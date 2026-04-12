#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from a26x device
$(call inherit-product, device/samsung/a26x/device.mk)

# Inherit from LineageOS/AxionOS
# Note: AxionOS is based on LineageOS, so we inherit from lineage config.
# When building with AxionOS, this will resolve to vendor/axion or vendor/lineage.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# ============================================================
# AxionOS Device Properties
# ============================================================

# Camera information (rear: 50MP main + 48MP ultrawide, front: 42MP inferred)
# Format: AXION_CAMERA_<TYPE>_INFO := megapixels,sensor_id_or_other_param
AXION_CAMERA_REAR_INFO := 50,48
AXION_CAMERA_FRONT_INFO := 13

# Maintainer name (underscores become spaces in the UI)
AXION_MAINTAINER := OpenSource_Guy

# Processor name (Exynos S5E8835)
AXION_PROCESSOR := Exynos_S5E8835

# ============================================================
# AxionOS Optional Features
# ============================================================

# Enable blur effects (if supported by compositor)
# TARGET_ENABLE_BLUR := true

# Enable AxionFx (audio effects)
# TARGET_INCLUDE_AXFX := true

# Include LineageOS prebuilt apps (default: false for cleaner builds)
# TARGET_INCLUDES_LOS_PREBUILTS := false

# ============================================================
# AxionOS Firmware Configurations
# ============================================================

# Bypass charging support (if hardware supports charging while maintaining battery %)
# BYPASS_CHARGE_SUPPORTED ?= false
# BYPASS_CHARGE_TOGGLE_PATH ?= /sys/class/power_supply/battery/input_suspend
# BYPASS_CHARGE_LEVEL_PATH ?= /sys/devices/platform/google,charger/charge_stop_level

# CPU governor support
# PERF_GOV_SUPPORTED := false
# PERF_DEFAULT_GOV := schedutil
# PERF_ANIM_OVERRIDE := false

# High Brightness Mode (HBM) - check panel support
# HBM_SUPPORTED := false
# HBM_NODE := /sys/class/backlight/panel0-backlight/hbm_mode

# Doze flags - enable if device has doze/sensor issues
# TARGET_NEEDS_DOZE_FIX := false
# TARGET_DOZE_TAP_PULSE_SUPPORTED ?= false
# TARGET_DOZE_DOUBLE_TAP_PULSE_SUPPORTED ?= false
# TARGET_DOZE_PICKUP_PULSE_SUPPORTED ?= false
# TARGET_DOZE_SIDE_FPS_PULSE_SUPPORTED ?= false

# RAM optimization (device has 6GB/8GB, so NOT low RAM)
TARGET_IS_LOW_RAM := false

# Supported refresh rates (A26 has 60Hz/120Hz AMOLED panel)
TARGET_SUPPORTED_REFRESH_RATES := 60,120

# ============================================================
# Product characteristics
# ============================================================

PRODUCT_DEVICE := a26x
PRODUCT_NAME := lineage_a26x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A266B
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="a26xxx-user 16 BP2A.250605.031.A3 A266BXXU4BYI2 release-keys" \
    BuildFingerprint=samsung/a26xxx/essi:16/BP2A.250605.031.A3/A266BXXU4BYI2:user/release-keys
