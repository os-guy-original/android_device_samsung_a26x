#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a26x
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# ============================================================
# AxionOS Configuration
# ============================================================

# Disable EPPE (Enhanced Privileged Process Execution) for Exynos devices
# EPPE can cause issues with custom kernels on Exynos platforms
TARGET_DISABLE_EPPE := true

# Performance tuning flags for AxionOS
# TARGET_ENABLE_BLUR := true          # Enable blur effects in UI
# TARGET_INCLUDE_AXFX := true         # Enable AxionFx audio effects

# ============================================================
# Architecture
# ============================================================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a78

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := s5e8835
TARGET_NO_BOOTLOADER := true

# Kernel - Prebuilt from stock firmware
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/Image
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := bootconfig loop.max_part=7
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 16777216
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_VBMETAIMAGE_PARTITION_SIZE := 65536
BOARD_METADATAIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 13421772800
BOARD_SUPER_PARTITION_DEVICES := sda
BOARD_SUPER_PARTITION_METADATA_DEVICE := sda
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm system_dlkm vendor_dlkm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 13417578496
BUILD_SUPER_EMPTY_PARTITION := true
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true

# Partition Sizes
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 2147483648
BOARD_ODMIMAGE_PARTITION_SIZE := 104857600
BOARD_SYSTEM_DLKMIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_DLKMIMAGE_PARTITION_SIZE := 104857600

# Partition Types
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

# Partition Building
BOARD_USES_VENDORIMAGE := true
BOARD_USES_ODMIMAGE := true
BOARD_USES_PRODUCTIMAGE := true
BOARD_BUILD_VENDOR_IMAGE := true
BOARD_BUILD_ODM_IMAGE := true
BOARD_BUILD_PRODUCT_IMAGE := true
BOARD_BUILD_SYSTEM_EXT_IMAGE := false
BOARD_BUILD_SYSTEM_DLKM_IMAGE := true
BOARD_BUILD_VENDOR_DLKM_IMAGE := true

# Target Copy Out
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Root Folders
BOARD_ROOT_EXTRA_FOLDERS := optics prism

# A/B - Virtual A/B (VABC) - Android 15 (API 35) Baseline
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true
BOARD_USES_METADATA_PARTITION := true
TARGET_USES_UFS_OTA := true
BOARD_VIRTUAL_AB_COMPRESSION := true
BOARD_VIRTUAL_AB_COMPRESSION_METHOD := zstd
BOARD_USE_USERSPACE_SNAPSHOT := true
BOARD_VIRTUAL_AB_BATCH_WRITES := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    vbmeta \
    vbmeta_system \
    vendor_boot \
    vendor_dlkm \
    system \
    vendor \
    product \
    odm \
    system_dlkm

# Platform
TARGET_BOARD_PLATFORM := erd8835
BOARD_BUILD_GKI_BOOT_IMAGE := true
BOARD_SHIPPING_API_LEVEL := 36

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.s5e8835
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2025-09-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 1

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/device_framework_matrix.xml
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Inherit the proprietary files
include vendor/samsung/a26x/BoardConfigVendor.mk


# AVB - match stock vbmeta configuration
# Stock vbmeta uses SHA256_RSA4096 algorithm
# Stock chains: dtbo (loc 1), prism (loc 2), optics (loc 3)
# Stock uses hash descriptors for: boot, recovery, vendor_boot, init_boot
# Stock uses hashtree descriptors for: system, vendor, product, odm, system_dlkm, vendor_dlkm
#
# NOTE: Currently using test keys for development builds.
# For production/official builds, replace test keys with proper signing keys:
# 1. Generate keys: external/avb/avbtool.py generate_rsa_key --key_path /path/to/keys/key.pem --algorithm SHA256_RSA4096
# 2. Update BOARD_AVB_KEY_PATH and BOARD_AVB_DTBO_KEY_PATH to point to your keys
# 3. Ensure keys are kept secure and not committed to version control
BOARD_AVB_DTBO_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_DTBO_ALGORITHM := SHA256_RSA4096
BOARD_AVB_DTBO_ROLLBACK_INDEX := 1
BOARD_AVB_DTBO_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_ALGORITHM := SHA256_RSA4096
