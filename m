Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D371E196A
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:35:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ384SPrzDqMt
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:35:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=tzimmermann@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49T7H16HkYzDqQr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 May 2020 23:52:58 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C822B018;
 Fri, 22 May 2020 13:52:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: abrodkin@synopsys.com, airlied@linux.ie, daniel@ffwll.ch,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, joel@jms.id.au, andrew@aj.id.au, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, xinliang.liu@linaro.org, zourongrong@gmail.com,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, linus.walleij@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 wens@csie.org, jsarha@ti.com, tomi.valkeinen@ti.com, noralf@tronnes.org
Subject: [PATCH 00/21] drm: Convert most CMA-based drivers to GEM object
 functions
Date: Fri, 22 May 2020 15:52:25 +0200
Message-Id: <20200522135246.10134-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 May 2020 12:34:04 +1000
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Most of the CMA-based drivers use the default implementation for the
callbacks in struct drm_driver. With this patch, these interfaces are
initialized with a common helper macro and GEM object functions replace
several deprecated interfaces.

The first patch updates the existing macro to similar naming as with
SHMEM and adds a helper for drivers that override the default implementation
for .dumb_create(). The remaining patches convert the drivers. The aspeed
driver already uses GEM object functions and only changes to the initializer
macro.

I don't have much of the hardware, so compile-tested on aarch64, arm and
x86-64 only.

Thomas Zimmermann (21):
  drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS macro
  drm/arc: Use GEM CMA object functions
  drm/arm: Use GEM CMA object functions
  drm/aspeed: Set driver CMA functions with DRM_GEM_CMA_DRIVER_OPS
  drm/atmel-hlcdc: Use GEM CMA object functions
  drm/fsl-dcu: Use GEM CMA object functions
  drm/hisilicon/kirin: Use GEM CMA object functions
  drm/imx: Use GEM CMA object functions
  drm/ingenic: Use GEM CMA object functions
  drm/komeda: Use GEM CMA object functions
  drm/malidp: Use GEM CMA object functions
  drm/mcde: Use GEM CMA object functions
  drm/meson: Use GEM CMA object functions
  drm/mxsfb: Use GEM CMA object functions
  drm/rcar-du: Use GEM CMA object functions
  drm/shmobile: Use GEM CMA object functions
  drm/stm: Use GEM CMA object functions
  drm/sti: Use GEM CMA object functions
  drm/tilcdc: Use GEM CMA object functions
  drm/tv200: Use GEM CMA object functions
  drm/zte: Use GEM CMA object functions

 drivers/gpu/drm/arc/arcpgu_drv.c              | 12 +---------
 .../gpu/drm/arm/display/komeda/komeda_kms.c   | 11 +--------
 drivers/gpu/drm/arm/hdlcd_drv.c               | 12 +---------
 drivers/gpu/drm/arm/malidp_drv.c              | 11 +--------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  7 +-----
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 11 +--------
 drivers/gpu/drm/drm_gem_cma_helper.c          |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     | 11 +--------
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 12 +---------
 drivers/gpu/drm/imx/imx-drm-core.c            | 12 +---------
 drivers/gpu/drm/ingenic/ingenic-drm.c         | 13 +---------
 drivers/gpu/drm/mcde/mcde_drv.c               | 12 +---------
 drivers/gpu/drm/meson/meson_drv.c             | 15 ++----------
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             | 11 +--------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 11 +--------
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      | 11 +--------
 drivers/gpu/drm/sti/sti_drv.c                 | 12 +---------
 drivers/gpu/drm/stm/drv.c                     | 11 +--------
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +--
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 13 +---------
 drivers/gpu/drm/tiny/hx8357d.c                |  2 +-
 drivers/gpu/drm/tiny/ili9225.c                |  2 +-
 drivers/gpu/drm/tiny/ili9341.c                |  2 +-
 drivers/gpu/drm/tiny/ili9486.c                |  2 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |  2 +-
 drivers/gpu/drm/tiny/repaper.c                |  2 +-
 drivers/gpu/drm/tiny/st7586.c                 |  2 +-
 drivers/gpu/drm/tiny/st7735r.c                |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           | 12 +---------
 drivers/gpu/drm/zte/zx_drm_drv.c              | 11 +--------
 include/drm/drm_gem_cma_helper.h              | 24 +++++++++++++++----
 32 files changed, 52 insertions(+), 226 deletions(-)

--
2.26.2

