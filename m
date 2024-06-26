Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 186859181AA
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xm8SqbwW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQX3vgcz3cVf
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xm8SqbwW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQ84RHWz3cRY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:52 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f9a78c6c5dso52238715ad.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407152; x=1720011952; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq7Km+kNindSOJ7hf0QT9SRfkWv9U1E4WEwZCW/4V7k=;
        b=Xm8SqbwWn11KOx7MlXKBTjheOCluVRj8Qg1A0N8k0m7qI7Q87ygb3XassUY5u251nP
         wdUKV2gp7GNOYCLuVExbcwsbeThyvcg5oVfG4LpHfgmn+gAOrnzyo+h0IB1UPIG4iIfO
         gx4/LXTlqd/DXn76m+0plFey2NPcJILsBqy/vUIorCuhR4ZwBZjAEGJhD4InhKH0bwVc
         4LbPWNqM7NcjLBpRCaS5LvKNZ9Y2t5EVc9mFY9jUFYjSmfq3nf5npDtWI5D43VcvKs1g
         qDR6RH4hMQmF/3QsGXeQlYGxGLk3ZWJivpp9sLKRyVUJ2xjex9blgfiXucIO1Ca+LYBy
         mUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407152; x=1720011952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq7Km+kNindSOJ7hf0QT9SRfkWv9U1E4WEwZCW/4V7k=;
        b=aFLmJJaK2ktG5LTaMc5v/c2nMCIltgpcJVYPlOIE/ZjGZuxF9bi2yT6QaK7QCEieQg
         86uEfcRp+hRJyYPX4EQwLKCI4N4tT1Mz5XHp6ntteJa8BESwYRcEfybdbiesrLuSKice
         HJ1V27yr/OF8fKDwK5HYd06RpVV3sXwIpPZeXitudrm6h1q8nhWuQM8kbNsH9Ymc0Vpr
         l1s1nCOWNdin642MQ/8k0NFiFs+ihhyqREofIqGxaWxyOcFkvP3BJtOEkELibLoDMm8l
         EINFTX/6vNqa7i7lXPyHOpbiRwrprWt9XhpXiru3IPRpDqcXZ4/riXeOClWwkBoYKQhm
         y0iw==
X-Forwarded-Encrypted: i=1; AJvYcCXbq21lLE3o2dCpYu+OTFzzV+WrrkoopPwoBqc4+/jIRc4f0HWCuHqhZdbXFnW0vrPDz3zCn/5XeNlmoxpPFt4NwNotGvqIyYKXMLy3+Q==
X-Gm-Message-State: AOJu0YztLkhVINmiNYZGWw9t/tbtkSrWK19UZ92r7DN2CF5ULYVIT3Tx
	jyWnwzgoGO4SNJzIyJbKPA/+uxsRXF1UIiuq04qj0aayX1iTvg9Z
X-Google-Smtp-Source: AGHT+IHxteW6OXgJmxn9+nKwB1bp/8Nb3CWl02MbFlYO8kguOCc6ybzpAkgE/yaguzdD7oHK/flDRg==
X-Received: by 2002:a17:902:e5c1:b0:1f9:c6df:a84e with SMTP id d9443c01a7336-1fa23f3638fmr125852215ad.64.1719407152195;
        Wed, 26 Jun 2024 06:05:52 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:51 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 06/17] ARM: dts: aspeed: minerva: remove unused bus and device
Date: Wed, 26 Jun 2024 21:03:21 +0800
Message-Id: <20240626130332.929534-7-yangchen.openbmc@gmail.com>
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

Remove unused bus and device.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 13819bc166cc..bc323bfbe514 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -315,10 +315,6 @@ rtc@51 {
 	};
 };
 
-&i2c10 {
-	status = "okay";
-};
-
 &i2c12 {
 	status = "okay";
 };
-- 
2.34.1

