Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC471F2AEA
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:14:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49grFt5dmHzDq9B
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:14:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dZBN5X2HzDqtS
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jun 2020 17:33:16 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7ED9B291;
 Fri,  5 Jun 2020 07:33:15 +0000 (UTC)
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
Subject: [PATCH v3 35/43] drm/sti: Use GEM CMA object functions
Date: Fri,  5 Jun 2020 09:32:39 +0200
Message-Id: <20200605073247.4057-36-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605073247.4057-1-tzimmermann@suse.de>
References: <20200605073247.4057-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:42:06 +1000
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
 dri-devel@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Create GEM objects with drm_gem_cma_create_object_default_funcs(), which
allocates the object and sets CMA's default object functions. Corresponding
callbacks in struct drm_driver are cleared. No functional changes are made.

Driver and object-function instances use the same callback functions, with
the exception of vunmap. The implementation of vunmap is empty and left out
in CMA's default object functions.

v3:
	* convert to DRIVER_OPS macro in a separate patch

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/sti/sti_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 3f9db3e3f3978..1e9dba309f12e 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -132,17 +132,13 @@ DEFINE_DRM_GEM_CMA_FOPS(sti_driver_fops);
 
 static struct drm_driver sti_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
-	.gem_free_object_unlocked = drm_gem_cma_free_object,
-	.gem_vm_ops = &drm_gem_cma_vm_ops,
+	.gem_create_object = drm_gem_cma_create_object_default_funcs,
 	.dumb_create = drm_gem_cma_dumb_create,
 	.fops = &sti_driver_fops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
-	.gem_prime_vmap = drm_gem_cma_prime_vmap,
-	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap = drm_gem_cma_prime_mmap,
 
 	.debugfs_init = sti_drm_dbg_init,
-- 
2.26.2

