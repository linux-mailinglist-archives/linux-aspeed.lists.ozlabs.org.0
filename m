Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3A91678B
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hb+rw1K0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTd4NzCz3dTf
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hb+rw1K0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSz2wXhz3dWb
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:21:07 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-70024655285so3199424a34.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318065; x=1719922865; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWdNsyhmh0vXBB+FB8HVJv+VLwSHu6Zd+4+7Sq4/Gys=;
        b=Hb+rw1K0hchJteKZKOu56HeCPWd6elzbo0Lf2uTt2y/l479NxXWnj0UHMYJlIquH1O
         zUcGu8l8+FxCiEu/5//YT4FJ690zWWMwMUJn76hcZEF3zZRea7SJK/1Ckp6XY9M6dqzU
         Ia5t3jLd+5F9Ay+ywCQioL/XriBCcFPtNUS6XUwGKg1VO0MkgBkQMlFvghqI9Ob+X3o2
         V5GVmAVKiNhGAlboOTZe64aVskz9rMcamvJI5HSiGmDzslUGUmj3nrqck5MT0cF30TTc
         mDM9s4UlEdcLE90uWGbJis0MnKpPpbN+LeWfFxlnA0MLb9nOq4AtAubLd+TIQ5kofUCf
         voCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318065; x=1719922865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWdNsyhmh0vXBB+FB8HVJv+VLwSHu6Zd+4+7Sq4/Gys=;
        b=T0L9ly6dakju0Wnu6s40u9TOcTFKUea6o7MRcNFcrbjnRgXdH1UIeEYlqWKXliNWYb
         ma8jqbDMN6BwM3JYpJx+vNtoZeYXSOIwWdozAfCK4LMRSBWqL4gSTxau7atWsUqulj5c
         KOdyNgJB1HMIKsRZxIXzE3YwgwNtvUYyi5QbkTh4rugDuZrBCjMLB1cgSp9RMsx90DFn
         mYgHk3qZTnISey1YcJSDTR13R1F7LaTJkRyZzTtvVEpJkIV9PrVpK7ffBepA+1g3Pj4E
         jWHKMOUHAHFrtp1qjX0cx58WixwaBhh02EDT0EqYwPIvMQRWwgCwcH30D53dSxos+dBG
         BJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5OhgUxct+m0kvtMARFTMvFv53tVsLNfc07DxMzbdfdu8jjEbaixEwmo+gvcII+s/7DEzO/Wb0Y0rmrDE6B76wPSttx7kEFYG2iXLncw==
X-Gm-Message-State: AOJu0Yx2JMQDxiZ2bnydjrnNGgf5QUdopJdA4fD1mCeTc0SUrW2KjsnX
	tz2UMx7SQmwxIjhz6tHrjk5OoAUucGbB4Iolhcri5xQdXdR+Vvxy
X-Google-Smtp-Source: AGHT+IGEFlDZVv53UK/DWcjhJ5G3xA9To81EmBORmmF3gelkm71OH5zcWSvbKLKm5WYPYDqrvKMvbQ==
X-Received: by 2002:a05:6870:4208:b0:25a:6d14:f84a with SMTP id 586e51a60fabf-25d06e37917mr7520760fac.42.1719318065571;
        Tue, 25 Jun 2024 05:21:05 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:21:05 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 12/17] ARM: dts: aspeed: minerva: add tmp75 sensor
Date: Tue, 25 Jun 2024 20:18:30 +0800
Message-Id: <20240625121835.751013-13-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
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
index 830616663387..7f6df8750953 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -252,6 +252,11 @@ power-sensor@45 {
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
@@ -294,6 +299,11 @@ power-sensor@45 {
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
@@ -336,6 +346,11 @@ power-sensor@45 {
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
@@ -378,6 +393,11 @@ power-sensor@45 {
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
@@ -420,6 +440,10 @@ power-sensor@45 {
 				reg = <0x45>;
 				shunt-resistor = <1000>;
 			};
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
 		};
 
 		imux21: i2c@5 {
@@ -462,6 +486,10 @@ power-sensor@45 {
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

