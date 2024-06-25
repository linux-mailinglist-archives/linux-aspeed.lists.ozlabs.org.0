Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED391677C
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KK3EibbA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kSs4GWZz3cyd
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KK3EibbA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSb3PvRz3dS9
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:47 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7067435d376so1703712b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318046; x=1719922846; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjV6Pheu2FSQvjGbirH3830/CoM3xL8kwQXPtOnBj6U=;
        b=KK3EibbAv6wYVXJQG2+SiYAEAJ9Amphr+J6cCpy0ejupEww0gnzIIzsz17/VED1uXG
         LLtUEjYj3sh3Hbh1fV9iWzrNZVTWa/CYzXZ6Kl4CxcLooLTKhyEGwxB8i742/9iLyvV8
         YNHKUaE1C82fB2GSkapQEfSF/GjoW4AzRooeDD6XKjdJZIoURug/l5d90QeFo9MOt9Hf
         y2YX6boUiEE9e7z0UKd65dhzcYtWP+1Ubd3lHsKYzZzof8I88uQx5+Lrwc7Bxk8K/8Xq
         m4CbhzcTCIBaE+XFggFAjIdmihlG7xO6jpRJaS2R5ZVuiGCzHfjvnqBrk0KucNbCfIE0
         26TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318046; x=1719922846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjV6Pheu2FSQvjGbirH3830/CoM3xL8kwQXPtOnBj6U=;
        b=CMLH3rGPWE6sKrxziluUSulbftmrrxV5+KUC+CPT5PowE/Ayfa36u6KTbgyafUKtyL
         z+1BVHJHjELNMTqHMVf0uusZNhb4wOSjcvM9wpPvu24iSplmddvtPGUcZytTMQGtD/Kd
         S/sYmcXiVkqwhLvGAr4/iWK2XCQixIX4sU1KwizJU3yJBGir+zXte/L9NfXIcVnQ9mqT
         JDiDNpXfj2WtnqQiJYNhFfffnMUH58VENkMHdoihuTXi/38x43VYYqwmGs3UoIOzUFQT
         1TLjXHttmpEQ0LSicggTxMaXkp6LeV5jZx5K2O1DC/xsSav3dh4bq1yMLRtwJPLi6g2d
         yrlw==
X-Forwarded-Encrypted: i=1; AJvYcCW5YtJ36yTTswyJt7FTHQdy1pxFKS6KehhYGNrbXkLR1HxyXUonoi9Gx6zAixNyFetxcd7FRBjztQ1q4pZere0YK6Jh7ufyNDpaPfWBWw==
X-Gm-Message-State: AOJu0YwqE4wwO3MDp1rQuRit6jYdFxwVZVVdT7LdjvWCUADW5BRXRH19
	FlllGR3jwYDKnPBG6jPzsKWBPK/PfFdzyRKIoUrBgZPMzqAuBL2L
X-Google-Smtp-Source: AGHT+IFFdhHpU4jgClNAV3bAEMz5uJjZCp8aQ05nPpNWUjp8BsCdyY1VjPzpmn21fY2A//VF6V6sWQ==
X-Received: by 2002:a05:6a20:c303:b0:1bc:bb05:e0db with SMTP id adf61e73a8af0-1bd13c08ba5mr4344543637.23.1719318045723;
        Tue, 25 Jun 2024 05:20:45 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:45 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 03/17] ARM: dts: aspeed: minerva: change aliases for uart
Date: Tue, 25 Jun 2024 20:18:21 +0800
Message-Id: <20240625121835.751013-4-yangchen.openbmc@gmail.com>
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

Change and add aliases name for uart interface.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 7d96a3638448..b0643d1d549b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -11,7 +11,8 @@ / {
 	compatible = "facebook,minerva-cmc", "aspeed,ast2600";
 
 	aliases {
-		serial5 = &uart5;
+		serial4 = &uart5;
+		serial5 = &uart6;
 		/*
 		 * PCA9548 (2-0077) provides 8 channels connecting to
 		 * 6 pcs of FCB (Fan Controller Board).
-- 
2.34.1

