LOCAL_PATH := $(call my-dir)
$(info $(LOCAL_PATH))

### libcrypto static library ###

include $(CLEAR_VARS)
LIBCRYPTO_PATH := ../vendor/couchbase-lite-libcrypto/libs
LOCAL_MODULE := libcrypto
LOCAL_EXPORT_C_INCLUDES := $(LIBCRYPTO_PATH)/include
LOCAL_SRC_FILES := $(LIBCRYPTO_PATH)/android/$(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

### Build libsqlcipher ###

include $(CLEAR_VARS)
LOCAL_MODULE := libsqlcipher
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src/headers
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../vendor/couchbase-lite-libcrypto/libs/include
LOCAL_SRC_FILES := ../src/c/sqlite3.c
LOCAL_STATIC_LIBRARIES := libcrypto
LOCAL_CFLAGS := -DSQLITE_THREADSAFE=2
LOCAL_CFLAGS += -DSQLITE_TEMP_STORE=2 -DSQLITE_HAS_CODEC
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS4
LOCAL_CFLAGS += -DSQLITE_ENABLE_RTREE
LOCAL_CFLAGS += -ffunction-sections -fdata-sections
include $(BUILD_SHARED_LIBRARY)
