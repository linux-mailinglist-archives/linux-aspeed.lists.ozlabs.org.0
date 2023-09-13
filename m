Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B1E79E49A
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 12:09:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZcX1NHA0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlx4s5Ggmz3bfK
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 20:09:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZcX1NHA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlx4l23lXz3bT8
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 20:09:09 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a65f9147ccso848069966b.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694599745; x=1695204545; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBuDcsIBg3E//Vv/9g5CCU2fgfEAOAgpt5kUuVffHJ0=;
        b=ZcX1NHA0VRc2DZdm4VYHQ1ZgaIstdGVUODSDhxOUFy379NN/EIUj/EWdMMlWf4247t
         xavuVxBmnkvCkefs8UJd8+i/KwYTZlVAKC45VIFXwQgta+/FJLWy2FvyRm31K0Obfoul
         RhQnuT/KJB8bRoa7DNGoPSeI6gMZadpJ8e7UZGWWJv0krNJFF2T0GcwdHn9pfbV8X/69
         Ay41I9ExvccVBVpTG6Er1Ux1Dw8zjCyRB3FiPUrL5aeSMZmAIhBb+5/Ix5hnkgXkd81x
         jurWOPkvvSBgIHWQhEjOsyNiOY/jytZkgcxop724amcBXhNKeTmB4Bvup9vo0eJGMSsV
         CKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599745; x=1695204545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBuDcsIBg3E//Vv/9g5CCU2fgfEAOAgpt5kUuVffHJ0=;
        b=w53MJPtyAubqiJPUqbNN7Qusemsdo/a6Y8kQNbqBmQst3Gezh8E9d7xUYRaYfgpTov
         HMHpGWcvzvXE4m8oEL80rplMyW9axxqfBakzZMBVnW2XHc6NhfCRK0crqaZtfrNkqmEX
         ymR6k2gvOfhkHx5anAhvOP8R6mNS2Sc75TBYgYrtez1SiQmaff6gK6NL8rJYP1YJRhTJ
         pTKGWHCfmXim/1jMDjwhaRV/BCCDoGlJZGBr20ys1CD03UnfhbsMF4uVff53MqBx43hF
         X3ZCDlD8KU+Qrl8PvzFdnPoLLwz0e5nDsUdkco8XUFO6WRC6vWoXqlldxTzc6Vb90c6y
         6fJA==
X-Gm-Message-State: AOJu0Yw3QkVWvQ92aU0gzt06wdUmz/VVawp8R5/5toTXWRhdHT3AIrtY
	7C+xLRrqwAS2dBH0zESloz+jng==
X-Google-Smtp-Source: AGHT+IF/yRHvcLucaXStR591Lxu4VFassY8xgrQ/r0PBfb2nok2oOPNsZ7YjEkUux11cIYQqO3UCgw==
X-Received: by 2002:a17:907:270e:b0:9a1:c00e:60cb with SMTP id w14-20020a170907270e00b009a1c00e60cbmr1779516ejk.10.1694599744967;
        Wed, 13 Sep 2023 03:09:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c13-20020a170906340d00b00982a352f078sm8119757ejb.124.2023.09.13.03.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 03:09:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: drop unused ref_voltage ADC property
Date: Wed, 13 Sep 2023 12:09:01 +0200
Message-Id: <20230913100901.100365-1-krzysztof.kozlowski@linaro.org>
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

Aspeed ADC "ref_voltage" property is neither documented nor used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 2 --
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts | 2 --
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 0715cb9ab30c..d7baa02e4666 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -541,7 +541,6 @@ bmc_ast2600_cpu: temperature-sensor@35 {
 };
 
 &adc0 {
-	ref_voltage = <2500>;
 	status = "okay";
 
 	pinctrl-names = "default";
@@ -552,7 +551,6 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 };
 
 &adc1 {
-	ref_voltage = <2500>;
 	status = "okay";
 
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
index 7a53f54833a0..a86bc75a9182 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
@@ -211,7 +211,6 @@ &i2c13 {
 };
 
 &adc0 {
-	ref_voltage = <2500>;
 	status = "okay";
 	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
 			&pinctrl_adc2_default &pinctrl_adc3_default
@@ -220,7 +219,6 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 };
 
 &adc1 {
-	ref_voltage = <2500>;
 	status = "okay";
 	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc10_default
 			&pinctrl_adc11_default &pinctrl_adc12_default
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 64075cc41d92..4097e3d355cb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -596,7 +596,6 @@ i2c-mux@72 {
 };
 
 &adc0 {
-	ref_voltage = <2500>;
 	status = "okay";
 	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
 			&pinctrl_adc2_default &pinctrl_adc3_default
@@ -605,7 +604,6 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 };
 
 &adc1 {
-	ref_voltage = <2500>;
 	status = "okay";
 	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
 };
-- 
2.34.1

