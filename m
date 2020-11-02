Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3B2A25A1
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 08:53:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPlX21n3qzDqTP
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 18:53:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPlWv0cMSzDqRw
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Nov 2020 18:52:54 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0A27mtgn046598;
 Mon, 2 Nov 2020 15:48:55 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 2 Nov
 2020 15:52:23 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <clg@kaod.org>, <bbrezillon@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 2/4] ARM: dts: aspeed: ast2600: Update FMC/SPI controller
 setting for spi-aspeed.c
Date: Mon, 2 Nov 2020 15:52:11 +0800
Message-ID: <20201102075213.32404-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102075213.32404-1-chin-ting_kuo@aspeedtech.com>
References: <20201102075213.32404-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0A27mtgn046598
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

- Adjust the value format of "reg" property:
  Instead of platform_get_resource(),
  platform_get_resource_byname() function can be used
  for more human-readable.
- Add "num-cs" property for FMC/SPI controller:
  Each ASPEED FMC/SPI memory controller can support more
  than a chip select. By "num-cs" property, FMC/SPI
  controller driver can know how many chip select related
  registers should be initialized at the probe stage.
  Besdies, with this property, driver can avoid accessing
  chip select which CS number is larger than the maximum
  one supported by the controller.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b58220a49cbd..8a5c798db54e 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -89,14 +89,16 @@
 			};
 
 		fmc: spi@1e620000 {
-			reg = < 0x1e620000 0xc4
-				0x20000000 0x10000000 >;
+			reg = <0x1e620000 0xc4>,
+				<0x20000000 0x10000000>;
+			reg-names = "spi_ctrl_reg", "spi_mmap";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2600-fmc";
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			num-cs = <3>;
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
@@ -118,12 +120,14 @@
 		};
 
 		spi1: spi@1e630000 {
-			reg = < 0x1e630000 0xc4
-				0x30000000 0x10000000 >;
+			reg = <0x1e630000 0xc4>,
+				<0x30000000 0x10000000>;
+			reg-names = "spi_ctrl_reg", "spi_mmap";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
+			num-cs = <2>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
@@ -140,12 +144,14 @@
 		};
 
 		spi2: spi@1e631000 {
-			reg = < 0x1e631000 0xc4
-				0x50000000 0x10000000 >;
+			reg = < 0x1e631000 0xc4>,
+				<0x50000000 0x10000000>;
+			reg-names = "spi_ctrl_reg", "spi_mmap";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
+			num-cs = <3>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
-- 
2.17.1

