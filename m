Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3726C4B4
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 17:58:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs4Wg4dztzDqJh
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 01:58:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=LnD48IgV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs4WP6LFvzDqWn
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 01:58:09 +1000 (AEST)
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDEBC22475;
 Wed, 16 Sep 2020 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600271887;
 bh=DVP8HWOezQWZwr5z1fnt3pXfVkT0SMNRUf0Uw3ZWonM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LnD48IgVPklpucRwdtNvoNlL2o5QLxTw3BGnYBoaRn1PCMLfvquqd4IvCJ9jXeq3k
 aGR6noegEKAL2vNoZmnU3kh4cVvkdYtH4AElP2jx6NPTzW6HRlWrm61Y+vqCRtgX3m
 zimhUjjQ2f6If3kP4q6wlz/nBD+7HSIDVSzBHgKk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 04/15] arm64: dts: mediatek: align GPIO hog names with
 dtschema
Date: Wed, 16 Sep 2020 17:57:04 +0200
Message-Id: <20200916155715.21009-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916155715.21009-1-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The convention for node names is to use hyphens, not underscores.
dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../boot/dts/mediatek/pumpkin-common.dtsi     | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 29d8cf6df46b..351a1905a074 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -63,91 +63,91 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		eint20_mux_sel0 {
+		eint20-mux-sel0-hog {
 			gpio-hog;
 			gpios = <0 0>;
 			input;
 			line-name = "eint20_mux_sel0";
 		};
 
-		expcon_mux_sel1 {
+		expcon-mux-sel1-hog {
 			gpio-hog;
 			gpios = <1 0>;
 			input;
 			line-name = "expcon_mux_sel1";
 		};
 
-		mrg_di_mux_sel2 {
+		mrg-di-mux-sel2-hog {
 			gpio-hog;
 			gpios = <2 0>;
 			input;
 			line-name = "mrg_di_mux_sel2";
 		};
 
-		sd_sdio_mux_sel3 {
+		sd-sdio-mux-sel3-hog {
 			gpio-hog;
 			gpios = <3 0>;
 			input;
 			line-name = "sd_sdio_mux_sel3";
 		};
 
-		sd_sdio_mux_ctrl7 {
+		sd-sdio-mux-ctrl7-hog {
 			gpio-hog;
 			gpios = <7 0>;
 			output-low;
 			line-name = "sd_sdio_mux_ctrl7";
 		};
 
-		hw_id0 {
+		hw-id0-hog {
 			gpio-hog;
 			gpios = <8 0>;
 			input;
 			line-name = "hw_id0";
 		};
 
-		hw_id1 {
+		hw-id1-hog {
 			gpio-hog;
 			gpios = <9 0>;
 			input;
 			line-name = "hw_id1";
 		};
 
-		hw_id2 {
+		hw-id2-hog {
 			gpio-hog;
 			gpios = <10 0>;
 			input;
 			line-name = "hw_id2";
 		};
 
-		fg_int_n {
+		fg-int-n-hog {
 			gpio-hog;
 			gpios = <11 0>;
 			input;
 			line-name = "fg_int_n";
 		};
 
-		usba_pwr_en {
+		usba-pwr-en-hog {
 			gpio-hog;
 			gpios = <12 0>;
 			output-high;
 			line-name = "usba_pwr_en";
 		};
 
-		wifi_3v3_pg {
+		wifi-3v3-pg-hog {
 			gpio-hog;
 			gpios = <13 0>;
 			input;
 			line-name = "wifi_3v3_pg";
 		};
 
-		cam_rst {
+		cam-rst-hog {
 			gpio-hog;
 			gpios = <14 0>;
 			output-low;
 			line-name = "cam_rst";
 		};
 
-		cam_pwdn {
+		cam-pwdn-hog {
 			gpio-hog;
 			gpios = <15 0>;
 			output-low;
-- 
2.17.1

