Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1E8687729
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:19:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6sCC2BFsz3f48
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:19:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NMUw1kDV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NMUw1kDV;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6sC63MVdz3dvc
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:19:30 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id l4-20020a17090a850400b0023013402671so4817370pjn.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACnHvTU7gEng4y82wmBORUtHHJ+pZWFgrAC6kuRsmqw=;
        b=NMUw1kDV1vh/37ahrFVcLgkXqHwgpoAEMOEnrhVN9bL4We5HZsYq26dfsmkM6Pl84c
         VeMhy8rJoCDnQeBl8e7/kIT17ltOL1wdxy2DeGEbRxYNpM6xv6oux5dZ2DUvyqnysiYU
         JjX2ddfuHXKmOXAFJd3NQK0ehBmF0EedWdKgU34O2uxiAr3uEWQhShZtDT4KyEc4wURk
         dBuyica5JYPQorNvA5i51jMx9nAvvoO68HsyM1azeYr5JIaG3dZ1uY1eyIcXejF1TcFg
         bMMU7u/SV//XsKAJ5jknGIIBdPec113SmDcyp5gFxM9JPQA7kq7ih6sIijp+USBoL7kX
         nFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACnHvTU7gEng4y82wmBORUtHHJ+pZWFgrAC6kuRsmqw=;
        b=e5LrY3Ju1+ye0KQzGKOWbJl/0zbiB+VpDr6lzqHqerXIFj4AHFKNbaugFgWAZt40L2
         Z84kZvrcbVGGaW/y40/SPRhbFMdimGscDmaVaHpp122C8CsqUcQL77flfcz06qGoIXTE
         oKpkKkHBH20LT6B4GOthbPiLxR/jgONu1i6540WqkmnTotglb8dGauPPqENk3iAI/gWl
         CYp0IU64l8pZiFiWYn6BD3nbrQuz61NN7yA0ttSkyzqwB+4ZCfIZQSIbE9pGKsw6GQAV
         50+YRASqnlMdKfOqpFjXxuwKAeYVotG0CL7fE2wZYtwj8py65MLfmfMtOl0oIQKrIoGo
         k4PQ==
X-Gm-Message-State: AO0yUKVdCzQEQS/5DgZ4EtU/rLcJV43z7zGnd8nREvyHy4VojBNPn6w/
	zZlWEdwXQB6A3OR08XEKnzEKWw==
X-Google-Smtp-Source: AK7set9NtY7wkF+Wxsy+aSeRILayZS+raEsGDMwKyw9dWkNSuor4NmO8YE4bZYM27q1x/r/RPUSFXg==
X-Received: by 2002:a17:903:2345:b0:198:a338:b9c5 with SMTP id c5-20020a170903234500b00198a338b9c5mr7249431plh.2.1675325968172;
        Thu, 02 Feb 2023 00:19:28 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709029b8900b0019324fbec59sm13187552plp.41.2023.02.02.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 00:19:27 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v2 3/3] ARM: dts: aspeed: Add device tree for Ufispace NCPLite BMC
Date: Thu,  2 Feb 2023 16:18:43 +0800
Message-Id: <20230202081843.2358-4-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202081843.2358-1-jordan.chang@ufispace.com>
References: <20230202081843.2358-1-jordan.chang@ufispace.com>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add initial version of device tree for Ufispace NCPLite platform
which is equipped with AST2600-based BMC.

Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 359 ++++++++++++++++++
 2 files changed, 360 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 2ee9c043218b..d26e0651e805 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1626,6 +1626,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-inventec-transformers.dtb \
 	aspeed-bmc-tyan-s7106.dtb \
 	aspeed-bmc-tyan-s8036.dtb \
+	aspeed-bmc-ufispace-ncplite.dtb \
 	aspeed-bmc-vegman-n110.dtb \
 	aspeed-bmc-vegman-rx20.dtb \
 	aspeed-bmc-vegman-sx20.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts b/arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts
new file mode 100644
index 000000000000..a3853bdcae9d
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2022 Ufispace Co., Ltd.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Ufispace NCPLite BMC";
+	compatible = "ufispace,ncplite-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		event-fan-alert {
+			label = "fan-alert";
+			gpios = <&gpio0 ASPEED_GPIO(M, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(M, 2)>;
+		};
+
+		event-allpwr-good {
+			label = "allpwr-good";
+			gpios = <&gpio0 ASPEED_GPIO(V, 4) GPIO_ACTIVE_HIGH>;
+			linux,code = <ASPEED_GPIO(V, 4)>;
+		};
+
+		event-psu0-alert {
+			label = "psu0-alert";
+			gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(V, 1)>;
+		};
+
+		event-psu1-alert {
+			label = "psu1-alert";
+			gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(V, 2)>;
+		};
+
+		event-thermal-alert {
+			label = "thermal-alert";
+			gpios = <&gpio0 ASPEED_GPIO(P, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(P, 2)>;
+		};
+
+		event-cpu-caterr {
+			label = "cpu-caterr";
+			gpios = <&gpio0 ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(N, 3)>;
+		};
+
+		event-cpu-thermtrip {
+			label = "cpu-thermtrip";
+			gpios = <&gpio0 ASPEED_GPIO(V, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(V, 5)>;
+		};
+
+		event-psu0-presence {
+			label = "psu0-presence";
+			gpios = <&gpio0 ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 6)>;
+		};
+
+		event-psu1-presence {
+			label = "psu1-presence";
+			gpios = <&gpio0 ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 7)>;
+		};
+
+		event-psu0-power-ok {
+			label = "psu0-power-ok";
+			gpios = <&gpio0 ASPEED_GPIO(M, 4) GPIO_ACTIVE_HIGH>;
+			linux,code = <ASPEED_GPIO(M, 4)>;
+		};
+
+		event-psu1-power-ok {
+			label = "psu1-power-ok";
+			gpios = <&gpio0 ASPEED_GPIO(M, 5) GPIO_ACTIVE_HIGH>;
+			linux,code = <ASPEED_GPIO(M, 5)>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		event-fan0-presence {
+			label = "fan0-presence";
+			gpios = <&fan_ioexp 2 GPIO_ACTIVE_LOW>;
+			linux,code = <2>;
+		};
+
+		event-fan1-presence {
+			label = "fan1-presence";
+			gpios = <&fan_ioexp 6 GPIO_ACTIVE_LOW>;
+			linux,code = <6>;
+		};
+
+		event-fan2-presence {
+			label = "fan2-presence";
+			gpios = <&fan_ioexp 10 GPIO_ACTIVE_LOW>;
+			linux,code = <10>;
+		};
+
+		event-fan3-presence {
+			label = "fan3-presence";
+			gpios = <&fan_ioexp 14 GPIO_ACTIVE_LOW>;
+			linux,code = <14>;
+		};
+	};
+};
+
+&mac2 {
+	status = "okay";
+	use-ncsi;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+		 <&syscon ASPEED_CLK_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+};
+
+&lpc_reset {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&peci0 {
+	status = "okay";
+};
+
+&udc {
+	status = "okay";
+};
+
+&adc0 {
+	vref = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	vref = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "national,lm75";
+		reg = <0x49>;
+	};
+
+	temperature-sensor@4c {
+		compatible = "national,lm86";
+		reg = <0x4c>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		cpmpatible = "national,lm75";
+		reg = <0x4f>;
+	};
+
+	fan_ioexp: i2c-expander@20 {
+		compatible = "nxp,pca9535";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"","","presence-fan0","",
+		"","","presence-fan1","",
+		"","","presence-fan2","",
+		"","","presence-fan3","";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+		pagesize = <64>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	psu@58 {
+		compatible = "pmbus";
+		reg = <0x58>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <1>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	psu@58 {
+		compatible = "pmbus";
+		reg = <0x58>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <1>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+
+	temperature-sensor@4d {
+		compatible = "national,lm75";
+		reg = <0x4d>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"CPU_PWRGD","","","power-button","host0-ready","","presence-ps0","presence-ps1",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","reset-button","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"power-chassis-control0","power-chassis-control1","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","power-chassis-good","","","";
+};
-- 
2.39.0

