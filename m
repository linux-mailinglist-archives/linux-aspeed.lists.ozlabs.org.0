Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8EC46B91D
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 11:29:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7c3b4S0qz308h
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 21:29:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=tommy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7c3J5dWwz2yg5
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Dec 2021 21:29:00 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1B7A33lY003134;
 Tue, 7 Dec 2021 18:03:03 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 18:27:59 +0800
From: Tommy Haung <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 5/6] drm/aspeed: Add reset and clock for AST2600
Date: Tue, 7 Dec 2021 18:27:48 +0800
Message-ID: <20211207102749.18118-7-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211207102749.18118-1-tommy_huang@aspeedtech.com>
References: <20211207102749.18118-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1B7A33lY003134
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: tommy-huang <tommy_huang@aspeedtech.com>

Add more reset and clock select code for AST2600.
The gfx_flags parameter was added for chip caps idenified.

Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      | 16 +++++++-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 16 ++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 50 ++++++++++++++++++++++--
 3 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index 4e6a442c3886..2c733225d3c7 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -8,7 +8,8 @@ struct aspeed_gfx {
 	struct drm_device		drm;
 	void __iomem			*base;
 	struct clk			*clk;
-	struct reset_control		*rst;
+	struct reset_control		*rst_crt;
+	struct reset_control		*rst_engine;
 	struct regmap			*scu;
 
 	u32				dac_reg;
@@ -16,6 +17,7 @@ struct aspeed_gfx {
 	u32				vga_scratch_reg;
 	u32				throd_val;
 	u32				scan_line_max;
+	u32				flags;
 
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
@@ -106,3 +108,15 @@ int aspeed_gfx_create_output(struct drm_device *drm);
 /* CRT_THROD */
 #define CRT_THROD_LOW(x)		(x)
 #define CRT_THROD_HIGH(x)		((x) << 8)
+
+/* SCU control */
+#define SCU_G6_CLK_COURCE		0x300
+
+/* GFX FLAGS */
+#define RESET_MASK			BIT(0)
+#define RESET_G6			BIT(0)
+#define CLK_MASK			BIT(4)
+#define CLK_G6				BIT(4)
+
+#define G6_CLK_MASK			(BIT(8) | BIT(9) | BIT(10))
+#define G6_USB_40_CLK			BIT(9)
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 827e62c1daba..e0975ecda92d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -77,6 +77,18 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
 }
 
+static void aspeed_gfx_set_clk(struct aspeed_gfx *priv)
+{
+	switch (priv->flags & CLK_MASK) {
+	case CLK_G6:
+		regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, 0x0);
+		regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, G6_USB_40_CLK);
+		break;
+	default:
+		break;
+	}
+}
+
 static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 {
 	struct drm_display_mode *m = &priv->pipe.crtc.state->adjusted_mode;
@@ -87,6 +99,8 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	if (err)
 		return;
 
+	aspeed_gfx_set_clk(priv);
+
 #if 0
 	/* TODO: we have only been able to test with the 40MHz USB clock. The
 	 * clock is fixed, so we cannot adjust it here. */
@@ -193,6 +207,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	/* Clear pending VBLANK IRQ */
@@ -207,6 +222,7 @@ static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
 static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	reg &= ~CRT_CTRL_VERTICAL_INTR_EN;
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d10246b1d1c2..59a0de92650f 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -64,6 +64,7 @@ struct aspeed_gfx_config {
 	u32 vga_scratch_reg;	/* VGA scratch register in SCU */
 	u32 throd_val;		/* Default Threshold Seting */
 	u32 scan_line_max;	/* Max memory size of one scan line */
+	u32 gfx_flags;		/* Flags for gfx chip caps */
 };
 
 static const struct aspeed_gfx_config ast2400_config = {
@@ -72,6 +73,7 @@ static const struct aspeed_gfx_config ast2400_config = {
 	.vga_scratch_reg = 0x50,
 	.throd_val = CRT_THROD_LOW(0x1e) | CRT_THROD_HIGH(0x12),
 	.scan_line_max = 64,
+	.gfx_flags = 0,
 };
 
 static const struct aspeed_gfx_config ast2500_config = {
@@ -80,6 +82,7 @@ static const struct aspeed_gfx_config ast2500_config = {
 	.vga_scratch_reg = 0x50,
 	.throd_val = CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3c),
 	.scan_line_max = 128,
+	.gfx_flags = 0,
 };
 
 static const struct aspeed_gfx_config ast2600_config = {
@@ -88,6 +91,7 @@ static const struct aspeed_gfx_config ast2600_config = {
 	.vga_scratch_reg = 0x50,
 	.throd_val = CRT_THROD_LOW(0x50) | CRT_THROD_HIGH(0x70),
 	.scan_line_max = 128,
+	.gfx_flags = RESET_G6 | CLK_G6,
 };
 
 static const struct of_device_id aspeed_gfx_match[] = {
@@ -138,6 +142,44 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 	return IRQ_NONE;
 }
 
+static int aspeed_gfx_reset(struct drm_device *drm)
+{
+	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
+
+	switch (priv->flags & RESET_MASK) {
+	case RESET_G6:
+		priv->rst_crt = devm_reset_control_get(&pdev->dev, "crt");
+		if (IS_ERR(priv->rst_crt)) {
+			dev_err(&pdev->dev,
+				"missing or invalid crt reset controller device tree entry");
+			return PTR_ERR(priv->rst_crt);
+		}
+		reset_control_deassert(priv->rst_crt);
+
+		priv->rst_engine = devm_reset_control_get(&pdev->dev, "engine");
+		if (IS_ERR(priv->rst_engine)) {
+			dev_err(&pdev->dev,
+				"missing or invalid engine reset controller device tree entry");
+			return PTR_ERR(priv->rst_engine);
+		}
+		reset_control_deassert(priv->rst_engine);
+		break;
+
+	default:
+		priv->rst_crt = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(priv->rst_crt)) {
+			dev_err(&pdev->dev,
+				"missing or invalid reset controller device tree entry");
+			return PTR_ERR(priv->rst_crt);
+		}
+		reset_control_deassert(priv->rst_crt);
+		break;
+	}
+
+	return 0;
+}
+
 static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
@@ -163,6 +205,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	priv->vga_scratch_reg = config->vga_scratch_reg;
 	priv->throd_val = config->throd_val;
 	priv->scan_line_max = config->scan_line_max;
+	priv->flags = config->gfx_flags;
 
 	priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->scu)) {
@@ -186,13 +229,12 @@ static int aspeed_gfx_load(struct drm_device *drm)
 		return ret;
 	}
 
-	priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(priv->rst)) {
+	ret = aspeed_gfx_reset(drm);
+	if (ret) {
 		dev_err(&pdev->dev,
 			"missing or invalid reset controller device tree entry");
-		return PTR_ERR(priv->rst);
+		return ret;
 	}
-	reset_control_deassert(priv->rst);
 
 	priv->clk = devm_clk_get(drm->dev, NULL);
 	if (IS_ERR(priv->clk)) {
-- 
2.17.1

