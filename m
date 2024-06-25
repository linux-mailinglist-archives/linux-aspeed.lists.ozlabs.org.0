Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407A916792
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZGsIpkPD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTt4b5lz3d2x
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZGsIpkPD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kT46kvJz3dFH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:21:12 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70671ecd334so2104178b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318072; x=1719922872; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1+ZY9MnH9MSIo3P/myoXe4SqRYQt+K5cKi8iBD/pYg=;
        b=ZGsIpkPDnCCaeo9iiH9CwLJKGVWdc3NLt2xzmLp2GFGc1ijwzUBm40+18yeiYuJz6P
         52RODlNPFqQJ6Maz+xd1PnPPpW967wWPdezzXh5V7pphnWVNVNUjl6I9N/Zr7H8Cyuw5
         Qyo8+SF8XZOoOqWYLMDFvCEagBK/Mv0/SBC9iEXND3W2DYU8lxVPyvwSCrXuMKR0Zjkd
         Bww5qndAVsFgw7WcaL6Honr38ZWKPrskiEUHgXIPsvoy8jIRzOId8l88mivh12gM8vED
         NUn9Qi7lzTBTDBCBHrg6cY/PEGV9u65UWrkaK41UhmbC9Wn76hMcIvz7O48jdrknjlZ1
         e80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318072; x=1719922872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1+ZY9MnH9MSIo3P/myoXe4SqRYQt+K5cKi8iBD/pYg=;
        b=osi1ZoDmWCIbmc0+LT94GwCU17xa//+FzcFkZWiBzMsxGWDM27WkNB0v6YAo73qpZN
         iFGzGr93FXZjEoJDv2Zq82EQrLK4MuKyywtQeBh6+a3T34hylhl8XjL4Y0xt7wCNYRsM
         TbUl46nPSLDC6/RTCnDF7emcFLKHJwZtHEx0PaW0O/urvz1hXj9f5qv0H1iXqunujRCk
         TYsCYCz1F/UJKAWy7pdk2/y8/FmI1IrR6D7Ez1+jzwrB9WGisg2gv/4DnRgVEYCS6lBq
         Fpt77Z/pmGF1TAEj8BtvA4rDWrZQnGb+8okWc46/pf57bhX8DU4slhVhwcEKxB2L8NK4
         p2xA==
X-Forwarded-Encrypted: i=1; AJvYcCVOu1aHJEfCHQCJG7sw8O71ODcHwasota0ay/kIrAHAVZmm2JJeL3xynDdG3ySq7X1dr62iRxfVvk8KxrdX31gCFuHyUFbFJsnJLmnIwA==
X-Gm-Message-State: AOJu0Yy9wSxAkky6thC3OdKgiwIFix8PFX3GmRSa+Jx/8wBz5rogCyMI
	IaJ9uq3gkQlfGgrkQLhxlSC1fAZVWAUv3Ck/NCw8hTZjymC2jyPo
X-Google-Smtp-Source: AGHT+IFHqLhGUImj+b/k14mrq94/fo0odtjnw+y814qaRfArf+OENLnysBYzvY6GBeeoij1w+51Yqw==
X-Received: by 2002:a05:6a00:180c:b0:704:1ac0:bf16 with SMTP id d2e1a72fcca58-70670e8fc2bmr9825666b3a.5.1719318072233;
        Tue, 25 Jun 2024 05:21:12 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:21:11 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 15/17] ARM: dts: aspeed: minerva: Switch the i2c bus number
Date: Tue, 25 Jun 2024 20:18:33 +0800
Message-Id: <20240625121835.751013-16-yangchen.openbmc@gmail.com>
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

Switch the i2c bus number to map the i2c tag according to the hardware design.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index ba67422a49b2..8dd2bbb15576 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -405,7 +405,7 @@ temperature-sensor@4b {
 			};
 		};
 
-		imux20: i2c@4 {
+		imux20: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -451,7 +451,7 @@ temperature-sensor@4b {
 			};
 		};
 
-		imux21: i2c@5 {
+		imux21: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
-- 
2.34.1

