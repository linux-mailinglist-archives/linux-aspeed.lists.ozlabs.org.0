Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F93B93D126
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 12:29:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NT0tsiz3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVkWt59jLz3dL2
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 20:29:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NT0tsiz3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVkWg50tWz3dBM
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 20:29:19 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-397ba4f7387so7439315ab.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721989757; x=1722594557; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=De+qXBtBz68o2ZspP14FQpFdhcta/tZ6/85u29jonkY=;
        b=NT0tsiz3jh1OtUBfzjylPjIe23oj8s6bZe4W5zamMzAROSOhx6+9U68RbqN4hYtgEz
         tpSY2y7b/vbv1Jsz/sfDYZSKhxkCr2WWqefwgjtyW+ieKtYUsliOwG3JheefmWPwnuwa
         psNGJrVWIieyPPOpVkKvijSPMoWdawVw6jWL8HpgGlSK+GKpT35LZ23gMzsoqvPhXn8C
         GasMck0NT/5kjaKeqxsRsgEDMtyqPO+X82Zn8JD85aLn/IIk/Qub5qu+5NYyR7RCF8aL
         m9pBvOBjmubZfNyCzKt2oltAaBujjRn3kn1pQUCewASiX9c9+HNojX5/35sezrOft7dG
         o+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721989757; x=1722594557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=De+qXBtBz68o2ZspP14FQpFdhcta/tZ6/85u29jonkY=;
        b=MCKBzx5jnAAkAKic/ymkl1agPVBHxVe/mxI63Y/E3vEZLrReL26ZVutX2/NRE4r6iN
         qbjcTbM9MeFZvMWg05RYbBcTh7YguYOKe1lanmpLa+OGTNM2mZXfnflxLzp8xtzGqNsY
         Gs8X4355nEfUGgyJzxok0mE3Ek/ybu8uvO066rTohIi3/Khc1qvrDIUi6ibrjBC6abj7
         3MxBXAIRTBkAiCO2DTfNORYGc19Qn/9RF9IanffEPhfvom/daQgpRN25l4E8dLu+53S1
         KrMC0Sm2jgcZEXl+tOxS8B3MGl3Hgy3U39ZZvNPANP9f7H5wZbmHZ7r+JdXgg9lJu9Iz
         xSXw==
X-Forwarded-Encrypted: i=1; AJvYcCULxLMIUmwZYTmTFqQFTwdpdaVkI1yKj91gEVqNH19mxuVB8F/UDifD4zD+9ioswTkV66roZP620/XJFyN538X8evRHHGu2qmJDXnXbEA==
X-Gm-Message-State: AOJu0Yznh8kdhAi48KOsaty8cNd1RBYwOvxGPT4zISgYFDgFcBy5+/Ri
	zype3pDI8oMc5Kn/ZWt5I0oMRL0NWc0PCAvFFs8B+JO1LgdZafog
X-Google-Smtp-Source: AGHT+IHwyQi+2XG6aLXTWrX/u8hRQ2mY/NzXfpKafEPnaDUZo+JgfaTVQK6wzZ9/hs8QRF09jsKHBg==
X-Received: by 2002:a05:6e02:b27:b0:376:3e9c:d9a8 with SMTP id e9e14a558f8ab-39a217f0ec5mr66125625ab.9.1721989756502;
        Fri, 26 Jul 2024 03:29:16 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8116a4sm2406545b3a.130.2024.07.26.03.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 03:29:16 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 26 Jul 2024 18:26:50 +0800
Subject: [PATCH v5 2/2] ARM: dts: aspeed: catalina: add Meta Catalina BMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-potin-catalina-dts-v5-2-8f02305af527@gmail.com>
References: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
In-Reply-To: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721989748; l=22558;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=FYCG9S9Mb0dYUplVAtTiuJyC39U8qcjJAMSBno6/Rmg=;
 b=NwDnnAugAVdAxLz9XO5wyW4NUGNj1HTuJvNRzESV/UIrWcWQjTnjwBUAet05gg71JOyKTwjRz
 PlieB/PBWF2B0mRDxJyuFJt4vPcGTvhkDO6irkA85QVHCT9rZPlHlDO
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add linux device tree entry for Meta(Facebook) Catalina compute-tray
BMC using AT2600 SoC.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 1016 ++++++++++++++++++++
 2 files changed, 1017 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index e51c6d203725..afdc9f78dd7f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
 	aspeed-bmc-facebook-bletchley.dtb \
+	aspeed-bmc-facebook-catalina.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
new file mode 100644
index 000000000000..19689bc58d0e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -0,0 +1,1016 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Catalina BMC";
+	compatible = "facebook,catalina-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart1;
+		serial2 = &uart3;
+		serial3 = &uart4;
+		serial4 = &uart5;
+		i2c16 = &i2c1mux0ch0;
+		i2c17 = &i2c1mux0ch1;
+		i2c18 = &i2c1mux0ch2;
+		i2c19 = &i2c1mux0ch3;
+		i2c20 = &i2c1mux0ch4;
+		i2c21 = &i2c1mux0ch5;
+		i2c22 = &i2c1mux0ch6;
+		i2c23 = &i2c1mux0ch7;
+		i2c24 = &i2c0mux0ch0;
+		i2c25 = &i2c0mux0ch1;
+		i2c26 = &i2c0mux0ch2;
+		i2c27 = &i2c0mux0ch3;
+		i2c28 = &i2c0mux1ch0;
+		i2c29 = &i2c0mux1ch1;
+		i2c30 = &i2c0mux1ch2;
+		i2c31 = &i2c0mux1ch3;
+		i2c32 = &i2c0mux2ch0;
+		i2c33 = &i2c0mux2ch1;
+		i2c34 = &i2c0mux2ch2;
+		i2c35 = &i2c0mux2ch3;
+		i2c36 = &i2c0mux3ch0;
+		i2c37 = &i2c0mux3ch1;
+		i2c38 = &i2c0mux3ch2;
+		i2c39 = &i2c0mux3ch3;
+		i2c40 = &i2c0mux4ch0;
+		i2c41 = &i2c0mux4ch1;
+		i2c42 = &i2c0mux4ch2;
+		i2c43 = &i2c0mux4ch3;
+		i2c44 = &i2c0mux5ch0;
+		i2c45 = &i2c0mux5ch1;
+		i2c46 = &i2c0mux5ch2;
+		i2c47 = &i2c0mux5ch3;
+		i2c48 = &i2c33mux0ch0;
+		i2c49 = &i2c33mux0ch1;
+		i2c50 = &i2c33mux0ch2;
+		i2c51 = &i2c33mux0ch3;
+		i2c52 = &i2c33mux0ch4;
+		i2c53 = &i2c33mux0ch5;
+		i2c54 = &i2c33mux0ch6;
+		i2c55 = &i2c33mux0ch7;
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
+	spi1_gpio: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
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
+			label = "bmc_ready_noled";
+			gpios = <&gpio0 ASPEED_GPIO(B, 3) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
+
+		led-3 {
+			label = "bmc_ready_cpld_noled";
+			gpios = <&gpio0 ASPEED_GPIO(P, 5) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
+	};
+};
+
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
+&uart5 {
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi4_default>;
+	use-ncsi;
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
+&i2c0 {
+	status = "okay";
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c0mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c0mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux0ch3: i2c@3 {
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
+
+		i2c0mux1ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux1ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			// IO Mezz 0 IOEXP
+			io_expander7: gpio@20 {
+				compatible = "nxp,pca9535";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// IO Mezz 0 FRU EEPROM
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+		i2c0mux1ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux1ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@73 {
+		compatible = "nxp,pca9546";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c0mux2ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux2ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-mux@70 {
+				compatible = "nxp,pca9548";
+				reg = <0x70>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				i2c33mux0ch0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				i2c33mux0ch1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				i2c33mux0ch2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				i2c33mux0ch3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				i2c33mux0ch4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				i2c33mux0ch5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				i2c33mux0ch6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				i2c33mux0ch7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					power-sensor@40 {
+						compatible = "ti,ina230";
+						reg = <0x40>;
+						shunt-resistor = <2000>;
+					};
+					power-sensor@41 {
+						compatible = "ti,ina230";
+						reg = <0x41>;
+						shunt-resistor = <2000>;
+					};
+					power-sensor@44 {
+						compatible = "ti,ina230";
+						reg = <0x44>;
+						shunt-resistor = <2000>;
+					};
+					power-sensor@45 {
+						compatible = "ti,ina230";
+						reg = <0x45>;
+						shunt-resistor = <2000>;
+					};
+				};
+			};
+		};
+		i2c0mux2ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux2ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@75 {
+		compatible = "nxp,pca9546";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c0mux3ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux3ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c0mux3ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux3ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@76 {
+		compatible = "nxp,pca9546";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c0mux4ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux4ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			// IO Mezz 1 IOEXP
+			io_expander8: gpio@21 {
+				compatible = "nxp,pca9535";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// IO Mezz 1 FRU EEPROM
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+		i2c0mux4ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux4ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c0mux5ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux5ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c0mux5ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux5ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c1mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <500>;
+			};
+			power-sensor@42 {
+				compatible = "ti,ina238";
+				reg = <0x42>;
+				shunt-resistor = <500>;
+			};
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <500>;
+			};
+		};
+		i2c1mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+			};
+			power-sensor@43 {
+				compatible = "ti,ina238";
+				reg = <0x43>;
+			};
+		};
+		i2c1mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			pwm@21{
+				compatible = "maxim,max31790";
+				reg = <0x21>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				channel@2 {
+					reg = <2>;
+					sensor-type = "TACH";
+				};
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
+			};
+			pwm@27{
+				compatible = "maxim,max31790";
+				reg = <0x27>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				channel@2 {
+					reg = <2>;
+					sensor-type = "TACH";
+				};
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
+			};
+		};
+		i2c1mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			vrm@60 {
+				compatible = "isil,raa228004";
+				reg = <0x60>;
+			};
+			vrm@61 {
+				compatible = "isil,raa228004";
+				reg = <0x61>;
+			};
+			vrm@62 {
+				compatible = "isil,raa228004";
+				reg = <0x62>;
+			};
+		};
+		i2c1mux0ch4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+
+			power-monitor@42 {
+				compatible = "lltc,ltc4287";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <200>;
+			};
+			power-monitor@43 {
+				compatible = "lltc,ltc4287";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <200>;
+			};
+		};
+		i2c1mux0ch5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+
+			// PDB FRU EEPROM
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			// PDB TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
+		};
+		i2c1mux0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+
+			// PDB IOEXP
+			io_expander5: gpio@27 {
+				compatible = "nxp,pca9554";
+				reg = <0x27>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// OSFP IOEXP
+			io_expander6: gpio@25 {
+				compatible = "nxp,pca9555";
+				reg = <0x25>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// OSFP FRU EEPROM
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+		i2c1mux0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+
+			// FIO FRU EEPROM
+			eeprom@53 {
+				compatible = "atmel,24c64";
+				reg = <0x53>;
+			};
+
+			// FIO TEMP SENSOR
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	// Module 0 IOEXP
+	io_expander0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 4) IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	// Module 1 IOEXP
+	io_expander1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 4) IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	// HMC IOEXP
+	io_expander2: gpio@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 4) IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	// Module 0 EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	// Module 1 EEPROM
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
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
+
+	// BMC IOEXP on Module 0
+	io_expander3: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	bus-frequency = <100000>;
+	multi-master;
+
+	//USB Debug Connector
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+
+	// SCM CPLD IOEXP
+	io_expander4: gpio@4f {
+		compatible = "nxp,pca9555";
+		reg = <0x4f>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// SCM TEMP SENSOR
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
+
+	// SCM FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	// BSM FRU EEPROM
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	// OCP NIC0 TEMP
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+
+	// OCP NIC0 FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+
+	// Module 1 FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+
+	// Module 0 FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	// Left CBC FRU EEPROM
+	eeprom@54 {
+		compatible = "atmel,24c02";
+		reg = <0x54>;
+	};
+
+	// Right CBC FRU EEPROM
+	eeprom@55 {
+		compatible = "atmel,24c02";
+		reg = <0x55>;
+	};
+
+	// HMC FRU EEPROM
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+
+	// OCP NIC1 TEMP
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+
+	// OCP NIC1 FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&adc0 {
+	vref = <1800>;
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
+	pinctrl-0 = <&pinctrl_adc10_default>;
+};
+
+&ehci0 {
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
+&pinctrl {
+	pinctrl_ncsi3_default: ncsi3_default {
+		function = "RMII3";
+		groups = "NCSI3";
+	};
+
+	pinctrl_ncsi4_default: ncsi4_default {
+		function = "RMII4";
+		groups = "NCSI4";
+	};
+};
+
+&gpio0 {
+	pinctrl-names = "default";
+
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"BATTERY_DETECT","PRSNT1_HPM_SCM_N",
+			"BMC_I2C1_FPGA_ALERT_L","BMC_READY",
+			"IOEXP_INT_L","FM_ID_LED",
+			"","",
+	/*C0-C7*/	"","","","",
+			"PMBUS_REQ_N","PSU_FW_UPDATE_REQ_N",
+			"","BMC_I2C_SSIF_ALERT_L",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","",
+			"FM_DEBUG_PORT_PRSNT_N","FM_BMC_DBP_PRESENT_N",
+	/*H0-H7*/	"PWR_BRAKE_L","RUN_POWER_EN",
+			"SHDN_FORCE_L","SHDN_REQ_L",
+			"","","","",
+	/*I0-I7*/	"","","","",
+			"","FLASH_WP_STATUS",
+			"FM_PDB_HEALTH_N","RUN_POWER_PG",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"PCIE_EP_RST_EN","BMC_FRU_WP",
+			"SCM_HPM_STBY_RST_N","SCM_HPM_STBY_EN",
+			"STBY_POWER_PG_3V3","TH500_SHDN_OK_L","","",
+	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1",
+			"LED_POSTCODE_2","LED_POSTCODE_3",
+			"LED_POSTCODE_4","LED_POSTCODE_5",
+			"LED_POSTCODE_6","LED_POSTCODE_7",
+	/*O0-O7*/	"HMC_I2C3_FPGA_ALERT_L","FPGA_READY_HMC",
+			"CHASSIS_AC_LOSS_L","BSM_PRSNT_R_N",
+			"PSU_SMB_ALERT_L","FM_TPM_PRSNT_0_N",
+			"","USBDBG_IPMI_EN_L",
+	/*P0-P7*/	"PWR_BTN_BMC_N","IPEX_CABLE_PRSNT_L",
+			"ID_RST_BTN_BMC_N","RST_BMC_RSTBTN_OUT_N",
+			"host0-ready","BMC_READY_CPLD","","BMC_HEARTBEAT_N",
+	/*Q0-Q7*/	"IRQ_PCH_TPM_SPI_N","USB_OC0_REAR_R_N",
+			"UART_MUX_SEL","I2C_MUX_RESET_L",
+			"RSVD_NV_PLT_DETECT","SPI_TPM_INT_L",
+			"CPU_JTAG_MUX_SELECT","THERM_BB_OVERT_L",
+	/*R0-R7*/	"THERM_BB_WARN_L","SPI_BMC_FPGA_INT_L",
+			"CPU_BOOT_DONE","PMBUS_GNT_L",
+			"CHASSIS_PWR_BRK_L","PCIE_WAKE_L",
+			"PDB_THERM_OVERT_L","HMC_I2C2_FPGA_ALERT_L",
+	/*S0-S7*/	"","","SYS_BMC_PWRBTN_R_N","FM_TPM_PRSNT_1_N",
+			"FM_BMC_DEBUG_SW_N","UID_LED_N",
+			"SYS_FAULT_LED_N","RUN_POWER_FAULT_L",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"L2_RST_REQ_OUT_L","L0L1_RST_REQ_OUT_L",
+			"BMC_ID_BEEP_SEL","BMC_I2C0_FPGA_ALERT_L",
+			"SMB_BMC_TMP_ALERT","PWR_LED_N",
+			"SYS_RST_OUT_L","IRQ_TPM_SPI_N",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","RST_BMC_SELF_HW",
+			"FM_FLASH_LATCH_N","BMC_EMMC_RST_N",
+			"","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
+&io_expander0 {
+	gpio-line-names =
+		"FPGA_THERM_OVERT_L","FPGA_READY_BMC",
+		"HMC_BMC_DETECT","HMC_PGOOD",
+		"","BMC_SELF_PWR_CYCLE",
+		"FPGA_EROT_FATAL_ERROR_L","WP_HW_EXT_CTRL_L",
+		"EROT_FPGA_RST_L","FPGA_EROT_RECOVERY_L",
+		"BMC_EROT_FPGA_SPI_MUX_SEL","USB2_HUB_RESET_L",
+		"NCSI_CS1_SEL","SGPIO_EN_L",
+		"B2B_IOEXP_INT_L","I2C_BUS_MUX_RESET_L";
+};
+
+&io_expander1 {
+	gpio-line-names =
+		"SEC_FPGA_THERM_OVERT_L","SEC_FPGA_READY_BMC",
+		"","",
+		"","",
+		"SEC_FPGA_EROT_FATAL_ERROR_L","SEC_WP_HW_EXT_CTRL_L",
+		"SEC_EROT_FPGA_RST_L","SEC_FPGA_EROT_RECOVERY_L",
+		"SEC_BMC_EROT_FPGA_SPI_MUX_SEL","",
+		"","",
+		"","SEC_I2C_BUS_MUX_RESET_L";
+};
+
+&io_expander2 {
+	gpio-line-names =
+		"HMC_PRSNT_L","HMC_READY",
+		"HMC_EROT_FATAL_ERROR_L","I2C_MUX_SEL",
+		"HMC_EROT_SPI_MUX_SEL","HMC_EROT_RECOVERY_L",
+		"HMC_EROT_RST_L","GLOBAL_WP_HMC",
+		"FPGA_RST_L","USB2_HUB_RST",
+		"CPU_UART_MUX_SEL","",
+		"","","","";
+};
+
+&io_expander3 {
+	gpio-line-names =
+		"RTC_MUX_SEL","PCI_MUX_SEL","TPM_MUX_SEL","FAN_MUX-SEL",
+		"SGMII_MUX_SEL","DP_MUX_SEL","UPHY3_USB_SEL","NCSI_MUX_SEL",
+		"BMC_PHY_RST","RTC_CLR_L","BMC_12V_CTRL","PS_RUN_IO0_PG",
+		"","","","";
+};
+
+&io_expander4 {
+	gpio-line-names =
+		"stby_power_en_cpld","stby_power_gd_cpld","","",
+		"","","","",
+		"","","","",
+		"","","","";
+};
+
+&io_expander5 {
+	gpio-line-names =
+		"JTAG_MUX_SEL","IOX_BMC_RESET","","",
+		"","","","";
+};
+
+&io_expander6 {
+	gpio-line-names =
+		"OSFP_PHASE_ID0","OSFP_PHASE_ID1",
+		"OSFP_PHASE_ID2","OSFP_PHASE_ID3",
+		"","","","",
+		"OSFP_BOARD_ID0","OSFP_BOARD_ID0",
+		"OSFP_BOARD_ID0","PWRGD_P3V3_N1",
+		"PWRGD_P3V3_N2","","","";
+};
+
+&io_expander7 {
+	gpio-line-names =
+		"RST_CX7_0","RST_CX7_1",
+		"CX0_SSD0_PRSNT_L","CX1_SSD1_PRSNT_L",
+		"CX_BOOT_CMPLT_CX0","CX_BOOT_CMPLT_CX1",
+		"CX_TWARN_CX0_L","CX_TWARN_CX1_L",
+		"CX_OVT_SHDN_CX0","CX_OVT_SHDN_CX1",
+		"FNP_L_CX0","FNP_L_CX1",
+		"","","","";
+};
+
+&io_expander8 {
+	gpio-line-names =
+		"SEC_RST_CX7_0","SEC_RST_CX7_1",
+		"SEC_CX0_SSD0_PRSNT_L","SEC_CX1_SSD1_PRSNT_L",
+		"SEC_CX_BOOT_CMPLT_CX0","SEC_CX_BOOT_CMPLT_CX1",
+		"SEC_CX_TWARN_CX0_L","SEC_CX_TWARN_CX1_L",
+		"SEC_CX_OVT_SHDN_CX0","SEC_CX_OVT_SHDN_CX1",
+		"SEC_FNP_L_CX0","SEC_FNP_L_CX1",
+		"","","","";
+};

-- 
2.31.1

