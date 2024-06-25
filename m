Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED3916787
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C84gJKa7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTN029zz3dX8
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C84gJKa7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSq3vmpz3dXQ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:59 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70685ab8fb1so1646411b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318059; x=1719922859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn92Ddq0IvoImB657oaMQiSF86tgeTAhup9iBLRfd7s=;
        b=C84gJKa7T8LX+Ig/CG048Hee+xFhtILEnW9S53Q/X6ATpwgo6lOtwlb1wEy1IvUkU7
         /rs/0MfL5zKLdTmOhTClqvj8wwRX1Mb98oCVhhjal8ypUYae2+brjBeByCBA6UXJVODT
         5CqPKOQWegCcVhRzk5pmAqVNtPTmcWIaj2Jki37KPSBrkHpzXnqOS1+BqFwOhsb8rMIg
         dO9+KNAIeAuh1zd82rJc8HngHv0ZO48fmXITevz2YAm80nPiLQ26FsvVBJIKGmB/lr0k
         owktFoP5bYZdOrzYrGK5PHteIJaGyefKjQ4fpzCzMHhPbjCbtgOqN9j9qhkSondJHp+x
         js3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318059; x=1719922859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn92Ddq0IvoImB657oaMQiSF86tgeTAhup9iBLRfd7s=;
        b=jC1pdsEshBpBWZqf0WvMgjxfdimU9CRO6P2CP2JHfvPCf34V/RZ7YYssA/GVrKUw3+
         DVtJosI8e0VYrchwzPZN2InBvFlFmeAM68ro7ZdOCEAepp1D6/Tg/skTyceoVFLljU3R
         gXFLrpWEhYuIL63P2C77EH33j/vs3MH0V6w4IJ+zK1KTV5G+9UEI6V51svV2UE9g224S
         3tReuvMdwjgaKHkQiVyeY0KnybQhugXhlnYEX7NJ4kStfV5wl8PiHsz+Wv/VG0YZAcGQ
         EV/7xMJIGDr67gLS9Wxnnv9mETlSQ2M7sqyljYzIdW74WB+VjxRZk6/iEcUbkQwIznTf
         psIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6B5EADeGHTKVbGOGwe/k7PFn8hJLsZZe8AIsdDxIf06DtdvP8SWKh76aXTp5+4Jvq3z3XuFfd9/91IxkGgqwebMsWXUFX1gQLxaHU+g==
X-Gm-Message-State: AOJu0YxmPfRfF4pIZDzSH+tFAqp+EF885NtTgCEGwgmmC41ogZ7NSIpm
	GLNUwudm3VqYb/pMGAsBXO2d7F+z1fMV0rJJiRjaP7OMIgI3XAAQ
X-Google-Smtp-Source: AGHT+IEm2L4+wB8BjdmsEdQwOKUL69wYUftO7+oTnX3eqEeV5rpyfma1fPEq0sib2QsRvoiUGVKdIg==
X-Received: by 2002:a05:6a00:2da0:b0:706:1edc:79af with SMTP id d2e1a72fcca58-706746b8ff7mr7886885b3a.22.1719318058945;
        Tue, 25 Jun 2024 05:20:58 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:58 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 09/17] ARM: dts: aspeed: minerva: Add adc sensors for fan board
Date: Tue, 25 Jun 2024 20:18:27 +0800
Message-Id: <20240625121835.751013-10-yangchen.openbmc@gmail.com>
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

Add ina238 support to read the sensors in front of fans.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index bea389d1e90b..60beda2737a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -228,6 +228,30 @@ pwm@5e{
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
@@ -246,6 +270,30 @@ pwm@5e{
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
@@ -264,6 +312,30 @@ pwm@5e{
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
@@ -282,6 +354,30 @@ pwm@5e{
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
@@ -300,6 +396,30 @@ pwm@5e{
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
@@ -318,6 +438,30 @@ pwm@5e{
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

