Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981178D27C
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 05:20:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=crjy+4Ni;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb8gY1fY4z3c13
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 13:20:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=crjy+4Ni;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYwlJ5ShWz2yG9
	for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Aug 2023 13:19:23 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1733946a12.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Aug 2023 20:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693192760; x=1693797560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxV4l6mlHU3mQ/9fiFdjek9/eZeTL4eJfpQUf2P54nk=;
        b=crjy+4Ni2Ghud4KSDqZ9Xh49ym3plna27hs3mhYzrf61xlv0dcU7SOMgs51cQk4Wg/
         vAAG3teXVIX7JuSfkCyFO3JrsvcE0G4JkM9CHUWs2fsYLKftY69rSDEUpao5XVws/I0m
         ufE5LVbMTav5ILfa/8NhUKDUWTwiqGbzZT5eH8QgN0KWgaC+4Ian1V/ZHSzwYu0wJ6Fs
         6hGgj+8r0QvrGzJy91lARPsOJkZdmi+NupIhCtry0HekLhGCp90un9Xg9lvSI7WvmShc
         cqXfESg16tnLeDjEVEqfx0q8RPlWZjLTdsRK74lJ0xCu3YdRgcY3d6X3H+SsmW19wCMf
         1+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693192760; x=1693797560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxV4l6mlHU3mQ/9fiFdjek9/eZeTL4eJfpQUf2P54nk=;
        b=cA2Y/UgTphi/9+zhucIXm0LrgI/d7gUU8MUslBBUqKQW2UMwqUWk6IITsVgXPWj+Et
         egenxksZZwtmsKMNHt03ktJNcOJ05Z75YJkFjVOspXJpvlfZOHHRaGSrSBjy1Zo+e4i8
         VVylH8jsLEUlMN/tbvuThV9XiGqSj7oacHOXEjBOy7gnlQ6Fg+Wpg+OPbib7D1hRbEpj
         vy5CioRUxA+01D5C0+BkY8FYgudMGKBElkv26CxFpckXnxQVCFbUtGFr0f6xNoHKj10i
         qh5dKLTue9PpCLSOvH8ZWkwbPXC+zJgHswh3m0nEgqeCHIIk2EYg8xarwpYwIkZFpCMv
         KFrQ==
X-Gm-Message-State: AOJu0Yz75++sXFzuBuHTBr4vHJ1z/n48AvhOaDBv0hJORJyzwURchYvx
	V0s9coLvY1QOViQbYesdR38=
X-Google-Smtp-Source: AGHT+IH4xCHiRJskVFoI5Npu1Zt5yppOy1NybY7nXwk0lGL08sZgItveAfmQEBPVj7vF3uyK2fcF+A==
X-Received: by 2002:a05:6a21:78a3:b0:14b:e604:9f0a with SMTP id bf35-20020a056a2178a300b0014be6049f0amr14214767pzc.20.1693192760545;
        Sun, 27 Aug 2023 20:19:20 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902d90500b001b9df8f14d7sm5967026plz.267.2023.08.27.20.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 20:19:19 -0700 (PDT)
From: peteryin <peteryin.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Minerva: Add Meta openBMC Minerva dts file.
Date: Mon, 28 Aug 2023 11:17:14 +0800
Message-Id: <20230828031714.107382-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Aug 2023 13:19:08 +1000
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com, peteryin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is for Meta openBMC Minerva dts.

Kernel:dev-6.1

Signed-off-by: peteryin <peteryin.openbmc@gmail.com>

---
v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/

Change log:
v1:
    1. Create minerva dts file.
v2:
    1.Add facebook,minerva-bmc in aspeed.yaml
    2.use stdout-path
    3.Add Makefile
---

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 329 ++++++++++++++++++
 3 files changed, 331 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index fb4ce5df2fa0..9d1b26e7ca6b 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6a897ff40ff0..e7c00905a08b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1603,6 +1603,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-wedge400.dtb \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
+	aspeed-bmc-facebook-minerva.dtb \
 	aspeed-bmc-ibm-bonnell.dtb \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
new file mode 100644
index 000000000000..fa4a803d68f2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2023 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Facebook Minerva";
+	compatible = "facebook,minerva-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart1;
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
+			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			<&adc1 2>;
+	};
+
+};
+
+// HOST BIOS Debug
+&uart1 {
+	status = "okay";
+};
+
+
+// SOL Host Console
+&uart2 {
+	status = "okay";
+	pinctrl-0 = <>;
+
+};
+
+// SOL BMC Console
+&uart4 {
+	status = "okay";
+	pinctrl-0 = <>;
+};
+
+// BMC Debug Console
+&uart5 {
+	status = "okay";
+};
+
+//MTIA
+&uart6 {
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+&vuart1 {
+	status = "okay";
+	virtual;
+	port=<0x3e8>;
+	sirq = <7>;
+	sirq-polarity = <0>;
+	dma-mode;
+	dma-channel = <12>;
+};
+
+&wdt1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+};
+
+
+&mac3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	no-hw-checksum;
+	use-ncsi;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-ctrl,no-channel-monitor;
+	mlx,multi-host;
+	ncsi-package = <1>;
+	ncsi-channel = <1>;
+	ncsi-rexmit = <1>;
+	ncsi-timeout = <2>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+
+//BIOS Flash
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <12000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+};
+
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&peci0 {
+	status = "okay";
+	clock-frequency = <1000000>;
+};
+
+&sgpiom0 {
+	status = "okay";
+	max-ngpios = <128>;
+	ngpios = <128>;
+	bus-frequency = <2000000>;
+	gpio-line-names =
+	/*in - out - in - out */
+	/*A0-A7*/   "","","","","","enable_sensors","","",
+	/*A0-A7*/   "","","","","","","","",
+	/*B0-B7*/   "","","","","","","","",
+	/*B0-B7*/   "","","","","","","","",
+	/*C0-C7*/   "","","","","","","","",
+	/*C0-C7*/   "","","","","","","","",
+	/*D0-D7*/   "","","","","","","","",
+	/*D0-D7*/   "","","","","","","","",
+	/*E0-E7*/   "","","","","","","","",
+	/*E0-E7*/   "","","","","","","","",
+	/*F0-F7*/   "","","","","","","","",
+	/*F0-F7*/   "","","","","","","","",
+	/*G0-G7*/   "","","","","","","","",
+	/*G0-G7*/   "","","","","","","","",
+	/*H0-H7*/   "","","","","","","","",
+	/*H0-H7*/   "","","","","","","","";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	tmp75@4B {
+		compatible = "ti,tmp75";
+		reg = <0x4B>;
+	};
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
+&i2c9 {
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
+&i2c13 {
+	status = "okay";
+};
+
+// To Debug card
+&i2c14 {
+	status = "okay";
+	multi-master;
+	aspeed,hw-timeout-ms = <1000>;
+};
+
+&i2c15 {
+	status = "okay";
+	// SCM FRU
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+	// BSM FRU
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+};
+
+&adc0 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc10_default>;
+};
+
+&jtag1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_jtagm_default>;
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&gpio0 {
+	pinctrl-names = "default";
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","SOL_UART_SET","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1",
+			"LED_POSTCODE_2","LED_POSTCODE_3",
+			"LED_POSTCODE_4","LED_POSTCODE_5",
+			"LED_POSTCODE_6","LED_POSTCODE_7",
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
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
-- 
2.25.1

