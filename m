Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA643BB59
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Oct 2021 22:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf2lL2QX9z2yb5
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Oct 2021 07:01:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OASvt0WN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OASvt0WN; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf2lF4wX2z2xY9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Oct 2021 07:01:28 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 188so796458ljj.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Oct 2021 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixtBSKhlM5RJeYoi6sIB/twD1T61aXRVqcD6skfC0C4=;
 b=OASvt0WNZosZEZgHQuH8VNU02bUZyY3BDytmDoB62eyIAfV6yXTow0cBabMkYAbWYy
 oIBB7Qxosao/Vpidt1V33S9hhybw/bgbj9zDM/dKUg74KiYjgW1/VMsGAu3v9HWIwrXi
 kCOFdXz+PdAvF8c5clnbl3luoqQhr0sZY8imjodZVbu8UycGKoawN/SelKj0cCmGAg1V
 reL3pVF77cyAThFPXCCd7yw/X8GVS4vWMmvaqISoszSXzeTb1MX9k7vzQ80k1a77D1yx
 EP/R753qh8Zb//YZVscmYaryJRpA76F9VxwDCeKJk2l/mQtRLpAmHUScsvvaLI+QvIAx
 uCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixtBSKhlM5RJeYoi6sIB/twD1T61aXRVqcD6skfC0C4=;
 b=6dOu1ZITXihq8M/SWukQOgzH2UWTEmUSpkaih3oAQ2BlzemDuN9KyBkin40RRMYl+S
 qI/8t8aQdc0uUEm/U5ERs3y33OkzpCxI4EKsL5AJaIiMPlKkeR6H/AIYpErmvWPoCRtZ
 dnAuB06NZU/OhN3gSolDpnhNb6ztR8GUAa0dhO+E8lKWWW1XhQBnAUIEQitUYaXfhp9J
 AtepIaAWiSY2LKAVupWbH3jhsbIgyCUpXZGTiSctYQSW10OA4aB30+Z5+AjcYRPQ50NG
 yXc3dDuuQXCP4Gu+yfWDO1cK19qbjlPHaK4b/pcuBsmGtjk3pBMlB3oFa2VN6W6VXVQc
 JxSw==
X-Gm-Message-State: AOAM532wGWyCxzArfBI+u0x3kUgc/rvr3fN9ezSwlxEq38wl8UgdIL4m
 V9X8XTgw8G6WW08kdWkxyCE=
X-Google-Smtp-Source: ABdhPJzIfFctBTfgVls2IZEdAjOeMzERzyJj26kMXRMddH9jsu2AwiH0X/heXUB/4NLOJSZOLi7w0w==
X-Received: by 2002:a05:651c:2104:: with SMTP id
 a4mr1861591ljq.82.1635278483010; 
 Tue, 26 Oct 2021 13:01:23 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-11-233.ip.moscow.rt.ru. [46.242.11.233])
 by smtp.gmail.com with ESMTPSA id x7sm2020720lfu.116.2021.10.26.13.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 13:01:22 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
Date: Tue, 26 Oct 2021 23:00:56 +0300
Message-Id: <20211026200058.2183-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, aladyshev22@gmail.com,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 supreeth.venkatesh@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add initial version of device tree for the BMC in the AMD DaytonaX
platform.

AMD DaytonaX platform is a customer reference board (CRB) with an
Aspeed ast2500 BMC manufactured by AMD.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 327 ++++++++++++++++++
 2 files changed, 328 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..01cfd803d273 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1457,6 +1457,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2600-evb-a1.dtb \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
+	aspeed-bmc-amd-daytonax.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
new file mode 100644
index 000000000000..93ad4262a786
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 AMD Inc.
+// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AMD DaytonaX BMC";
+	compatible = "amd,daytonax-bmc", "aspeed,ast2500";
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+
+	aliases {
+		serial0 = &uart1;
+		serial4 = &uart5;
+	};
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlycon";
+	};
+	leds {
+		compatible = "gpio-leds";
+
+		fault {
+			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
+		};
+	};
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
+			      <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
+			      <&adc 10>, <&adc 11>, <&adc 12>, <&adc 13>, <&adc 14>,
+			      <&adc 15>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
+};
+
+&uart1 {
+	//Host Console
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+		     &pinctrl_rxd1_default>;
+};
+
+&uart5 {
+	//BMC Console
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+		     &pinctrl_adc1_default
+		     &pinctrl_adc2_default
+		     &pinctrl_adc4_default
+		     &pinctrl_adc5_default
+		     &pinctrl_adc6_default
+		     &pinctrl_adc7_default
+		     &pinctrl_adc8_default
+		     &pinctrl_adc9_default
+		     &pinctrl_adc10_default
+		     &pinctrl_adc11_default
+		     &pinctrl_adc12_default
+		     &pinctrl_adc13_default
+		     &pinctrl_adc14_default
+		     &pinctrl_adc15_default>;
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"","","FAULT_LED","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"CHASSIS_ID_BTN","","","","","","","",
+	/*D0-D7*/	"","","ASSERT_BMC_READY","","","","","",
+	/*E0-E7*/	"MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
+			"MON_P0_PWR_GOOD","MON_PWROK","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&kcs1 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0x60>;
+};
+
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0x62>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xCA2>;
+};
+
+&kcs4 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0x97DE>;
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>, <0x81>;
+};
+
+&lpc_ctrl {
+	//Enable lpc clock
+	status = "okay";
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+	&pinctrl_pwm1_default
+	&pinctrl_pwm2_default
+	&pinctrl_pwm3_default
+	&pinctrl_pwm4_default
+	&pinctrl_pwm5_default
+	&pinctrl_pwm6_default
+	&pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+
+	fan@8 {
+		reg = <0x08>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
+	};
+
+	fan@9 {
+		reg = <0x09>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
+	};
+
+	fan@10 {
+		reg = <0x0a>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
+	};
+
+	fan@11 {
+		reg = <0x0b>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
+	};
+
+	fan@12 {
+		reg = <0x0c>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
+	};
+
+	fan@13 {
+		reg = <0x0d>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
+	};
+
+	fan@14 {
+		reg = <0x0e>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
+	};
+
+	fan@15 {
+		reg = <0x0f>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
+	};
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&vhub {
+	status = "okay";
+};
+
-- 
2.25.1

