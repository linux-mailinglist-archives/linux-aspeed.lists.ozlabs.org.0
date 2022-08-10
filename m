Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23558EB04
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 13:11:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2nM600gwz30Qc
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 21:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KiNK2omd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KiNK2omd;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2nLy1SG7z2xHm
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 21:11:35 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id x9so12042759ljj.13
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Ch7MLzjtjxDAnl8q0BHET3tRA6bodCqHcVbiwE3Oe4g=;
        b=KiNK2omd8DLq4fRawlv2UlQGC3ixt2SOv3WoamhbOn4/WJIHBztUaYvcdEcoEXaeWV
         n3qT5h4eX4/7LFps12YmPYQ0TjGoRatvvtXHp9STxIeeb526zUYTI0ILSYwEL49rB1zK
         4nLLLR+SvRw6OTAIL1Ocw6OHB9fmfsD2dG8PIpnjXmOUKRGmgz83XR6g9snA9M7VcLOS
         jECd8j9D3LrusZc2qHwL1B/d9cDKh3RgSdyRmV3y6f+uoMC+EIqxFAWYD0wckIXH8B3I
         VNO1+2CuFnXqSsXlUCayvwEqU0IXCvVWHZomrQGBc8k3ihJEHi9G700l32EWd7H1xPtX
         /Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Ch7MLzjtjxDAnl8q0BHET3tRA6bodCqHcVbiwE3Oe4g=;
        b=3FJIjgbKTLggJsMQZzG1ZvLlzDt7qkBoFllVFH8qE6G3ubv+6Lixq/RB+qK1ZZl8M1
         J/4CiSpzpiOkdJb9XjlsY3U4hQvObLq4eMYbH2VYHtJtaySGTVRMFQ5WsglPAlJ0iZbO
         pHxN81hZS+AMyZVG2Syh+A+0e1aWJUhdSAfGyJZs4MW7EJSHWafQ/ZRo5a7wdWAKgcZA
         WFKjBGjXl3y4aYc3U60ntgRNW/r1EbAn9VgOltRM8pI52hllkgLQblMquzFWR5/dcs6y
         UgPZ61cBfNYedQl9WM8SD1simfAWg+dXEOq715/MfXkHfrC5FTSbLAcE2E4oh6qhLeba
         PKug==
X-Gm-Message-State: ACgBeo04ubSDtk+6LFTy//E2nxFRnUuo7WUbD1L+at2NV62zDlnNpK9g
	v81WZBIxBSRNgRjGgmyp5Gm28w==
X-Google-Smtp-Source: AA6agR4Yhps3ifFoUzNeZ4v4pfsf5foycFIjE22kBxaGVNAFDbW82io8VHx2WQvR01APu6a1u0hMIA==
X-Received: by 2002:a05:651c:1503:b0:24c:81df:e1f2 with SMTP id e3-20020a05651c150300b0024c81dfe1f2mr8137090ljf.182.1660129889284;
        Wed, 10 Aug 2022 04:11:29 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id p20-20020ac24ed4000000b0048a7c86f4e7sm298221lfr.291.2022.08.10.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 04:11:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: align SPI node name with dtschema
Date: Wed, 10 Aug 2022 14:11:26 +0300
Message-Id: <20220810111126.281214-1-krzysztof.kozlowski@linaro.org>
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

The node names should be generic and DT schema expects certain pattern.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts      | 2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts        | 2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts    | 2 +-
 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
index 9c6271a17ae8..5cd060029ea9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
@@ -77,7 +77,7 @@ aliases {
 		i2c55 = &imux55;
 	};
 
-	spi_gpio: spi-gpio {
+	spi_gpio: spi {
 		num-chipselects = <2>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>,
 			   <&gpio0 ASPEED_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
index 27b43fe099f1..4b520d7ce3e1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
@@ -44,7 +44,7 @@ chosen {
 		stdout-path = &uart5;
 	};
 
-	spi_gpio: spi-gpio {
+	spi_gpio: spi {
 		num-chipselects = <1>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
index af58a73bbc49..6b319f34a9b9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
@@ -207,7 +207,7 @@ aliases {
 		i2c143 = &imux143;
 	};
 
-	spi_gpio: spi-gpio {
+	spi_gpio: spi {
 		num-chipselects = <3>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>,
 			   <0>,	/* device reg=<1> does not exist */
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
index a901c8be49b9..ed305948386f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
@@ -67,7 +67,7 @@ ast-adc-hwmon {
 	 * full-duplex SPI transactions are not supported by ASPEED SPI
 	 * Controllers.
 	 */
-	spi_gpio: spi-gpio {
+	spi_gpio: spi {
 		status = "okay";
 		compatible = "spi-gpio";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
index 051de5bec345..31590d3186a2 100644
--- a/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
@@ -25,7 +25,7 @@ memory@80000000 {
 	 * full-duplex SPI transactions are not supported by ASPEED SPI
 	 * Controllers.
 	 */
-	spi_gpio: spi-gpio {
+	spi_gpio: spi {
 		status = "okay";
 		compatible = "spi-gpio";
 		#address-cells = <1>;
-- 
2.34.1

