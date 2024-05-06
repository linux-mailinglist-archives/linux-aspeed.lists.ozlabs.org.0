Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB78BCC77
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 May 2024 12:57:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXyz408Khz3c5J
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 May 2024 20:57:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=dylan_hung@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXyys68DFz30Np
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 May 2024 20:56:53 +1000 (AEST)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 6 May
 2024 18:51:21 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 6 May
 2024 18:51:20 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 6 May 2024 18:51:20 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <jk@codeconstruct.com.au>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 1/2] [RFC] ARM: dts: aspeed-g6: Add AST2600 I3Cs
Date: Mon, 6 May 2024 18:51:19 +0800
Message-ID: <20240506105120.3028083-2-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
References: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 has 6 I3Cs which are based on dw-i3c along with Aspeed
proprietary enhancements.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 137 ++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 29f94696d8b1..d0d685747b74 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -13,6 +13,12 @@ / {
 	interrupt-parent = <&gic>;
 
 	aliases {
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
+		i3c2 = &i3c2;
+		i3c3 = &i3c3;
+		i3c4 = &i3c4;
+		i3c5 = &i3c5;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
@@ -579,6 +585,13 @@ wdt4: watchdog@1e7850c0 {
 				status = "disabled";
 			};
 
+			i3c: bus@1e7a0000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e7a0000 0x8000>;
+			};
+
 			peci0: peci-controller@1e78b000 {
 				compatible = "aspeed,ast2600-peci";
 				reg = <0x1e78b000 0x100>;
@@ -1125,3 +1138,127 @@ i2c15: i2c-bus@800 {
 		status = "disabled";
 	};
 };
+
+&i3c {
+	i3c_global: i3c-global {
+		compatible = "aspeed,ast2600-i3c-global", "simple-mfd", "syscon";
+		resets = <&syscon ASPEED_RESET_I3C>;
+		reg = <0x0 0x1000>;
+	};
+
+	i3c0: i3c@2000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x2000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c1_default>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 0>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c1: i3c@3000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x3000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C1CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c2_default>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 1>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c2: i3c@4000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x4000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C2CLK>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 2>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c3: i3c@5000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x5000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C3CLK>;
+		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 3>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c4: i3c@6000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x6000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C4CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c5_default>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 4>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c5: i3c@7000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x7000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C5CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c6_default>;
+		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 5>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+};
-- 
2.25.1

