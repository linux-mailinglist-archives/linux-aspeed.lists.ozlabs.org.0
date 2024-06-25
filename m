Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D11916785
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dOrZKenp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTH5pWFz3dBs
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dOrZKenp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSn1krfz3dXW
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:57 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7067435d376so1703838b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318057; x=1719922857; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdBPhx+OovP/ovtJQtq4zDvnsEmSZc35AhCTNpmRrOg=;
        b=dOrZKenphEYEcJh9C5a5VEnTgWFVxLQ+KFa52uiXelotOpHtg35df7Pwh5V8ZBZNP6
         NkH/Zfo8OLH6gdx7hEwWu3dxBIBkRX44DFXWzX1dK8y3sIzgBmSpsD4BvapZ5e6kaTyb
         VMBIiCj0CiOS2IxIf+nHilw/77sJrlOOZJVds2Yue4/DpALZjXvq1GBEu4Uvq9/T+nLy
         LcyIqVEcVvzeWfQPb7Ry/9o+CP7tWTqtUskBkZU97xzEUXuD4CqQUonT4ldDrQnSrpg4
         a7tBHpURDUjegvhv5eGG39PN2d9ih7s0tcWVYHD0KPQgs5RGvjD75usTA6sAQrd2BNTV
         vzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318057; x=1719922857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdBPhx+OovP/ovtJQtq4zDvnsEmSZc35AhCTNpmRrOg=;
        b=xPJrTOekRCbX9d060+WmgomDX0RLHztg7nmxcTaoBdvfORJ79PuHSCAX9YvR/lXcJt
         jk9u0DkGNaF4FDLh3Cf075KgPb6SImK+xolUWcDqRdUjApWnfJizebW1efcwdFLx9q7C
         uCED11Dg4NuEfwDdyUdzf43N3FzhFtg3weSRk0Y/Z6/5qIVI03xrXLdsiJh+NpQsbPWC
         TdTiussTjR1xgBj0kkyYbQuv0vr/P2vThenFutYStbGOHi5dHvBe4TZeB/w8J+NLUziI
         yZUmFINKsVzuFlWpA1bWIz7ssd85Ui64GsheyPZktX6V9dtobbpgAz3aTZjvtDkQpRZD
         iuoA==
X-Forwarded-Encrypted: i=1; AJvYcCXzOQuYzr0HTNY5DNdNfJH8Bmz6hK/Mqaax3aUiQPKJ9CQCS/80M+0YAQgVjSnSh7rQjCrPs6ah7MFG38LOtpJHEgo18HmBqZwMOhz8GQ==
X-Gm-Message-State: AOJu0YwkGVRxCegv2PCmIFXIKKoYBg88rr4FeiXps/Po8GUA1dAQlPPp
	pl/hD0mZV8Vn7H5X5iq1u1reWQr6WjlXqSoNnbor/SFJosxhIueO
X-Google-Smtp-Source: AGHT+IET4IPVYeOD3BB8CFBKQsqIv79DMcHv+zGwNeMOfbYW+uYOV+eps3+r6O3SeM+QR5TKqc6iuQ==
X-Received: by 2002:a05:6a20:5a91:b0:1bc:baef:63c3 with SMTP id adf61e73a8af0-1bcec92bf92mr8939905637.9.1719318056759;
        Tue, 25 Jun 2024 05:20:56 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:56 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 08/17] ARM: dts: aspeed: minerva: Define the LEDs node name
Date: Tue, 25 Jun 2024 20:18:26 +0800
Message-Id: <20240625121835.751013-9-yangchen.openbmc@gmail.com>
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

Define the LEDs node name.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index a80c46c1962d..bea389d1e90b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -46,11 +46,35 @@ iio-hwmon {
 	leds {
 		compatible = "gpio-leds";
 
-		led-fan-fault {
-			label = "led-fan-fault";
+		led-0 {
+			label = "bmc_heartbeat_amber";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "power_blue";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-3 {
+			label = "fan_status_led";
 			gpios = <&leds_gpio 9 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
+
+		led-4 {
+			label = "fan_fault_led_n";
+			gpios = <&leds_gpio 10 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
 	};
 
 	spi_gpio: spi-gpio {
-- 
2.34.1

