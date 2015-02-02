#
# Copyright (C) 2015 The CyanogenMod Project
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

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_AAPT_FLAGS := --auto-add-overlay
LOCAL_AAPT_INCLUDE_ALL_RESOURCES := true

LOCAL_PACKAGE_NAME := MaterialDark
# Disable proguard, for now.
#LOCAL_CERTIFICATE := platform
#LOCAL_PROGUARD_FLAG_FILES := proguard.flags

LOCAL_ADDITIONAL_DEPENDENCIES += $(LOCAL_PATH)/Android.mk
include $(call all-makefiles-under,$(LOCAL_PATH))

ifeq ($(TARGET_BOOTANIMATION_HALF_RES),true)
LOCAL_ASSET_DIR := \
    $(LOCAL_PATH)/assets \
    $(LOCAL_PATH)/bootanimation/halfres/$(TARGET_BOOTANIMATION_NAME)
else
LOCAL_ASSET_DIR := \
    $(LOCAL_PATH)/assets \
    $(LOCAL_PATH)/bootanimation/$(TARGET_BOOTANIMATION_NAME)
endif

include $(BUILD_PACKAGE)
