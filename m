Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D751E957A0D
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL4757Jz87vP
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=kevin_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb0Lt4FHcz3cZ0
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 19:06:30 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 2 Aug
 2024 17:05:52 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 2 Aug 2024 17:05:52 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <lee@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>, <quic_bjorande@quicinc.com>,
	<geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
	<shawnguo@kernel.org>, <neil.armstrong@linaro.org>,
	<m.szyprowski@samsung.com>, <nfraprado@collabora.com>, <u-kumar1@ti.com>,
	<kevin_chen@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v2 8/9] arm64: dts: aspeed: Add initial AST27XX device tree
Date: Fri, 2 Aug 2024 17:05:43 +0800
Message-ID: <20240802090544.2741206-10-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add aspeed-g7.dtsi to be AST27XX device tree.

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 arch/arm64/boot/dts/Makefile              |   1 +
 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi | 185 ++++++++++++++++++++++
 2 files changed, 186 insertions(+)
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 21cd3a87f385..c909c19dc5dd 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -34,3 +34,4 @@ subdir-y += tesla
 subdir-y += ti
 subdir-y += toshiba
 subdir-y += xilinx
+subdir-y += aspeed
diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
new file mode 100644
index 000000000000..85f7977a753a
--- /dev/null
+++ b/arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <dt-bindings/clock/aspeed,ast2700-clk.h>
+#include <dt-bindings/reset/aspeed,ast2700-reset.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
+
+/ {
+	compatible = "aspeed,ast2700";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <1>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@2 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <2>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <3>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-size = <0x80000>;
+			cache-unified;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-level = <2>;
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a35-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		arm,cpu-registers-not-fw-configured;
+		always-on;
+	};
+
+	soc0: soc@10000000 {
+		compatible = "simple-bus";
+		reg = <0x0 0x10000000 0x0 0x10000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@12200000 {
+			compatible = "arm,gic-v3";
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			reg = <0 0x12200000 0 0x10000>, /* GICD */
+				  <0 0x12280000 0 0x80000>, /* GICR */
+				  <0 0x40440000 0 0x1000>;  /* GICC */
+			#address-cells = <2>;
+			#size-cells = <2>;
+		};
+
+		syscon0: syscon@12c02000 {
+			compatible = "aspeed,ast2700-scu0", "syscon", "simple-mfd";
+			reg = <0x0 0x12c02000 0x0 0x1000>;
+			ranges = <0x0 0x0 0 0x12c02000 0 0x1000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			silicon-id@0 {
+				compatible = "aspeed,ast2700-silicon-id", "aspeed,silicon-id";
+				reg = <0 0x0 0 0x4>;
+			};
+
+			soc0_rst: reset-controller@200 {
+				reg = <0 0x200 0 0x40>;
+			};
+
+			soc0_clk: clock-controller@240 {
+				reg = <0 0x240 0 0x1c0>;
+			};
+		};
+
+		uart4: serial@12c1a000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x12c1a000 0x0 0x1000>;
+			clocks = <&syscon0 SCU0_CLK_GATE_UART4CLK>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			no-loopback-test;
+		};
+	};
+
+	soc1: soc@14000000 {
+		compatible = "simple-bus";
+		reg = <0x0 0x14000000 0x0 0x10000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		syscon1: syscon@14c02000 {
+			compatible = "aspeed,ast2700-scu1", "syscon", "simple-mfd";
+			reg = <0x0 0x14c02000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x0 0x14c02000 0x0 0x1000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			soc1_rst: reset-controller@200 {
+				reg = <0 0x200 0 0x40>;
+				#reset-cells = <1>;
+			};
+
+			soc1_clk: clock-controller@240 {
+				reg = <0 0x240 0 0x1c0>;
+			};
+		};
+	};
+};
-- 
2.34.1

