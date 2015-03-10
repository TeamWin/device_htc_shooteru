# Release name
PRODUCT_RELEASE_NAME := shooteru

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/shooteru/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := shooteru
PRODUCT_NAME := cm_shooteru
PRODUCT_BRAND := htc
PRODUCT_MODEL := shooteru
PRODUCT_MANUFACTURER := htc
