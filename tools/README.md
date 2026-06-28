# Build Tools for Samsung Galaxy A26

This directory contains scripts to detect and prevent duplicate install target errors before they cause build failures.

## Files

| File | Purpose |
|------|---------|
| `prebuild_check.sh` | Main pre-build duplicate checker |
| `check_duplicates.sh` | Detailed duplicate analysis |
| `check_install_map.sh` | Post-configure install map scanner |
| `crave_build.sh` | Wrapper script for Crave builds |

## Usage with Crave

### Option 1: Manual Pre-Build Check

Before starting your Crave build, the scripts will automatically run. If you want to run manually:

```bash
# In Crave build environment
cd /tmp/src/android
./device/samsung/a26x/tools/prebuild_check.sh
```

### Option 2: Use the Build Wrapper

```bash
# Instead of: make -j$(nproc) bacon
# Use:
./device/samsung/a26x/tools/crave_build.sh bacon
```

### Option 3: Crave Configuration

Add to your `local_manifests` or create a `.crave.yaml`:

```yaml
device:
  name: a26x
  vendor: samsung

# Pre-build hooks
prebuild:
  - ./device/samsung/a26x/tools/prebuild_check.sh
```

## What Gets Checked

1. **VINTF Manifests** - Detects generic filenames with `android.hardware.*` declarations
2. **APEX Files** - Warns if APEX in `PRODUCT_COPY_FILES` (build system handles these)
3. **VNDK Conflicts** - Detects VNDK APEX copies
4. **Install Map** - Scans generated build files for duplicate targets

## Troubleshooting

### VINTF Conflict
```
ERROR: android.hardware.wifi.hostapd.xml - Generic name with android.hardware.*
```
**Fix:** Remove from vendor tree (AOSP provides it) or rename to Samsung-specific name.

### APEX Conflict
```
ERROR: APEX in PRODUCT_COPY_FILES
```
**Fix:** Remove APEX from `PRODUCT_COPY_FILES` - build system handles APEX installation automatically.

### VNDK Conflict
```
ERROR: VNDK in PRODUCT_COPY_FILES
```
**Fix:** Remove VNDK APEX from `PRODUCT_COPY_FILES` - VNDK is managed by `BOARD_VNDK_VERSION`.
