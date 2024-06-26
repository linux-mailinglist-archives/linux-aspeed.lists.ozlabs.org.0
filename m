Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4702B9181AD
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B7Gp84He;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQd5fqTz3cZ1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B7Gp84He;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQC6DwMz3cX7
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:55 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f65a3abd01so54008635ad.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407155; x=1720011955; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV2dcDDnQmUqF9lNzCGX3CGaBRrLRWxvY3uAb50Y988=;
        b=B7Gp84HeLFZspsMCQ7i5ROvdzOr4sf+7hAIZOotDOwjA4U+lX6VMgtNj9XtouoZ54R
         io8lUTYQtAYabkXbVQaccXjJ4swd4dA/UMbUYh41BPxdsTGSwl6X2vbN8hhBwhZyvH9G
         zobX5gs86ewovipAuWD95D46HSKeYb/EKEh/y6GtO2T4/GNTXtSF7bPshzHlOvA+WFb7
         3ru+ImmlWudpEXkyqOac+RM+YH0Xuts5rKb/r/hSKxZP0usq11U1uP29a6xkTjij+FsH
         WLx8Rf/n06pp0AE7rAQWfZwjS/BScc6O6rZX2Ej2vPc17hpUPgJKNFGqayOg5Y02JzFV
         GejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407155; x=1720011955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV2dcDDnQmUqF9lNzCGX3CGaBRrLRWxvY3uAb50Y988=;
        b=DNqGiKTfT4Mq8czZVHCayQsIj/MYXjxQIfNmqqll04rXb9BWWwA4xINKZBePYOpAQk
         B7pLh9mypEJmN/KDzeEVVCm2Bi14fgl0i2t/9aG3VWnVjAJb/mrWqbwfrDNxUMalVtvR
         s1oFD50nSwWvJUTZJTr0Y7AH3qnvM4RZozUcbS6XPT4GUcOwcyV19I1+hyAeoH76vwAQ
         lRxHtU/UK1y47+DX6sTOF8LMlhslOUp6qOz5uAVcrsU2r1foN8yVL5QJNM17mGn2vsKT
         w9n6qQGmfexti5h/hJu0rzlg55LlfRUQ3WWjGcm+SPDMaFqP7FFf5XAXj+/dKaKLp0lQ
         8QXg==
X-Forwarded-Encrypted: i=1; AJvYcCVkS4DMcFzqr/JSh3Tel+zPck55J0vryhM6zbLbC8aDF5UXHCqVxBhNffo9Mch5q16Am7dYHrlTwDONr8Pt9BRXWDR0B9PA19295liXHQ==
X-Gm-Message-State: AOJu0Yz+TAAAYjkgGXaHSVqz8efsxro+Zhr17ASg3n+bOjeND5Zoyvno
	EJPscOvWXVY/y6nUOknLFUp0v0xxfTeYPS4dmbGvVO01JYOWlZKd
X-Google-Smtp-Source: AGHT+IFKyKanqJegFloDMjHf3mrlG0KpLvhC+Rc/rVahResBIQAyJt4ZieC+JHHGb5NG5e5vfa/y9w==
X-Received: by 2002:a17:902:ce90:b0:1f7:1706:2596 with SMTP id d9443c01a7336-1fa23f4a1d7mr138232585ad.67.1719407154441;
        Wed, 26 Jun 2024 06:05:54 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:54 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 07/17] ARM: dts: aspeed: minerva: Define the LEDs node name
Date: Wed, 26 Jun 2024 21:03:22 +0800
Message-Id: <20240626130332.929534-8-yangchen.openbmc@gmail.com>
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

Define the LEDs node name.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index bc323bfbe514..dfea0025e6ce 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -44,11 +44,35 @@ iio-hwmon {
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
 };
 
-- 
2.34.1

