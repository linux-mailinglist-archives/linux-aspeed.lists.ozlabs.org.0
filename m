Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F50919FC9
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:00:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mnwu5h7n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qGW04qVz3cVy
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:00:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mnwu5h7n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qFx4l28z3cX3
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:21 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fab03d2eecso1325315ad.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471621; x=1720076421; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oqZSVf3Pja7+3axQ7FhMBZCb9fhp3k28x1dNv+Nkh0=;
        b=mnwu5h7nD4cp5mc1GNjZteBuh3btkUhS0Q9hZFa6gqOlvEXltTribV7Kj6mSD8DiXr
         nh1BKPcmb3hGZEBOuEbEkdB0Ss7juR6dHnAP57rXeh1e4XuxePPf6BCL8IQZdZOQD8A/
         4Fp5y5sRjYcmZdbQXc7EUwE4eZrkQ8huj4fqbA2tYEgSFlKOUNHoTC5cC+7FN1v7e5P5
         YIOBUUWEJ+pIYvMZloV27iHIoGKVy9sEh3qNB7KmwYYIgZcj0J621YZqNRl4yDNdubOk
         GvHv0L2sVL0+LGe9WdRawE3y1xtp7xPAd25d2ck0yGFbo1e1l4SiHo8JoTJT+fwogJN2
         qIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471621; x=1720076421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oqZSVf3Pja7+3axQ7FhMBZCb9fhp3k28x1dNv+Nkh0=;
        b=MBYOZFn0vxK/3iBFhx/SXkZDncJ/GPkR9KS/zJ3s09pG3oLvoJd+QPZzxDCQ8Rmx8W
         4Nnzj5e5lqUDnPNyKDE6MuLBijM9o7xp268YRTPhk6hBTHZGVhXfMTiyL+5rUweC4dVV
         QtpkD2h42aBkVZfWZC03DJNFJ6YqQACwthF84UtcsMXGBWQ0+kUyEv5ntdVUbrQ1qzrA
         71HwsG2V9HXoMLkl+Jc7GrLKTrTSnV14HIFZEoMajQnL30ynZX39MR/Zr/DS11qvev8T
         ArnJqOKToeqR3/XIYRItFbiI/lMujfUS6Ks+KMB/ZLCmND7BhtUWy14hEyJNY8TwcEWE
         jhCg==
X-Forwarded-Encrypted: i=1; AJvYcCUgqSr1c5a1UTK3el6e+U96CfSeVnIre3IPdBFGMZOtK0K2WH3qTLzCKlU0WssuRRnyXqWBgTpcHWzoAtGDF2CZY37gxp4I6HY9lFgT0g==
X-Gm-Message-State: AOJu0YzI7xkb3pwChEfLM/rXpPUCpIaRaRjr9kK1Z5ERAUwOb6FzoFoV
	joIx/sxwvdt59+8kVoUp8lZm33YDgy4SlR4YEDPr8D1gpy5JaKFl
X-Google-Smtp-Source: AGHT+IFlxyStZuPqIstUbHexek6n7CBT6uzzIbQQHjx1wgL6505KF4tirpi5W5yVRoW/ZYAMrY5X2A==
X-Received: by 2002:a17:903:18d:b0:1f9:b4eb:ce4a with SMTP id d9443c01a7336-1fa1d51c2b4mr174615415ad.23.1719471621202;
        Thu, 27 Jun 2024 00:00:21 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:20 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] ARM: dts: aspeed: Harma: revise hsc chip
Date: Thu, 27 Jun 2024 15:00:03 +0800
Message-Id: <20240627070013.2509150-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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

Revise HSC chip name and address to match LTC4287.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index c118d473a76f..d99fba321379 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -276,11 +276,10 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	power-monitor@22 {
-		compatible = "lltc,ltc4286";
-		reg = <0x22>;
-		adi,vrange-low-enable;
-		shunt-resistor-micro-ohms = <500>;
+	power-monitor@44 {
+		compatible = "lltc,ltc4287";
+		reg = <0x44>;
+		shunt-resistor-micro-ohms = <250>;
 	};
 };
 
-- 
2.25.1

