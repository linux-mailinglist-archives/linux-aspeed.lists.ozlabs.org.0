Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF49402F23
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Sep 2021 21:49:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3wpT60WQz2yJC
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 05:49:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aZ4BDzuf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::b49;
 helo=mail-yb1-xb49.google.com;
 envelope-from=3wmi3yqmkdms591x55x2v.t532z4be-r96vvu2z9a9.5g2rs9.58x@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=aZ4BDzuf; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3wpP6Lrdz2xvS
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Sep 2021 05:49:48 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 p69-20020a254248000000b00598282d96ceso530972yba.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Sep 2021 12:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=betTjfgS8zjP3fX10C5hPeV/OwurbMsBnKSEneTiuPE=;
 b=aZ4BDzufVfDBHtoMqUZyV7QG8dv1xp6RcrSvnFAImbQjGE1811OjR5JEA+CXSac8bG
 /BjeD/nlXNhFEEuiuigAdYi8Odc4Kjig+LjaqL4i1reWmz1R240ZvDMnxQzMY/1zHgq3
 XuSatIAgLigYfLT2XOy9FauuIyqZEm5Dtejq/C3F/OCICjzuLiB18BKMTqlIm6eG2AXj
 NXLS3DJVOlHKUwPynB0WIME5mSLfB87JO5RwMMmBSTZZP2VuCwZ8MhogRkLkrUzb1fBq
 xro/bWWcMu/c+ufDzYBCnd5ckFjXbme/F2ytp7nj2yP4orM+MJ0tQbzx9nChf0wVpt/U
 iIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=betTjfgS8zjP3fX10C5hPeV/OwurbMsBnKSEneTiuPE=;
 b=mc3gdmnWIZTybqrlx4vI2KtqPhkOPLOB5w4tX8o3tolLQbdotlYUyVYHc9XS3O/LPu
 uhusKb/a6Pq8Qpix97u0R0DGHaSjxi18LqRD/9cSw4eFqgarmCr5m4WNwygyXUM2rV9H
 2eiLlEL+cBtNDOzYaJzCjVDamO0lqDb0fYx9WS3YPJTyfRyv596FqX+LMQkee1NkROd5
 IavvdgptwgL4QRGdvaeuOAxsE8BK0f77PX+JwggUQnYopwRq6cY1tI2zZE1qZVTXWFE8
 EiBnvxIWLf/xMrpCqGbLRYsRQFmaoRj1oK8sQlI7Vaf6RIlN4kiiYjCuBaoNPut12st3
 T1gQ==
X-Gm-Message-State: AOAM53020XZx6s0N8EEommwA62ljnuL3lnjHzJxyJ8mApm2abbBlOo6B
 A/CB3r2O/PnznQSau/4BpDL8D2fu3ryXmeWsvgZ/RO8mrjy4kBhEmqXSjgL6VuAgBzLLP6oCoj+
 z3PxX+t6V6LlmeEVQlqlGpsqg/3k3CvXfiA/ii6/jgdLjPC/8K7FyZqlSrltdIA4=
X-Google-Smtp-Source: ABdhPJxUCVQCchLvFbepJk7QUPzqcRiuOVhtOhuNfhmAed3H09WmTIq5LoYkLz5HCCkI2DFGXmEUczo=
X-Received: from osk.cam.corp.google.com ([2620:0:1004:1a:3e97:4527:d351:41b])
 (user=osk job=sendgmr) by 2002:a25:b7d0:: with SMTP id
 u16mr126025ybj.342.1631044184593; 
 Tue, 07 Sep 2021 12:49:44 -0700 (PDT)
Date: Tue,  7 Sep 2021 15:49:31 -0400
Message-Id: <20210907194931.1173750-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH] ARM: dts: aspeed: Add TYAN S7106 BMC machine
From: Oskar Senft <osk@google.com>
To: linux-aspeed@lists.ozlabs.org
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
Cc: Ed Tanous <ed@tanous.net>, Oskar Senft <osk@google.com>,
 Jason Hargis <jason.hargis@equuscs.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The TYAN S7106 is a server platform with an ASPEED AST2500 BMC.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 415 ++++++++++++++++++++
 1 file changed, 415 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
new file mode 100644
index 000000000000..292bfb1a4bb2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -0,0 +1,415 @@
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
+		bootargs = "console=ttyS4,115200 earlyprintk";
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
+		p2a_memory: region@987F0000 {
+			no-map;
+			reg = <0x987F0000 0x00010000>; /* 64KB */
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
+	 * - via switch (BMC_SMB3_PCH_IE_SML3_EN, active low) to PCH SMBUS #3
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
+
+	use-ncsi;
+	no-hw-checksum;
+
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
+	kcs_addr = <0xca8>;
+};
+
+&kcs3 {
+	status = "okay";
+	kcs_addr = <0xca2>;
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"","","IDLED_N","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","ID_BUTTON","POST_COMPLETE","","",
+	/*D0-D7*/	"","","PS_PWROK","PLTRST_N","","","","",
+	/*E0-E7*/	"POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
+					"NMI_BUTTON","NMI_OUT","","HEARTBEAT_LED_N",
+	/*F0-F7*/	"","CLEAR_CMOS_N","","","IPMI_ALERT_LED_N","","","",
+	/*G0-G7*/	"BMC_PE_SMB_EN_1_N","BMC_PE_SMB_EN_2_N","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","BMC_PE_SMB_SW_BIT0","BMC_PE_SMB_SW_BIT1","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/   "","","","","","","","",
+	/*AA0-AA7*/	"","","","BMC_SMB3_PCH_IE_SML3_EN","","","","",
+	/*AB0-AB7*/	"","","","","","","","";
+};
-- 
2.33.0.309.g3052b89438-goog

