Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 148874CCDC9
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 07:33:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8yhp0rtVz30FM
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 17:32:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8yhd11p9z2yww
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 17:32:46 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2246MIcb041906;
 Fri, 4 Mar 2022 14:22:18 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 14:31:44 +0800
From: Tommy Haung <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] drm/aspeed: Add 1024x768 mode for AST2600
Date: Fri, 4 Mar 2022 14:31:37 +0800
Message-ID: <20220304063137.12970-3-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220304063137.12970-1-tommy_huang@aspeedtech.com>
References: <20220304063137.12970-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2246MIcb041906
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

Update the aspeed_gfx_set_clk with display width.
At AST2600, the display clock could be coming from
HPLL clock / 16 = 75MHz. It would fit 1024x768@70Hz.
Another chip will still keep 800x600.

Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      | 12 ++++++----
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 29 ++++++++++++++++++++----
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 16 +++++++++++--
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c  | 14 +++++++++++-
 4 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index eb4c267cde5e..c7aefee0657a 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -109,11 +109,15 @@ int aspeed_gfx_create_output(struct drm_device *drm);
 #define CRT_THROD_HIGH(x)		((x) << 8)
 
 /* SCU control */
-#define SCU_G6_CLK_COURCE		0x300
+#define G6_CLK_SOURCE			0x300
+#define G6_CLK_SOURCE_MASK		(BIT(8) | BIT(9) | BIT(10))
+#define G6_CLK_SOURCE_HPLL		(BIT(8) | BIT(9) | BIT(10))
+#define G6_CLK_SOURCE_USB		BIT(9)
+#define G6_CLK_SEL3			0x308
+#define G6_CLK_DIV_MASK			0x3F000
+#define G6_CLK_DIV_16			(BIT(16)|BIT(15)|BIT(13)|BIT(12))
+#define G6_USB_40_CLK			BIT(9)
 
 /* GFX FLAGS */
 #define CLK_MASK			BIT(0)
 #define CLK_G6				BIT(0)
-
-#define G6_CLK_MASK			(BIT(8) | BIT(9) | BIT(10))
-#define G6_USB_40_CLK			BIT(9)
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index a24fab22eac4..5829be9c7c67 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -23,6 +23,28 @@ drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
 	return container_of(pipe, struct aspeed_gfx, pipe);
 }
 
+static void aspeed_gfx_set_clock_source(struct aspeed_gfx *priv, int mode_width)
+{
+	regmap_update_bits(priv->scu, G6_CLK_SOURCE, G6_CLK_SOURCE_MASK, 0x0);
+	regmap_update_bits(priv->scu, G6_CLK_SEL3, G6_CLK_DIV_MASK, 0x0);
+
+	switch (mode_width) {
+	case 1024:
+		/* hpll div 16 = 75Mhz */
+		regmap_update_bits(priv->scu, G6_CLK_SOURCE,
+		G6_CLK_SOURCE_MASK, G6_CLK_SOURCE_HPLL);
+		regmap_update_bits(priv->scu, G6_CLK_SEL3,
+		G6_CLK_DIV_MASK, G6_CLK_DIV_16);
+		break;
+	case 800:
+	default:
+		/* usb 40Mhz */
+		regmap_update_bits(priv->scu, G6_CLK_SOURCE,
+		G6_CLK_SOURCE_MASK, G6_CLK_SOURCE_USB);
+		break;
+	}
+}
+
 static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
 {
 	struct drm_crtc *crtc = &priv->pipe.crtc;
@@ -77,12 +99,11 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
 }
 
-static void aspeed_gfx_set_clk(struct aspeed_gfx *priv)
+static void aspeed_gfx_set_clk(struct aspeed_gfx *priv, int mode_width)
 {
 	switch (priv->flags & CLK_MASK) {
 	case CLK_G6:
-		regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, 0x0);
-		regmap_update_bits(priv->scu, SCU_G6_CLK_COURCE, G6_CLK_MASK, G6_USB_40_CLK);
+		aspeed_gfx_set_clock_source(priv, mode_width);
 		break;
 	default:
 		break;
@@ -99,7 +120,7 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	if (err)
 		return;
 
-	aspeed_gfx_set_clk(priv);
+	aspeed_gfx_set_clk(priv, m->hdisplay);
 
 #if 0
 	/* TODO: we have only been able to test with the 40MHz USB clock. The
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index af56ffdccc65..e1a814aebc2d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -110,6 +110,7 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
 
 static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
 {
+	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	int ret;
 
 	ret = drmm_mode_config_init(drm);
@@ -118,8 +119,18 @@ static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
 
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
-	drm->mode_config.max_width = 800;
-	drm->mode_config.max_height = 600;
+
+	switch (priv->flags & CLK_MASK) {
+	case CLK_G6:
+		drm->mode_config.max_width = 1024;
+		drm->mode_config.max_height = 768;
+		break;
+	default:
+		drm->mode_config.max_width = 800;
+		drm->mode_config.max_height = 600;
+		break;
+	}
+
 	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
 
 	return ret;
@@ -167,6 +178,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	priv->vga_scratch_reg = config->vga_scratch_reg;
 	priv->throd_val = config->throd_val;
 	priv->scan_line_max = config->scan_line_max;
+	priv->flags = config->gfx_flags;
 
 	priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->scu)) {
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
index 6759cb88415a..5d5e04f15c59 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
@@ -10,7 +10,19 @@
 
 static int aspeed_gfx_get_modes(struct drm_connector *connector)
 {
-	return drm_add_modes_noedid(connector, 800, 600);
+	struct aspeed_gfx *priv = container_of(connector, struct aspeed_gfx, connector);
+	int mode_count = 0;
+
+	switch (priv->flags & CLK_MASK) {
+	case CLK_G6:
+		mode_count = drm_add_modes_noedid(connector, 1024, 768);
+		break;
+	default:
+		mode_count = drm_add_modes_noedid(connector, 800, 600);
+		break;
+	}
+
+	return mode_count;
 }
 
 static const struct
-- 
2.17.1

