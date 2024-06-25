Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A90E916780
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YywQK11Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kT25vRNz3dRm
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YywQK11Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSh3knKz3dwG
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:52 +1000 (AEST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5c21df2d0a6so5273eaf.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318050; x=1719922850; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYpMdLUZ8Pu5PErgyvvWAR9vFZoKUmmawdaOP6axHDQ=;
        b=YywQK11Q7IAdGfMastmDliFWaBeNFcyvlLpPDGA3zjEPxvxsOiboKC/aayhxe9J2OA
         hiTjzhJ2TZJsMdHdbWbxU5nWm0AwbvqymQvQ+25IpSGDGf0vhi+orqL7HQxPuQ6+i6TN
         T59Tje2lT8Zjeq2UdgKgqYI6dXjC9OrxikvDmnVklnwpPu+SKJhxSyrLClNVQB/Uqjqs
         jWkJ3w9JzV+F3wyJOguru2DeYVwSEgMINKamMum1fDVRWFI6wQg6dWLefkKOFjt8s8wR
         Evxbd0QQSIgFKtHGx564r1ClUH7R1xIveqnilslhlpda64pVDavHj2+wyah3MI0A6nFb
         nSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318050; x=1719922850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYpMdLUZ8Pu5PErgyvvWAR9vFZoKUmmawdaOP6axHDQ=;
        b=aXOPveRmJ4xA8PvCvAAlRpkSvMR3sKOcssZl38halWOaQz6rFQgvD8LgrEkMz+OglR
         7KuKkfLxuT+yxm2Jv5SHtFB7tSb+SzbrYbDACXem7GX4s+OQfy+6sIqL0loYNK+IEO6T
         gkk08kJYUTkxOy749VcntMKmAaYJAJuMi7lo24x/99PoMrr6xZgsQIbAgZ50kQ0Sp1xk
         BGJ2UtXc3ZL+AD7ZAArd3IXfko75GV57j3iHsLZ7kqT/XL6XvI4vwsD+hvNsA4YauRbG
         WOhwea0Pbm+dx6Y899xTV6nZ+bs4i6BW6P9YHFlDPRLSWmix9R6zVrHH1GDz8HCtMZ06
         7yVg==
X-Forwarded-Encrypted: i=1; AJvYcCVReEX+mQRmJJUOKypuw9+0EF720Z1mV7XpjlSk8h5cO6H3wLjJ60T+Pd6L9rAt+AXaVCARVtniLbMxwrHV1Wvc7vflKw6Z60DtOg1mRw==
X-Gm-Message-State: AOJu0YxQV42qr1wAZy8TyDIjgPZcGTorWSAy5igoxJO1GXzsI7oZmQHd
	uzbNq9oVUlCqIbOFAsjXfUcOpTfQYq5zjwCCf4xE34oWJddlbP1R
X-Google-Smtp-Source: AGHT+IEhiFkBr36kLcBUT5z+d5IDZ9KKHvfkPFh4qleoUCawh5QS4Rc8+ecYPGqAh6Lk7GcoQZfzZg==
X-Received: by 2002:a05:6870:1791:b0:259:f03c:4e96 with SMTP id 586e51a60fabf-25d06b793f9mr7726194fac.11.1719318050237;
        Tue, 25 Jun 2024 05:20:50 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:49 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 05/17] ARM: dts: aspeed: minerva: change RTC reference
Date: Tue, 25 Jun 2024 20:18:23 +0800
Message-Id: <20240625121835.751013-6-yangchen.openbmc@gmail.com>
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

Change the RTC reference from on-chip to externel on i2c bus 9 and address
is 0x51.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 19f609cfd026..32400284479e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -116,10 +116,6 @@ flash@1 {
 	};
 };
 
-&rtc {
-	status = "okay";
-};
-
 &sgpiom0 {
 	status = "okay";
 	ngpios = <128>;
@@ -329,6 +325,11 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
 };
 
 &i2c10 {
-- 
2.34.1

