Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED16971C5
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cxk305h9zDqyj
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:56:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L8CgZh8S"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cxjr0rT4zDr0X
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:56:16 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y8so709860plr.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kBuMdl3ouzT5F6CQ56x8UxMBUnjULwPlonuZLKRPfuA=;
 b=L8CgZh8S7a8Bmk+crzkNrRbob8X/xUp3A440SkxVzNrVA4E9P3fToLi4QSqfB9Ypc8
 rFf/IwcUWpGAHlnviG8HsEfBFBmmB54eFyrYZ1ce0s/XbBT1YbCEBv9oqxbs63070HmP
 2wfOAQpcIiEQfaeWLj9LbLK/iHRGbipWEvfOP3sJ7fJ29c9keQl1kiwioaoOV4x4WwkV
 tbxVkY3pKcR9m4tiTH/zgY70f4WDaoHhI2giPk1y2OAM2w9ro5Z92K7ezi3f/yE34EK1
 q9txJKFtKu1l7nPU4x9uOeZpZIxeYtcM6EdFKqB20+g06z3M3XOqAjVzorTzFdoFsjaR
 HjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kBuMdl3ouzT5F6CQ56x8UxMBUnjULwPlonuZLKRPfuA=;
 b=r6L3jVGmT/nS0U4y3tOGvv9nL80LtSnGsQVMyUK8LvWJVhoQOwHdTRJNu8/MTM/T54
 FI+lfzLDsLfLkdAuzcpX7oUfWJyF3110DujorIMRf65HQDrZJEOXQp136Twvds7RokrV
 1pYRaxWWx7RcFHrNB+OboXMZbwSceRnzjv0u4YobeN4pEY67IBp7cHizbvH3kiajWHb4
 CMrqpfBjkq/aGjT7rJQ1SOnP/h1dTAeiuZ6b4Bd5nEx7CD9UxkXVuCVhe9n9zz99l/HG
 MoVASEzYwqjIRqP0ctUcNdIX2T4AlA/jXruXGbzpP+VRry5yW7xQQJG/KbXvT7gpHHNG
 dBDA==
X-Gm-Message-State: APjAAAX8iX42/0hMgzcAeLwV0mUmVMq5/l2RhCLmzUzfgL5R91V4myHR
 yeX2WlZWwmfbsa7C+pUgcZ0=
X-Google-Smtp-Source: APXvYqwx3Wcnc1YkkoISw1jxugTO+5qgp6eivh6zt+iIUMa7tVtslvyKR/Np6g/6Jwjz4svEfS0fPg==
X-Received: by 2002:a17:902:4201:: with SMTP id
 g1mr32294164pld.300.1566366973859; 
 Tue, 20 Aug 2019 22:56:13 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:56:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 5/7] ARM: dts: aspeed: Add AST2600 and EVB
Date: Wed, 21 Aug 2019 15:25:28 +0930
Message-Id: <20190821055530.8720-6-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821055530.8720-1-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 is a new SoC by ASPEED. It contains a dual core Cortex A7
CPU and shares many periperhals with the existing AST2400 and AST2500.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts |  44 ++++
 arch/arm/boot/dts/aspeed-g6.dtsi         | 266 +++++++++++++++++++++++
 3 files changed, 311 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb.dts
 create mode 100644 arch/arm/boot/dts/aspeed-g6.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 247e556de48e..2d8d29e5686d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1276,6 +1276,7 @@ dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
+	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
new file mode 100644
index 000000000000..7f2528e084b5
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2019 IBM Corp.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "AST2600 EVB";
+	compatible = "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		bootargs = "console=ttyS4,115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+};
+
+&mdio1 {
+	status = "okay";
+
+	ethphy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac1 {
+	status = "okay";
+
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+};
+
+&emmc {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
new file mode 100644
index 000000000000..9f9931541060
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/ast2600-clock.h>
+
+/ {
+	model = "Aspeed BMC";
+	compatible = "aspeed,ast2600";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "aspeed,ast2600-smp";
+
+		cpu@f00 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0xf00>;
+		};
+
+		cpu@f01 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0xf01>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		clocks = <&syscon ASPEED_CLK_HPLL>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	ahb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "soc";
+		ranges;
+
+		gic: interrupt-controller@40461000 {
+			compatible = "arm,cortex-a7-gic";
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			reg = <0x40461000 0x1000>,
+			    <0x40462000 0x1000>,
+			    <0x40464000 0x2000>,
+			    <0x40466000 0x2000>;
+			};
+
+		mdio0: mdio@1e650000 {
+			compatible = "aspeed,ast2600-mdio";
+			reg = <0x1e650000 0x8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mdio1: mdio@1e650008 {
+			compatible = "aspeed,ast2600-mdio";
+			reg = <0x1e650008 0x8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mdio2: mdio@1e650010 {
+			compatible = "aspeed,ast2600-mdio";
+			reg = <0x1e650010 0x8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mdio3: mdio@1e650018 {
+			compatible = "aspeed,ast2600-mdio";
+			reg = <0x1e650018 0x8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mac0: ftgmac@1e660000 {
+			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			reg = <0x1e660000 0x180>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>;
+			status = "disabled";
+		};
+
+		mac1: ftgmac@1e680000 {
+			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			reg = <0x1e680000 0x180>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>;
+			status = "disabled";
+		};
+
+		mac2: ftgmac@1e670000 {
+			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			reg = <0x1e670000 0x180>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>;
+			status = "disabled";
+		};
+
+		mac3: ftgmac@1e690000 {
+			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			reg = <0x1e690000 0x180>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>;
+			status = "disabled";
+		};
+
+		apb {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			syscon: syscon@1e6e2000 {
+				compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
+				reg = <0x1e6e2000 0x1000>;
+				ranges = <0 0x1e6e2000 0x1000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				pinctrl: pinctrl {
+					compatible = "aspeed,ast2600-pinctrl";
+				};
+
+				smp-memram@180 {
+					compatible = "aspeed,ast2600-smpmem";
+					reg = <0x180 0x40>;
+				};
+			};
+
+			rng: hwrng@1e6e2524 {
+				compatible = "timeriomem_rng";
+				reg = <0x1e6e2524 0x4>;
+				period = <1>;
+				quality = <100>;
+			};
+
+			rtc: rtc@1e781000 {
+				compatible = "aspeed,ast2600-rtc";
+				reg = <0x1e781000 0x18>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart5: serial@1e784000 {
+				compatible = "ns16550a";
+				reg = <0x1e784000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART5CLK>;
+				no-loopback-test;
+			};
+
+			wdt1: watchdog@1e785000 {
+				compatible = "aspeed,ast2600-wdt";
+				reg = <0x1e785000 0x40>;
+			};
+
+			wdt2: watchdog@1e785040 {
+				compatible = "aspeed,ast2600-wdt";
+				reg = <0x1e785040 0x40>;
+				status = "disabled";
+			};
+
+			wdt3: watchdog@1e785080 {
+				compatible = "aspeed,ast2600-wdt";
+				reg = <0x1e785080 0x40>;
+				status = "disabled";
+			};
+
+			wdt4: watchdog@1e7850C0 {
+				compatible = "aspeed,ast2600-wdt";
+				reg = <0x1e7850C0 0x40>;
+				status = "disabled";
+			};
+
+			sdc: sdc@1e740000 {
+				compatible = "aspeed,ast2600-sd-controller";
+				reg = <0x1e740000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e740000 0x10000>;
+				clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
+				status = "disabled";
+
+				sdhci0: sdhci@1e740100 {
+					compatible = "aspeed,ast2600-sdhci", "sdhci";
+					reg = <0x100 0x100>;
+					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+					sdhci,auto-cmd12;
+					clocks = <&syscon ASPEED_CLK_SDIO>;
+					status = "disabled";
+				};
+
+				sdhci1: sdhci@1e740200 {
+					compatible = "aspeed,ast2600-sdhci", "sdhci";
+					reg = <0x200 0x100>;
+					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+					sdhci,auto-cmd12;
+					clocks = <&syscon ASPEED_CLK_SDIO>;
+					status = "disabled";
+				};
+			};
+
+			emmc: sdc@1e750000 {
+				compatible = "aspeed,ast2600-sd-controller";
+				reg = <0x1e750000 0x100>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e750000 0x10000>;
+				clocks = <&syscon ASPEED_CLK_GATE_EMMCCLK>;
+				status = "disabled";
+
+				sdhci@1e750100 {
+					compatible = "aspeed,ast2600-sdhci";
+					reg = <0x100 0x100>;
+					sdhci,auto-cmd12;
+					interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&syscon ASPEED_CLK_EMMC>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_emmc_default>;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	pinctrl_emmc_default: emmc_default {
+		function = "SD3";
+		groups = "SD3";
+	};
+};
-- 
2.23.0.rc1

