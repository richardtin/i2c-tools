[TOC]

I2C TOOLS FOR LINUX
===================

This package contains an heterogeneous set of I2C tools for the Linux kernel
as well as an I2C library. The tools were originally part of the lm-sensors
project but were finally split into their own package for convenience. The
library is used by some of the tools, but can also be used by third-party
applications. The tools and library compile, run and have been tested on
GNU/Linux.

The latest version of the code can be downloaded from:
  https://github.com/groeck/i2c-tools

# How to build `i2c-tools` for Android platform

## Download `i2c-tools`

```sh
$ git clone https://github.com/richardtin/i2c-tools {ANDROID_ROOT}/external/i2c-tools
```

## Compile `i2c-tools` ONLY

```sh
$ source build/envsetup.sh
$ lunch $TARGET-$VARIANT (ex: aosp_arm-eng, aosp_hammerhead-eng)
$ cd {ANDROID_ROOT}/external/i2c-tools
$ mm
```

* There are 4 binary files - `i2cdetect`, `i2cdump`, `i2cset`, `i2cget`, and will be installed to `{ANDROID_ROOT}/out/target/product/{PRODUCT_NAME}/system/bin` folder.

## Make new `system.img`

```sh
$ make snod
$ fastboot system system.img
```

# `Android.mk`

```Makefile
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
```

