Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614B1F2A15
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:09:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr8H242FzDq9p
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:09:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dZB12frGzDqtN
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jun 2020 17:32:57 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51AECB165;
 Fri,  5 Jun 2020 07:32:55 +0000 (UTC)
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
Subject: [PATCH v3 03/43] drm/cma-helper: Add DRM_GEM_CMA_DRIVER_OPS to set
 default GEM CMA functions
Date: Fri,  5 Jun 2020 09:32:07 +0200
Message-Id: <20200605073247.4057-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605073247.4057-1-tzimmermann@suse.de>
References: <20200605073247.4057-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:54 +1000
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

The macro to DRM_GEM_CMA_DRIVER_OPS sets GEM callbacks in struct drm_driver
to their defaults for CMA. An variant of the macro is provided for drivers
that override the default .dumb_create callback. Adapt drivers to the changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 include/drm/drm_gem_cma_helper.h | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 2cdf333ae585d..5e1e595c0e72d 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -109,6 +109,42 @@ void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 struct drm_gem_object *
 drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
 
+/**
+ * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
+ * @dumb_create_func: callback function for .dumb_create
+ *
+ * This macro provides a shortcut for setting the default GEM operations in the
+ * &drm_driver structure.
+ *
+ * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that
+ * override the default implementation of &struct rm_driver.dumb_create. Use
+ * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual address
+ * on imported buffers should use
+ * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
+ */
+#define DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func) \
+	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
+	.dumb_create		= (dumb_create_func), \
+	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
+	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
+	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table, \
+	.gem_prime_mmap		= drm_gem_cma_prime_mmap
+
+/**
+ * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
+ *
+ * This macro provides a shortcut for setting the default GEM operations in the
+ * &drm_driver structure.
+ *
+ * Drivers that come with their own implementation of
+ * &struct drm_driver.dumb_create should use
+ * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead. Use
+ * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual address
+ * on imported buffers should use DRM_GEM_CMA_DRIVER_OPS_VMAP instead.
+ */
+#define DRM_GEM_CMA_DRIVER_OPS \
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
+
 /**
  * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE - CMA GEM driver operations
  *                                                ensuring a virtual address
@@ -120,8 +156,10 @@ drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
  * imported buffers.
  *
  * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS_VMAP for drivers that
- * override the default implementation of &struct rm_driver.dumb_create. Use
- * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible.
+ * override the default implementation of &struct drm_driver.dumb_create. Use
+ * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
+ * virtual address on imported buffers should use
+ * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead.
  */
 #define DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(dumb_create_func) \
 	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
@@ -142,7 +180,9 @@ drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
  * Drivers that come with their own implementation of
  * &struct drm_driver.dumb_create should use
  * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead. Use
- * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible.
+ * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
+ * virtual address on imported buffers should use DRM_GEM_CMA_DRIVER_OPS
+ * instead.
  */
 #define DRM_GEM_CMA_DRIVER_OPS_VMAP \
 	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
-- 
2.26.2

