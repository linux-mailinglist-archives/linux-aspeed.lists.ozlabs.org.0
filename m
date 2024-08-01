Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A14944FF5
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwHjdbLo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgr3c8zz3dRK
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwHjdbLo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYgJ6TWZz3dT4
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:04:12 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70eec5f2401so4461299b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528251; x=1723133051; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikAlSYKd4FAKko+mbSzcnWgebllBxMH0Ig9OFX5Pv8Y=;
        b=mwHjdbLoD/tWjeCROgk6pv9dOFFdkddHoWYy37mVhoiLNL9sHMtVA1KdVJJlbhB1bN
         VS7NhIZQyUqOaYJm+7Ul7NLsbDJmkj83SJSAMGDLiZe6yFD8PzwuAjQ26XOzz6UBXPX8
         bF7NW6iNZH4io8UhXYjx6DaAUKk6D6HSRHuUHXaL+yukxtJ407x4Y/ApLczVVPOqscMD
         rWkmm051Kf04WPoi0ccNwtUQtzGD1l7SIAiaa5Tl0kRDK3kkPrUkiq4CDI7qmx6lTRf4
         21ES5VVPTkCCrbmK8pDx7nQmp/DbOgKet8zOHBJ526kxGeX7QSkkm8abcJv+xc41x2Tp
         1NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528251; x=1723133051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikAlSYKd4FAKko+mbSzcnWgebllBxMH0Ig9OFX5Pv8Y=;
        b=b30qXxUKod4p33hSkW8XwyHASt5Tkwq6qiO+KzfuoD10IUaytxxAdmhUBHfrj/ZmeR
         VplnCt+s/Ubgyx5+wJCfida2cM8iPyHBLpKp5i1lGaAfQYd6bazxkBNtsMt0UhSfMtf8
         CqaeJRImALidYEwrBeDSvqlZi8Uhd9iNo6WiKE3jTsNv6aqCeTYcAQdXa1Je/OBD0Vnq
         BYk13/6aqJbGFvOIHCeX71dNR4Klj0D5IpO+UWs+1HOwUGhvFcrvEg+pmt0hcjOU+7Ko
         azGHkW1jXCUvvu0Kd/juNrI7GHXMQXmUwCNKN1EMX2IE4eHAE6D9wXeWDhamQVIJuV3Y
         f4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwIQoK1CFHnfbDyYmugFmLTgf5fBc3DRKjaFOwKfRvCJUgveyA/ICzBpgM/lRUJqNoZUY41OF+AFIaEWSRTqU3vogcpxa6SMHHHel/dg==
X-Gm-Message-State: AOJu0YzNWna1xY5BcOIOUad2ufWdA2xvDQw8a3LC6QIU/ngfupaydN+d
	ZByT2B1lhrTgfzClBYUwJK2kXBZBP7ou1EJP/jBOL6TPiXIlyzYG
X-Google-Smtp-Source: AGHT+IFKgL3S2d5GTrQ0YRnV85K+aqoVwG/L93JmVq42fiXFGURtoW8VEBS9oWRamZEmCVq/LzyS9w==
X-Received: by 2002:a17:90a:fe88:b0:2c9:7fba:d88b with SMTP id 98e67ed59e1d1-2cff9419943mr852723a91.14.1722528250638;
        Thu, 01 Aug 2024 09:04:10 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:04:10 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/11] ARM: dts: aspeed: Harma: remove pca9546
Date: Fri,  2 Aug 2024 00:01:35 +0800
Message-Id: <20240801160136.1281291-12-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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

Remove pca9546 device from i2c bus 9.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 31 -------------------
 1 file changed, 31 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 4421822eb134..cf3f807a38fe 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -20,10 +20,6 @@ aliases {
 		i2c21 = &imux21;
 		i2c22 = &imux22;
 		i2c23 = &imux23;
-		i2c24 = &imux24;
-		i2c25 = &imux25;
-		i2c26 = &imux26;
-		i2c27 = &imux27;
 		i2c28 = &imux28;
 		i2c29 = &imux29;
 		i2c30 = &imux30;
@@ -409,33 +405,6 @@ gpio@31 {
 		"","","","";
 	};
 
-	i2c-mux@71 {
-		compatible = "nxp,pca9546";
-		reg = <0x71>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		imux24: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-		imux25: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-		imux26: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-		imux27: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-	};
 	// PTTV FRU
 	eeprom@52 {
 		compatible = "atmel,24c64";
-- 
2.25.1

