#!/bin/bash
# Pre-build duplicate detector for AOSP/LineageOS
# Run this after "lunch" but before "make"

set -e

DEVICE="a26x"
DEVICE_TREE="device/samsung/${DEVICE}"
VENDOR_TREE="vendor/samsung/${DEVICE}"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "========================================"
echo "  AOSP Duplicate Install Auditor"
echo "  Device: ${DEVICE}"
echo "========================================"
echo ""

ERRORS=0

# 1. Check for VINTF manifest files that might conflict with AOSP
echo "[1] Checking VINTF manifests for AOSP conflicts..."
VINTF_DIR="${VENDOR_TREE}/proprietary/vendor/etc/vintf/manifest"
if [ -d "$VINTF_DIR" ]; then
    for xml in "$VINTF_DIR"/*.xml; do
        [ -f "$xml" ] || continue
        filename=$(basename "$xml")
        
        # Check if it declares android.hardware.* (potential AOSP conflict)
        if grep -q "<name>android\.hardware\." "$xml" 2>/dev/null; then
            # Check if filename is generic (not Samsung-prefixed)
            if [[ ! "$filename" =~ ^(vendor\.|vendor_|st\.|manifest_android|power-samsung|samsung) ]]; then
                echo -e "  ${RED}CONFLICT RISK${NC}: $filename"
                echo "    - Declares android.hardware.* interface"
                echo "    - Generic filename may conflict with AOSP"
                grep "<name>android\.hardware\." "$xml" | head -1 | sed 's/^/    /'
                ((ERRORS++))
            fi
        fi
    done
    echo -e "  ${GREEN}Done${NC}"
fi
echo ""

# 2. Check for APEX files in PRODUCT_COPY_FILES
echo "[2] Checking for APEX in PRODUCT_COPY_FILES..."
for mk in "$DEVICE_TREE"/*.mk "$VENDOR_TREE"/*.mk; do
    [ -f "$mk" ] || continue
    if grep -q "\.apex:" "$mk" 2>/dev/null; then
        echo -e "  ${RED}ERROR${NC}: APEX in PRODUCT_COPY_FILES in $mk"
        grep -n "\.apex:" "$mk" | sed 's/^/    /'
        echo "    APEX files should not be copied manually (build system handles them)"
        ((ERRORS++))
    fi
done
echo -e "  ${GREEN}Done${NC}"
echo ""

# 3. Check for VNDK references
echo "[3] Checking for VNDK conflicts..."
for mk in "$DEVICE_TREE"/*.mk "$VENDOR_TREE"/*.mk; do
    [ -f "$mk" ] || continue
    if grep -q "com\.android\.vndk" "$mk" 2>/dev/null; then
        # Check if it's PRODUCT_COPY_FILES (bad) vs PRODUCT_PACKAGES (ok in some cases)
        if grep "PRODUCT_COPY_FILES" "$mk" | grep -q "com\.android\.vndk"; then
            echo -e "  ${RED}ERROR${NC}: VNDK in PRODUCT_COPY_FILES in $mk"
            grep -n "com\.android\.vndk" "$mk" | grep "PRODUCT_COPY_FILES" | sed 's/^/    /'
            echo "    VNDK is handled automatically by build system"
            ((ERRORS++))
        fi
    fi
done
echo -e "  ${GREEN}Done${NC}"
echo ""

# 4. Check for duplicate PRODUCT_PACKAGES entries
echo "[4] Checking for duplicate PRODUCT_PACKAGES..."
for mk in "$DEVICE_TREE"/*.mk "$VENDOR_TREE"/*.mk; do
    [ -f "$mk" ] || continue
    dups=$(grep "PRODUCT_PACKAGES" -A100 "$mk" 2>/dev/null | grep -E "^\s+[a-zA-Z0-9_@.-]+ \\\\$" | sed 's/[\\ ]//g' | sort | uniq -d)
    if [ -n "$dups" ]; then
        echo -e "  ${YELLOW}WARNING${NC}: Duplicate entries in $mk"
        echo "$dups" | sed 's/^/    /'
    fi
done
echo -e "  ${GREEN}Done${NC}"
echo ""

# 5. Check for common AOSP HAL modules that shouldn't be in vendor
echo "[5] Checking for AOSP HAL modules in vendor tree..."
AOSP_HALS="android.hardware.wifi.hostapd
android.hardware.wifi.supplicant
android.hardware.wifi@1.0-service
android.hardware.sensors@2.0-multihal
android.hardware.drm-service.clearkey
bluetooth_audio"

if [ -f "$VENDOR_TREE/Android.bp" ]; then
    for hal in $AOSP_HALS; do
        if grep -q "name: \"$hal\"" "$VENDOR_TREE/Android.bp" 2>/dev/null; then
            echo -e "  ${RED}ERROR${NC}: AOSP HAL '$hal' found in vendor Android.bp"
            echo "    This will conflict with AOSP's built-in module"
            ((ERRORS++))
        fi
    done
fi
echo -e "  ${GREEN}Done${NC}"
echo ""

# 6. Summary
echo "========================================"
if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}FOUND $ERRORS POTENTIAL ISSUE(S)${NC}"
    echo "Fix these before building."
    exit 1
else
    echo -e "${GREEN}NO ISSUES FOUND${NC}"
    echo "Ready to build!"
    exit 0
fi
