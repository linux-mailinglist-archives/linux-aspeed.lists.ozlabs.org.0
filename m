Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E79181A8
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hAgLTi0K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQS2WmJz3cYb
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hAgLTi0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQ83dY2z3cW4
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:52 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f9ffd24262so35485685ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407151; x=1720011951; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2tr1hBMLOFEF51USZXCVOmyouauly2LVBpam53aFYQ=;
        b=hAgLTi0KefEMOuK+gWTREYgLtYjQXDepFlZwR8/9nSvdX5of97o7uqYoYUYcdBg0Gx
         IR8dmeXIUqaaZo8B0LTr4+X6QUuY/LT4GET+xQ3sIkf12W6ZszdGwIAv/vW37bGUj2Do
         dfZfp/EH+Dprg1BVJuCVokt4DSJWxnSl5HmwBA3e1u6UMI4pcn/WHZxnzRdVgd3z7JLA
         pwT4PGhLN84dFHj0W8PSzT2o+q4IBfa90MGe3lTNAM5YH7v9si1nE33e6CrpBr2XxnhO
         aOVX4XZCLBb1Nc5JTa4KvRjcLIG2FJaDi5BkncutIuo+nxyGiLU3DrHhDFH3gT4cxfjw
         ChJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407151; x=1720011951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2tr1hBMLOFEF51USZXCVOmyouauly2LVBpam53aFYQ=;
        b=s0NyXaG0nxkgr3amB5n68zYotqedGYK8Ypiy2am5+7Jc2brue0DRYKRFOsf8CG16am
         tbpwLZD0l8eCwbmHXXbJmKBOjRg3W0w0Or3LMFAQINPAgCVnF7Xs+5W8zys2PE6uaUH2
         //HO7oSBy5YaNrmPirW5Z8LZeZ7Nd6+16GuPVrNB7JcJVbGSxfpfG4g9DqYQL5IGA4H2
         eh1tD01gbjQK5uJLa3mpbfAVKpB+CxmKLC1FNKbt3gmfg6OWNRmAlBvhle6X/xWA+byI
         3CBeABMKWm6Wt04l3AqrfRg3Wh99DiI24YGy9rlSeoqGhsBKgcCTIxIvmati8HO8GHz5
         ZrmA==
X-Forwarded-Encrypted: i=1; AJvYcCVuwEsJcoZlr8Td06WvH1gWCsu+DXt9Udr6L82wlnLEm5ggQsprrPv75kTrj5lE6cY5IFfifmFdQ+jHI8XolskXmfu7Lmdvfjszh2H6Uw==
X-Gm-Message-State: AOJu0Yz9/Xz9EsXpqHG6WiQMmDctJhWGtv2JqCohViqxY4Vfk4Tw9D+L
	aepc/+HgG+FciPGPoXkpBpY5NcBiX6QiVZkQAxFW53HhMTYQciay
X-Google-Smtp-Source: AGHT+IHSfeIrTbbzVMgHrBphxY5MvfF565Sp77JHt0bggXN9+n/m0mIZHPPoEx27M6p9TIY5bzs3/Q==
X-Received: by 2002:a17:902:ec8e:b0:1f9:d6bf:a678 with SMTP id d9443c01a7336-1fa23fd8c48mr121483215ad.32.1719407149911;
        Wed, 26 Jun 2024 06:05:49 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:49 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 05/17] ARM: dts: aspeed: minerva: enable mdio3
Date: Wed, 26 Jun 2024 21:03:20 +0800
Message-Id: <20240626130332.929534-6-yangchen.openbmc@gmail.com>
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

Change usage of I2C bus 11 to mdio3.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index cd321482aa09..13819bc166cc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -78,6 +78,10 @@ fixed-link {
 	};
 };
 
+&mdio3 {
+	status = "okay";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -315,10 +319,6 @@ &i2c10 {
 	status = "okay";
 };
 
-&i2c11 {
-	status = "okay";
-};
-
 &i2c12 {
 	status = "okay";
 };
-- 
2.34.1

