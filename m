Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 784EA6170C2
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 23:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2hZH2lcgz3c2j
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 09:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ogx+ovNo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ogx+ovNo;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2hZ71kc9z2xjr
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 09:36:13 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id b21so202571plc.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 15:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=asm9P2XWCiMn4Vml+HfqmeJ9Equ9Ftejm36QD1NxLfk=;
        b=Ogx+ovNo3m6QYt25heGGrophhpPrSU/hM1qrG2ZXat8H2b1CelNLQJ++X8wfjdJWrg
         ykoGUchkDJuKmxDJ3RNEktphd09n1pGRqAdLFXhMiQ+Z09QdRPBJazLXLAEEhrko6A2r
         J7DSQXQv9YyNNJvH8krAkNUZUaWyIoNPpxHcJLggARUMbAtXFR+T6PlgNX2hWOFMvdw4
         MxgaVoxTaWFDIsrYFkRCgcf/sYiK+jVlfsWD5neQtAqqbAaFE/dP/5kMFxPTdzx3L9Vm
         sz19h5M0gXimjJSL/XY+c8IbtSHvkHHXxAn+Yi+0PkTvwATu/69olmsjJthEDihlcrG+
         7pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asm9P2XWCiMn4Vml+HfqmeJ9Equ9Ftejm36QD1NxLfk=;
        b=Icx9RNDQSk8d7+83jk8tPZ+EenAoQvxR4lgFbxZ4XruS6QmKmrQ2mNol7d+NgotWcd
         0y31E+Exc9DKQwRPPMaur/m3DDjb3vv6YZxGd8fjAGEgweKqPud2a8L+bNlTrOcwhhMa
         6FpNQVkO3U8natXk+ntzEUTqcpWQXlJsATqxMJDHHEMBqbAHTwadnUkMtGABjfH02UjC
         QfTCgAiQJkzWrt8HoH2EKP0f+LWeWgQKsCqnOkfCGPu+VvbKFpmUQQvDlKmIM8CHdJoi
         sKxJYQGoi3BN+HOu2mwLhMjzKwVfNMVVJNGRiYyT6cZ8soDX+Xgss3SjSWohmJuzOiLJ
         WGSA==
X-Gm-Message-State: ACrzQf2B/cxQ+XkCghJQTYu6wBZDU2YCA75cLJcWu+Ll/TepTA0lRj6g
	ScdiCQX8p0eG4AchsSUg0fFqYq6yoyg=
X-Google-Smtp-Source: AMsMyM5W061wByaviVk7pjg2O41hBR/HQDAb/69JoRcj9Tuv9AKMR8HHMCypfdiVv2DeafGPv4stKA==
X-Received: by 2002:a17:902:7101:b0:180:202c:ad77 with SMTP id a1-20020a170902710100b00180202cad77mr28075680pll.47.1667428569952;
        Wed, 02 Nov 2022 15:36:09 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id r11-20020aa7988b000000b0056babe4fb8asm8927241pfl.49.2022.11.02.15.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 15:36:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: rainier: Fix pca9551 nodes
Date: Thu,  3 Nov 2022 09:05:54 +1030
Message-Id: <20221102223554.1738642-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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

From: Santosh Puranik <santosh.puranik@in.ibm.com>

The pca9551 compatible LED drivers are under the pca9546 mux
on Rainier pass > 1. On pass 1, they are directly connected to
the aspeed i2c.

Signed-off-by: Santosh Puranik <santosh.puranik@in.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 208 +++++++++----------
 1 file changed, 104 insertions(+), 104 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 24c1f698275d..05d856856844 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1018,32 +1018,6 @@ tmp275@4a {
 		reg = <0x4a>;
 	};
 
-	pca9551@60 {
-		compatible = "nxp,pca9551";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		led@0 {
-			label = "cablecard0-cxp-top";
-			reg = <0>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-
-		led@1 {
-			label = "cablecard0-cxp-bot";
-			reg = <1>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-	};
-
 	pca9546@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
@@ -1061,6 +1035,32 @@ eeprom@50 {
 				compatible = "atmel,24c64";
 				reg = <0x50>;
 			};
+
+			pca9551@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard0-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard0-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
 		};
 
 		i2c4mux0chn1: i2c@1 {
@@ -1100,58 +1100,6 @@ tmp275@49 {
 		reg = <0x49>;
 	};
 
-	pca9551@60 {
-		compatible = "nxp,pca9551";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		led@0 {
-			label = "cablecard3-cxp-top";
-			reg = <0>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-
-		led@1 {
-			label = "cablecard3-cxp-bot";
-			reg = <1>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-	};
-
-	pca9551@61 {
-		compatible = "nxp,pca9551";
-		reg = <0x61>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		led@0 {
-			label = "cablecard4-cxp-top";
-			reg = <0>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-
-		led@1 {
-			label = "cablecard4-cxp-bot";
-			reg = <1>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-	};
-
 	pca9546@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
@@ -1169,6 +1117,32 @@ eeprom@50 {
 				compatible = "atmel,24c64";
 				reg = <0x50>;
 			};
+
+			pca9551@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard3-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard3-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
 		};
 
 		i2c5mux0chn1: i2c@1 {
@@ -1180,6 +1154,32 @@ eeprom@51 {
 				compatible = "atmel,24c64";
 				reg = <0x51>;
 			};
+
+			pca9551@61 {
+				compatible = "nxp,pca9551";
+				reg = <0x61>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard4-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard4-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
 		};
 	};
 };
@@ -2032,32 +2032,6 @@ tmp275@49 {
 		reg = <0x49>;
 	};
 
-	pca9551@60 {
-		compatible = "nxp,pca9551";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		led@0 {
-			label = "cablecard10-cxp-top";
-			reg = <0>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-
-		led@1 {
-			label = "cablecard10-cxp-bot";
-			reg = <1>;
-			retain-state-shutdown;
-			default-state = "keep";
-			type = <PCA955X_TYPE_LED>;
-		};
-	};
-
 	pca9546@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
@@ -2075,6 +2049,32 @@ eeprom@50 {
 				compatible = "atmel,24c64";
 				reg = <0x50>;
 			};
+
+			pca9551@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "cablecard10-cxp-top";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "cablecard10-cxp-bot";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
 		};
 
 		i2c11mux0chn1: i2c@1 {
-- 
2.35.1

