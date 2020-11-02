Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E64392A25A3
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 08:53:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPlXB6W8RzDqTQ
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 18:53:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPlWv1WsvzDqRy
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Nov 2020 18:52:55 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0A27mtgo046598;
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
Subject: [PATCH 3/4] ARM: dts: aspeed: ast2600-evb: Adjust SPI flash
 configuration
Date: Mon, 2 Nov 2020 15:52:12 +0800
Message-ID: <20201102075213.32404-4-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102075213.32404-1-chin-ting_kuo@aspeedtech.com>
References: <20201102075213.32404-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0A27mtgo046598
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

- Enable FMC CS1 and SPI2 CS0 SPI NOR flashes since both of
  these two flashes are mounted on AST2600 EVB by default.
- Remove spi-max-frequency setting: 50MHz is usual SPI bus
  frequency adopted on AST2600 EVB which has already been
  configured in aspeed-g6.dtsi.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 26 ++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 8d0f4656aa05..5a2e4612d155 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -96,12 +96,11 @@
 
 &fmc {
 	status = "okay";
+
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-max-frequency = <50000000>;
-
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
@@ -133,18 +132,37 @@
 			};
 		};
 	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "fmc0:1";
+	};
 };
 
 &spi1 {
 	status = "okay";
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
-		label = "pnor";
-		spi-max-frequency = <100000000>;
+		label = "spi1:0";
+	};
+};
+
+&spi2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi2:0";
 	};
 };
 
-- 
2.17.1

