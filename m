Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438AB404265
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 02:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4gQ607n3z2yJ7
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 10:49:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ICgQFJfI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::b49;
 helo=mail-yb1-xb49.google.com;
 envelope-from=3hlo5yqmkdmc15xt11tyr.p1zyv07a-n52rrqyv565.1cyno5.14t@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ICgQFJfI; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4gPy0kVLz2xYR
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Sep 2021 10:49:39 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 z6-20020a257e06000000b0059bad6decfbso193854ybc.16
 for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Sep 2021 17:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oiAzryirNx030fZtWDn60SQQfEdcK4CXbkasITzENXQ=;
 b=ICgQFJfIl00iMXTzOLxIloypydy+UY1TQ5Bo/j01chCe/uxZIeZTOxmNkkkl2SRBBE
 th8KW/A777a0VVClSqAyraUtCj2ilsrDwCS+brTky6xXQnVLVU9ZGPGk2vvIC5kXrvMy
 NEGdI/xX9SuPhUhP2teSZXDUM1JA3t9nLYBG2JERinfwlj/d8vxm4H9gyc7BKpgTTa3L
 TYGi+fIrnfdpdOZ+4fX04Bv8cO6Nj8x2SuNIBUOhB6G3Optc0hh39g2V4yQZk6om4G7k
 K2ebR16t4jrpN4lrbqVCigGN10HVPFj6yPQ4D//VJmDJFSNS2QL99LjqZXSFYuEbBn8C
 1qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oiAzryirNx030fZtWDn60SQQfEdcK4CXbkasITzENXQ=;
 b=K8CVcKazMSBSVEz+neZ1tBltkbFs0FtUUgegCzp+G8rvPng/rTBGL+PwAro2kXl4IG
 eHEUkgwvBZdJabBcijEP0ltEdsqdTPLrvLwBMBgi+oKLtGU85EyEKVIfHlmGFcysdkeb
 ObbsXGzA4uCQvLpwr+wac+imzZyES5jspwfucvdtNemc6euTJ2O0QV4AbEqk/mCbctT9
 PqSEjzj2UcWrsL3jvfVEiU/CwTYmACSvFB5dEzwOiObhNfFQ99GEXIYNkdViGXytYX1b
 qLGEjPukhNzcn/r0QtDAydxzaRpggXOzLhKa7famaDSinD2j/xlFij7rNeZTCRpzlhGt
 QSeg==
X-Gm-Message-State: AOAM533KnPyvDK0urHo5N0SCBpZTXHTh5u3hcs5QhTlMDjbNDZ5b2y5T
 KeriJvipO+ltn2ITXSw1dbncxws=
X-Google-Smtp-Source: ABdhPJzijR1LBb4PIKLKEzFbz39TkF+AueBkchBTn4TnZ2adfWrmOb3zfXGvfoWKmvONlBVEjsedkjQ=
X-Received: from osk.cam.corp.google.com ([2620:0:1004:1a:5130:5c18:9d91:553a])
 (user=osk job=sendgmr) by 2002:a25:ba83:: with SMTP id
 s3mr290015ybg.450.1631148574279; 
 Wed, 08 Sep 2021 17:49:34 -0700 (PDT)
Date: Wed,  8 Sep 2021 20:49:20 -0400
Message-Id: <20210909004920.1634322-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH v2] ARM: dts: aspeed: Add TYAN S7106 BMC machine
From: Oskar Senft <osk@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ed Tanous <ed@tanous.net>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Jason Hargis <jason.hargis@equuscs.com>, Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The TYAN S7106 is a server platform with an ASPEED AST2500 BMC.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/Makefile                  |   3 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 488 ++++++++++++++++++++
 2 files changed, 490 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..522bf78e896b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1497,4 +1497,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
-	aspeed-bmc-supermicro-x11spi.dtb
+	aspeed-bmc-supermicro-x11spi.dtb \
+	aspeed-bmc-tyan-s7106.dts
diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
new file mode 100644
index 000000000000..68f332ee1886
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Tyan S7106 BMC";
+	compatible = "tyan,s7106-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlycon";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		p2a_memory: region@987f0000 {
+			no-map;
+			reg = <0x987f0000 0x00010000>; /* 64KB */
+		};
+
+		vga_memory: framebuffer@9f000000 {
+			no-map;
+			reg = <0x9f000000 0x01000000>; /* 16M */
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>; /* 16M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		heartbeat {
+			gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 12>, <&adc 13>, <&adc 14>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 15>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		label = "bmc";
+		status = "okay";
+		m25p,fast-read;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		label = "pnor";
+		m25p,fast-read;
+	};
+};
+
+&uart1 {
+	/* Rear RS-232 connector */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default>;
+};
+
+&uart2 {
+	/* RS-232 connector on header */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default
+			&pinctrl_rxd2_default>;
+};
+
+&uart3 {
+	/* Alternative to vuart to internally connect (route) to uart1
+	 * when vuart cannot be used due to BIOS limitations.
+	 */
+	status = "okay";
+};
+
+&uart4 {
+	/* Alternative to vuart to internally connect (route) to the
+	 * external port usually used by uart1 when vuart cannot be
+	 * used due to BIOS limitations.
+	 */
+	status = "okay";
+};
+
+&uart5 {
+	/* BMC "debug" (console) UART; connected to RS-232 connector
+	 * on header; selectable via jumpers as alternative to uart2
+	 */
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+};
+
+&p2a {
+	status = "okay";
+	memory-region = <&p2a_memory>;
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&adc {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+			&pinctrl_pwm1_default
+			&pinctrl_pwm3_default
+			&pinctrl_pwm4_default>;
+
+	/* CPU fan #0 */
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	/* CPU fan #1 */
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	/* PWM group for chassis fans #1, #2, #3 and #4  */
+	fan@2 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	/* PWM group for chassis fans #5 and #6  */
+	fan@6 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@7 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	/* Hardware monitor with temperature sensors */
+	nct7802@28 {
+		compatible = "nuvoton,nct7802";
+		reg = <0x28>;
+	};
+
+	/* Also connected to:
+	 * - IPMB pin header
+	 * - CPU #0 memory error LED @ 0x3A
+	 * - CPU #1 memory error LED @ 0x3C
+	 */
+};
+
+&i2c1 {
+	/* Directly connected to PCH SMBUS #0 */
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	/* BMC EEPROM, incl. mainboard FRU */
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+
+	/* Also connected to:
+	 * - fan header
+	 * - mini-SAS HD connector
+	 * - SSATA SGPIO
+	 * - via switch (BMC_SMB3_PCH_IE_SML3_EN, active low)
+	 *   to PCH SMBUS #3
+	 */
+};
+
+&i2c3 {
+	status = "okay";
+
+	/* PSU1 FRU @ 0xA0 */
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+	};
+
+	/* PSU2 FRU @ 0xA2 */
+	eeprom@51 {
+		compatible = "atmel,24c02";
+		reg = <0x51>;
+	};
+
+	/* PSU1 @ 0xB0 */
+	power-supply@58 {
+		compatible = "pmbus";
+		reg = <0x58>;
+	};
+
+	/* PSU2 @ 0xB2 */
+	power-supply@59 {
+		compatible = "pmbus";
+		reg = <0x59>;
+	};
+
+	/* Also connected to:
+	 * - PCH SMBUS #1
+	 */
+};
+
+&i2c4 {
+	status = "okay";
+
+	/* Connected to:
+	 * - PCH SMBUS #2
+	 */
+
+	/* Connected via switch to:
+	 * - CPU #0 channels ABC VDDQ @ 0x80
+	 * - CPU #0 channels DEF VDDQ @ 0x81
+	 * - CPU #1 channels ABC VDDQ @ 0x82
+	 * - CPU #1 channels DEF VDDQ @ 0x83
+	 * - CPU #0 VCCIO & VMCP @ 0x52
+	 * - CPU #1 VCCIO & VMCP @ 0x53
+	 * - CPU #0 VCCIN @ 0xC0
+	 * - CPU #0 VSA @ 0xC2
+	 * - CPU #1 VCCIN @ 0xC4
+	 * - CPU #1 VSA @ 0xC6
+	 * - J110
+	 */
+};
+
+&i2c5 {
+	status = "okay";
+
+	/* Connected via switch (PCH_BMC_SMB_SW_P) to:
+	 * - mainboard FRU @ 0xAE
+	 * - XDP connector
+	 * - ME debug header
+	 * - clock buffer @ 0xD8
+	 * - i2c4 via switch (PCH_VR_SMBUS_SW_P; controlled by PCH)
+	 * - PCH SMBUS
+	 */
+};
+
+&i2c6 {
+	status = "okay";
+
+	/* Connected via switch (BMC_PE_SMB_EN_1_N) to
+	 * bus mux (selector BMC_PE_SMB_SW_BIT[1..0]) to:
+	 * - 0,0: PCIE slot 1, SMB #1
+	 * - 0,1: PCIE slot 1, SMB #2
+	 * - 1,0: PCIE slot 2, SMB #1
+	 * - 1,1: PCIE slot 2, SMB #2
+	 */
+
+	/* Connected via switch (BMC_PE_SMB_EN_2_N) to
+	 * bus mux (selector BMC_PE_SMB_SW_BIT[1..0]) to:
+	 * - 0,0: OCP0 (A) SMB
+	 * - 0,1: OCP0 (C) SMB
+	 * - 1,0: OCP1 (A) SMB
+	 * - 1,1: NC
+	 */
+};
+
+&i2c7 {
+	status = "okay";
+
+	/* Connected to:
+	 * - PCH SMBUS #4
+	 */
+};
+
+&i2c8 {
+	status = "okay";
+
+	/* Not connected */
+};
+
+&mac0 {
+	status = "okay";
+	use-ncsi;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+};
+
+&mac1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&ibt {
+	status = "okay";
+};
+
+&kcs1 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+};
+
+/* Enable BMC VGA output to show an early (pre-BIOS) boot screen */
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+/* We're following the GPIO naming as defined at
+ * https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md.
+ *
+ * Notes on led-identify and id-button:
+ * - A physical button is connected to id-button which
+ *   triggers the clock on a D flip-flop. The /Q output of the
+ *   flip-flop drives its D input.
+ * - The flip-flop's Q output drives led-identify which is
+ *   connected to LEDs.
+ * - With that, every button press toggles the LED between on and off.
+ *
+ * Notes on power-, reset- and nmi- button and control:
+ * - The -button signals can be used to monitor physical buttons.
+ * - The -control signals can be used to actuate the specific
+ *   operation.
+ * - In hardware, the -button signals are connected to the -control
+ *   signals through drivers with the -control signals being
+ *   protected through diodes.
+ */
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0*/		"",
+	/*A1*/		"",
+	/*A2*/		"led-identify", /* in/out: BMC_IDLED_ON_N */
+	/*A3*/		"",
+	/*A4*/		"",
+	/*A5*/		"",
+	/*A6*/		"",
+	/*A7*/		"",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0*/		"",
+	/*C1*/		"",
+	/*C2*/		"",
+	/*C3*/		"",
+	/*C4*/		"id-button", /* in/out: BMC_IDBTN_IN_OUT_N */
+	/*C5*/		"post-complete", /* in: FM_BIOS_POST_CMPLT_N */
+	/*C6*/		"",
+	/*C7*/		"",
+	/*D0*/		"",
+	/*D1*/		"",
+	/*D2*/		"power-chassis-good", /* in: SYS_PWROK_BUF */
+	/*D3*/		"platform-reset", /* in: SYS_PLTRST_N */
+	/*D4*/		"",
+	/*D5*/		"",
+	/*D6*/		"",
+	/*D7*/		"",
+	/*E0*/		"power-button", /* in: BMC_PWBTN_IN_N */
+	/*E1*/		"power-chassis-control", /* out: BMC_PWRBTN_OUT_N */
+	/*E2*/		"reset-button", /* in: BMC_RSTBTN_IN_N */
+	/*E3*/		"reset-control", /* out: BMC_RSTBTN_OUT_N */
+	/*E4*/		"nmi-button", /* in: BMC_NMIBTN_IN_N */
+	/*E5*/		"nmi-control", /* out: BMC_NMIBTN_OUT_N */
+	/*E6*/		"",
+	/*E7*/		"led-heartbeat", /* out: BMC_HEARTBRAT_LED_N */
+	/*F0*/		"",
+	/*F1*/		"clear-cmos-control", /* out: BMC_CLR_CMOS_N */
+	/*F2*/		"",
+	/*F3*/		"",
+	/*F4*/		"led-fault", /* out: AST_HW_FAULT_N */
+	/*F5*/		"",
+	/*F6*/		"",
+	/*F7*/		"",
+	/*G0*/		"BMC_PE_SMB_EN_1_N", /* out */
+	/*G1*/		"BMC_PE_SMB_EN_2_N", /* out */
+	/*G2*/		"",
+	/*G3*/		"",
+	/*G4*/		"",
+	/*G5*/		"",
+	/*G6*/		"",
+	/*G7*/		"",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0*/		"",
+	/*Q1*/		"",
+	/*Q2*/		"",
+	/*Q3*/		"",
+	/*Q4*/		"BMC_PE_SMB_SW_BIT0", /* out */
+	/*Q5*/		"BMC_PE_SMB_SW_BIT1", /* out */
+	/*Q6*/		"",
+	/*Q7*/		"",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0*/		"",
+	/*AA1*/		"",
+	/*AA2*/		"",
+	/*AA3*/		"BMC_SMB3_PCH_IE_SML3_EN", /* out */
+	/*AA4*/		"",
+	/*AA5*/		"",
+	/*AA6*/		"",
+	/*AA7*/		"",
+	/*AB0-AB7*/	"","","","","","","","";
+};
-- 
2.33.0.309.g3052b89438-goog

