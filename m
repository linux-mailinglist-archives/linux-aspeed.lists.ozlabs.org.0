Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3C9181AE
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NQI+Z6eA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQk0Jjsz3ckk
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NQI+Z6eA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQG1yxKz3cXt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:58 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f9ffd24262so35487245ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407158; x=1720011958; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdGXb9xaxS+at5MNG5psiNQJLwy+4zAvvWhthDyzcbA=;
        b=NQI+Z6eASaArdPPZDDZ+SyXqUaJhMii/EgXlAYfoJAozInW7mHH//Bf4CzFARBfHjP
         L9WCC5YIl4Dn4rUZomd+BAWKCenXQBRZbIKu+bbIfrNTT1cCfVHc0xh4YzTglgLsE6Li
         zjZ40fxrFDkcOPPowzd/k8MXtm/0DOWQGAbsyaQiWQsWe9nFkLjHD8rdxrEG2lgwZJL2
         +H8rCDXOVOVA4LYG9t4xdrfH9F79unbF+5MMe96gDcqMFw+e1xS7LlkhaWLfnn6rE9ac
         3wckpf0sBJB6WqUQN+SOa0DlSqCvUg1iV0fsqNUxn/+6ad58k9+2mzteOilZCdAlIVKk
         Co6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407158; x=1720011958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdGXb9xaxS+at5MNG5psiNQJLwy+4zAvvWhthDyzcbA=;
        b=txvfeuUWNJsd/0i+DZzC2m5X/mnc5mWRBzzpb1EZ1yN0taN7sKPOHDJ8Uuv1evTGB7
         XRdskuGlciRprW/43yDkc9plYu5ysMB4BILkTL7NU+4C+ml5/snodfx0Osy0maUfVTz0
         O6qMsMmZV7+QvfkycJCyF+jkGRkz3NfOJ3fFF+wMOsF6pPLHzJvNt3L+PsnF2KX7uQa1
         23fJQADegd23s5TgIfonQkd9Ffrg9L+6t1BM9/sbyK1VTIdK25L1rogORYYBnTaGx32e
         A7ht9OpzhW0TUrvARBVgiYQKPPhxNc0AcGD6xmmSJyZfylY27KV4ELighoIN9+15hOvd
         3QvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXIrGt9cUhXKH/LtTlyodHxpwgYTnwb7qzg2hK1vPjBAGSKYPbj8Bm9oqnZZxFwJanlyEE1U9loPesmtRdXJjaBdv/uldkJQqvBQVcEA==
X-Gm-Message-State: AOJu0YzbmJdy4XfrR9iywwBV4/VTxGNjG4K99t1Nd+iih8iLkWyhYcyu
	MQCBNdcRwlkjd3dJSvFddsoScac5huFfC36Ug7ZX2GxnVdB6pnGj
X-Google-Smtp-Source: AGHT+IEaWb9bMQzZFOYWTqIbH1czxKQEGH++hJttO+WxTvjO0VFAW9LCdcw7pQbK9MTllDpAV0DpYQ==
X-Received: by 2002:a17:902:ea08:b0:1f9:d551:c848 with SMTP id d9443c01a7336-1fa240e74a8mr105800835ad.53.1719407157649;
        Wed, 26 Jun 2024 06:05:57 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:57 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 08/17] ARM: dts: aspeed: minerva: Add adc sensors for fan board
Date: Wed, 26 Jun 2024 21:03:23 +0800
Message-Id: <20240626130332.929534-9-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Add ina238 support to read the sensors in front of fans.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index dfea0025e6ce..86d319d7edcd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -207,6 +207,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux17: i2c@1 {
@@ -225,6 +249,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux18: i2c@2 {
@@ -243,6 +291,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux19: i2c@3 {
@@ -261,6 +333,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux20: i2c@4 {
@@ -279,6 +375,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 
 		imux21: i2c@5 {
@@ -297,6 +417,30 @@ pwm@5e{
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
+			power-sensor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina238";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-sensor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 		};
 	};
 };
-- 
2.34.1

