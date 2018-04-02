GO_EASY_ON_ME = 1

export ARCHS = armv7 arm64

SDKVERSION = 10.3
SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk

include $(THEOS)/makefiles/common.mk

TOOL_NAME = postrm
postrm_FILES = main.mm
postrm_INSTALL_PATH = /DEBIAN

include $(THEOS_MAKE_PATH)/tool.mk
