Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665988F53C
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 03:22:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jq9fWIcA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4nPq26r5z3dWr
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 13:22:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jq9fWIcA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4nPh2FC9z3f0P
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 13:22:48 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e6888358dfso226071a34.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711592565; x=1712197365; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bI/8H0pAGYbJspCOpWpVMnvSIVC0SWhWj4SAbo7SW7A=;
        b=jq9fWIcAMl9+Gp3Dl7sBRhht6hHGgxpJ/OIGrKGa1LR1s4xRE9zEbQuFtWskUBE42a
         mNwkdd3vAOLd8QZreziJfOB4RjZ2ZxtMbfzeqIuCuZ7ZBweIkQPrin85SFPp2fODF1tI
         wQum/11tU8hpBnXENJz0vL23ZlSfm7d2p7KGix7DiJ31PNdpMEnIw0xL0UZNvo0tEKrk
         1ySVPxv2tlZQYNyGyJPm8kOuzlq7c4urQv4XiDv+t2ef+fnrdx8XU5nH/Xjvk36aA+p1
         0R4NVQhkq1frNqwRjQcbb6amVrBY4eHUFLaLRLPy2bovyBt6uONKZ73nDDzRh9fhjMQv
         ypng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711592565; x=1712197365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI/8H0pAGYbJspCOpWpVMnvSIVC0SWhWj4SAbo7SW7A=;
        b=KLQCEem4mImDGIaUjw3BntlssrCcvZZFekFM5/cQknlDbWx9P6J7vaf+fwL/VuN0C+
         anAIwJso/uuDLuWQdevEm540LhD4OSVm/zUNOStW3cFWxN5PiYglXe0wD6en246TQJgt
         N7f3r2ZAODwcfpRS9RzYG4aMvUBOzpeUImDQqcebdPkaLQ9Uj6+8WrwIFg7Ik61IEpIx
         m03es2HsqPAMSS06g/6+qgRwZ9tXLS4Mr2V+0KT/P1Gs/0i4qKUsYsSad+9IOjguxbin
         HJFRUdTG2DyYxAWz9hvn4WIacoUSOspN66ujjLVP6vM8R3E/T9UpVAD46EEi5Tp2CSSy
         jqlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT12vosWZ02xsycMAwpRGIzVPcN6GgTJTOF4/1sQ/tWMtBr5CGsIcDbgZ/C8PnSNocTwR2GEXUAU/AhbF7F9BSsd2n3KAcqJhYjI1Dtw==
X-Gm-Message-State: AOJu0Yy9+p0q7l2cGwTc6cBz00UKSaxVOQTG85XlgETgUOsbfcHpIOdH
	yMwScRLBC76ZA/4K7w2CDVM6FDf2sn8Ym3l/OE43uiquiaBz9TTF
X-Google-Smtp-Source: AGHT+IGbwznYQbqi5HTXiUOA7d00ceCj8N2cmmUWUhbT755TePpGDg9zSqMamOerLluvJFoltPTgXw==
X-Received: by 2002:a05:6871:4191:b0:221:bbb6:3aea with SMTP id lc17-20020a056871419100b00221bbb63aeamr1570113oab.16.1711592565077;
        Wed, 27 Mar 2024 19:22:45 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-17c6-c47d-d4ee-f9e8.emome-ip6.hinet.net. [2001:b400:e355:7eb0:17c6:c47d:d4ee:f9e8])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78699000000b006ea858ea901sm229256pfo.210.2024.03.27.19.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 19:22:44 -0700 (PDT)
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
Subject: [PATCH v6 2/4] ARM: dts: aspeed: Add the AST2600 WDT with SCU register
Date: Thu, 28 Mar 2024 10:22:29 +0800
Message-Id: <20240328022231.3649741-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
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
index ead835fca657..b47850f0dca0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -557,23 +557,27 @@ uart5: serial@1e784000 {
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

