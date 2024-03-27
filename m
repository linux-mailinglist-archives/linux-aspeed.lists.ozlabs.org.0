Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9257588D98D
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 09:53:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NdImYuNd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4L7R2QLSz3dXG
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 19:53:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NdImYuNd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4L7H2J0Xz3dwr
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:53:47 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dffa5e3f2dso42335905ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 01:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711529625; x=1712134425; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNSpu6YM8BptgR2qjrv8QihJHcI+7VsMuE3/EFlGmdw=;
        b=NdImYuNdGNrD3X87KPzhDJjWvM/HRSKHieFPrnWALfLEyyYrXGEL4Au4UfOSGOQAtb
         +EO4uC4I8m2W0XxwYjN1Q9eR7kcZgww2Wl59mQwRv6sVJuYxscT/FGun/imv9g8zGTnl
         xxOYSlCV7DnuJdh/04wzclWYZrDcO0AgdKL0LZQmPGkeoiT9fH78mLteHjd+uP2gtEfn
         Jr1tvLKJlHxxExuhzulKD/SR/KcxeuuOavlO0WAGJmOnopCx5Us4RtX8WM8eX6t4SR53
         vaTmO67YwPvLlJN4Rdi6SUtgE5H9rptffY1XJt5sBTSLa3wmtm9QsUYcyZbTyoSG5o8l
         ++Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529625; x=1712134425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNSpu6YM8BptgR2qjrv8QihJHcI+7VsMuE3/EFlGmdw=;
        b=ihlXfC/tADodDyIGQStKP4l5HwCe2ME4vvLYhkdN0CJZ0UQcUjAThLAEKj1i3Bx7i3
         Oq5t9HyC1NzzmwIY45Kss7pqEJMuFIfHK1kjihPtqYBXVSSO9U9De5Vtvh0pPhMncNo/
         s1U0pQQB7Ed5q7WzoTo98oLIZnj3aP4z/KcP6+ma/FdQDVrX0Ve2LX4cJt+L0VpXCEx2
         k2huNdfKw1kAMs3pb3rRsKGySnur/6BMyGQhe2D4vT3P52lIKyM+rcF7kKRsha5GpqSL
         6+a/qlaWO46WO7/KttEDJb+7Pxa/mxs+CCfFg0tyVuQlfpgwgTGWUcu26VZJlFYbtsBM
         8RnA==
X-Forwarded-Encrypted: i=1; AJvYcCXF2pJ1F2hTWc9kpuLlhS/u39jqFjoSGv7ZHevw1p0LS3sSxToEfZdPi7YvkH5KRblZUz7LQYmPNPWW0vJmes5dToeBZ7/VvGRcPNF1Ew==
X-Gm-Message-State: AOJu0YwLkDFvUq+wBo2aJrU7HI+weO9qyM7qM8lfwkB3Dm64WDkPGZjn
	eJQmVpCVKZGFcaNgw9QmWjs2BMWvlYTDiRN0llhTJWfzdqYvk3g5
X-Google-Smtp-Source: AGHT+IHn+z3k+py4UVKTT73n+eHw2Es3sDNz128MEDJ3zzb3n/dn1oWz8gRzbMhU0oCuzm6/uIBFXg==
X-Received: by 2002:a17:903:2a8e:b0:1e0:294f:17d3 with SMTP id lv14-20020a1709032a8e00b001e0294f17d3mr660549plb.5.1711529624925;
        Wed, 27 Mar 2024 01:53:44 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e383-3566-013c-5a87-9abc-381e.emome-ip6.hinet.net. [2001:b400:e383:3566:13c:5a87:9abc:381e])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902eecc00b001e0501d3058sm8356848plb.63.2024.03.27.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:53:44 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] ARM: dts: aspeed: Add the AST2600 WDT with SCU register
Date: Wed, 27 Mar 2024 16:53:28 +0800
Message-Id: <20240327085330.3281697-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
References: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
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

The AST2600 Watchdog Timer (WDT) references
the System Control Unit (SCU) register for its operation.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 5f640b7d6b6d..2f7788f2f153 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -558,23 +558,27 @@ uart5: serial@1e784000 {
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785000 0x40>;
+				aspeed,scu = <&syscon>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785040 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785080 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e7850C0 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
-- 
2.25.1

