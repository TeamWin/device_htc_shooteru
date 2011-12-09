#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/shooteru/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/htc/shooteru/init:root/init \
    device/htc/shooteru/init.shooteru.rc:root/init.shooteru.rc \
    device/htc/shooteru/init.rc:root/init.rc \
    device/htc/shooteru/ueventd.shooter_u.rc:root/ueventd.shooter_u.rc

#Add touchscreen config file
PRODUCT_COPY_FILES += \
    device/htc/shooteru/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/shooteru/shooteru-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y
    ro.opengles.version=131072

# Don't set /proc/sys/vm/dirty_ratio to 0 when USB mounting
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/shooteru/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/shooteru/voicemail-conf.xml:system/etc/voicemail-conf.xml

#PRODUCT_PACKAGES += \
#    gps.shooteru \
#    gralloc.msm8660 \
#    copybit.msm8660 \
#    overlay.default \

PRODUCT_PACKAGES += \
    librs_jni \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    libaudio \
    com.android.future.usb.accessory

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/shooteru/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/shooteru/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/shooteru/keychars/shooteru-keypad.kcm.bin:system/usr/keychars/shooteru-keypad.kcm.bin \
    device/htc/shooteru/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/shooteru/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/shooteru/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/shooteru/keylayout/shooteru-keypad.kl:system/usr/keylayout/shooteru-keypad.kl \
    device/htc/shooteru/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/shooteru/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/shooteru/firmware/BCM4329B1_002.002.023.0589.0632.hcd:system/etc/firmware/BCM4329B1_002.002.023.0589.0632.hcd \
    device/htc/shooteru/firmware/default_bak.acdb:system/etc/firmware/default_bak.acdb \
    device/htc/shooteru/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/shooteru/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    device/htc/shooteru/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/htc/shooteru/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/shooteru/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Hardware Acceleration
PRODUCT_COPY_FILES += \
    device/htc/shooteru/prebuilt/libC2D2.so:system/lib/libC2D2.so \
    device/htc/shooteru/prebuilt/libOpenVG.so:system/lib/libOpenVG.so

# Prebuilt audio
PRODUCT_COPY_FILES += \
    device/htc/shooteru/prebuilt/libaudio.so:system/lib/libaudio.so

# Misc Prebuilt Files
PRODUCT_COPY_FILES += \
    device/htc/shooteru/prebuilt/adreno_config.txt:system/etc/adreno_config.txt \
    device/htc/shooteru/prebuilt/init.post_boot.sh:system/etc/init.post_boot.sh \
    device/htc/shooteru/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/shooteru/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/shooteru/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/shooteru/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/shooteru/dsp/asound.conf:system/etc/asound.conf \
    device/htc/shooteru/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/shooteru/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/shooteru/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/shooteru/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/shooteru/dsp/TPA2051_CFG_XC.csv:system/etc/TPA2051_CFG_XC.csv \
    device/htc/shooteru/dsp/soundimage/Sound_FM_HP.txt:system/etc/soundimage/Sound_FM_HP.txt \
    device/htc/shooteru/dsp/soundimage/Sound_FM_SPK.txt:system/etc/soundimage/Sound_FM_SPK.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Original_MFG.txt:system/etc/soundimage/Sound_Original_MFG.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Phone_Original.txt:system/etc/soundimage/Sound_Phone_Original.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Rec_mono.txt:system/etc/soundimage/Sound_Rec_mono.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/shooteru/dsp/soundimage/Sound_Rec_Voice_record.txt:system/etc/soundimage/Sound_Rec_Voice_record.txt \
    device/htc/shooteru/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/shooteru/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/shooteru/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/shooteru/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/shooteru/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg

# Kernel Modules
PRODUCT_COPY_FILES += $(shell \
    find device/htc/shooteru/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This is a high density device with more memory, so larger vm heaps for it.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=48m

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# device uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/htc/shooteru/vold.fstab:system/etc/vold.fstab

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/shooteru/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/shooteru/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/shooteru/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/shooteru/media_htcaudio.mk)

PRODUCT_NAME := full_shooteru
PRODUCT_DEVICE := shooteru
PRODUCT_MODEL := HTC Evo 3D
PRODUCT_MANUFACTURER := HTC
