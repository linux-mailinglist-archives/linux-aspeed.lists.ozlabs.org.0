Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1891677E
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQ9zCGUE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kSx5bdWz3dBx
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQ9zCGUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSf2gHkz3dng
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:50 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7067a2e9607so2036689b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318048; x=1719922848; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrtPbGSmykS0cLt2ThwHws1Euel48gln1tDvUnq/Z9E=;
        b=fQ9zCGUEJJcrWueCdmiuUEpLW70zMDkuhzGHOhqJ6++XS/CKA5Xgclu12XT8Ug4VkH
         IF69PjZB0J4dxq/8jQVfAQbPWgH33ldIVUoHeJ2t1Lg63N4cQajgX10wvyaEzxFLHFI0
         Z2R8ZBygm3B9l2SCSbcYksL82N5iYsUppSbVno376CylaOjT54DTLAMRLSC75nLxzdq8
         FQc+85zRfTiDbLRLB3hW6K1yQAuLqqGZw8DvT2flGhBNAiG+G2IomRSkMHe2judnpCLZ
         uk3Q+0bvjAUibUQglkOPwUFtxWKd/JbVJV9vaofF6+E8EDZJ8RusV4yV0B/4IL6WVgCW
         A9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318048; x=1719922848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrtPbGSmykS0cLt2ThwHws1Euel48gln1tDvUnq/Z9E=;
        b=jNdpwmMxZ2hXO6fDVSkTSA44yB5rm4rLhhuilBnGFKc+I9UhmAugZOoEVNAYCYFGPC
         Jfwjyu6eDJh6ok328XQpXJdUJbEtRl5FeIR6gwT4diOnC7460Udx9DO1zcGrQ9byvC0T
         QHpI8JIIrYOQJPm7HBv9HVJwSZx6msmGZ3+hh5sXdLqLq665ytCZsUY0FJKUcmINsIS+
         1Jxm0T584gpk+yceyQGqir86xijg0wAY15NRnXVnIyzgbLMexj0vX9r5Z9qEk6AotF8A
         gFtTFA2rCkCXfqQasaCn3JWcYd7GPQh9gmVdXBCjO8vZNRiErO/tqjzsi7+4tQ47yb1r
         keCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp3nStZmSGHSzwGmYWJNaXrVxcDZSfC/88eo+x7oLaVK3+ngceEBHVsUyVBEia/Vew6YK/bn7sZ8PXoQEmz/P02u+X43bKfX93dd5seQ==
X-Gm-Message-State: AOJu0Yx4ZwA+iPWNyHfj+vxzGrBsqwrrZiiOc2hdfaVkQOlAAou+gb5t
	jPfAyIIR7SLhifB2KIECn3qX+rMhqgtfjYAtWtcm6yyD/B6VRu8F
X-Google-Smtp-Source: AGHT+IGzdeIjPSg2rWQ5ZEg4nniQMEMPO1e67nua4W+EJWyUQjrWionEjpF79ZppKBT76By0UdnM3A==
X-Received: by 2002:aa7:990e:0:b0:705:9748:7bb8 with SMTP id d2e1a72fcca58-70671034a55mr8085919b3a.29.1719318048019;
        Tue, 25 Jun 2024 05:20:48 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:47 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 04/17] ARM: dts: aspeed: minerva: add eeprom on i2c bus
Date: Tue, 25 Jun 2024 20:18:22 +0800
Message-Id: <20240625121835.751013-5-yangchen.openbmc@gmail.com>
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

Add eeprom on the i2c-9 address 0x50 and i2c-15 address 0x56.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index b0643d1d549b..19f609cfd026 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -324,6 +324,11 @@ &i2c8 {
 
 &i2c9 {
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
 };
 
 &i2c10 {
@@ -360,6 +365,11 @@ eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
 	};
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
 };
 
 &adc0 {
-- 
2.34.1

