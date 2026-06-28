#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a26x

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

# API level
PRODUCT_SHIPPING_API_LEVEL := 35

# Build Maintainer
PRODUCT_SYSTEM_PROPERTIES += \
    ro.lineage.maintainer="OpenSource Guy"

# Display
PRODUCT_AAPT_PREF_CONFIG := 450dpi

# fastbootd (AOSP module)
PRODUCT_PACKAGES += \
    fastbootd

# Virtual A/B OTA (AOSP modules)
PRODUCT_PACKAGES += \
    snapuserd \
    update_engine \
    update_verifier

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Force generation of build.prop for modular partitions
PRODUCT_VENDOR_PROPERTIES += ro.vendor.build.dont_skip=1
PRODUCT_ODM_PROPERTIES += ro.odm.build.dont_skip=1
PRODUCT_PRODUCT_PROPERTIES += ro.product.build.dont_skip=1

# Product characteristics
PRODUCT_CHARACTERISTICS := phone

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# Audio HIDL HAL packages (manifest declares audio@7.1, effect@7.0, soundtrigger@2.3)
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.3-impl

# Bluetooth HIDL HAL packages (manifest declares bluetooth@1.1)
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1-service

# CAS HIDL HAL packages (manifest declares cas@1.2)
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service

# DRM AIDL HAL packages (manifest declares drm V1 — clearkey + widevine)
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# Gatekeeper HIDL HAL (manifest declares gatekeeper@1.0 with override)
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service

# Graphics HIDL HAL packages (manifest declares allocator@4.0, composer@2.4, mapper@4.0)
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0-service \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@4.0-impl

# Health AIDL HAL (manifest declares health V1)
# Vendor provides vendor.samsung.hardware.health-service (Samsung AIDL wrapper)
PRODUCT_PACKAGES += \
    android.hardware.health-service.default \
    vendor.samsung.hardware.health-service

# KeyMint AIDL HAL (manifest declares keymint V2 + secureclock + sharedsecret with override)
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-service

# Media C2 HIDL HAL (manifest declares media.c2@1.2 with override, 2 instances)
# Vendor provides samsung.hardware.media.c2@1.2-service (Samsung implementation)
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.2-service \
    samsung.hardware.media.c2@1.2-service

# Media OMX HIDL HAL (manifest declares media.omx@1.0)
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service

# NFC HIDL HAL (manifest declares nfc@1.2)
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service

# Power AIDL HAL (manifest declares power V2)
# Vendor provides android.hardware.power.samsung-service (Samsung implementation)
PRODUCT_PACKAGES += \
    android.hardware.power-service.default \
    android.hardware.power.samsung-service

# RenderScript HIDL HAL (manifest declares renderscript@1.0 passthrough)
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Sensors HIDL HAL (manifest declares sensors@2.0)
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service

# Thermal HIDL HAL (manifest declares thermal@1.0 + @2.0 with override)
# Vendor provides vendor.samsung.hardware.thermal@1.0-service (Samsung @1.0 extension)
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service \
    vendor.samsung.hardware.thermal@1.0-service

# USB HIDL HAL (manifest declares usb@1.3)
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service

# Weaver HIDL HAL (manifest declares weaver@1.0 with override)
PRODUCT_PACKAGES += \
    android.hardware.weaver@1.0-service

# Wi-Fi HIDL HAL packages (manifest declares wifi@1.6, hostapd@1.3, supplicant@1.4)
# Vendor provides android.hardware.wifi@1.0-service + vendor.samsung.hardware.wifi@2.0-service
# AOSP builds wifi@1.6 from source; Samsung vendor service is a proprietary extension
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.6-service \
    android.hardware.wifi@1.0-service \
    vendor.samsung.hardware.wifi@2.0-service \
    android.hardware.wifi.hostapd@1.3-service \
    android.hardware.wifi.supplicant@1.4-service

# HIDL Allocator (required for VINTF compatibility with older FCM levels)
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0-service

# AIDL HAL packages for Samsung vendor services
# (Biometrics face/fingerprint, camera, dumpstate, gnss, light, memtrack,
#  neuralnetworks, vibrator are provided by vendor APEXes and proprietary services)

# Init files (defined in rootdir/Android.mk - use PRODUCT_PACKAGES)
PRODUCT_PACKAGES += \
    init.recovery.s5e8835.rc \
    init.recovery.samsung.rc \
    init.s5e8835.rc \
    fstab.s5e8835 \
    fstab.ramplus

# Shell scripts (defined in rootdir/Android.bp - use PRODUCT_PACKAGES)
PRODUCT_PACKAGES += \
    gps.sh \
    enable_test_mode.sh \
    hdm_status.sh \
    init.insmod.sh \
    install-recovery.sh \
    mx_log_collection.sh \
    mx_logger.sh \
    mx_logger_dump.sh

# Ramdisk fstab (no module defined, use PRODUCT_COPY_FILES)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.ramplus:$(TARGET_COPY_OUT_RAMDISK)/fstab.ramplus

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/samsung

# Samsung Soong config
SOONG_CONFIG_NAMESPACES += samsungExynosHalmgr
SOONG_CONFIG_samsungExynosHalmgr := soc
SOONG_CONFIG_samsungExynosHalmgr_soc := s5e8835

# Vendor firmware / policy prebuilts (defined in rootdir/Android.bp)
PRODUCT_PACKAGES += \
    ft3419_firmware \
    dpolicy

# Audio configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/audio/audio_board_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_board_info.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/audio_effects_sec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_sec.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/audio_effects_spatializer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_spatializer.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/audio_policy_configuration_base.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_base.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(DEVICE_PATH)/rootdir/etc/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Media codecs configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_c2_sec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_c2_sec_ape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_ape.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_c2_sec_qcp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_qcp.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_codecs_performance_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_c2.xml \
    $(DEVICE_PATH)/rootdir/etc/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Wi-Fi configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/rootdir/etc/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(DEVICE_PATH)/rootdir/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# NFC configuration (ST54L / ST21NFCA family)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
    $(DEVICE_PATH)/rootdir/etc/nfc/st54l_conf.txt:$(TARGET_COPY_OUT_VENDOR)/etc/nfc/st54l_conf.txt

# Keylayout files
# No vendor keylayout files were present on the live SM-A266B dump; generic AOSP keylayouts are used.

# Display
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=mali \
    ro.hardware.vulkan=mali \
    ro.opengles.version=196610 \
    persist.sys.sf.color_saturation=1.0 \
    ro.surface_flinger.enable_frame_rate_override=false \
    ro.surface_flinger.game_default_frame_rate_override=60 \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.protected_contents=1 \
    ro.surface_flinger.running_without_sync_framework=false \
    ro.surface_flinger.use_color_management=false \
    ro.surface_flinger.use_content_detection_for_refresh_rate=false \
    ro.surface_flinger.vsync_event_phase_offset_ns=0 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=0

# DRM
PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Audio
PRODUCT_VENDOR_PROPERTIES += \
    aaudio.hw_burst_min_usec=2000 \
    aaudio.mmap_exclusive_policy=2 \
    aaudio.mmap_policy=2 \
    audio.offload.min.duration.secs=30

PRODUCT_SYSTEM_PROPERTIES += \
    ro.audio.spatializer_enabled=true

# Media
PRODUCT_VENDOR_PROPERTIES += \
    debug.stagefright.c2-poolmask=458752 \
    debug.stagefright.ccodec_delayed_params=1 \
    debug.stagefright.ccodec_lax_type=true \
    debug.stagefright.ccodec_strict_type=true \
    media.c2.dmabuf.padding=512 \
    vendor.debug.c2.sbwc.enable=true \
    vendor.media.omx=0

# Wi-Fi
PRODUCT_VENDOR_PROPERTIES += \
    wifi.interface=wlan0

PRODUCT_SYSTEM_PROPERTIES += \
    ro.wifi.channels=

# Bluetooth
PRODUCT_SYSTEM_PROPERTIES += \
    bluetooth.device.class_of_device=90,2,12 \
    bluetooth.profile.a2dp.source.enabled=true \
    bluetooth.profile.asha.central.enabled=true \
    bluetooth.profile.avrcp.target.enabled=true \
    bluetooth.profile.gatt.enabled=true \
    bluetooth.profile.hfp.ag.enabled=true \
    bluetooth.profile.hid.device.enabled=true \
    bluetooth.profile.hid.host.enabled=true \
    bluetooth.profile.map.server.enabled=true \
    bluetooth.profile.opp.enabled=false \
    bluetooth.profile.pan.nap.enabled=true \
    bluetooth.profile.pan.panu.enabled=true \
    bluetooth.profile.pbap.server.enabled=true

# Radio / Telephony
PRODUCT_VENDOR_PROPERTIES += \
    ro.radio.noril=no \
    ro.telephony.default_cdma_sub=0 \
    ro.vendor.sec.radio.def_network=9 \
    ro.vendor.epdg.support=true

# Security / Keystore
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.keystore=mdfpp \
    ro.hardware.keystore_desede=true \
    ro.security.keystore.keytype=sakv2,gak,rkp \
    ro.security.cass.feature=1 \
    ro.security.vpnpp.release=2.0 \
    ro.security.vpnpp.ver=2.4

# LMK / Memory management
PRODUCT_VENDOR_PROPERTIES += \
    ro.slmk.2nd.dha_cached_max=24 \
    ro.slmk.add_bonusEFK=2 \
    ro.slmk.allied_proc_protect=true \
    ro.slmk.beks_enable=true \
    ro.slmk.beks_key=160 \
    ro.slmk.cam_dha_ver=3 \
    ro.slmk.chimera_strategy_6gb=1050,19,9,2034 \
    ro.slmk.chimera_strategy_8gb=2150,24,10,2550 \
    ro.slmk.dec_EFK_enable=true \
    ro.slmk.dha_2ndprop_thMB=6144 \
    ro.slmk.dha_cached_max=18 \
    ro.slmk.dha_cached_min=3 \
    ro.slmk.plg_key=16388 \
    ro.slmk.swap_free_low_percentage=35 \
    ro.slmk.trim_sec_policy=true \
    ro.slmk.v_bonusEFK=60720

# NAND swap (RAM Plus)
PRODUCT_VENDOR_PROPERTIES += \
    ro.sys.kernelmemory.nandswap.expand_action=true \
    ro.sys.kernelmemory.nandswap.prefetch_action=true \
    ro.sys.kernelmemory.nandswap.slot_count_map=5,6,8,8,12 \
    ro.sys.kernelmemory.nandswap.storage_clock_boost=true \
    ro.sys.kernelmemory.nandswap.writeback_on_bg=true

# SoC identity
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=Samsung \
    ro.soc.model=s5e8835

# GPU / Graphics
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.ddk.set.afbc=1 \
    ro.vendor.gpu.dataspace=1 \
    graphics.gpu.profiler.support=true \
    ro.hw.use_disable_composition_type_gles=1 \
    ro.hw.use_hwc_services=1 \
    ro.hw.use_secure_encoder_only=1 \
    ro.hw.use_virtual_display=1 \
    ro.hw.wfd_use_c2_encoder=1 \
    ro.hw.wfd_use_single_plane_in_drm=0 \
    debug.hwc.winupdate=1 \
    vendor.hwc.exynos.vsync_mode=0

# NFC (ST21NFCA)
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.nfc.feature.chipname=STM_ST21 \
    ro.vendor.nfc.info.antpos=16 \
    ro.vendor.nfc.info.antposX=29.0 \
    ro.vendor.nfc.info.antposY=29.0 \
    ro.vendor.nfc.info.deviceFoldable=false \
    ro.vendor.nfc.info.deviceHeight=164.0 \
    ro.vendor.nfc.info.deviceWidth=78.0 \
    ro.vendor.nfc.support.advancedsetting=false \
    ro.vendor.nfc.support.autoselect=true \
    ro.vendor.nfc.support.defaultaid=true \
    ro.vendor.nfc.support.ese=false \
    ro.vendor.nfc.support.nonaid=true \
    ro.vendor.nfc.support.othercategory=true \
    ro.vendor.nfc.support.uicc=true

# HDM (Samsung firmware)
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.hdm.supported.swblock=0x100 \
    ro.vendor.config.dm.autostart=0 \
    persist.vendor.sys.dm.zip=0

# Camera
PRODUCT_VENDOR_PROPERTIES += \
    ro.camera.disableJpegR=true \
    ro.camera.notify_nfc=1

# Dalvik / ART
PRODUCT_VENDOR_PROPERTIES += \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapmaxfree=32m \
    dalvik.vm.heapminfree=8m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heaptargetutilization=0.5

PRODUCT_SYSTEM_PROPERTIES += \
    dalvik.vm.appimageformat=lz4 \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    dalvik.vm.dex2oat-max-image-block-size=524288 \
    dalvik.vm.dex2oat-minidebuginfo=true \
    dalvik.vm.dex2oat-resolve-startup-strings=true \
    dalvik.vm.dexopt.secondary=true \
    dalvik.vm.dexopt.thermal-cutoff=2 \
    dalvik.vm.enable_pr_dexopt=true \
    dalvik.vm.finalizer-timeout-ms=60000 \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.madvise.artfile.size=4294967295 \
    dalvik.vm.madvise.odexfile.size=104857600 \
    dalvik.vm.madvise.vdexfile.size=104857600 \
    dalvik.vm.minidebuginfo=true \
    dalvik.vm.systemuicompilerfilter=speed \
    dalvik.vm.usap_pool_enabled=false \
    dalvik.vm.usap_pool_refill_delay_ms=3000 \
    dalvik.vm.usap_pool_size_max=3 \
    dalvik.vm.usap_pool_size_min=1 \
    dalvik.vm.usap_refill_threshold=1 \
    dalvik.vm.useartservice=true \
    dalvik.vm.usejit=true

# Storage
PRODUCT_VENDOR_PROPERTIES += \
    ro.incremental.enable=yes \
    external_storage.casefold.enabled=1 \
    external_storage.projid.enabled=1 \
    external_storage.sdcardfs.enabled=0 \
    persist.sys.fuse.passthrough.enable=true \
    persist.sys.fuse.bpf.override=false

# Log collection
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.wlbtlog.maxfiles=5 \
    persist.vendor.wlbtlog.maxfilesize=50

# Samsung-specific system properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.netflix.bsp_rev=EXYNOS1380-36589-1 \
    ro.build.PDA=A266BXXS4AYG9

# Performance tuning
PRODUCT_VENDOR_PROPERTIES += \
    sys.perf.hmp=4:4

# Samsung security
PRODUCT_VENDOR_PROPERTIES += \
    security.ADP.policy_version=00000000 \
    security.ADP.version=0 \
    security.ASKS.policy_version=00000000 \
    security.ASKS.rufs_enable=true \
    security.ASKS.time_value=00000000 \
    security.ASKS.version=0 \
    security.securehw.available=false \
    security.securenvm.available=false

# Logging/debug
PRODUCT_VENDOR_PROPERTIES += \
    log.tag.stats_log=I

PRODUCT_SYSTEM_PROPERTIES += \
    persist.traced.enable=1

# Samsung RIL
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.qb.id=99274341

# USB
PRODUCT_VENDOR_PROPERTIES += \
    dev.usbsetting.embedded=on

PRODUCT_SYSTEM_PROPERTIES += \
    dev.usbsetting.embedded=on

# Verity / Apk
PRODUCT_VENDOR_PROPERTIES += \
    ro.apk_verity.mode=2 \
    ro.control_privapp_permissions=enforce

# Vibrator
PRODUCT_VENDOR_PROPERTIES += \
    ro.config.vc_call_vol_steps=8

# Samsung audio config
PRODUCT_VENDOR_PROPERTIES += \
    ro.config.systemaudiodebug=abox

# Swappiness (set in init.rc too, but property fallback)
PRODUCT_VENDOR_PROPERTIES += \
    ro.carrier=unknown

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a26x/a26x-vendor.mk)
