Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BDB8A0762
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 06:56:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oa+aRwB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFS8r2CL4z3dWv
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 14:56:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oa+aRwB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFS8k4qs2z3dX4
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 14:56:37 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so4574479a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 21:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712811393; x=1713416193; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHTNrwtVfB656IwmijcBPMC2ZgOyFKP3zBvEDwvoMC8=;
        b=Oa+aRwB6DcqSRrtbymzfNSY72UydcA6U65Ka5EBgwZGvsB2p+qaQGKUiW8aLEhhR2t
         3C4pTj7CbkQcoqD19l/p4fyDWNTvSDKXk43khcklBUy0RvmVpxqSMFRHuqR8cBTiCGH6
         mkZODWQmdqQ6Q/W9UON3Xm6m8dsGz7W4bU5rmBshW5KcBg9M4NBvhjichUu3vo+k5tK5
         PQ4T3Lowi+4Nc2J+6G1Tuj2/ds13RYnvj51Dti3qKjYosm0UKycX5dn6oHPzyn38mqnI
         2SqzWJTanmDlgM2RUYJ0nITYuW1+kyUe8X2ZvlJbbd3dGMzskKK4gm9BF+Tip2Zhnbbs
         HOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712811393; x=1713416193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHTNrwtVfB656IwmijcBPMC2ZgOyFKP3zBvEDwvoMC8=;
        b=hNp2qr0zulhug5RmQZ8UhoJOcpgznG1jl+JhLfzoC2pUcnB+uN92yE21u8rJcsC6oE
         mijSghoQQrscV6xQcqUZOigqoLcgDiG2SAmElAwfOqV8d4ZXCDYJ1O8zuSkSlazS3rj+
         h0AF3U384xADMxqdGz+zdWr591lTQbB4KMfDXVEV3XJiGCUueNuTbKmMvJTdXH4TM3g7
         wWDFj/fc0hpOx05pH0ddUPMx4mP7xeiCR9szVDTaa2XlAHahk1F1BpTk0bEifVmlxy1+
         Xz/Df5wrlB2Jk6fecsIxvWtAjkSvEbeShuG2G+SuAn6AG2R70qj47h1qn9d2Qt3XRqB+
         6uzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWi/0D+CkBbR9rJj/g7CXlz+97x11tEy+rn6BWf4v+V2AUnTUdOsnhh+jUWaHZc2KPEDsoiah73FUL7eJsJ9SQR05Av+8ZoyoW/0V4EQ==
X-Gm-Message-State: AOJu0YyF09WahdKKnjOCmlAKJLhi5C5gulTJum8N7Kp6bguvtPD1UhEH
	M+D8dqvWDvIHP8Q0Lddksn4mNtpjg/oXvbk2vxaB9eU3sKQR8KA/
X-Google-Smtp-Source: AGHT+IHtf+Wl4dhvIBwFO5quw26YDztgDGpa8JMW+Q3uEfK/tNr4QU1WIV2KNcjoDf4O75QBFns8wQ==
X-Received: by 2002:a05:6a21:8806:b0:1a7:9476:6cb9 with SMTP id ta6-20020a056a21880600b001a794766cb9mr6205729pzc.32.1712811392865;
        Wed, 10 Apr 2024 21:56:32 -0700 (PDT)
Received: from localhost.localdomain (c-24-6-195-222.hsd1.ca.comcast.net. [24.6.195.222])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm809998pjs.6.2024.04.10.21.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 21:56:32 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	taoren@meta.com
Subject: [PATCH] ARM: dts: aspeed: Remove Facebook Cloudripper dts
Date: Wed, 10 Apr 2024 21:56:18 -0700
Message-ID: <20240411045622.7915-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Remove Facebook Cloudripper dts because the switch platform is not
actively maintained (all the units are deprecated).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 -
 .../aspeed-bmc-facebook-cloudripper.dts       | 544 ------------------
 2 files changed, 545 deletions(-)
 delete mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cloudripper.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index d3ac20e316d0..1c0e08c9ed3e 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -13,7 +13,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
 	aspeed-bmc-facebook-bletchley.dtb \
-	aspeed-bmc-facebook-cloudripper.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cloudripper.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cloudripper.dts
deleted file mode 100644
index d49328fa487a..000000000000
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cloudripper.dts
+++ /dev/null
@@ -1,544 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-// Copyright (c) 2020 Facebook Inc.
-
-/dts-v1/;
-
-#include <dt-bindings/leds/common.h>
-#include "ast2600-facebook-netbmc-common.dtsi"
-
-/ {
-	model = "Facebook Cloudripper BMC";
-	compatible = "facebook,cloudripper-bmc", "aspeed,ast2600";
-
-	aliases {
-		/*
-		 * PCA9548 (1-0070) provides 8 channels connecting to
-		 * SMB (Switch Main Board).
-		 */
-		i2c16 = &imux16;
-		i2c17 = &imux17;
-		i2c18 = &imux18;
-		i2c19 = &imux19;
-		i2c20 = &imux20;
-		i2c21 = &imux21;
-		i2c22 = &imux22;
-		i2c23 = &imux23;
-
-		/*
-		 * PCA9548 (2-0070) provides 8 channels connecting to
-		 * SCM (System Controller Module).
-		 */
-		i2c24 = &imux24;
-		i2c25 = &imux25;
-		i2c26 = &imux26;
-		i2c27 = &imux27;
-		i2c28 = &imux28;
-		i2c29 = &imux29;
-		i2c30 = &imux30;
-		i2c31 = &imux31;
-
-		/*
-		 * PCA9548 (3-0070) provides 8 channels connecting to
-		 * SMB (Switch Main Board).
-		 */
-		i2c32 = &imux32;
-		i2c33 = &imux33;
-		i2c34 = &imux34;
-		i2c35 = &imux35;
-		i2c36 = &imux36;
-		i2c37 = &imux37;
-		i2c38 = &imux38;
-		i2c39 = &imux39;
-
-		/*
-		 * PCA9548 (8-0070) provides 8 channels connecting to
-		 * PDB (Power Delivery Board).
-		 */
-		i2c40 = &imux40;
-		i2c41 = &imux41;
-		i2c42 = &imux42;
-		i2c43 = &imux43;
-		i2c44 = &imux44;
-		i2c45 = &imux45;
-		i2c46 = &imux46;
-		i2c47 = &imux47;
-
-		/*
-		 * PCA9548 (15-0076) provides 8 channels connecting to
-		 * FCM (Fan Controller Module).
-		 */
-		i2c48 = &imux48;
-		i2c49 = &imux49;
-		i2c50 = &imux50;
-		i2c51 = &imux51;
-		i2c52 = &imux52;
-		i2c53 = &imux53;
-		i2c54 = &imux54;
-		i2c55 = &imux55;
-	};
-
-	spi_gpio: spi {
-		num-chipselects = <2>;
-		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>,
-			   <&gpio0 ASPEED_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
-
-		eeprom@1 {
-			compatible = "atmel,at93c46d";
-			spi-max-frequency = <250000>;
-			data-size = <16>;
-			spi-cs-high;
-			reg = <1>;
-		};
-	};
-};
-
-&ehci1 {
-	status = "okay";
-};
-
-/*
- * "mdio1" is connected to the MDC/MDIO interface of the on-board
- * management switch (whose ports are connected to BMC, Host and front
- * panel ethernet port).
- */
-&mdio1 {
-	status = "okay";
-};
-
-&mdio3 {
-	status = "okay";
-
-	ethphy1: ethernet-phy@13 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x0d>;
-	};
-};
-
-&mac3 {
-	status = "okay";
-	phy-mode = "rgmii";
-	phy-handle = <&ethphy1>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii4_default>;
-};
-
-&i2c0 {
-	multi-master;
-	bus-frequency = <1000000>;
-};
-
-&i2c1 {
-	/*
-	 * PCA9548 (1-0070) provides 8 channels connecting to SMB (Switch
-	 * Main Board).
-	 */
-	i2c-mux@70 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x70>;
-		i2c-mux-idle-disconnect;
-
-		imux16: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux17: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux18: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux19: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux20: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux21: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux22: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux23: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-	};
-};
-
-&i2c2 {
-	/*
-	 * PCA9548 (2-0070) provides 8 channels connecting to SCM (System
-	 * Controller Module).
-	 */
-	i2c-mux@70 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x70>;
-		i2c-mux-idle-disconnect;
-
-		imux24: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux25: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux26: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux27: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux28: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux29: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux30: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux31: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-	};
-};
-
-&i2c3 {
-	/*
-	 * PCA9548 (3-0070) provides 8 channels connecting to SMB (Switch
-	 * Main Board).
-	 */
-	i2c-mux@70 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x70>;
-		i2c-mux-idle-disconnect;
-
-		imux32: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux33: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux34: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux35: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux36: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux37: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux38: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux39: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-	};
-};
-
-&i2c6 {
-	lp5012@14 {
-		compatible = "ti,lp5012";
-		reg = <0x14>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		multi-led@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-			color = <LED_COLOR_ID_MULTI>;
-			function = LED_FUNCTION_ACTIVITY;
-			label = "sys";
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_RED>;
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_BLUE>;
-			};
-
-			led@2 {
-				reg = <2>;
-				color = <LED_COLOR_ID_GREEN>;
-			};
-		};
-
-		multi-led@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-			color = <LED_COLOR_ID_MULTI>;
-			function = LED_FUNCTION_ACTIVITY;
-			label = "fan";
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_RED>;
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_BLUE>;
-			};
-
-			led@2 {
-				reg = <2>;
-				color = <LED_COLOR_ID_GREEN>;
-			};
-		};
-
-		multi-led@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-			color = <LED_COLOR_ID_MULTI>;
-			function = LED_FUNCTION_ACTIVITY;
-			label = "psu";
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_RED>;
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_BLUE>;
-			};
-
-			led@2 {
-				reg = <2>;
-				color = <LED_COLOR_ID_GREEN>;
-			};
-		};
-
-		multi-led@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-			color = <LED_COLOR_ID_MULTI>;
-			function = LED_FUNCTION_ACTIVITY;
-			label = "scm";
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_RED>;
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_BLUE>;
-			};
-
-			led@2 {
-				reg = <2>;
-				color = <LED_COLOR_ID_GREEN>;
-			};
-		};
-	};
-};
-
-&i2c8 {
-	/*
-	 * PCA9548 (8-0070) provides 8 channels connecting to PDB (Power
-	 * Delivery Board).
-	 */
-	i2c-mux@70 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x70>;
-		i2c-mux-idle-disconnect;
-
-		imux40: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux41: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux42: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux43: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux44: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux45: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux46: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux47: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-
-	};
-};
-
-&i2c15 {
-	/*
-	 * PCA9548 (15-0076) provides 8 channels connecting to FCM (Fan
-	 * Controller Module).
-	 */
-	i2c-mux@76 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x76>;
-		i2c-mux-idle-disconnect;
-
-		imux48: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux49: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux50: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux51: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux52: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux53: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux54: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux55: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-	};
-};
-- 
2.44.0

