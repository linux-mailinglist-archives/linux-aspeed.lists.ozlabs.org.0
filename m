Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBFB8A2AD5
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tz4YEKXd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wk0HVjz3vdb
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tz4YEKXd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wL1XP8z3vcF
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:26 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c6f9f1d1c5so12493b6e.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913503; x=1713518303; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeUVH1enZnNU18wYfElV/S7pL59t5rpG29uXETSjnD8=;
        b=Tz4YEKXd/8wiYV1oE/Trg0grfJoMfNEY6U/R0GpivB9+4FhVWrVxdklRh78g1UsNF2
         YjNzFxQqE1QMboN2FmmJxfDPHjE3CaggAIAK9pzM58HV8DNSvxDHS3ZIinnMhSwwluHP
         FBWQOr73oC/fMNPItklz/vkp+bNk0Rjqxd6fp3dEU+g7K3ns7XNC0FHKw5Jl9zNOokIL
         QU59tmPHNs9y/FJ6XBX9beB8Ukr//uo7oKHYD2V2kvkCstcXMZX0DLxF92Du3Z6Z+g1s
         hL79bHye+adtt18PA99yze8RwhofFC2Hbld7I/78a2M9KPw6pVtbU1QHBqJJhXle4ZDz
         XP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913503; x=1713518303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeUVH1enZnNU18wYfElV/S7pL59t5rpG29uXETSjnD8=;
        b=NvPEZIctgy0fMKZfjNxWIb0n4JqLwnnU6PfGqyvn4j4x/a70/gW1YRTdQBSGlyoi/o
         z+mY65HgcR+DikT8y3YuImPPfho+UEueWnNmRJGQyxckUr/iBm4H7FmpDOeG/QTXUitT
         NKQbVZNUK2j6ZZWZiNhcldEAJt+UIWn0OSp+MTRTLRxuZyJhVsO3AdLQMWVfzOB6/hX2
         pl6We7AfSDahgbltTfajIO8KtJUMpjESgspIOvb5F2cLRNWEyvklW9RtC/nnDih1my5+
         1zj/eGKiACqq6457D/7OfcU8bhKBojfd75CZlHzYzPtXxHAgmaR8GgGIrtJoGto/iV/8
         0xhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6dlskSK+3zBLWEOIwXDEYDPZTLZoJBlzNs6W9Xf0KWI0CkODWg/ejPixmiAquabfulmO3X4sSrG7kl3g6/3TPz3LdCO3zn7b4iuWcFw==
X-Gm-Message-State: AOJu0YzWTcBPzueWR3HRq/rS0VgPIdDZTTgrtF8B9pEJROg8f7ZocTpe
	4X1pXvkqGC01/E+b/189AaAVzcvWGIoRJ9KagcIoabmNN4Ln2rmP
X-Google-Smtp-Source: AGHT+IFYC3MMaHSyFp8p82wE4TiscPIFe78sHQJz9DD7hiHzFomgzEMlz5Xu0NOwJ6bDsMcN+Dcdyw==
X-Received: by 2002:a05:6871:27a6:b0:22e:b2b4:f009 with SMTP id zd38-20020a05687127a600b0022eb2b4f009mr1744524oab.39.1712913503215;
        Fri, 12 Apr 2024 02:18:23 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:22 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/12] ARM: dts: aspeed: Harma: Revise max31790 address
Date: Fri, 12 Apr 2024 17:15:55 +0800
Message-Id: <20240412091600.2534693-8-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
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

Revise max31790 address from 0x30 to 0x5e

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 5c3fa8bbaced..7e98af5836cf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -192,9 +192,9 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	max31790@30{
+	max31790@5e{
 		compatible = "max31790";
-		reg = <0x30>;
+		reg = <0x5e>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -212,9 +212,9 @@ temperature-sensor@4b {
 &i2c2 {
 	status = "okay";
 
-	max31790@30{
+	max31790@5e{
 		compatible = "max31790";
-		reg = <0x30>;
+		reg = <0x5e>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
-- 
2.25.1

