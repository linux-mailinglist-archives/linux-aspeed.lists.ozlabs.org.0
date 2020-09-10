Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C37526565B
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:08:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd0c07tvzDqjn
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:08:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=pr+ZvUa/; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRTF3CxbzDrRW
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 03:58:41 +1000 (AEST)
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46BE3214F1;
 Thu, 10 Sep 2020 17:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599760719;
 bh=UC3OFw0SUr5PBSeWnQOTk6uMeflPyNmlay7v1RLLJw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pr+ZvUa/6oP9kDHCo1sayvtfcwy4WTShFITbY25GX52chyVTdTy0/lS0Qna16enYD
 XldEV8L/rJP0gAPbPGhI3bFVQVzhhE4OBMtX17QRMcXBps9W4rViEpF5UDV4fKsEGQ
 q5wmPq/dl0SO9L4mz0iCTxB0xLIQgQJAOmWFJm/I=
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
Subject: [PATCH v2 07/15] arm64: dts: xilinx: align GPIO hog names with
 dtschema
Date: Thu, 10 Sep 2020 19:57:25 +0200
Message-Id: <20200910175733.11046-8-krzk@kernel.org>
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
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index 4f801721564f..f1255f635dfd 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -203,25 +203,25 @@
 		gpio-line-names = "PS_GTR_LAN_SEL0", "PS_GTR_LAN_SEL1", "PS_GTR_LAN_SEL2", "PS_GTR_LAN_SEL3",
 				"PCI_CLK_DIR_SEL", "IIC_MUX_RESET_B", "GEM3_EXP_RESET_B",
 				"", "", "", "", "", "", "", "", "";
-		gtr-sel0 {
+		gtr-sel0-hog {
 			gpio-hog;
 			gpios = <0 0>;
 			output-low; /* PCIE = 0, DP = 1 */
 			line-name = "sel0";
 		};
-		gtr-sel1 {
+		gtr-sel1-hog {
 			gpio-hog;
 			gpios = <1 0>;
 			output-high; /* PCIE = 0, DP = 1 */
 			line-name = "sel1";
 		};
-		gtr-sel2 {
+		gtr-sel2-hog {
 			gpio-hog;
 			gpios = <2 0>;
 			output-high; /* PCIE = 0, USB0 = 1 */
 			line-name = "sel2";
 		};
-		gtr-sel3 {
+		gtr-sel3-hog {
 			gpio-hog;
 			gpios = <3 0>;
 			output-high; /* PCIE = 0, SATA = 1 */
-- 
2.17.1

