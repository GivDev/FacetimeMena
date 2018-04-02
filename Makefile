export ARCHS = armv7 arm64

DEBUG=0

SDKVERSION = 10.3
SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += preinst
SUBPROJECTS += postrm

include $(THEOS_MAKE_PATH)/aggregate.mk
