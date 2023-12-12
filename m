Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C542E80E540
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOFx03Xq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9rC2G0Kz30MD
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOFx03Xq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qn1r3kz3c4h
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:29 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ceb2501f1bso4381625b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367666; x=1702972466; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR87eIuDn9C0HsT6AC1CHUaEI+JGnco8C87tfDzAy1Q=;
        b=gOFx03XqfLqHBIM7p1wDmNcLmMdH6LvoRsqlSUW7wtOuQZ4aIJrE08UAy4UfG/kRh8
         V8zx1J59RCiB+6yK+2KQk1nXmoL0vlJ/KasJnGfJXtipt0DZmivfl/cIjJZUPUlmOtPM
         +F6JJSdS8jUoz0Y7NevTU7P0G0zgwe7TCdXFHnfv8C+dEtlk0AqFqVsazlg9RP8nPgE3
         3uoeUc1acEIuvu3z99/JaF5NM4ZxnI1jvjDXR9+BG+e8QeH1Ct4axz5sqTe3c7+mZcUd
         +pk0+JDRIIzMie/5wLldbi4j0u+mpuyvFdB6LWILAPeXDAJaB9tu/eJ/dANzY6UPhPYp
         Bg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367666; x=1702972466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR87eIuDn9C0HsT6AC1CHUaEI+JGnco8C87tfDzAy1Q=;
        b=sxbBThLdKxZ4uR/phZ6aas/pBG1ds7Qu10vHVeqbpErvwdKjoEPAOArJTBzRZE40a7
         sG3hBRVJeSPPED7Li8fhDif4OtbUdDAs/Y1+/1984XxMV49CQS2RXCkqzNfJCxHwbCmZ
         1F3abr389vYz2Omx9m1mvoZ1EvXfQonGnkxWJtn2NSzq3DoicuLmd9XYzA5frzqk4kRX
         nCzEplTo8r9sHzc8xUSIufBdQhYy8g+QY9JlpN5jZJv1PKhQen4ooNgH22LZRLFfvhMW
         G49wWFdfCL1eW8fGnsdhURvC5lwKsn+Tx+iu5zz7sMPBGmr7IuOAoRnoWoeFlKwbEiFd
         rglQ==
X-Gm-Message-State: AOJu0Yx1/9u4k/xkSpbnNRGz9OV+zr6Ie2B5xxQTDON/0ftNT0FsFJNz
	l57s8e9iu+i2ksAA8BR94yw=
X-Google-Smtp-Source: AGHT+IFfyvBm3LnqNo7atzJ1xVUp4Yr9OqqLlbZGbP/nazODJ02yLWDVkfZj65sI030MwL8J6JU4fQ==
X-Received: by 2002:a05:6a20:3d08:b0:18f:97c:9766 with SMTP id y8-20020a056a203d0800b0018f097c9766mr8171271pzi.78.1702367666749;
        Mon, 11 Dec 2023 23:54:26 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:26 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] ARM: dts: aspeed: minerva: add fan rpm controller
Date: Tue, 12 Dec 2023 15:51:57 +0800
Message-Id: <20231212075200.983536-9-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add fan rpm controller max31790 on all bus of FCB.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index f4cb5ef72310..c7445c819baf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -158,6 +158,13 @@ eeprom@50 {
 				compatible = "atmel,24c128";
 				reg = <0x50>;
 			};
+
+			pwm@5e{
+				compatible = "max31790";
+				reg = <0x5e>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		imux17: i2c@1 {
@@ -169,6 +176,13 @@ eeprom@50 {
 				compatible = "atmel,24c128";
 				reg = <0x50>;
 			};
+
+			pwm@5e{
+				compatible = "max31790";
+				reg = <0x5e>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		imux18: i2c@2 {
@@ -180,6 +194,13 @@ eeprom@50 {
 				compatible = "atmel,24c128";
 				reg = <0x50>;
 			};
+
+			pwm@5e{
+				compatible = "max31790";
+				reg = <0x5e>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		imux19: i2c@3 {
@@ -191,6 +212,13 @@ eeprom@50 {
 				compatible = "atmel,24c128";
 				reg = <0x50>;
 			};
+
+			pwm@5e{
+				compatible = "max31790";
+				reg = <0x5e>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		imux20: i2c@4 {
@@ -202,6 +230,13 @@ eeprom@50 {
 				compatible = "atmel,24c128";
 				reg = <0x50>;
 			};
+
+			pwm@5e{
+				compatible = "max31790";
+				reg = <0x5e>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		imux21: i2c@5 {
@@ -213,6 +248,13 @@ eeprom@50 {
 				compatible = "atmel,24c128";
 				reg = <0x50>;
 			};
+
+			pwm@5e{
+				compatible = "max31790";
+				reg = <0x5e>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 	};
 };
-- 
2.34.1

