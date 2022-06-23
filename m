Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF75573DB
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 09:24:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTBbG6F6Gz3btt
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 17:24:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LxxG2HwI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LxxG2HwI;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTBb83vC8z3bnn
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 17:24:35 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id q6so2157544eji.13
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 00:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UndQkFV094yCZSTZ0g3V8yTNtRHE1sSLI8lJ0Whr5OQ=;
        b=LxxG2HwInE1hIpau8xuu6LTWIsR2ZFXStCwPPsC3E5dWajeJikaGzSqn+YZmgPW4sx
         gAbKhUs8pvI75j9bYMzlXp8zzZLB1gNEOrD06pYYzVbz8njnJ0rFA3ipRIXBeJUqjwyQ
         2OkH8zdS243eKNw16oqWzWkJ4k+ohKxi+t15VnbGw+iCqkmnoCDlwFHDwE7o7/NODy3U
         f3WPG2nfnv8RRUiR7gtdU5pOCcQow69Gw+rEcRBoNPdZCS99Fd0aQ0RVUqFAyRz9hZ9w
         iidcNhejdHzWcqbGQ1mYSJ52znMWT28hkCuDQYjT4QxHcD/Ee7Qza3u1VQgfjfUdOsiG
         lHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UndQkFV094yCZSTZ0g3V8yTNtRHE1sSLI8lJ0Whr5OQ=;
        b=Rt/MZ6Uw0FGPJSqDqBkCgqu+BOtdFwDlARrjms6qwyDRp68uw5n/m5R3rdJtmihye3
         kiN4dSV2g/jxTvWJDBKx0C421AzFf6nKL8/LoyHmZslFi0b9dWOaGXNsd1VDDVYG2XV0
         XUw2sxhO6cgExCMPJQ3EQO3h7Q+klkO7+h85ukjNGjDMRhcMpU+IFs8N7hcgyuDDkPlh
         R/CUSnmQk1HFVKJIWONe9vBgU3BArD0K8DM9SI0TuKE4tmLldDvLaqhHIsaA47CorYsN
         C6hvtcj88vtZSIrV27g0rvTFxendp/sgd+f7i4Zcj3Ao7CNJRyMIOqJ4f3OrI4twpIgB
         /keQ==
X-Gm-Message-State: AJIora+954bIl6Ipnch4gBNGZejreC6WtZC8SMiQhHCwq4Que1i4DsoD
	dBLGZyk32dbZRUSpZU6T1U620Q==
X-Google-Smtp-Source: AGRyM1t1t95hm8IimzvVPEAlRlVe3PW6IigWDmSWchyuqd6ky2gYS/fF209B7CQraROMk8HyI89kjw==
X-Received: by 2002:a17:907:2d29:b0:70e:8b1c:c3f0 with SMTP id gs41-20020a1709072d2900b0070e8b1cc3f0mr6709673ejc.37.1655969071889;
        Thu, 23 Jun 2022 00:24:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qf6-20020a1709077f0600b006fec4ee28d0sm10305248ejc.189.2022.06.23.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 00:24:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: centriq2400: drop the board
Date: Thu, 23 Jun 2022 09:24:28 +0200
Message-Id: <20220623072428.33697-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The board is unmaintained and unused, according to Joel, so simply let's
remove it.

Link: https://lore.kernel.org/all/CACPK8XfxXi8kQr+vxta8rD6SBgxLf_oBjAH0UkPBacQta552YQ@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/Makefile                    |   1 -
 .../dts/aspeed-bmc-arm-centriq2400-rep.dts    | 225 ------------------
 2 files changed, 226 deletions(-)
 delete mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 03f5b3a15415..6c36b7610c57 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1556,7 +1556,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
-	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-romed8hm3.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
deleted file mode 100644
index 3395de96ee11..000000000000
--- a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
+++ /dev/null
@@ -1,225 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/dts-v1/;
-
-#include "aspeed-g5.dtsi"
-#include <dt-bindings/gpio/aspeed-gpio.h>
-
-/ {
-	model = "Qualcomm Centriq 2400  REP AST2520";
-	compatible = "qualcomm,centriq2400-rep-bmc", "aspeed,ast2500";
-
-	chosen {
-		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlycon";
-	};
-
-	memory@80000000 {
-		reg = <0x80000000 0x40000000>;
-	};
-
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
-                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
-	};
-
-	iio-hwmon-battery {
-		compatible = "iio-hwmon";
-		io-channels = <&adc 7>;
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		uid_led {
-			label = "UID_LED";
-			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
-		};
-
-		ras_error_led {
-			label = "RAS_ERROR_LED";
-			gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
-		};
-
-		system_fault {
-			label = "System_fault";
-			gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
-		};
-	};
-};
-
-&fmc {
-	status = "okay";
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "bmc";
-#include "openbmc-flash-layout.dtsi"
-	};
-};
-
-&spi1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1_default>;
-	flash@0 {
-		status = "okay";
-	};
-};
-
-&spi2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi2ck_default
-			&pinctrl_spi2miso_default
-			&pinctrl_spi2mosi_default
-			&pinctrl_spi2cs0_default>;
-};
-
-&uart3 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
-	current-speed = <115200>;
-};
-
-&uart5 {
-	status = "okay";
-};
-
-&mac0 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
-};
-
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-
-	tmp421@1e {
-		compatible = "ti,tmp421";
-		reg = <0x1e>;
-	};
-	tmp421@2a {
-		compatible = "ti,tmp421";
-		reg = <0x2a>;
-	};
-	tmp421@4e {
-		compatible = "ti,tmp421";
-		reg = <0x4e>;
-	};
-	tmp421@1c {
-		compatible = "ti,tmp421";
-		reg = <0x1c>;
-	};
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&i2c3 {
-	status = "okay";
-};
-
-&i2c4 {
-	status = "okay";
-};
-
-&i2c5 {
-	status = "okay";
-};
-
-&i2c6 {
-	status = "okay";
-
-	tmp421@1d {
-		compatible = "ti,tmp421";
-		reg = <0x1d>;
-	};
-	tmp421@1f {
-		compatible = "ti,tmp421";
-		reg = <0x1f>;
-	};
-	tmp421@4d {
-		compatible = "ti,tmp421";
-		reg = <0x4d>;
-	};
-	tmp421@4f {
-		compatible = "ti,tmp421";
-		reg = <0x4f>;
-	};
-	nvt210@4c {
-		compatible = "nvt210";
-		reg = <0x4c>;
-	};
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-		pagesize = <128>;
-	};
-};
-
-&i2c7 {
-	status = "okay";
-};
-
-&i2c8 {
-	status = "okay";
-
-	pca9641@70 {
-		compatible = "nxp,pca9641";
-		reg = <0x70>;
-		i2c-arb {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			tmp421@1d {
-				compatible = "tmp421";
-				reg = <0x1d>;
-			};
-			adm1278@12 {
-				compatible = "adi,adm1278";
-				reg = <0x12>;
-				Rsense = <500>;
-			};
-			eeprom@50 {
-				compatible = "atmel,24c02";
-				reg = <0x50>;
-			};
-			ds1100@58 {
-				compatible = "ds1100";
-				reg = <0x58>;
-			};
-		};
-	};
-};
-
-&i2c9 {
-	status = "okay";
-};
-
-&vuart {
-	status = "okay";
-};
-
-&gfx {
-	status = "okay";
-};
-
-&pinctrl {
-	aspeed,external-nodes = <&gfx &lhc>;
-};
-
-&gpio {
-	pin_gpio_c7 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
-		output;
-		line-name = "BIOS_SPI_MUX_S";
-	};
-};
-- 
2.34.1

