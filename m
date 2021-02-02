Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DCF30B755
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 06:46:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVDMj5Z4NzDr4L
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 16:46:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ur5uyu81; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVDMJ4PMJzDqT3
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Feb 2021 16:46:20 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id i63so13586698pfg.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Feb 2021 21:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tln3Bg0XWCxbufTPpfscM35i70HxngVJbE7UvBj98UE=;
 b=ur5uyu8125bKSk36BOgqcHzNRba+m4rmdURAunmA1IZgw8Ukl7SwGOgOY/um9zahIF
 U2fjcHxa/Bt7VIsk6JgIIJ/TZ6SszxDbMTjrGzgEQdw9/cNitmVV4L64z10vcV68FzZl
 UpG3NLARwg6/5a3KUXd4EyeB8O+hogCEvX/yn1wJiuW1FxbzPw0jxY5brGCWEnLFw7z2
 eiH9COO2N0exjo0wFrvLPlJ8i+hQESRvRDMI2tjHB31idQ9emCrcNwGeTn0ZUGRZW+e6
 BJUpNKgYQgyrRNwgeKx66tWx3uP0Mbq7wEsCUuN9JrcHqrG4Hi05g99cG9ymwChQ519E
 cbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tln3Bg0XWCxbufTPpfscM35i70HxngVJbE7UvBj98UE=;
 b=mV+smxcrsoK36JNeHQPUrUs3wsnrAd7/Z8bJ861BLVONMmJFRDK9Yg+a3WQ9DrlvN2
 97+R5SNBQCb+kIVccszbtqCnlsV08Q7g+9602XShmse1z7u+htmAercWZ858asC35eTi
 dqMn6E7EPX3XTl7iqkUfRmNqtGQ8US7Ng8ocPZACwjkZBbBzQpAqemOx8Cwim2vMp3cB
 4lLwNmIIl/OAveIdFd0+07nAUPO2RP40FV5W9qI3KHaEleJrslklmqqBnYIXV0xvgHq0
 h0uRn+bjXGvIivnF3wPQLPL0iLZHQ/rzn+ezGF4qN3XMZVlpp60fGfJXSfXApPgorgFQ
 dnuQ==
X-Gm-Message-State: AOAM532pP6fiYNKgaSmitF/LOLIbjGl8MYrqsv/QdeJHxMzM/KpmglVZ
 tsohoa4t0as+UT7+43VbGGE=
X-Google-Smtp-Source: ABdhPJwAGq0QrnQvtW7iHwLGv1gc6/4GdIY8RMuro1k8E19IQc512uEEnSwRGgFEjshUKWj6Jw05xg==
X-Received: by 2002:a62:2ac3:0:b029:1bc:4287:c0b3 with SMTP id
 q186-20020a622ac30000b02901bc4287c0b3mr19188437pfq.26.1612244777839; 
 Mon, 01 Feb 2021 21:46:17 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id h23sm20707603pgh.64.2021.02.01.21.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 21:46:16 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 2/2] drm/aspeed: Use dt matching for default register values
Date: Tue,  2 Feb 2021 16:15:58 +1030
Message-Id: <20210202054558.344451-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202054558.344451-1-joel@jms.id.au>
References: <20210202054558.344451-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There are minor differences in the values for the threshold value and
the scan line size between families of ASPEED SoC. Additionally the SCU
registers for the output control and scratch registers differ between
families.

This adds device tree matching to parameterise these values, allowing us
to add support for the AST2400 now, and in the future the AST2600.

Reviewed-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Add jk's review
 - Clean up comments and unused define
 - Add VGA password register
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  8 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 11 ++---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 57 ++++++++++++++++++------
 3 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index f1e7e56abc02..96501152bafa 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -11,6 +11,11 @@ struct aspeed_gfx {
 	struct reset_control		*rst;
 	struct regmap			*scu;
 
+	u32				dac_reg;
+	u32				vga_scratch_reg;
+	u32				throd_val;
+	u32				scan_line_max;
+
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
 };
@@ -100,6 +105,3 @@ int aspeed_gfx_create_output(struct drm_device *drm);
 /* CRT_THROD */
 #define CRT_THROD_LOW(x)		(x)
 #define CRT_THROD_HIGH(x)		((x) << 8)
-
-/* Default Threshold Seting */
-#define G5_CRT_THROD_VAL	(CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3C))
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index e54686c31a90..20c2197b270f 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -59,8 +59,8 @@ static void aspeed_gfx_enable_controller(struct aspeed_gfx *priv)
 	u32 ctrl1 = readl(priv->base + CRT_CTRL1);
 	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
 
-	/* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
-	regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
+	/* Set DAC source for display output to Graphics CRT (GFX) */
+	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), BIT(16));
 
 	writel(ctrl1 | CRT_CTRL_EN, priv->base + CRT_CTRL1);
 	writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
@@ -74,7 +74,7 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 	writel(ctrl1 & ~CRT_CTRL_EN, priv->base + CRT_CTRL1);
 	writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
 
-	regmap_update_bits(priv->scu, 0x2c, BIT(16), 0);
+	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
 }
 
 static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
@@ -127,7 +127,8 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	 * Terminal Count: memory size of one scan line
 	 */
 	d_offset = m->hdisplay * bpp / 8;
-	t_count = (m->hdisplay * bpp + 127) / 128;
+	t_count = DIV_ROUND_UP(m->hdisplay * bpp, priv->scan_line_max);
+
 	writel(CRT_DISP_OFFSET(d_offset) | CRT_TERM_COUNT(t_count),
 			priv->base + CRT_OFFSET);
 
@@ -135,7 +136,7 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	 * Threshold: FIFO thresholds of refill and stop (16 byte chunks
 	 * per line, rounded up)
 	 */
-	writel(G5_CRT_THROD_VAL, priv->base + CRT_THROD);
+	writel(priv->throd_val, priv->base + CRT_THROD);
 }
 
 static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe,
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 54a6bda03c0e..debf6c6e1958 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -7,6 +7,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -57,6 +58,34 @@
  * which is available under NDA from ASPEED.
  */
 
+struct aspeed_gfx_config {
+	u32 dac_reg;		/* DAC register in SCU */
+	u32 vga_scratch_reg;	/* VGA scratch register in SCU */
+	u32 throd_val;		/* Default Threshold Seting */
+	u32 scan_line_max;	/* Max memory size of one scan line */
+};
+
+static const struct aspeed_gfx_config ast2400_config = {
+	.dac_reg = 0x2c,
+	.vga_scratch_reg = 0x50,
+	.throd_val = CRT_THROD_LOW(0x1e) | CRT_THROD_HIGH(0x12),
+	.scan_line_max = 64,
+};
+
+static const struct aspeed_gfx_config ast2500_config = {
+	.dac_reg = 0x2c,
+	.vga_scratch_reg = 0x50,
+	.throd_val = CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3c),
+	.scan_line_max = 128,
+};
+
+static const struct of_device_id aspeed_gfx_match[] = {
+	{ .compatible = "aspeed,ast2400-gfx", .data = &ast2400_config },
+	{ .compatible = "aspeed,ast2500-gfx", .data = &ast2500_config },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_gfx_of_table);
+
 static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
 	.fb_create		= drm_gem_fb_create,
 	.atomic_check		= drm_atomic_helper_check,
@@ -97,13 +126,13 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 	return IRQ_NONE;
 }
 
-
-
 static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	struct device_node *np = pdev->dev.of_node;
+	const struct aspeed_gfx_config *config;
+	const struct of_device_id *match;
 	struct resource *res;
 	int ret;
 
@@ -112,6 +141,16 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	match = of_match_device(aspeed_gfx_match, &pdev->dev);
+	if (!match)
+		return -EINVAL;
+	config = match->data;
+
+	priv->dac_reg = config->dac_reg;
+	priv->vga_scratch_reg = config->vga_scratch_reg;
+	priv->throd_val = config->throd_val;
+	priv->scan_line_max = config->scan_line_max;
+
 	priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->scu)) {
 		priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
@@ -206,14 +245,6 @@ static const struct drm_driver aspeed_gfx_driver = {
 	.minor = 0,
 };
 
-static const struct of_device_id aspeed_gfx_match[] = {
-	{ .compatible = "aspeed,ast2500-gfx" },
-	{ }
-};
-
-#define ASPEED_SCU_VGA0		0x50
-#define ASPEED_SCU_MISC_CTRL	0x2c
-
 static ssize_t dac_mux_store(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t count)
 {
@@ -228,7 +259,7 @@ static ssize_t dac_mux_store(struct device *dev, struct device_attribute *attr,
 	if (val > 3)
 		return -EINVAL;
 
-	rc = regmap_update_bits(priv->scu, ASPEED_SCU_MISC_CTRL, 0x30000, val << 16);
+	rc = regmap_update_bits(priv->scu, priv->dac_reg, 0x30000, val << 16);
 	if (rc < 0)
 		return 0;
 
@@ -241,7 +272,7 @@ static ssize_t dac_mux_show(struct device *dev, struct device_attribute *attr, c
 	u32 reg;
 	int rc;
 
-	rc = regmap_read(priv->scu, ASPEED_SCU_MISC_CTRL, &reg);
+	rc = regmap_read(priv->scu, priv->dac_reg, &reg);
 	if (rc)
 		return rc;
 
@@ -256,7 +287,7 @@ vga_pw_show(struct device *dev, struct device_attribute *attr, char *buf)
 	u32 reg;
 	int rc;
 
-	rc = regmap_read(priv->scu, ASPEED_SCU_VGA0, &reg);
+	rc = regmap_read(priv->scu, priv->vga_scratch_reg, &reg);
 	if (rc)
 		return rc;
 
-- 
2.30.0

