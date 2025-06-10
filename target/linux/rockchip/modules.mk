# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 OpenWrt.org

define KernelPackage/drm-rockchip
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=Rockchip DRM support
  DEPENDS:=@TARGET_rockchip +kmod-backlight +kmod-drm-kms-helper \
	+kmod-drm-display-helper
  KCONFIG:= \
	CONFIG_DRM_ROCKCHIP \
	CONFIG_DRM_LOAD_EDID_FIRMWARE=y \
	CONFIG_DRM_FBDEV_EMULATION=y \
	CONFIG_DRM_FBDEV_OVERALLOC=100 \
	CONFIG_DRM_BRIDGE=y \
	CONFIG_HDMI=y \
	CONFIG_PHY_ROCKCHIP_INNO_HDMI \
	CONFIG_ROCKCHIP_ANALOGIX_DP=y \
	CONFIG_ROCKCHIP_CDN_DP=y \
	CONFIG_ROCKCHIP_INNO_HDMI=y \
	CONFIG_ROCKCHIP_LVDS=y \
	CONFIG_ROCKCHIP_RGB=y \
	CONFIG_ROCKCHIP_RK3066_HDMI=y \
	CONFIG_ROCKCHIP_VOP=y \
	CONFIG_ROCKCHIP_VOP2=y \
	CONFIG_DRM_DP_AUX_BUS \
	CONFIG_DRM_GEM_DMA_HELPER \
	CONFIG_DRM_PANEL=y \
	CONFIG_DRM_PANEL_BRIDGE=y \
	CONFIG_DRM_PANEL_SIMPLE
  FILES:= \
	$(LINUX_DIR)/drivers/phy/rockchip/phy-rockchip-inno-hdmi.ko \
	$(LINUX_DIR)/drivers/gpu/drm/drm_dma_helper.ko \
	$(LINUX_DIR)/drivers/gpu/drm/bridge/analogix/analogix_dp.ko \
	$(LINUX_DIR)/drivers/gpu/drm/panel/panel-simple.ko \
	$(LINUX_DIR)/drivers/gpu/drm/rockchip/rockchipdrm.ko \
	$(LINUX_DIR)/drivers/media/cec/core/cec.ko
  AUTOLOAD:=$(call AutoProbe,rockchipdrm phy-rockchip-inno-hdmi panel-simple)
endef

define KernelPackage/drm-rockchip/description
  Direct Rendering Manager (DRM) support for Rockchip
endef

$(eval $(call KernelPackage,drm-rockchip))
