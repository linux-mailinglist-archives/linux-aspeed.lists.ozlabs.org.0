Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9218A4643DC
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 01:14:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3fhY384Pz3brX
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 11:14:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U2yNKGWE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--aaelhaj.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3-2amyqckdhyuuyfbudaiiafy.wigfchor-umjyyxfcmnm.itfuvm.ila@flex--aaelhaj.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=U2yNKGWE; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3VQj514bz308v
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Dec 2021 05:01:33 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id
 x5-20020a2584c5000000b005f89a35e57eso30424831ybm.19
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 10:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=OUWKtS5wN5AtVUPRAyYepSRZ8pC1j09F5QY2p8VRhWo=;
 b=U2yNKGWExrYKqKLJIgTLc5v1VCvGEl6GgV8txeG3ZHgH36XOI5GrXl8zv5U22f8Kzu
 ySZIwcTX0Ih6FsK4WS+XrHcgGuziIjGD+jBofp1fdER0JjfTehs9EyWf7SID1fhivpDT
 UQZDXu/a3pje8VJ4OodJba7EeOdr6C5wM0ZvGQNLId2J20e6PMmJncyfkfVDQ0PmEroq
 TmE+eipBjaVBVuyNEUDNXNiuwI2jSAuXVrg7CbQ2KKM+MIwsOf2bmvHs33ed3rQPebNM
 QiHEs+ZahfJEZl/G44XxN9Yh1gCWr7xrX3ANI5i2ZbG2WJM7t1UdU+pIxBegBk83BXxv
 XL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=OUWKtS5wN5AtVUPRAyYepSRZ8pC1j09F5QY2p8VRhWo=;
 b=AkVNsMYwe/dJO0z+BT05Ja8g0HYfShfsNdcbSmPgAu97iNStOjyaPSiZkDdNXA0f2X
 K0OTsjkOcQABnVJPmjIlHc5MNPg5Vod6ixRDdfZS4uYNQmGFE9iz0NDZkwReWyQ5ZjYN
 7uIZoYywHQ+36ZLck4Q6GxZ/DrRaUVP6DHyehVBlbyg7IqA5RbZHh92mJkpRcDzLflNl
 RtLj0nxWT31u8UkcsOAHU/TCIgwAPs/GHtZ3QZHn759jhbIZy7S29OyjgdLYRN5BBYTY
 d3bXcqjqXoFyAeAwcpxORiJk9R5E72xvsIbn7tg3wQh+esJk/LG6QPxpswUF1hjeqwCR
 DWgw==
X-Gm-Message-State: AOAM531JtnjyU0XnAwGA+F5elP33+BBl3LJOMzXMf4p7zMle1jswCLHd
 8UWQkqqmzDli5aX9dX02sJ5+UqiIi2FH
X-Google-Smtp-Source: ABdhPJzl2hX0sW1jTTDkjHTZtqQ7s2jv7EjzJoVhUxteVU373Jwnyq3Bbnab/E79l7zVR8aA7uQDZffHgZXF
X-Received: from aaelhaj02.cam.corp.google.com
 ([2620:15c:93:a:1db9:9f82:594c:720f])
 (user=aaelhaj job=sendgmr) by 2002:a25:a0c8:: with SMTP id
 i8mr747978ybm.322.1638295291380; Tue, 30 Nov 2021 10:01:31 -0800 (PST)
Date: Tue, 30 Nov 2021 13:01:10 -0500
Message-Id: <20211130180110.2217042-1-aaelhaj@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH] ARM: dts: aspeed: Add TYAN S8036 BMC machine
From: Ali El-Haj-Mahmoud <aaelhaj@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Dec 2021 11:13:59 +1100
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
Cc: Rob Herring <robh+dt@kernel.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>,
 Oskar Sneft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The TYAN S8036 is a server platform with an ASPEED AST2500 BMC.

Signed-off-by: Ali El-Haj-Mahmoud <aaelhaj@google.com>
---
 arch/arm/boot/dts/Makefile                  |   3 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts | 466 ++++++++++++++++++++
 2 files changed, 468 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8b7f150be39e..b0ca5e88942b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1499,4 +1499,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
 	aspeed-bmc-inventec-transformers.dtb \
-	aspeed-bmc-tyan-s7106.dtb
+	aspeed-bmc-tyan-s7106.dtb \
+	aspeed-bmc-tyan-s8036.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
new file mode 100644
index 000000000000..873e7bf2361e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Tyan S8036 BMC";
+	compatible = "tyan,s8036-bmc", "aspeed,ast2500";
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
+&uart_routing {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+
+	/* We enable the VUART here, but leave it in a state that does
+	 * not interfere with the SuperIO. The goal is to have both the
+	 * VUART and the SuperIO available and decide at runtime whether
+	 * the VUART should actually be used. For that reason, configure
+	 * an "invalid" IO address and an IRQ that is not used by the
+	 * BMC.
+	 */
+	aspeed,lpc-io-reg = <0xffff>;
+	aspeed,lpc-interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
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
+	/* CPU fan */
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	/* PWM group for chassis fans #1, #2, #3 and #4 */
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
+	/* Directly connected to Sideband-Temperature Sensor Interface (APML) */
+	status = "okay";
+};
+
+&i2c1 {
+	/* Directly connected to IPMB HDR. */
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
+	/* Also connected to:
+	 * - BCM5720
+	 * - FPGA
+	 * - FAN HDR
+	 * - FPIO HDR
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
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+	/* Hardware monitor with temperature sensors */
+	nct7802@28 {
+		compatible = "nuvoton,nct7802";
+		reg = <0x28>;
+		channel@0 { /* LTD */
+			reg = <0>;
+			status = "okay";
+		};
+		channel@1 { /* RTD1 */
+			reg = <1>;
+			status = "okay";
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@2 { /* RTD2 */
+			reg = <2>;
+			status = "okay";
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@3 { /* RTD3 */
+			reg = <3>;
+			status = "okay";
+			sensor-type = "temperature";
+		};
+	};
+
+	/* Also connected to:
+	 * - PCA9544
+	 * - CLK BUFF
+	 * - OCP FRU
+	 */
+};
+
+&i2c6 {
+	status = "okay";
+	/* Connected to:
+	 * - PCA9548 @0xE0
+	 * - PCA9548 @0xE2
+	 * - PCA9544 @0xE4
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
+	/*A2*/		"led-identify", /* in/out: BMC_CHASSIS_ID_LED_L */
+	/*A3*/		"",
+	/*A4*/		"",
+	/*A5*/		"",
+	/*A6*/		"",
+	/*A7*/		"",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0*/		"",
+	/*D1*/		"",
+	/*D2*/		"power-chassis-good", /* in: PWR_GOOD_LED -- Check if this is Z3?*/
+	/*D3*/		"platform-reset", /* in: RESET_LED_L */
+	/*D4*/		"",
+	/*D5*/		"",
+	/*D6*/		"",
+	/*D7*/		"",
+	/*E0*/		"power-button", /* in: BMC_SYS_MON_PWR_BTN_L */
+	/*E1*/		"power-chassis-control", /* out: BMC_ASSERT_PWR_BTN */
+	/*E2*/		"reset-button", /* in: BMC_SYS_MOS_RST_BTN_L*/
+	/*E3*/		"reset-control", /* out: BMC_ASSERT_RST_BTN */
+	/*E4*/		"nmi-button", /* in: BMC_SYS_MON_NMI_BTN_L */
+	/*E5*/		"nmi-control", /* out: BMC_ASSERT_NMI_BTN */
+	/*E6*/		"TSI_RESERT",
+	/*E7*/		"led-heartbeat", /* out: BMC_GPIOE7 */
+	/*F0*/		"",
+	/*F1*/		"clear-cmos-control", /* out: BMC_ASSERT_CLR_CMOS_L */
+	/*F2*/		"",
+	/*F3*/		"",
+	/*F4*/		"led-fault", /* out: BMC_HWM_FAULT_LED_L */
+	/*F5*/		"BMC_SYS_FAULT_LED_L",
+	/*F6*/		"BMC_ASSERT_BIOS_WP_L",
+	/*F7*/		"",
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
+	/*Q0*/		"",
+	/*Q1*/		"",
+	/*Q2*/		"",
+	/*Q3*/		"",
+	/*Q4*/		"",
+	/*Q5*/		"",
+	/*Q6*/		"id-button", /* in: BMC_CHASSIS_ID_BTN_L */
+	/*Q7*/		"",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z2*/	"","","",
+	/*Z3*/		"post-complete", /* BMC_SYS_MON_PWROK */
+	/*Z4-Z7*/	"","","","",
+	/*AA0*/		"",
+	/*AA1*/		"",
+	/*AA2*/		"",
+	/*AA3*/		"",
+	/*AA4*/		"",
+	/*AA5*/		"",
+	/*AA6*/		"",
+	/*AA7*/		"BMC_ASSERT_BMC_READY",
+	/*AB0*/		"BMC_SPD_SEL",
+	/*AB1-AB7*/	"","","","","","","";
+};
-- 
2.34.0.rc2.393.gf8c9666880-goog

