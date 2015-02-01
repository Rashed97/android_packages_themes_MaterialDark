ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
# determine the smaller dimension
THEME_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls packages/themes/material-dark/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval THEME_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(THEME_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(THEME_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

ifeq ($(TARGET_BOOTANIMATION_HALF_RES),true)
#THEME_BOOTANIMATION := $(LOCAL_PATH)/halfres/$(THEME_BOOTANIMATION_NAME).zip
LOCAL_ASSET_DIR += $(LOCAL_PATH)/bootanimation/halfres/$(THEME_BOOTANIMATION_NAME)
THEME_BOOTANIMATION_PATH := $(LOCAL_PATH)/bootanimation/halfres/$(THEME_BOOTANIMATION_NAME)
else
#THEME_BOOTANIMATION := $(LOCAL_PATH)/$(THEME_BOOTANIMATION_NAME).zip
LOCAL_ASSET_DIR += $(LOCAL_PATH)/bootanimation/$(THEME_BOOTANIMATION_NAME)
THEME_BOOTANIMATION_PATH := $(LOCAL_PATH)/bootanimation/$(THEME_BOOTANIMATION_NAME)
endif
endif

#cp $(THEME_BOOTANIMATION) packages/themes/material-dark/assets/bootanimation/$(THEME_BOOTANIMATION_NAME).zip
