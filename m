Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02F8995C9
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 08:47:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ts4sNp2q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9ptq1BlQz3vZJ
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Apr 2024 17:46:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ts4sNp2q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9ptQ0sdpz3d2m
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Apr 2024 17:46:38 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-56e2e09fc27so664031a12.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Apr 2024 23:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299595; x=1712904395; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OsNd1Zvbhvpy0Prr8UcMcF9SUo+KwwufXMf2s1i4ho=;
        b=ts4sNp2qTKi/30ekkP4qkz/il9UKrfuXDD5BN1bh1JHM9atYjn5+EUOclX93wi46/v
         yr++fphqyV5kVTwJ4zZA45T6R4adPwtuA4hcfPd73CAPPF4XcB2LCTyzpeX8hHHpIG4O
         B66VQC17bhLITSr2pXtevNY/r1kDOJpRk38HBG4jB4gv31YfD6OAvaD0lnn9sU9q/FlH
         8QEJBXi+xpkBpijPM6PS20N0T88k9G7h9xJF4R2BbKh75qOb9EgQwWzcXyV6O4GvZHri
         7bByxsR4l3d2qYLKqa5ZoYHVlDFFMlKrbkPNVyTVJl2fbhGWJmaZnue9jEJtIPRpePVQ
         n6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299595; x=1712904395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OsNd1Zvbhvpy0Prr8UcMcF9SUo+KwwufXMf2s1i4ho=;
        b=CMlW9M4IRc6yOvWa4JLWVe1HLw5EVMAxsEt/jZqQhGArniL7VsL3QUm6ug1eMf2ftf
         sBNrbh2y+ok5RHtFqoSu2HJggFlf8R5IlK4nN/If3RIzLahraMwlGiGjzIHxK24PSy+Z
         f/3/qbUfiZ80rr6nIZ1bAItZXSDubwe/6qW0Wi6NVrIfs1Dh2i8GQIy3wZ6gbR2BMGpj
         +XfO+3FJ0hNUwYH+rTOIR2Akmr450Vur3yI0FnJXJ5hOJbl4SSyJzkfozNdkhyDFMxJr
         j8DoEfYIrBJwXh6an21cq8VkozDHm1V2umldmJgFd5BH4T0zCcMxp+SDQ5nIGrBbrX2o
         ZmVg==
X-Forwarded-Encrypted: i=1; AJvYcCV5H37VD7cYlPhug7RREW4o5TStywmiVa4SBlSeCB26bMXuCkjWGzgNP6iIbFp7DoZN9mIqup4pvD07dYY2ABw8J1fQ8+sFYO+3A8qcCw==
X-Gm-Message-State: AOJu0YzTAtuZaSmdarnZa7KB0dGCe8QIDd/z0ilGXryuZHwigaIgqoS+
	Iuc8mmXJ4+lilAhdcgygB3QXW1oucBByS1t/fNk9Eb9s2gdAvpLAICk2nB7l3p8=
X-Google-Smtp-Source: AGHT+IGcSW6YjVx2WoyiEZV2vm8/F8YAbla7uK0FkCvrxBbSwJQKhh3paZslTk5YzeC3tYo10mtLDw==
X-Received: by 2002:a05:6402:1c07:b0:56e:2d0a:b9f6 with SMTP id ck7-20020a0564021c0700b0056e2d0ab9f6mr891890edb.14.1712299595023;
        Thu, 04 Apr 2024 23:46:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id en16-20020a056402529000b0056e310e6655sm278888edb.68.2024.04.04.23.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:46:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] ARM: dts: aspeed: drop unused ref_voltage ADC property
Date: Fri,  5 Apr 2024 08:46:24 +0200
Message-Id: <20240405064624.18997-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
References: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
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

Changes in v2:
1. None
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 1 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts | 2 --
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 2 --
 3 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 7b540880cef9..3c8925034a8c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -813,7 +813,6 @@ bmc_ast2600_cpu: temperature-sensor@35 {
 };
 
 &adc0 {
-	ref_voltage = <2500>;
 	status = "okay";
 
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
index 9a6757dd203f..998598c15fd0 100644
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
index 1bd555a6c3ba..b4d003cbae8b 100644
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

