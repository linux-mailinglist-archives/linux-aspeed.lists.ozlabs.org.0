Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D988F53B
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 03:22:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bE2XJtp1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4nPk6Yjtz3dX1
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 13:22:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bE2XJtp1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4nPc19Nhz3d3Q
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 13:22:43 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3c3d3710018so369331b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 19:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711592561; x=1712197361; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=bE2XJtp1Vgx8yLO4oP//+W6+TP/tqfkUotJ8szjlZRIs4qYH6qAGQ4NlvjMVAHLEPY
         yhCFWQci7Wfr6QSdV9Qe5CaWKuqDrFFwqG7odssBFMq9OXBv2TrOd7G9Ads9RhRHUgHu
         3KNbDkcglDzZF+0baA6yZYymBmOdBCa77la9gGbUeo0wdb4HXzmyf1ypy4GGz5oh6PUO
         m4c1TT2Y1JKjzy+4nxWBfQWXzOHcThcDURwLyvPanXqlM5sd57mZdSG9BqqGoMsJyi3B
         HXMh7geQ4Z37dZmtwotYfjexH05+9YWZCi4Xdo2XJiqi4+xa0I47VFYlv6LkH9dRkWp4
         utPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711592561; x=1712197361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=EdC1R7SYiABfkfqkTweDrmvF2NzQSL7rqffcWxQH5WGc4J60P4bNNVc39YeCvXH6OL
         yPbGA7QABWAPrdzCsNOo8mRsxfSVi6n75zScSR2DNxGpzw1rFMt6M+hb6uRijvTAGOOV
         cHzQi+hv7PHBqVfBbRMZ5Jr551nZqTSnkt+6n0XbjaiQQMkSuxKvD5Z3uvow2dm80qE7
         8ENWvuHGVCvKda0NgeG5SRzzck4zeBUhLXu/kNR5/9k2muqjQJTRsLYtB7b1f+j6BHJp
         fRBghpWMGgSdSGCyVhrWVDkQ3G8uspHjkena3pUTsa+3ILBpaqAIgo2Y76X1b1rszVMQ
         In8w==
X-Forwarded-Encrypted: i=1; AJvYcCUlce8N6rP2JP5ZsgyJ6LtzZ3J1C9Lqot+pH/oGtExi2W4iKiihJxlC3waOhq2smAIuP+BWC93GBwPuOLVuWDNuYsxUyaT8C8bULOsMOA==
X-Gm-Message-State: AOJu0Yxhrt1I+CZuNLaGVwTEOTepCr6oRVXcsuy4902MRsdHVTxnC64E
	s9h5+eXfczZ5Ssmrwz6APGfJS61VBW9/VUiFuKgFDG2f1im3Sr0C
X-Google-Smtp-Source: AGHT+IF/M2aT2iNp3ruFJkZVXPJ0JqQ59asv05qBqw21fy7twZ5ntMVtEyAWYGtrxsTVZAd3CYIWkA==
X-Received: by 2002:a05:6808:ec7:b0:3c3:cd21:8a07 with SMTP id q7-20020a0568080ec700b003c3cd218a07mr1833577oiv.32.1711592560966;
        Wed, 27 Mar 2024 19:22:40 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-17c6-c47d-d4ee-f9e8.emome-ip6.hinet.net. [2001:b400:e355:7eb0:17c6:c47d:d4ee:f9e8])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78699000000b006ea858ea901sm229256pfo.210.2024.03.27.19.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 19:22:40 -0700 (PDT)
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
Subject: [PATCH v6 1/4] ARM: dts: aspeed: Add the AST2500 WDT with SCU register
Date: Thu, 28 Mar 2024 10:22:28 +0800
Message-Id: <20240328022231.3649741-2-peteryin.openbmc@gmail.com>
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

The AST2500 WDT references the System Control Unit
register for its operation.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 04f98d1dbb97..5fd12c057c31 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -410,12 +410,14 @@ wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785000 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				aspeed,scu = <&syscon>;
 			};
 
 			wdt2: watchdog@1e785020 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785020 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				aspeed,scu = <&syscon>;
 			};
 
 			wdt3: watchdog@1e785040 {
@@ -423,6 +425,7 @@ wdt3: watchdog@1e785040 {
 				reg = <0x1e785040 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				status = "disabled";
+				aspeed,scu = <&syscon>;
 			};
 
 			pwm_tacho: pwm-tacho-controller@1e786000 {
-- 
2.25.1

