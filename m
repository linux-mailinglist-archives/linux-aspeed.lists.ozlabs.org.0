Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6E80E53D
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H0tuO9F+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9r66F6Jz3cCM
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H0tuO9F+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qk4XyFz3byP
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:26 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c629a9fe79so2846526a12.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367664; x=1702972464; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CxPkHqq/wIZgg9po5jZpP4pYsbg0yHu6jwPoFMsG+o=;
        b=H0tuO9F+koutuP4pQkX+nJCBSuMuAB6B8zqMXKtLwph/e21LAVZiFNgAlLevvv8pzL
         fviBdutX4T0dRpVZCtcC5kO+pNUQq4iO6u5ib3UvJHrbXCrdAknxMfzO7QMToDydmjbG
         S9Fh18W+k/bSTmB06fI1yQYPmtjSWKstTJymirtD2WFurUF1JCTSaO9OllnE+X7ITP3h
         azrJknQfnW9YrUjJKRQB7BlYKSC0Q6a9FUFkIPYr0sGGjNycVv0DPhgMtx0+qHxEmUGD
         nhPNmxUeSd3pUGLqZNFaYVWmGcfUXtIb6Vlm0bPS3vzxYyklVAGpFQeGZPAsoeFR4KM8
         20Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367664; x=1702972464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CxPkHqq/wIZgg9po5jZpP4pYsbg0yHu6jwPoFMsG+o=;
        b=Wz5S64Z5zICVDFULAxEdfKF8w3LphyInDG6x1cWwoMURFqMLUzSKgVo3U4lJxQRzz5
         IUIhEPQkvKODLImE6WIB6zI+t5Q2T9C4b5Dm3UJXDUNcLwIoKIe6JdveNg26P4FGQvha
         VJmifzPxgZ+5GFrh/MlkV/TCTnMxN+w5yDTrQHRPtsiebda7V2RDTTPujlDXShUZAlz8
         begd/R9U9HW2YMNDWp4o02DDzTAZiqxcbiAlTGuJaOcxGtcOneclCQ3yarlMgXw1QJD4
         /AWXo6L3iglbN6oN+B7tPPT2YJUFnQGO6hCwVOMCqW162dBsiTCz2kgXHr063TJPo2PS
         jClw==
X-Gm-Message-State: AOJu0YzFwOR58NE/YwAuNSPUqLQfbA3QxLYkRqnbnw5Q1nkXQiy2YQRz
	UAVGB9jaAnHUp55LxzNiipA=
X-Google-Smtp-Source: AGHT+IFi4xuDx0PvSb/d3AgUnK4w3nM3LRouAPjCbYv0D1Jskx3o4X4NAUyzv6KHPzZQShn1BJPXxw==
X-Received: by 2002:a17:90b:118d:b0:28a:2fd5:be04 with SMTP id gk13-20020a17090b118d00b0028a2fd5be04mr2365085pjb.96.1702367664023;
        Mon, 11 Dec 2023 23:54:24 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:23 -0800 (PST)
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
Subject: [PATCH 07/11] ARM: dts: aspeed: minerva: add bus labels and aliases
Date: Tue, 12 Dec 2023 15:51:56 +0800
Message-Id: <20231212075200.983536-8-yangchen.openbmc@gmail.com>
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

Add bus labels and aliases for the fan control board.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index f2a48033ac5c..f4cb5ef72310 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -12,6 +12,16 @@ / {
 
 	aliases {
 		serial5 = &uart5;
+		/*
+		 * PCA9548 (2-0077) provides 8 channels connecting to
+		 * 6 pcs of FCB (Fan Controller Board).
+		 */
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
 	};
 
 	chosen {
@@ -139,7 +149,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;
 
-		i2c@0 {
+		imux16: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -150,7 +160,7 @@ eeprom@50 {
 			};
 		};
 
-		i2c@1 {
+		imux17: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
@@ -161,7 +171,7 @@ eeprom@50 {
 			};
 		};
 
-		i2c@2 {
+		imux18: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
@@ -172,7 +182,7 @@ eeprom@50 {
 			};
 		};
 
-		i2c@3 {
+		imux19: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
@@ -183,7 +193,7 @@ eeprom@50 {
 			};
 		};
 
-		i2c@4 {
+		imux20: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -194,7 +204,7 @@ eeprom@50 {
 			};
 		};
 
-		i2c@5 {
+		imux21: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
-- 
2.34.1

