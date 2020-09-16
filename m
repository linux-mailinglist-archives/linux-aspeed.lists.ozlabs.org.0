Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6065E26C4C6
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 17:59:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs4YJ0qJHzDqYk
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 01:59:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=jlud3Zfn; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs4Y24yx1zDqXq
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 01:59:34 +1000 (AEST)
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 488FE224D1;
 Wed, 16 Sep 2020 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600271972;
 bh=sVRW+Q4w/VIyVW+IR4tgq66N90jKOapREO5ueA+lxUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jlud3ZfnHWw7zTZF2T9cB6BlWS09yQycNhBZqAyoDK+lyMZ+TxuwDSYneGZtg8u6D
 Ng/l+RwM7zHlz3rDcjw2ByKDzWA1kUVYekTUzwHMFQKZc20hWBRokgls6nVd1+TzNO
 L0+qiQjbFVgHa5z9jQyCaXAuUWBKgNknv11M93vY=
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
Subject: [PATCH v3 15/15] ARM: dts: imx6q: align GPIO hog names with dtschema
Date: Wed, 16 Sep 2020 17:57:15 +0200
Message-Id: <20200916155715.21009-16-krzk@kernel.org>
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

dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.  While
touching the hogs, fix indentation (spaces -> tabs).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx6q-b450v3.dts  | 14 +++++++-------
 arch/arm/boot/dts/imx6q-b650v3.dts  | 12 ++++++------
 arch/arm/boot/dts/imx6q-b850v3.dts  |  4 ++--
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 12 ++++++------
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-b450v3.dts b/arch/arm/boot/dts/imx6q-b450v3.dts
index fb0980190aa0..604f2420370f 100644
--- a/arch/arm/boot/dts/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/imx6q-b450v3.dts
@@ -84,19 +84,19 @@
 };
 
 &pca9539 {
-	P04 {
+	P04-hog {
 		gpio-hog;
 		gpios = <4 0>;
 		output-low;
 		line-name = "PCA9539-P04";
 	};
 
-        P07 {
-                gpio-hog;
-                gpios = <7 0>;
-                output-low;
-                line-name = "PCA9539-P07";
-        };
+	P07-hog {
+		gpio-hog;
+		gpios = <7 0>;
+		output-low;
+		line-name = "PCA9539-P07";
+	};
 };
 
 &pci_root {
diff --git a/arch/arm/boot/dts/imx6q-b650v3.dts b/arch/arm/boot/dts/imx6q-b650v3.dts
index 8f762d9c5ae9..56d2aeb1900c 100644
--- a/arch/arm/boot/dts/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/imx6q-b650v3.dts
@@ -84,12 +84,12 @@
 };
 
 &pca9539 {
-        P07 {
-                gpio-hog;
-                gpios = <7 0>;
-                output-low;
-                line-name = "PCA9539-P07";
-        };
+	P07-hog {
+		gpio-hog;
+		gpios = <7 0>;
+		output-low;
+		line-name = "PCA9539-P07";
+	};
 };
 
 &usbphy1 {
diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index 1ea64ecf4291..3d6b757bf325 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -199,14 +199,14 @@
 };
 
 &pca9539 {
-	P10 {
+	P10-hog {
 		gpio-hog;
 		gpios = <8 0>;
 		output-low;
 		line-name = "PCA9539-P10";
 	};
 
-	P11 {
+	P11-hog {
 		gpio-hog;
 		gpios = <9 0>;
 		output-low;
diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index 02812e6cb302..2a98cc657595 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -248,42 +248,42 @@
 				interrupt-parent = <&gpio2>;
 				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
-				P12 {
+				P12-hog {
 					gpio-hog;
 					gpios = <10 0>;
 					output-low;
 					line-name = "PCA9539-P12";
 				};
 
-				P13 {
+				P13-hog {
 					gpio-hog;
 					gpios = <11 0>;
 					output-low;
 					line-name = "PCA9539-P13";
 				};
 
-				P14 {
+				P14-hog {
 					gpio-hog;
 					gpios = <12 0>;
 					output-low;
 					line-name = "PCA9539-P14";
 				};
 
-				P15 {
+				P15-hog {
 					gpio-hog;
 					gpios = <13 0>;
 					output-low;
 					line-name = "PCA9539-P15";
 				};
 
-				P16 {
+				P16-hog {
 					gpio-hog;
 					gpios = <14 0>;
 					output-low;
 					line-name = "PCA9539-P16";
 				};
 
-				P17 {
+				P17-hog {
 					gpio-hog;
 					gpios = <15 0>;
 					output-low;
-- 
2.17.1

