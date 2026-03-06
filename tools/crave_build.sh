#!/bin/bash
# Crave Build Script with Pre-Build Checks
# Usage: ./crave_build.sh [target] [additional make args]

set -e

DEVICE="a26x"
TARGET="${1:-lineage_${DEVICE}}"
shift 2>/dev/null || true

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Crave Build with Pre-Build Checks${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Step 1: Run pre-build checks
echo -e "${YELLOW}[Step 1] Running pre-build duplicate check...${NC}"
if [ -f "device/samsung/${DEVICE}/tools/prebuild_check.sh" ]; then
    ./device/samsung/${DEVICE}/tools/prebuild_check.sh || {
        echo -e "${RED}Pre-build check failed! Fix errors before building.${NC}"
        exit 1
    }
else
    echo -e "${YELLOW}Warning: prebuild_check.sh not found, skipping...${NC}"
fi
echo ""

# Step 2: Setup build environment
echo -e "${YELLOW}[Step 2] Setting up build environment...${NC}"
source build/envsetup.sh
lunch "${TARGET}-userdebug"
echo ""

# Step 3: Quick check of install map after lunch
echo -e "${YELLOW}[Step 3] Checking for install conflicts...${NC}"
sleep 2
if [ -f "device/samsung/${DEVICE}/tools/check_install_map.sh" ]; then
    ./device/samsung/${DEVICE}/tools/check_install_map.sh || true
fi
echo ""

# Step 4: Start build
echo -e "${YELLOW}[Step 4] Starting build: ${TARGET}...${NC}"
echo -e "${BLUE}Command: make -j\$(nproc) $@${NC}"
echo ""

make -j$(nproc) "$@"
