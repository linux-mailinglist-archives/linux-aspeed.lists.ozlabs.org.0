Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A614265659
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:07:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd0M4m2QzDqkS
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:07:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=fkFAnNN1; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRT02WWQzDrR6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 03:58:28 +1000 (AEST)
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94DB620BED;
 Thu, 10 Sep 2020 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599760704;
 bh=OXsik6EqH3Q2Anuh4Xhln9JrXulc3fb3eoNqyC07rng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fkFAnNN12TOdvhn6emMXCqZQykb5yLGh/K746LenzHXMlovIxKy+Zq5SdiXSlg8Qz
 2RF8OVfWrKuDXJjqAAuMRbITTXVF8nP01xdSgL7obFCqV1222DzGswOIh25HVyevKV
 peANFOdksg/OJHzPQg/BjhrCOwJkzry8HLVVUU8A=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 05/15] arm64: dts: renesas: align GPIO hog names with
 dtschema
Date: Thu, 10 Sep 2020 19:57:23 +0200
Message-Id: <20200910175733.11046-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
X-Mailman-Approved-At: Fri, 11 Sep 2020 11:07:02 +1000
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
dtschema for pca95xx requires GPIO hogs to end with 'hog' prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |  2 +-
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |  2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index cef9da4376a3..e5922329a4b8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -118,7 +118,7 @@
 };
 
 &pca9654 {
-	pcie_sata_switch {
+	pcie-sata-switch-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_HIGH>;
 		output-low; /* enable SATA by default */
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index 5cef64605464..d7e621101af7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -55,7 +55,7 @@
 };
 
 &pca9654 {
-	pcie_sata_switch {
+	pcie-sata-switch-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_HIGH>;
 		output-low; /* enable SATA by default */
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 202177706cde..e9ed2597f1c2 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -143,49 +143,49 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 
-		audio_out_off {
+		audio-out-off-hog {
 			gpio-hog;
 			gpios = <0 GPIO_ACTIVE_HIGH>; /* P00 */
 			output-high;
 			line-name = "Audio_Out_OFF";
 		};
 
-		hub_pwen {
+		hub-pwen-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "HUB pwen";
 		};
 
-		hub_rst {
+		hub-rst-hog {
 			gpio-hog;
 			gpios = <7 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "HUB rst";
 		};
 
-		otg_extlpn {
+		otg-extlpn-hog {
 			gpio-hog;
 			gpios = <9 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "OTG EXTLPn";
 		};
 
-		otg_offvbusn {
+		otg-offvbusn-hog {
 			gpio-hog;
 			gpios = <8 GPIO_ACTIVE_HIGH>;
 			output-low;
 			line-name = "OTG OFFVBUSn";
 		};
 
-		sd-wifi-mux {
+		sd-wifi-mux-hog {
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_HIGH>;
 			output-low;	/* Connect WL1837 */
 			line-name = "SD WiFi mux";
 		};
 
-		snd_rst {
+		snd-rst-hog {
 			gpio-hog;
 			gpios = <15 GPIO_ACTIVE_HIGH>; /* P17 */
 			output-high;
-- 
2.17.1

