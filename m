Return-Path: <linux-aspeed+bounces-1328-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C90EAD0AE6
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Jun 2025 04:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDhPG6818z306d;
	Sat,  7 Jun 2025 12:06:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749205699;
	cv=none; b=E5+7Sr97o7BpyiE64DdheFYrjTAEpbCHqNe3EmET0hnFB6aS2yN07+7gaL08O2orJlwxcdCdaGRlGcgrpyxqucnv4In7+LKPoweVyeTyRypT7ZF+6LuOVLB+P0cmvfrpRD7M2SfChg7huSr4JPo15JRmJX60l0WanUl4QNX2BUXheHxDLS2ni4IDzQLQFP7PO399n9RLMpPCDYczGl5RStuhkEf04h6aFC4yVvnl4Ub4bw21JxvcU/d0EFWgqYpGQF80MdOS/hKjl+Ts75OooQ82gztAKh0khOZxKz14djo9YJm8ytOpu+XwCyVjDVrc30WIvAV2QFrZtbSOsp+ZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749205699; c=relaxed/relaxed;
	bh=6FuwAcAYxwLpn9cchA975j9Xj8eJ1TYxbCYiCle/9/k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKWqwsovp5KzuyajFFUU9+0cB2EOtEOJF4cDGLl7WzQNV6TAkCp82wa10hQ9Toj7GccumINDVZQ5gX0RH/mVIBd49/feQTJqVDIwN7TPlmppVb6fa9obd0lJXfmJerNP1vHuQQl4S/3wAGVlGNVHupM7DPiWyNmWlZ3+o29K+DX9pU18492CD7EvMHHaDQR4ODCXEzRvrPd+7fGgc7OpStPdRwQoeDbXBiLsYSzon1upjD6BJW8g//9bvZ3SU325gRXOXQlhvT1KZ8AKmdYEiHrixjhnJ8InDpHLVESK1M0Bt/fecuetxOehHewrKA3k9biv7yvSpqJssreRqytFEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+vfkzmL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+vfkzmL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bDHb65QqXz2yZZ
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Jun 2025 20:28:18 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2320d06b728so18180435ad.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Jun 2025 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749205697; x=1749810497; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FuwAcAYxwLpn9cchA975j9Xj8eJ1TYxbCYiCle/9/k=;
        b=X+vfkzmL/PaGgAiQnm4I8X6QW1qeEY6Lj66d+qEy68nquEQm64cUwz/ULEZAEY3NVv
         h1xOLg73AHY44Wa4qBf6GVWwbJLDWkOCDhQmwzGXGgtnpaTrTv9Rx3xwCmnFiZVVLU2G
         mWUQj/2bYGCr9tWAWnTtNHS0G7yJ4Zhhx61S+8UZbGVC+vQSmQqsTN9kDgUvjOJTbxJx
         3oH2yEIP+pkDXGok4Ehv98VVaDXcK0o+1dDsfC023coOofWiJygrEKIftOYwiMjOARcD
         3vXagRPNOFnMqY+Yz2tcduubJ6ua6VjmAesfUW6JkFjjX8T4sjfJ/D8awbnAr/N0owL5
         vJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205697; x=1749810497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FuwAcAYxwLpn9cchA975j9Xj8eJ1TYxbCYiCle/9/k=;
        b=Js4vq9gmOdUcSiazXOBQmoYuHXtvwEA1HblgNXj1gAdwHL+rE+SFPc69Fi81gxtyt5
         /SfBsppbAJbrMDevlnxPKE8iLY3zrfl6AQlRyRERgqZK/U+zuwsi9q2EO7EPXjyPzOS3
         H0bME0EJy6TQERpnWabX2FN+o6AbBEdl7JqJxZSfJS/oHZMpiFhUnNXhj9n4K8sioxUM
         3VhEgYgdmQQwlGH+l/iMOrWh1WgSp/rJmDwbgX7LGdg3mLNW1eg4Qz6+gvgqZE9TdfCr
         om7Y58BEaURSf+aEgSmSWOSdVlyV5PM5KbIkmFsK/u1aQgv4hx0NkaRFF+v48tjMf11J
         43SA==
X-Forwarded-Encrypted: i=1; AJvYcCXzWIF/isDkCwE8cg01jn09JDvq8GCbxcnUjwIqr9+4J5RDysAKk2v5Hfl9lKb5Yljg3r+LoQ0lcewNcmQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9ZKsfzFIj9uP7B8+4bd4Jrp4kuDst7L71mJ+OszA+uOSROCXK
	56zmaWshHX9pZpOVCn2Xvu9uTUbxdyNrLzWKcM28JD+osEoeEOlSHCGwisEoqVBSOzM=
X-Gm-Gg: ASbGncv2QnjBy+9TDsjJ9yBlFKApFrhrwh3aEKOpYVxtbYQ6Du3KzWiZaKKwL8PqL8o
	zf/NpeTd5WhRU7q0dxCIK4IsBiqGS42SqQ1lZmljjzuopMH6y45jvHrjWSa21hwzB25/G+Br1fC
	mvjsLkGJALCijGKZg1AnIoeoP4/+60U1ZFVNTwL3Ds6ZqnYz0snd0APRL8PjxHjXGcFtrhxT1Zs
	E1shwLnUDkZdMDzbswkEcdn7nflkhoEabb0orVPn8krS9VgFl410zDhGKKsKDdRiXoXb2/uLC6z
	dQSXRBFgqe1w6vvWHYwnDxIQzzSqUmLi4tUsyvq2AN45Cn7SCprpP6xvGSwqNcacMKAdGDBjT5c
	SostMFVlOXR4epKhgxh25g1oHNqnVV2UZVGI/03OAM9MwnkYHtvWNUgdlsu2mKxFFVGYXCp83DJ
	w=
X-Google-Smtp-Source: AGHT+IH4J91L2aDxjjQr7iT8Z7j1Q4ogvAFc9RSoJ0FjgokqAcs7pYI+t4+uY+PnXxPaHD5ArLFGKQ==
X-Received: by 2002:a17:902:d483:b0:234:9052:2be6 with SMTP id d9443c01a7336-23601d73edamr42409975ad.41.1749205696668;
        Fri, 06 Jun 2025 03:28:16 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e35c-06eb-80f3-97a6-ae1b-00f8.emome-ip6.hinet.net. [2001:b400:e35c:6eb:80f3:97a6:ae1b:f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360307813bsm9632885ad.22.2025.06.06.03.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:28:16 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: dts: aspeed: santabarbara: Add Meta Santabarbara BMC
Date: Fri,  6 Jun 2025 18:27:54 +0800
Message-ID: <20250606102802.1821638-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
References: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add linux device tree entry related to the Meta(Facebook) computer-node
system use an AT2600 BMC.
This node is named "Santabarbara".

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-santabarbara.dts      | 978 ++++++++++++++++++
 2 files changed, 979 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..6a8fb3addf0f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-harma.dtb \
 	aspeed-bmc-facebook-minerva.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
+	aspeed-bmc-facebook-santabarbara.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
 	aspeed-bmc-facebook-wedge100.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
new file mode 100644
index 000000000000..139b986bbfbf
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -0,0 +1,978 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2025 Facebook Inc.
+
+/dts-v1/;
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Santabarbara BMC";
+	compatible = "facebook,santabarbara-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart1;
+		serial2 = &uart3;
+		serial3 = &uart4;
+		serial4 = &uart5;
+		i2c16 = &i2c4mux0ch0;
+		i2c17 = &i2c4mux0ch1;
+		i2c18 = &i2c4mux0ch2;
+		i2c19 = &i2c4mux0ch3;
+		i2c20 = &i2c4mux0ch4;
+		i2c21 = &i2c4mux0ch5;
+		i2c22 = &i2c4mux0ch6;
+		i2c23 = &i2c4mux0ch7;
+		i2c24 = &i2c5mux0ch0;
+		i2c25 = &i2c5mux0ch1;
+		i2c26 = &i2c5mux0ch2;
+		i2c27 = &i2c5mux0ch3;
+		i2c28 = &i2c5mux1ch0;
+		i2c29 = &i2c5mux1ch1;
+		i2c30 = &i2c5mux1ch2;
+		i2c31 = &i2c5mux1ch3;
+		i2c32 = &i2c12mux0ch0;
+		i2c33 = &i2c12mux0ch1;
+		i2c34 = &i2c12mux0ch2;
+		i2c35 = &i2c12mux0ch3;
+		i2c36 = &i2c12mux0ch4;
+		i2c37 = &i2c12mux0ch5;
+		i2c38 = &i2c12mux0ch6;
+		i2c39 = &i2c12mux0ch7;
+	};
+
+	chosen {
+		stdout-path = "serial4:57600n8";
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
+			      <&adc1 2>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "bmc_heartbeat_amber";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "power_blue";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	spi_gpio: spi {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+
+	p3v3_bmc_aux: regulator-p3v3-bmc-aux {
+		compatible = "regulator-fixed";
+		regulator-name = "p3v3_bmc_aux";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+// HOST BIOS Debug
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+// BMC Debug Console
+&uart5 {
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
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
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	use-ncsi;
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+// BIOS Flash
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
+&i2c0 {
+	status = "okay";
+
+	// MB FRU
+	eeprom@53 {
+		compatible = "atmel,24c128";
+		reg = <0x53>;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	fan-controller@21{
+		compatible = "maxim,max31790";
+		reg = <0x21>;
+	};
+
+	gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <112 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"FM_NIC_PPS_IN_OE_N","FM_NIC_PPS_OUT_OE_N",
+			"FM_CPU0_TRIGGERTSC_OE_N","FM_NIC_PPS_IN_MUX_OE_N",
+			"FM_CPU0_CORETYPE0","FM_CPU0_CORETYPE1",
+			"FM_CPU0_CORETYPE2","FM_NIC_PPS_OUT_MUX_OE",
+			"CLKMUX_INPUT_LOSS_U45_R_N","FM_CPU0_SP7R1",
+			"FM_CPU0_SP7R2","FM_CPU0_SP7R3",
+			"FM_CPU0_SP7R4","",
+			"FM_NIC_PPS_IN_S0_R","FM_NIC_PPS_IN_S1_R";
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <116 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"FM_CBL_PRSNT_0A_N","FM_CBL_PRSNT_0B_N",
+			"FM_CBL_PRSNT_1A_N","FM_CBL_PRSNT_1B_N",
+			"FM_MODULE_PWRGD_0A","FM_MODULE_PWRGD_0B",
+			"CLKMUX_INPUT_LOSS_U88_R_N","FM_MODULE_PWRGD_1B",
+			"","",
+			"CLKMUX_INPUT_LOSS_U83_R_N","CLKMUX_INPUT_LOSS_U84_R_N",
+			"FM_P3V3_E1S_0_FAULT_R_N","FM_P3V3_E1S_1_FAULT_R_N",
+			"E1S_0_P12V_ADC_R_ALERT","E1S_1_P12V_ADC_R_ALERT";
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <114 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"FM_CBL_PRSNT_2A_N","FM_CBL_PRSNT_2B_N",
+			"FM_CBL_PRSNT_3A_N","FM_CBL_PRSNT_3B_N",
+			"FM_CBL_PRSNT_4A_N","FM_CBL_PRSNT_4B_N",
+			"FM_P3V3_NIC_400G_FAULT_R_N","FM_MODULE_PWRGD_2B",
+			"OCP_SFF_P12V_ADC_R_ALERT","FM_MODULE_PWRGD_3B",
+			"FM_THERMAL_ALERT_R_N","FM_MODULE_PWRGD_4B",
+			"FM_CBL_PRSNT_OSFP_A_N","FM_CBL_PRSNT_OSFP_B_N",
+			"FM_JTAG_MCIO_MUX_S0","FM_JTAG_MCIO_MUX_S1";
+	};
+
+	gpio@26 {
+		compatible = "nxp,pca9555";
+		reg = <0x26>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <118 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"FAN_0_PRSNT_R1_N","FAN_1_PRSNT_R1_N",
+			"FAN_2_PRSNT_R1_N","FAN_3_PRSNT_R1_N",
+			"P12V_FAN_0_ADC_ALERT","P12V_FAN_1_ADC_ALERT",
+			"P12V_FAN_2_ADC_ALERT","P12V_FAN_3_ADC_ALERT",
+			"P12V_FAN0_PWRGD_R","P12V_FAN1_PWRGD_R",
+			"P12V_FAN2_PWRGD_R","P12V_FAN3_PWRGD_R",
+			"","","","";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			// HPM Board ID EEPROM
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			// SCM Board ID EEPROM
+			eeprom@53 {
+				compatible = "atmel,24c128";
+				reg = <0x53>;
+			};
+		};
+		i2c4mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c4mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c4mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			power-monitor@40 {
+				compatible = "ti,ina230";
+				reg = <0x40>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@42 {
+				compatible = "ti,ina230";
+				reg = <0x42>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina230";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@46 {
+				compatible = "ti,ina230";
+				reg = <0x46>;
+				shunt-resistor = <2000>;
+			};
+
+			temperature-sensor@4c {
+				compatible = "ti,tmp75";
+				reg = <0x4c>;
+			};
+
+			temperature-sensor@4e {
+				compatible = "ti,tmp75";
+				reg = <0x4e>;
+			};
+
+			voltage-sensor@48 {
+				compatible = "ti,ads7830";
+				reg = <0x48>;
+				vref-supply = <&p3v3_bmc_aux>;
+			};
+
+			voltage-sensor@4a {
+				compatible = "ti,ads7830";
+				reg = <0x4a>;
+				vref-supply = <&p3v3_bmc_aux>;
+			};
+		};
+		i2c4mux0ch4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+		i2c4mux0ch5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+		i2c4mux0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+
+			power-monitor@40 {
+				compatible = "ti,ina230";
+				reg = <0x40>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@42 {
+				compatible = "ti,ina230";
+				reg = <0x42>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina230";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@46 {
+				compatible = "ti,ina230";
+				reg = <0x46>;
+				shunt-resistor = <2000>;
+			};
+
+			voltage-sensor@48 {
+				compatible = "ti,ads7830";
+				reg = <0x48>;
+			};
+		};
+		i2c4mux0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			// FIO FRU
+			eeprom@53 {
+				compatible = "atmel,24c512";
+				reg = <0x53>;
+			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
+
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	// E1S BP FRU
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c5mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c5mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c5mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9546";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux1ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			voltage-sensor@48 {
+				compatible = "ti,ads7830";
+				reg = <0x48>;
+			};
+		};
+		i2c5mux1ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+		};
+		i2c5mux1ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			power-monitor@40 {
+				compatible = "ti,ina230";
+				reg = <0x40>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@41 {
+				compatible = "ti,ina230";
+				reg = <0x41>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina230";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+				shunt-resistor = <2000>;
+			};
+		};
+		i2c5mux1ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			gpio@74 {
+				compatible = "nxp,pca9539";
+				reg = <0x74>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names =
+					"P12V_E1S_ADC_ALERT","BUFF0_100M_LOSB_PLD",
+					"E1S_BP_SKU_ID0","E1S_BP_SKU_ID1",
+					"E1S_BP_SKU_ID2","E1S_BP_REV_ID0",
+					"E1S_BP_REV_ID1","E1S_BP_REV_ID2",
+					"P3V3_E1S_1_FAULT_R_N","P3V3_E1S_2_FAULT_R_N",
+					"P3V3_E1S_3_FAULT_R_N","P3V3_E1S_4_FAULT_R_N",
+					"P12V_E1S_1_FAULT_R_N","P12V_E1S_2_FAULT_R_N",
+					"P12V_E1S_3_FAULT_R_N","P12V_E1S_4_FAULT_R_N";
+			};
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	// Rainbow0 FRU
+	eeprom@52 {
+		compatible = "atmel,24c256";
+		reg = <0x52>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+
+	// Rainbow2 FRU
+	eeprom@52 {
+		compatible = "atmel,24c256";
+		reg = <0x52>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	// SCM FRU
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+
+	// BSM FRU
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	// Rainbow3 FRU
+	eeprom@52 {
+		compatible = "atmel,24c256";
+		reg = <0x52>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	// OCP NIC TEMP
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+
+	// OCP NIC FRU
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+
+	// SWB FRU
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9548";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c12mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+		};
+		i2c12mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			power-monitor@42 {
+				compatible = "mps,mp2971";
+				reg = <0x42>;
+			};
+
+			power-monitor@43 {
+				compatible = "mps,mp2971";
+				reg = <0x43>;
+			};
+		};
+		i2c12mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			power-monitor@40 {
+				compatible = "ti,ina230";
+				reg = <0x40>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@41 {
+				compatible = "ti,ina230";
+				reg = <0x41>;
+				shunt-resistor = <2000>;
+			};
+		};
+		i2c12mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			power-monitor@44 {
+				compatible = "ti,ina230";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+				shunt-resistor = <2000>;
+			};
+		};
+		i2c12mux0ch4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			voltage-sensor@49 {
+				compatible = "ti,ads7830";
+				reg = <0x49>;
+			};
+		};
+		i2c12mux0ch5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+		i2c12mux0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+		i2c12mux0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c13 {
+	status = "okay";
+
+	// Rainbow1 FRU
+	eeprom@52 {
+		compatible = "atmel,24c256";
+		reg = <0x52>;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&adc0 {
+	aspeed,int-vref-microvolt = <2500000>;
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
+	aspeed,int-vref-microvolt = <2500000>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc10_default>;
+};
+
+&ehci0 {
+	status = "okay";
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
+	/*B0-B7*/	"rtc-battery-voltage-read-enable","","","BMC_READY",
+			"","led-identify","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"led-postcode-0","led-postcode-1",
+			"led-postcode-2","led-postcode-3",
+			"led-postcode-4","led-postcode-5",
+			"led-postcode-6","led-postcode-7",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"power-button","","reset-button","",
+			"led-power","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","power-host-control","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","",
+				"FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_REV_ID1",
+				"FM_BOARD_BMC_REV_ID2","",
+	/*18C0-18C7*/	"SPI_BMC_BIOS_ROM_IRQ0_R_N","","","","","","","",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"FM_BMC_PROT_LS_EN","AC_PWR_BMC_BTN_R_N","","";
+};
+
+&sgpiom0 {
+	status = "okay";
+	ngpios = <128>;
+	bus-frequency = <2000000>;
+	gpio-line-names =
+	/*in - out - in - out */
+	/*A0-A3 line 0-7*/
+	"PDB1_HSC_PWR_OK","power-chassis-control",
+	"PDB2_HSC_PWR_OK","FM_MODULE_PWRGD_0A_OUT",
+	"PWRGD_P12V_MEM","FM_MODULE_PWRGD_0B_OUT",
+	"PWRGD_P12V_SCM","FM_MODULE_PWRGD_1B_OUT",
+	/*A4-A7 line 8-15*/
+	"PWRGD_P12V_FAN","FM_MODULE_PWRGD_2B_OUT",
+	"PWRGD_P5V_AUX","FM_MODULE_PWRGD_3B_OUT",
+	"power-chassis-good","FM_MODULE_PWRGD_4B_OUT",
+	"PWRGD_P1V8_LDO","FM_CBL_PRSNT_0A_N_OUT",
+	/*B0-B3 line 16-23*/
+	"PWRGD_P1V_LDO","FM_CBL_PRSNT_0B_N_OUT",
+	"PWRGD_PVDD33_S5","FM_CBL_PRSNT_1A_N_OUT",
+	"PWRGD_PVDD18_S5_P0","FM_CBL_PRSNT_1B_N_OUT",
+	"CPU0_SLP_S5_N","FM_CBL_PRSNT_2A_N_OUT",
+	/*B4-B7 line 24-31*/
+	"PWRGD_PVDDIO_MEM_S3_P0","FM_CBL_PRSNT_2B_N_OUT",
+	"CPU0_SLP_S3_N","FM_CBL_PRSNT_3A_N_OUT",
+	"FM_MODULE_PWRGD_1B","FM_CBL_PRSNT_3B_N_OUT",
+	"FM_MODULE_PWRGD_2B","FM_CBL_PRSNT_4A_N_OUT",
+	/*C0-C3 line 32-39*/
+	"FM_MODULE_PWRGD_3B","FM_CBL_PRSNT_4B_N_OUT",
+	"FM_MODULE_PWRGD_4B","P12V_FAN0_PWRGD_OUT",
+	"FM_MODULE_PWRGD_0B","P12V_FAN1_PWRGD_OUT",
+	"PWRGD_PVDDIO_P0","P12V_FAN2_PWRGD_OUT",
+	/*C4-C7 line 40-47*/
+	"PWRGD_PVDDCR_SOC_P0","P12V_FAN3_PWRGD_OUT",
+	"PWRGD_PVDDCR_CPU0_P0","P12V_FAN4_PWRGD_OUT",
+	"PWRGD_PVDDCR_CPU1_P0","P12V_FAN5_PWRGD_OUT",
+	"FM_CPU0_PWR_GOOD","P12V_FAN6_PWRGD_OUT",
+	/*D0-D3 line 48-55*/
+	"host0-ready","P12V_FAN7_PWRGD_OUT",
+	"FM_PWRGD_CPU0_PWROK","FAN_0_PRSNT_R1_N_OUT",
+	"FM_RST_CPU0_RESETL_N","FAN_1_PRSNT_R1_N_OUT",
+	"RST_CPU0_PERST0_R_N","FAN_2_PRSNT_R1_N_OUT",
+	/*D4-D7 line 56-63*/
+	"RST_CPU0_PERST1_R_N","FAN_3_PRSNT_R1_N_OUT",
+	"BIOS_POST_CMPLT","FAN_4_PRSNT_R1_N_OUT",
+	"","FAN_5_PRSNT_R1_N_OUT",
+	"","FAN_6_PRSNT_R1_N_OUT",
+	/*E0-E3 line 64-71*/
+	"FM_PWRGD_CHAD_CPU0","FAN_7_PRSNT_R1_N_OUT",
+	"FM_PWRGD_CHEH_CPU0","TRAY_SLOT_ID0_OUT",
+	"FM_PWRGD_CHIL_CPU0","TRAY_SLOT_ID1_OUT",
+	"FM_PWRGD_CHMP_CPU0","TRAY_SLOT_ID2_OUT",
+	/*E4-E7 line 72-79*/
+	"P12V_E1S_0_PWRGD","TRAY_SLOT_ID3_OUT",
+	"P12V_E1S_1_PWRGD","TRAY_SLOT_ID4_OUT",
+	"P3V3_E1S_0_PWRGD","SCM_JTAG_MUX_S0_R",
+	"P3V3_E1S_1_PWRGD","SCM_JTAG_MUX_S1_R",
+	/*F0-F3 line 80-87*/
+	"FM_MODULE_PWRGD_0A","BMC_SGPIO_READY",
+	"OCP_V3_1_P3V3_PLD_R_PWRGD","CPU0_SYS_RESET_N",
+	"P12V_OCP_V3_1_PLD_PWRGD","RST_CPU0_KBRST_N",
+	"PWRGD_OCP_SFF_PWR_GOOD","BIOS_DEBUG_MODE",
+	/*F4-F7 line 88-95*/
+	"","CLR_CMOS",
+	"","I3C_SPD_MUX_FORCE_SEL",
+	"","FM_JTAG_HOST_SEL",
+	"","TRAY_PRESENT_N",
+	/*G0-G3 line 96-103*/
+	"MB_REV_ID_0","UART_BMC_SEL0",
+	"MB_REV_ID_1","UART_BMC_SEL1",
+	"MB_REV_ID_2","SCM_USB_SEL",
+	"MB_SKU_ID_0","FORCE_ALL_PWRON",
+	/*G4-G7 line 104-111*/
+	"MB_SKU_ID_1","PASSWORD_CLEAR",
+	"MB_SKU_ID_2","",
+	"MB_SKU_ID_3","",
+	"","BIOS_DEBUG_MODE",
+	/*H0-H3 line 112-119*/
+	"FM_IOEXP_U538_INT_N","",
+	"FM_IOEXP_U539_INT_N","",
+	"FM_IOEXP_U540_INT_N","",
+	"FM_IOEXP_U541_INT_N","",
+	/*H4-H7 line 120-127*/
+	"FM_IOEXP_PDB2_U1003_INT_N","",
+	"","","","","","",
+	/*I0-I3 line 128-135*/
+	"","","","",
+	"PDB_IRQ_PMBUS_ALERT_ISO_R_N","",
+	"PDB_UV_ALERT_ISO_R_N","",
+	/*I4-I7 line 136-143*/
+	"P12V_SCM_ADC_ALERT","",
+	"CPU0_REGS_I2C_ALERT_N","",
+	"FM_RTC_ALERT_N","",
+	"APML_CPU0_ALERT_R_N","",
+	/*J0-J3 line 144-151*/
+	"SMB_RJ45_FIO_TMP_ALERT","",
+	"FM_SMB_ALERT_MCIO_0A_N","",
+	"I3C_MCIO_0B_ALERT_ISO_R_N","",
+	"FM_SMB_ALERT_MCIO_1A_N","",
+	/*J4-J7 line 152-159*/
+	"I3C_MCIO_1B_ALERT_ISO_R_N","",
+	"FM_SMB_ALERT_MCIO_2A_N","",
+	"I3C_MCIO_2B_ALERT_ISO_R_N","",
+	"FM_SMB_ALERT_MCIO_3A_N","",
+	/*K0-K3 line 160-167*/
+	"I3C_MCIO_3B_ALERT_ISO_R_N","",
+	"FM_SMB_ALERT_MCIO_4A_N","",
+	"I3C_MCIO_4B_ALERT_ISO_R_N","",
+	"","",
+	/*K4-K7 line 168-175*/
+	"","","","","","","","",
+	/*L0-L3 line 176-183*/
+	"FM_CPU0_THERMTRIP_N","",
+	"FM_CPU0_PROCHOT_N","",
+	"FM_CPU0_SMERR_N","",
+	"FM_PVDDCR_CPU0_P0_OCP_N","",
+	/*L4-L7 line 184-191*/
+	"FM_PVDDCR_CPU1_P0_OCP_N","",
+	"FM_PVDDCR_SOC_P0_OCP_N","",
+	"FM_OCP_PWRBRK_R_N","",
+	"PMIC_ERROR_N","",
+	/*M0-M3 line 192-199*/
+	"","","","","","","","",
+	/*M4-M7 line 200-207*/
+	"","","","","","","","",
+	/*N0-N3 line 208-215*/
+	"FM_PRSNT_CPU0_N","",
+	"OCP_SFF_PRSNT_N","",
+	"E1S_0_PRSNT_R_N","",
+	"E1S_BP_0_PRSNT_R_N","",
+	/*N4-N7 line 216-223*/
+	"E1S_BP_1_PRSNT_R_N","",
+	"E1S_BP_2_PRSNT_R_N","",
+	"E1S_BP_3_PRSNT_R_N","",
+	"PDB_PRSNT_J311_N","",
+	/*O0-O3 line 224-231*/
+	"PDB_PRSNT_J312_N","",
+	"PDB_PRSNT_J313_N","",
+	"PDB_PRSNT_J314_N","",
+	"PRSNT_RJ45_FIO_N_R","",
+	/*O4-O7 line 232-239*/
+	"PRSNT_LEAK_CABLE_1_R_N","",
+	"PRSNT_LEAK_CABLE_2_R_N","",
+	"PRSNT_HDT_N","",
+	"","",
+	/*P0-P3 line 240-247*/
+	"","","","","","","","",
+	/*P4-P7 line 248-255*/
+	"","","","","","","","";
+};
-- 
2.49.0


