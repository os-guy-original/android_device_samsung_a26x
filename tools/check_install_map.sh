#!/bin/bash
# Post-configure duplicate detector
# Run this AFTER the build starts generating files (or after first failure)
# This catches duplicates that the pre-check might miss

set -e

PRODUCT="lineage_a26x"
INSTALLS_MK="out/soong/installs-${PRODUCT}.mk"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "========================================"
echo "  Install Map Duplicate Scanner"
echo "========================================"
echo ""

if [ ! -f "$INSTALLS_MK" ]; then
    echo -e "${YELLOW}NOTE${NC}: $INSTALLS_MK not found."
    echo "Run this script after starting the build (or after a failure)."
    echo ""
    echo "To generate it, run:"
    echo "  source build/envsetup.sh && lunch lineage_a26x-userdebug && make nothing"
    exit 0
fi

echo "Scanning $INSTALLS_MK for duplicate targets..."
echo ""

# Find all duplicate targets
duplicates=$(grep -oP '^out/target/product/[^:]+(?=:)' "$INSTALLS_MK" 2>/dev/null | sort | uniq -d)

if [ -z "$duplicates" ]; then
    echo -e "${GREEN}No duplicate install targets found!${NC}"
    exit 0
fi

echo -e "${RED}DUPLICATE INSTALL TARGETS FOUND:${NC}"
echo ""

count=0
for target in $duplicates; do
    ((count++))
    echo -e "${RED}[$count]${NC} $target"
    
    # Show which lines define this target
    lines=$(grep -n "^${target}:" "$INSTALLS_MK" | cut -d: -f1)
    for line in $lines; do
        # Get context - the source file
        context=$(sed -n "${line}p" "$INSTALLS_MK")
        echo "    Line $line: $context"
    done
    echo ""
done

echo "========================================"
echo -e "${RED}FOUND $count DUPLICATE(S)${NC}"
echo ""
echo "These files are being installed from multiple sources."
echo "Check the source paths above and remove one of the declarations."
exit 1
