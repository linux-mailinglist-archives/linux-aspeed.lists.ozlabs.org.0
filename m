Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9469181A2
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:05:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bctHPhHF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQ61dSNz3cT1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:05:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bctHPhHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MPx6jKFz3c5J
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:41 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f9de13d6baso47734185ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407140; x=1720011940; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyqW/YPcUcSECKMKEcpbBGmhotZwVjBgiijoMXMXMs0=;
        b=bctHPhHFqA0urenFdV8xjBagLnUlC6H5xzcL+rNxLTkyl2TlVMUvEmLhkzLSXUEwg3
         w7FZaGIHsVLnHmf3+llFY28WNCZ8PhCGmqGiZiIULPaNMrI1KhbPumsHBhnHPXqH5A1N
         SEFmd+E1FEur9HnGlBj8qxKGbOAWh8HjLnh2pc9knYWYvKSnZ2/2NJWogvmQYOt67Jmo
         jIy48Hc1eiPDDuZ0xmfJA4etULFTf1jZrqS4UnqI16ysVIKvD5ybNRaBmVe+eBxbnLF6
         9xMpFMoQQaNuS3cHNJo1KnYyRck67uLl37gs+J5Cg0XsZwna+1Mz7CZF0eYGWdSLwEkv
         Ez/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407140; x=1720011940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyqW/YPcUcSECKMKEcpbBGmhotZwVjBgiijoMXMXMs0=;
        b=G9eQfnbEwj1Ihp3Ww/gtaRVaBKPU3X/jrmx9+Qs4aUS351aVXOb750AhVMduEEGWpF
         NlyBZGhvDkVHX69ngdwYbG8cdgCMTuducl6Fpkl9PMdok65RWZJQ0ZC+91TcL1Z4U0kR
         juESm7XDnvqRaZr9CqlwnHyv1t+BCM3Y3aeH3rrRTiRxc+7/hw6hcgbfvBbHmVzuV1tB
         KOb51WbeuyKFpGG7XuKY01vLBGzXSe1admHkOVGphsP7AyelOAAH+uj7w3Vsu6mNXXrb
         inFEvACa/PiwCjZfWDLIkWLGfvf7Mthur4W5ky+oQi8fjjKRJGo/9XtZvoOgWmlcWg+n
         xmsA==
X-Forwarded-Encrypted: i=1; AJvYcCWNAtXlD5/aTc53LvetcKyQGcnMxK+0hGHLQ6z9iN4NJEo7WUZzIfeJ3ro5Xz/ypRwK8vCJnAtq0NH6IaYZw60feDmuWd2zNGp3Uy259g==
X-Gm-Message-State: AOJu0Yzik3N9tHGeq8H2Uw5GOnXgWEJrv+08KI0YahNj6xz6mD04BUc6
	JENFdQgBBc1tvzw5jIgp3pQecliBwc2Ay/zs6YbSwK4uFwtOu2L+
X-Google-Smtp-Source: AGHT+IFXKI3ZK9KhGk+NOro9WzwgcP0es2mZLIvNIGkh7ef2OoZcyOGBPs6/d8NBHWVVUni0wDeFFA==
X-Received: by 2002:a17:902:e84d:b0:1f9:9691:7b9d with SMTP id d9443c01a7336-1fa23f22833mr119940605ad.11.1719407139777;
        Wed, 26 Jun 2024 06:05:39 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:39 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 01/17] ARM: dts: aspeed: minerva: change the address of tmp75
Date: Wed, 26 Jun 2024 21:03:16 +0800
Message-Id: <20240626130332.929534-2-yangchen.openbmc@gmail.com>
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

Revise the address of tmp75 on I2C bus 1 from 0x48 to 0x4f due to design
change.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 942e53d5c714..e20e31917d6c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -145,9 +145,9 @@ temperature-sensor@4b {
 		reg = <0x4b>;
 	};
 
-	temperature-sensor@48 {
+	temperature-sensor@4f {
 		compatible = "ti,tmp75";
-		reg = <0x48>;
+		reg = <0x4f>;
 	};
 
 	eeprom@54 {
-- 
2.34.1

