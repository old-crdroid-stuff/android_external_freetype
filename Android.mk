# this is now the default FreeType build for Android
#
ifndef USE_FREETYPE
USE_FREETYPE := 2.7
endif

ifeq ($(USE_FREETYPE),2.7)
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# compile in ARM mode, since the glyph loader/renderer is a hotspot
# when loading complex pages in the browser
#
LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES:= \
    src/autofit/autofit.c \
    src/base/ftbase.c \
    src/base/ftbbox.c \
    src/base/ftbitmap.c \
    src/base/ftdebug.c \
    src/base/ftfstype.c \
    src/base/ftgasp.c \
    src/base/ftglyph.c \
    src/base/ftinit.c \
    src/base/ftmm.c \
    src/base/ftstroke.c \
    src/base/fttype1.c \
    src/base/ftsystem.c \
    src/cid/type1cid.c \
    src/cff/cff.c \
    src/gzip/ftgzip.c \
    src/psaux/psaux.c \
    src/pshinter/pshinter.c \
    src/psnames/psnames.c \
    src/raster/raster.c \
    src/sfnt/sfnt.c \
    src/smooth/smooth.c \
    src/truetype/truetype.c \
    src/type1/type1.c

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/include \
    external/libpng \
    external/zlib

LOCAL_CFLAGS += -W -Wall
LOCAL_CFLAGS += -fPIC -DPIC
LOCAL_CFLAGS += "-DDARWIN_NO_CARBON"
LOCAL_CFLAGS += "-DFT2_BUILD_LIBRARY"

LOCAL_SHARED_LIBRARIES += libpng libz

# the following is for testing only, and should not be used in final builds
# of the product
#LOCAL_CFLAGS += "-DTT_CONFIG_OPTION_BYTECODE_INTERPRETER"

LOCAL_CFLAGS += -O2

LOCAL_MODULE:= libft2

include $(BUILD_SHARED_LIBRARY)
endif