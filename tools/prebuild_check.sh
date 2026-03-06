#!/bin/bash
# Pre-build check for Crave CI/CD
# This script is called before the main build

set -e

DEVICE="a26x"
DEVICE_TREE="device/samsung/${DEVICE}"
VENDOR_TREE="vendor/samsung/${DEVICE}"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "========================================"
echo "  Pre-Build Duplicate Check"
echo "  Device: ${DEVICE}"
echo "========================================"
echo ""

ERRORS=0
WARNINGS=0

# 1. VINTF manifest conflicts
echo "[1/6] Checking VINTF manifests..."
VINTF_DIR="${VENDOR_TREE}/proprietary/vendor/etc/vintf/manifest"
if [ -d "$VINTF_DIR" ]; then
    for xml in "$VINTF_DIR"/*.xml; do
        [ -f "$xml" ] || continue
        filename=$(basename "$xml")
        
        if grep -q "<name>android\.hardware\." "$xml" 2>/dev/null; then
            if [[ ! "$filename" =~ ^(vendor\.|vendor_|st\.|manifest_android|power-samsung|samsung) ]]; then
                echo -e "  ${RED}ERROR${NC}: $filename - Generic name with android.hardware.*"
                ((ERRORS++))
            fi
        fi
    done
fi
echo -e "  ${GREEN}Done${NC}"

# 2. APEX in PRODUCT_COPY_FILES
echo "[2/6] Checking APEX copies..."
for mk in "$DEVICE_TREE"/*.mk "$VENDOR_TREE"/*.mk; do
    [ -f "$mk" ] || continue
    if grep -q "\.apex:" "$mk" 2>/dev/null; then
        echo -e "  ${RED}ERROR${NC}: APEX in PRODUCT_COPY_FILES: $mk"
        ((ERRORS++))
    fi
done
echo -e "  ${GREEN}Done${NC}"

# 3. VNDK conflicts
echo "[3/6] Checking VNDK..."
for mk in "$DEVICE_TREE"/*.mk "$VENDOR_TREE"/*.mk; do
    [ -f "$mk" ] || continue
    if grep "PRODUCT_COPY_FILES" "$mk" 2>/dev/null | grep -q "com\.android\.vndk"; then
        echo -e "  ${RED}ERROR${NC}: VNDK in PRODUCT_COPY_FILES: $mk"
        ((ERRORS++))
    fi
done
echo -e "  ${GREEN}Done${NC}"

# 4. Check for AOSP binaries in PRODUCT_COPY_FILES
echo "[4/6] Checking for AOSP binaries in PRODUCT_COPY_FILES..."
AOSP_BINARIES="android.hidl.allocator
hwservicemanager
android.hardware.wifi
android.hardware.bluetooth
android.hardware.audio
android.hardware.camera
android.hardware.graphics
android.hardware.media"

for mk in "$DEVICE_TREE"/*.mk "$VENDOR_TREE"/*.mk; do
    [ -f "$mk" ] || continue
    for bin in $AOSP_BINARIES; do
        if grep "PRODUCT_COPY_FILES" "$mk" 2>/dev/null | grep -q "$bin"; then
            echo -e "  ${RED}ERROR${NC}: AOSP binary '$bin' in PRODUCT_COPY_FILES: $mk"
            grep -n "$bin" "$mk" | grep "PRODUCT_COPY_FILES" | head -2 | sed 's/^/    /'
            ((ERRORS++))
        fi
    done
done
echo -e "  ${GREEN}Done${NC}"

# 5. Check install map if it exists
echo "[5/6] Checking install map..."
INSTALLS_MK="out/soong/installs-lineage_${DEVICE}.mk"
if [ -f "$INSTALLS_MK" ]; then
    dups=$(grep -oP '^out/target/product/[^:]+(?=:)' "$INSTALLS_MK" 2>/dev/null | sort | uniq -d)
    if [ -n "$dups" ]; then
        echo -e "  ${RED}ERROR${NC}: Duplicate targets in install map:"
        echo "$dups" | head -10 | sed 's/^/    /'
        ((ERRORS++))
    fi
else
    echo "  (Install map not generated yet - will check after build starts)"
fi
echo -e "  ${GREEN}Done${NC}"

# 6. Summary
echo "[6/6] Summary..."
echo ""

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}FOUND $ERRORS ERROR(S) - BUILD ABORTED${NC}"
    echo -e "${RED}========================================${NC}"
    exit 1
else
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}ALL CHECKS PASSED${NC}"
    echo -e "${GREEN}========================================${NC}"
    exit 0
fi
