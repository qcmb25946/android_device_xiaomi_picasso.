#
# Copyright (C) 2020 AICP
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/picasso/picasso-vendor.mk)

include $(LOCAL_PATH)/system_prop.mk
include $(LOCAL_PATH)/system.prop
include $(LOCAL_PATH)/product_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

PRODUCT_BUILD_SUPER_PARTITION := false
BOARD_BUILD_PRODUCT_IMAGE := true
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE := true

# A/B status
AB_OTA_UPDATER := false

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    vendor.xiaomi.hardware.fingerprintextension@1.0

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)
    
# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti
    
# Charging
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/media_profiles_vendor.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/parts/privapp-permissions-parts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-parts.xml

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_picasso

# NFC
PRODUCT_PACKAGES += \
    NQNfcNci \
    com.nxp.nfc.nq \
    android.hardware.nfc@1.0:64 \
    android.hardware.nfc@1.1:64 \
    android.hardware.nfc@1.2:64 \
    android.hardware.secure_element@1.0:64 \
    com.android.nfc_extras \
    Tag \
    vendor.nxp.nxpese@1.0:64 \
    vendor.nxp.nxpnfc@1.0:64

# OpenGApps
BUILD_GAPPS_PREBUILT_APK # - for apps
BUILD_GAPPS_PREBUILT_SHARED_LIBRARY # - for shared libraries
GAPPS_VARIANT := pico
GAPPS_PRODUCT_PACKAGES += CalculatorGoogle
GAPPS_PRODUCT_PACKAGES += CarrierServices
GAPPS_PRODUCT_PACKAGES += CloudPrint2
GAPPS_PRODUCT_PACKAGES += DigitalWellbeing
GAPPS_PRODUCT_PACKAGES += GoogleContacts
GAPPS_PRODUCT_PACKAGES += GoogleDialer
GAPPS_PRODUCT_PACKAGES += GoogleWebViewOverlay
GAPPS_PRODUCT_PACKAGES += LatinImeGoogle
GAPPS_PRODUCT_PACKAGES += MarkupGoogle
GAPPS_PRODUCT_PACKAGES += Photos
GAPPS_PRODUCT_PACKAGES += PrebuiltBugle
GAPPS_PRODUCT_PACKAGES += PrebuiltDeskClockGoogle
GAPPS_PRODUCT_PACKAGES += SoundPicker
GAPPS_PRODUCT_PACKAGES += Wallet
GAPPS_PRODUCT_PACKAGES += Wallpapers
GAPPS_PRODUCT_PACKAGES += WebViewGoogle
GAPPS_EXCLUDED_PACKAGES := ConfigUpdater
GAPPS_EXCLUDED_PACKAGES := GoogleCalendarSyncAdapter
GAPPS_EXCLUDED_PACKAGES := GoogleFeedback
GAPPS_EXCLUDED_PACKAGES := GoogleOneTimeInitializer
GAPPS_EXCLUDED_PACKAGES := GooglePartnerSetup
GAPPS_EXCLUDED_PACKAGES := GoogleTTS
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_FORCE_MMS_OVERRIDES := true
GAPPS_FORCE_DIALER_OVERRIDES := true
GAPPS_FORCE_MATCHING_DPI := true
WITH_DEXPREOPT := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aicp

PRODUCT_PACKAGES += \
    NotchNoFillOverlay

# Overlays -- Override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext 

PRODUCT_BOOT_JARS += \
    telephony-ext

# XiaomiParts
PRODUCT_PACKAGES += \
    XiaomiParts

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/modules-20.7.30,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/lib/modules)
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
