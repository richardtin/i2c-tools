LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := eng
LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/$(KERNEL_DIR)/include
LOCAL_SRC_FILES := tools/i2cbusses.c tools/util.c lib/smbus.c
LOCAL_MODULE := i2c-tools
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := eng
LOCAL_SRC_FILES := tools/i2cdetect.c lib/smbus.c
LOCAL_MODULE := i2cdetect
LOCAL_CPPFLAGS += -DANDROID
LOCAL_SHARED_LIBRARIES := libc
LOCAL_STATIC_LIBRARIES := i2c-tools
LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/$(KERNEL_DIR)/include
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := eng
LOCAL_SRC_FILES := tools/i2cget.c lib/smbus.c
LOCAL_MODULE := i2cget
LOCAL_CPPFLAGS += -DANDROID
LOCAL_SHARED_LIBRARIES := libc
LOCAL_STATIC_LIBRARIES := i2c-tools
LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/$(KERNEL_DIR)/include
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := eng
LOCAL_SRC_FILES := tools/i2cset.c lib/smbus.c
LOCAL_MODULE := i2cset
LOCAL_CPPFLAGS += -DANDROID
LOCAL_SHARED_LIBRARIES := libc
LOCAL_STATIC_LIBRARIES := i2c-tools
LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/$(KERNEL_DIR)/include
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := eng
LOCAL_SRC_FILES := tools/i2cdump.c lib/smbus.c
LOCAL_MODULE := i2cdump
LOCAL_CPPFLAGS += -DANDROID
LOCAL_SHARED_LIBRARIES := libc
LOCAL_STATIC_LIBRARIES := i2c-tools
LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/$(KERNEL_DIR)/include
include $(BUILD_EXECUTABLE)

