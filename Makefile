#
# To build, put this file in "package/hub-ctrl/Makefile" in the OpenWrt SDK,
# then run "scripts/feeds install libusb-compat" and finally "make V=s".
# This will create ./bin/ar71xx/packages/base/hub-ctrl_1_ar71xx.ipk (depending on your architecture)
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hub-ctrl
PKG_VERSION:=1.0
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/codazoda/hub-ctrl.c.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/hub-ctrl
  SUBMENU:=Utilities
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Control USB power on a port by port basis 
  URL:=https://github.com/codazoda/hub-ctrl.c
  DEPENDS:=+libusb-compat
endef

define Package/hub-ctrl/description
  Control USB power on a port by port basis on some USB hubs.
  This only works on USB hubs that have the hardware necessary 
  to allow software controlled power switching.
  Most hubs DO NOT include the hardware.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Build/Configure
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include \
		-L$(STAGING_DIR)/usr/lib -lusb \
		-o $(PKG_BUILD_DIR)/hub-ctrl $(PKG_BUILD_DIR)/hub-ctrl.c
endef

define Package/hub-ctrl/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hub-ctrl $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,hub-ctrl))
