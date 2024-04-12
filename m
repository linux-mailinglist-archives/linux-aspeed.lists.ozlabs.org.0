Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFEF8A2ACB
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qh7QTrbr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wH5NWHz3blb
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qh7QTrbr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9w54qX5z3vX6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:13 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6eb5511088aso505353a34.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913490; x=1713518290; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=Qh7QTrbrbrxRP5hjEKDkz4jvfxEAp6oD7o2swkTJt1mpBVVby4lQ/JN9Jvle2m2XOi
         AOOoWIShXYJ4fObXjn8HW6DfLuOFYRsFfwPFusE2rAqQi5IEkqA7hqfBtSJt/GCDuEdZ
         m85QDc5IT9WYB0B7MfSqDii42uD9sBqQ1x4R9lumOvNUbBClPp13lihLE01TPGaBgAGk
         Pv/qIMCq08BWRgxKigxILaaYyLLv6KQKZk3NORUdcM4YiMhrQ2ipFTmrTLLwXWqmibp0
         12Ew/UGrzMowqlMWFGu9aciEtfMCT0osB3U8UyuFvd6PjFxuLbWB/3ovzcIDqApp+V9i
         ytFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913490; x=1713518290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=WefPbQqFVMbPhfOWfINu+JdI9Zjdxa1RCXb68zTYHGNuLIFcisnX6uzf7vZl7wIpg/
         cUnWafHcnzgc5UIZrlYBtdOIl9XeO4zU5BV+YlJ9FXRL6sB7u/hSaKRjYPKJs/dG1gvy
         qW8Mjcuvw/9OjXVDSxgcO+DNkIHGnAqHikn2RMtsy9zHX4pEywzNfaR2Phe2kFPe+jVr
         /8d5/xE05KfSGTvwwGdF4dJlSGWhqVClivsIEAigsoQXBYd492V71UdptRV4JaDm+128
         9d57f9ikOGBWuSDg473ZQLAyCe3xLKHAr/i3PJV6Ksce9dEw83P1Z7qvhmPNg2OVBqGf
         0wBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX60DI+vkxmOZeExaUCrK+J8okozKyC25rd9EZ1N+KHFlorqJiaVF8x9bmZJra+v/5wDXvmDertPnWPJCrf4M8FBMuK6RplHAFusAvlVg==
X-Gm-Message-State: AOJu0YyTSuRBHTR8iOLV0qZ9GDnNNVDyEZrbQuJlhVFP6tZWzHiQ8P0s
	TM8qvVw4T2qZURu4ecOQK9O6/hplGt3morz2f00UF5tHamjfkM0C
X-Google-Smtp-Source: AGHT+IER7RY3UI1nL3RyrLJqYDGuT/AjZxE7I8qA+iB98G7L1KTZGLKBBosuNef4zJ3jEkCXu/qDsw==
X-Received: by 2002:a9d:768e:0:b0:6ea:1d30:71fb with SMTP id j14-20020a9d768e000000b006ea1d3071fbmr2030496otl.38.1712913490129;
        Fri, 12 Apr 2024 02:18:10 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:09 -0700 (PDT)
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
Subject: [PATCH v5 02/12] ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
Date: Fri, 12 Apr 2024 17:15:50 +0800
Message-Id: <20240412091600.2534693-3-peteryin.openbmc@gmail.com>
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

Change routing to match SOL(Serial Over LAN) settings.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 8a173863ef24..a0056d633eb1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -12,8 +12,8 @@ / {
 
 	aliases {
 		serial0 = &uart1;
-		serial1 = &uart6;
-		serial2 = &uart2;
+		serial1 = &uart2;
+		serial2 = &uart4;
 		serial4 = &uart5;
 
 		i2c20 = &imux20;
-- 
2.25.1

