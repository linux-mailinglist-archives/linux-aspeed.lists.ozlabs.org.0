Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2639D5C0
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 09:16:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz4R84m9Pz3036
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 17:16:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz4R00WSyz3021
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 17:15:55 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15771ajl056320;
 Mon, 7 Jun 2021 15:01:36 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 15:15:20 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/7] ARM: dts: aspeed-g6: Add SGPIO node.
Date: Mon, 7 Jun 2021 15:15:08 +0800
Message-ID: <20210607071514.11727-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607071514.11727-1-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15771ajl056320
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
Cc: steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
with 80 pins.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index f96607b7b4e2..c09b24824b6d 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -377,6 +377,36 @@
 				#interrupt-cells = <2>;
 			};
 
+			sgpiom0: sgpiom@1e780500 {
+				#gpio-cells = <2>;
+				gpio-controller;
+				compatible = "aspeed,ast2600-sgpiom-128";
+				reg = <0x1e780500 0x100>;
+				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+				ngpios = <128>;
+				clocks = <&syscon ASPEED_CLK_APB2>;
+				interrupt-controller;
+				bus-frequency = <12000000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_sgpm1_default>;
+				status = "disabled";
+			};
+
+			sgpiom1: sgpiom@1e780600 {
+				#gpio-cells = <2>;
+				gpio-controller;
+				compatible = "aspeed,ast2600-sgpiom-80";
+				reg = <0x1e780600 0x100>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+				ngpios = <80>;
+				clocks = <&syscon ASPEED_CLK_APB2>;
+				interrupt-controller;
+				bus-frequency = <12000000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_sgpm2_default>;
+				status = "disabled";
+			};
+
 			gpio1: gpio@1e780800 {
 				#gpio-cells = <2>;
 				gpio-controller;
-- 
2.17.1

