Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC933C51
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2019 02:04:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HscR1gDJzDqWR
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2019 10:04:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 903 seconds by postgrey-1.36 at bilbo;
 Tue, 04 Jun 2019 08:59:24 AEST
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hr8r05w4zDqS0
 for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Jun 2019 08:59:23 +1000 (AEST)
X-AuditID: ac10606f-bd5ff70000003de9-4b-5cf5a2bc2cf5
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 C7.FD.15849.CB2A5FC5; Mon,  3 Jun 2019 18:44:13 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 3 Jun 2019 18:44:12 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>
Subject: [PATCH linux dev-5.1 v1] ARM: dts: aspeed: Add SGPM pinmux
Date: Mon, 3 Jun 2019 18:43:09 -0400
Message-ID: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsWyRiBhgu7eRV9jDJ5NkLTYdZnDYv6Rc6wW
 v8//ZbaY8mc5k8Wmx9dYLZpXn2O22Dz/D6PF5V1z2CyWXr/IZNG69wi7A5fH1fZd7B5r5q1h
 9Lj48Rizx6ZVnWwed67tYfPYvKTe4/yMhYwenzfJBXBEcdmkpOZklqUW6dslcGVsubuKqWC2
 RMWfM81MDYzHRboYOTkkBEwkXrz9xQZiCwnsYpK4s6usi5ELyD7EKDH9/C12kASbgJrE3s1z
 mEASIgI7GCU657exgjjMAmcZJTY83MsMUiUs4Czx78NGRhCbRUBFYu2sS2BxXgEHic4rk9kh
 1slJ3DzXCRUXlDg58wkLiM0sICFx8MULZogzZCVuHXrMBFGvIPG87zHLBEa+WUhaZiFpWcDI
 tIpRKLEkJzcxMye93EgvMTdTLzk/dxMjJKTzdzB+/Gh+iJGJgxHoJQ5mJRHexNtfYoR4UxIr
 q1KL8uOLSnNSiw8xSnOwKInzzgi5HCMkkJ5YkpqdmlqQWgSTZeLglGpgXFWk/GnRonOdGUuS
 Yvj+KN696zD/SIOiGe9i1tu51qxbHpmmTKi+xySVLxDkWlKqesnXKcfL1mijY7nSMhND1wcz
 nFXCAo1vqgbVvpP/wvr8Q3ha28qiqNnlLscamS8/Z7tUU6QdbnZvscfNq0IFhzYXzP59cmJw
 ZLXxjnk29exmpTETWL4rsRRnJBpqMRcVJwIA93vZXlcCAAA=
X-Mailman-Approved-At: Tue, 04 Jun 2019 10:04:00 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Hongwei Zhang <hongweiz@ami.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
supporting SGPIO in AST2500 SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                             | 5 +++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
index 3b7266c..8f1c5c4 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
@@ -84,7 +84,7 @@ NDCD2 NDCD3 NDCD4 NDSR1 NDSR2 NDSR3 NDSR4 NDTR1 NDTR2 NDTR3 NDTR4 NRI1 NRI2
 NRI3 NRI4 NRTS1 NRTS2 NRTS3 NRTS4 OSCCLK PEWAKE PNOR PWM0 PWM1 PWM2 PWM3 PWM4
 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 RXD1 RXD2 RXD3 RXD4 SALT1 SALT10
 SALT11 SALT12 SALT13 SALT14 SALT2 SALT3 SALT4 SALT5 SALT6 SALT7 SALT8 SALT9
-SCL1 SCL2 SD1 SD2 SDA1 SDA2 SGPS1 SGPS2 SIOONCTRL SIOPBI SIOPBO SIOPWREQ
+SCL1 SCL2 SD1 SD2 SDA1 SDA2 SGPM SGPS1 SGPS2 SIOONCTRL SIOPBI SIOPBO SIOPWREQ
 SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1CS1 SPI1DEBUG SPI1PASSTHRU SPI2CK SPI2CS0
 SPI2CS1 SPI2MISO SPI2MOSI TIMER3 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2
 TXD3 TXD4 UART6 USB11BHID USB2AD USB2AH USB2BD USB2BH USBCKI VGABIOSROM VGAHS
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 383510d..d10c3ea 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1394,6 +1394,11 @@
 		groups = "SDA2";
 	};
 
+	pinctrl_sgpm_default: sgpm_default {
+		function = "SGPM";
+		groups = "SGPM";
+	};
+
 	pinctrl_sgps1_default: sgps1_default {
 		function = "SGPS1";
 		groups = "SGPS1";
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 187abd7..0c89647 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -577,6 +577,8 @@ SS_PIN_DECL(N3, GPIOJ2, SGPMO);
 SIG_EXPR_LIST_DECL_SINGLE(SGPMI, SGPM, SIG_DESC_SET(SCU84, 11));
 SS_PIN_DECL(N4, GPIOJ3, SGPMI);
 
+FUNC_GROUP_DECL(SGPM, R2, L2, N3, N4);
+
 #define N5 76
 SIG_EXPR_LIST_DECL_SINGLE(VGAHS, VGAHS, SIG_DESC_SET(SCU84, 12));
 SIG_EXPR_LIST_DECL_SINGLE(DASHN5, DASHN5, SIG_DESC_SET(SCU94, 8));
@@ -2127,6 +2129,7 @@ static const struct aspeed_pin_group aspeed_g5_groups[] = {
 	ASPEED_PINCTRL_GROUP(SD2),
 	ASPEED_PINCTRL_GROUP(SDA1),
 	ASPEED_PINCTRL_GROUP(SDA2),
+	ASPEED_PINCTRL_GROUP(SGPM),
 	ASPEED_PINCTRL_GROUP(SGPS1),
 	ASPEED_PINCTRL_GROUP(SGPS2),
 	ASPEED_PINCTRL_GROUP(SIOONCTRL),
@@ -2296,6 +2299,7 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
 	ASPEED_PINCTRL_FUNC(SD2),
 	ASPEED_PINCTRL_FUNC(SDA1),
 	ASPEED_PINCTRL_FUNC(SDA2),
+	ASPEED_PINCTRL_FUNC(SGPM),
 	ASPEED_PINCTRL_FUNC(SGPS1),
 	ASPEED_PINCTRL_FUNC(SGPS2),
 	ASPEED_PINCTRL_FUNC(SIOONCTRL),
-- 
2.7.4

