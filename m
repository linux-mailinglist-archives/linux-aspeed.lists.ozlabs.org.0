Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B28D4C9B72
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 03:50:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7dsK5K2kz3bpr
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 13:50:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7dsB6XqNz3bbj
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 13:50:37 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2222eJjA029209;
 Wed, 2 Mar 2022 10:40:20 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 10:49:41 +0800
From: Tommy Haung <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 3/5] drm/aspeed: Update INTR_STS handling
Date: Wed, 2 Mar 2022 10:49:28 +0800
Message-ID: <20220302024930.18758-4-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
References: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2222eJjA029209
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

Add interrupt clear register define for further chip support.

Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h     | 1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index 96501152bafa..4e6a442c3886 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -12,6 +12,7 @@ struct aspeed_gfx {
 	struct regmap			*scu;
 
 	u32				dac_reg;
+	u32				int_clr_reg;
 	u32				vga_scratch_reg;
 	u32				throd_val;
 	u32				scan_line_max;
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index b53fee6f1c17..d4b56b3c7597 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -60,6 +60,7 @@
 
 struct aspeed_gfx_config {
 	u32 dac_reg;		/* DAC register in SCU */
+	u32 int_clear_reg;	/* Interrupt clear register */
 	u32 vga_scratch_reg;	/* VGA scratch register in SCU */
 	u32 throd_val;		/* Default Threshold Seting */
 	u32 scan_line_max;	/* Max memory size of one scan line */
@@ -67,6 +68,7 @@ struct aspeed_gfx_config {
 
 static const struct aspeed_gfx_config ast2400_config = {
 	.dac_reg = 0x2c,
+	.int_clear_reg = 0x60,
 	.vga_scratch_reg = 0x50,
 	.throd_val = CRT_THROD_LOW(0x1e) | CRT_THROD_HIGH(0x12),
 	.scan_line_max = 64,
@@ -74,6 +76,7 @@ static const struct aspeed_gfx_config ast2400_config = {
 
 static const struct aspeed_gfx_config ast2500_config = {
 	.dac_reg = 0x2c,
+	.int_clear_reg = 0x60,
 	.vga_scratch_reg = 0x50,
 	.throd_val = CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3c),
 	.scan_line_max = 128,
@@ -119,7 +122,7 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 
 	if (reg & CRT_CTRL_VERTICAL_INTR_STS) {
 		drm_crtc_handle_vblank(&priv->pipe.crtc);
-		writel(reg, priv->base + CRT_CTRL1);
+		writel(reg, priv->base + priv->int_clr_reg);
 		return IRQ_HANDLED;
 	}
 
@@ -147,6 +150,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	config = match->data;
 
 	priv->dac_reg = config->dac_reg;
+	priv->int_clr_reg = config->int_clear_reg;
 	priv->vga_scratch_reg = config->vga_scratch_reg;
 	priv->throd_val = config->throd_val;
 	priv->scan_line_max = config->scan_line_max;
-- 
2.17.1

