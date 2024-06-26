Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F1C9181B4
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nR9xW0AU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQz0HpCz3cZC
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nR9xW0AU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQN6zv6z3cYf
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:04 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fa9ecfb321so2099085ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407164; x=1720011964; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhXK344Q+BpjbqsqUSHdDG5MpVvT/P130hkel56cMb8=;
        b=nR9xW0AUa9hmkzHplf+jpDgeHGELH4hbFp+HwI6P0ZEyui0Fjb8/E113rgbwyoqGgj
         TEv6UNX6Pv8W7TM/N4XgJANxXF0AGJ0KYFLlsX8Pmxs4co+O6X62rxJqHYJ9zxMvQfj+
         c7FtoMZy6qCK1AWH140Dum+YieYJESKZvrvVwlE3La3R5eu4iG2aQZkRDK2Tyd1Bm6SO
         ZLpdnNb0ZNhmQV0/7BwAE/6asGGD457meYK7iDdHNNCHOzSLBTYM/+2+xiMKCc+RKIHZ
         g/bTqDDpr70Aqw5nuAoWHfhSzdwCFnFzQiga9eGGJDVid1IIX6Ky6vJi/8g+rNdxUALN
         4s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407164; x=1720011964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhXK344Q+BpjbqsqUSHdDG5MpVvT/P130hkel56cMb8=;
        b=SHrPXpXbADuLI/V/0P4h6JaaMa8BF4SLMOVJprJkrzVznlmYoD5f11aiGarrQ8PnUA
         w9m+cdbtz4Qc07VJYvg5KTw+UtiLV/baC22vR3q1EwDZZNqxZt9D78rL6xLUG8g21eM6
         Y1o4cdFkX/RUVdpwqiQZUdJ8cgHPVPgpOYTbhJ1UZxmlihtVZq7VdeQpSVAAPYKfaKkV
         Em01fMcN84Y6MZ5rcsqJJjTLClXsP/Fdo7Ba5B3mFnpR1b9tVwsLp83vIb+GTsVg1qcL
         FroQuX4ulELdxtIBi5txZkvumdbDI04RP4Yd8SYtT0UE/ByY/OKwdh89zdCi7br8z2tQ
         50Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWRE28A/bKFgOUvTzXsbCUKNypo0fj4hYdL7rlAaFG+Ww7vjMaRLyaDBgG3VdygBWPyztRj5jyMriVNCh/nqtgNAMhQSXb5L8zRy1O6fQ==
X-Gm-Message-State: AOJu0YzWoaK9NgbiSy5l31eXXMASU4mHqY9FmLT5gsMdh0ChoWei8DGd
	Gmr+EQ97OqhZEkHQgML/pcrmM74KGwOdDjgYGnT6OTFj/a+vMg+B
X-Google-Smtp-Source: AGHT+IEKpsmL1kM064iGPqVHITvzDtrUyCPao6Q5sZbn4k7xg/3YMH0t1b3telcRyOckfqAAkEa0OQ==
X-Received: by 2002:a17:903:2290:b0:1f8:393e:8b8c with SMTP id d9443c01a7336-1fa1d683c9dmr110656935ad.60.1719407164447;
        Wed, 26 Jun 2024 06:06:04 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:04 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 11/17] ARM: dts: aspeed: minerva: add tmp75 sensor
Date: Wed, 26 Jun 2024 21:03:26 +0800
Message-Id: <20240626130332.929534-12-yangchen.openbmc@gmail.com>
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

Add tmp75 sensor on the i2c bus connect to each fan board.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index fd769578f826..3d80993885b7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -231,6 +231,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux17: i2c@1 {
@@ -273,6 +278,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux18: i2c@2 {
@@ -315,6 +325,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux19: i2c@3 {
@@ -357,6 +372,11 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux20: i2c@4 {
@@ -399,6 +419,10 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux21: i2c@5 {
@@ -441,6 +465,10 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 	};
 };
-- 
2.34.1

