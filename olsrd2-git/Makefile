# 
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id $

include $(TOPDIR)/rules.mk

PKG_NAME:=olsrd2-git
PKG_VERSION:=master
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://olsr.org/oonf.git
PKG_SOURCE_VERSION:=origin/master
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

define Package/olsrd2-git/template
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=OLSR V2 daemon packaged for Sburratone by Ninux
  MAINTAINER:=contatti@ninux.org
  URL:=http://www.olsr.org/
endef

define Package/olsrd2-git
  $(call Package/olsrd2-git/template)
  MENU:=1
  DEPENDS:=+librt +libnl-tiny +libuci
endef

#define Package/olsrd2-git/conffiles
#/etc/config/olsrd2
#endef


CMAKE_SOURCE_DIR=$(CURDIR)/../../
CMAKE_OPTIONS=-D OONF_DO_NOT_REGISTER_PACKAGE:Bool=true \
              -D OONF_NO_WERROR:Bool=true \
              -D OONF_LOGGING_LEVEL:String=debug \
              -D UCI:Bool=true \
              -D OONF_APP_DEFAULT_CFG_HANDLER:String=uci \
              -D OONF_CUSTOM_STATIC_PLUGINS:String="cfg_compact ff_dat_metric neighbor_probing nl80211_listener link_config layer2info cfg_uciloader nhdpinfo olsrv2info" \
              -D INSTALL_LIB_DIR:Path=lib/oonf \
              -D INSTALL_INCLUDE_DIR:Path=include/oonf \
              -D INSTALL_CMAKE_DIR:Path=lib/oonf \
              -D CMAKE_PREFIX_PATH=$(STAGING_DIR)/usr

define Build/Configure
        cd $(PKG_BUILD_DIR)/build && cmake ..
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/build	
endef

define Package/olsrd2-git/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/olsrd2 $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/*.so* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,olsrd2-git))

