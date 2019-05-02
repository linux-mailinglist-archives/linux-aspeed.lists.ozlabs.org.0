Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889112456
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 23:51:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w89g42GyzDqQC
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 07:51:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="TizcKENu"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w89Y4WBJzDqPF
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 May 2019 07:51:45 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 927A1E03176
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:51:43 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0Eyf7yI3Bvcn for <linux-aspeed@lists.ozlabs.org>;
 Thu,  2 May 2019 16:51:42 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BCF85E03631
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:51:42 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BCF85E03631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556833902; bh=GDVkjSH5wFjLwXsn2dSo2qreuBPoVvlciiYrmarUyKY=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=TizcKENuC5MJRXOj3jNZWpzdKW5qeBAwKaQCsniJN/8Du+SSJWugJOjoxujt8Vt8N
 Uq76CzRCspRCgbht3IF0xGmdWO8ma3X6XNUbRyCOJWsNwpzND6XP5qWuUy/D7BenXL
 9yRna3quO/9E2jvwvMjlD9gzllpIo/N196vY2ycM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nTUqTjM0mMMt for <linux-aspeed@lists.ozlabs.org>;
 Thu,  2 May 2019 16:51:42 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 952BCE03176
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:51:41 -0500 (CDT)
Date: Thu, 2 May 2019 16:51:41 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Message-ID: <671575004.3553124.1556833901812.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 2/2] drm/aspeed: Add DVO output option to GFX driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF65 (Linux)/8.5.0_GA_3042)
Thread-Index: Hn+lzH9KeJqAQh8vDd+ULZxVSc+qow==
Thread-Topic: drm/aspeed: Add DVO output option to GFX driver
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2500 offers an alternate GFX output mode over DVO.
Enable DVO or VGA output mode conditionally based on two new
device tree properties, output-vga and output-dvo.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  6 ++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 29 +++++++++++++++++++++++------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 17 ++++++++++++++++-
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index b34c97613aaf..6f9bc01191c0 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -14,6 +14,8 @@ struct aspeed_gfx {
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
 	struct drm_fbdev_cma		*fbdev;
+
+	u8				output_mode;
 };
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
@@ -105,3 +107,7 @@ int aspeed_gfx_create_output(struct drm_device *drm);
 
 /* Default Threshold Seting */
 #define G5_CRT_THROD_VAL	(CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3C))
+
+/* Output mode */
+#define OUTPUT_VGA	0x1
+#define OUTPUT_DVO	0x2
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 15db9e426ec4..ee16f9011d70 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corporation
+// Copyright 2019 Raptor Engineering, LLC
 
 #include <linux/clk.h>
 #include <linux/reset.h>
@@ -59,11 +60,21 @@ static void aspeed_gfx_enable_controller(struct aspeed_gfx *priv)
 	u32 ctrl1 = readl(priv->base + CRT_CTRL1);
 	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
 
-	/* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
-	regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
+	if (priv->output_mode & OUTPUT_VGA) {
+		/* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
+		regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
+	}
+	if (priv->output_mode & OUTPUT_DVO) {
+		/* SCU2C: set DVO source for display output to Graphics CRT (GFX) */
+		regmap_update_bits(priv->scu, 0x2c, BIT(18), BIT(18));
+	}
 
 	writel(ctrl1 | CRT_CTRL_EN, priv->base + CRT_CTRL1);
-	writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
+
+	if (priv->output_mode & OUTPUT_VGA)
+		writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
+	if (priv->output_mode & OUTPUT_DVO)
+		writel(ctrl2 | CRT_CTRL_DVO_EN, priv->base + CRT_CTRL2);
 }
 
 static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
@@ -72,9 +83,15 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
 
 	writel(ctrl1 & ~CRT_CTRL_EN, priv->base + CRT_CTRL1);
-	writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
-
-	regmap_update_bits(priv->scu, 0x2c, BIT(16), 0);
+	if (priv->output_mode & OUTPUT_VGA)
+		writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
+	if (priv->output_mode & OUTPUT_DVO)
+		writel(ctrl2 & ~CRT_CTRL_DVO_EN, priv->base + CRT_CTRL2);
+
+	if (priv->output_mode & OUTPUT_VGA)
+		regmap_update_bits(priv->scu, 0x2c, BIT(16), 0);
+	if (priv->output_mode & OUTPUT_DVO)
+		regmap_update_bits(priv->scu, 0x2c, BIT(18), 0);
 }
 
 static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 7e9072fd0ef0..17a22dd0922a 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corporation
+// Copyright 2019 Raptor Engineering, LLC
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
@@ -50,7 +51,8 @@
  * is the ARM's internal display controller.
  *
  * The driver only supports a simple configuration consisting of a 40MHz
- * pixel clock, fixed by hardware limitations, and the VGA output path.
+ * pixel clock, fixed by hardware limitations.  It supports DVO output
+ * mode as well based on device tree configuration.
  *
  * The driver was written with the 'AST2500 Software Programming Guide' v17,
  * which is available under NDA from ASPEED.
@@ -95,6 +97,7 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct device_node *nc = drm->dev->of_node;
 	struct aspeed_gfx *priv;
 	struct resource *res;
 	int ret;
@@ -145,6 +148,18 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	}
 	clk_prepare_enable(priv->clk);
 
+	if (of_property_read_bool(nc, "output-vga"))
+		priv->output_mode |= OUTPUT_VGA;
+	else if (of_property_read_bool(nc, "output-dvo"))
+		priv->output_mode |= OUTPUT_DVO;
+	else
+		priv->output_mode = OUTPUT_VGA;
+
+	if (priv->output_mode & OUTPUT_VGA)
+		DRM_INFO("Enabling VGA output\n");
+	if (priv->output_mode & OUTPUT_DVO)
+		DRM_INFO("Enabling DVO output\n");
+
 	/* Sanitize control registers */
 	writel(0, priv->base + CRT_CTRL1);
 	/* Preserve CRT_CTRL2[7:6] (DVO configuration) */
-- 
2.11.0
