#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from a26x device
$(call inherit-product, device/samsung/a26x/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := a26x
PRODUCT_NAME := lineage_a26x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A266B
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="a26xxx-user 15 AP3A.240905.015.A2 A266BXXS4AYG9 release-keys" \
    BuildFingerprint=samsung/a26xxx/essi:15/AP3A.240905.015.A2/A266BXXS4AYG9:user/release-keys
