Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E557688F4AF
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 02:33:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SmoppO6P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4mJf4yGGz3dWg
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 12:33:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SmoppO6P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4mJV3q2wz3c12
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 12:33:14 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e0bec01232so4201705ad.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 18:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711589592; x=1712194392; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=SmoppO6P29KsksEWu5Q73xABh0CXSjGs3xK0v7qz9629BM4IXE3YBoicJ8IzZ2pZXW
         Puw+iknABh9EIAg71aGiaGadNE6QLmjLU7XD19LJu0ntwt6YWYUSsovmhz4CEC/i/Ep8
         UuOVgOtzS+SutLBBd4jIQ+QIfHmtq42H8TvZbt0KoOxqm5L06Xt/AuPLfPc4IqZ7yhit
         2w1/UVcuUIKcfE0AQr25c2y1E5vlaO+N/oc4uJIIlbC9phf7brF0LBnvYxe627X5ZnCR
         xcsublyE3Xny4M5tBEt4MBGYYMn4a4rNCe8Sqg1GUNYEmVu0kQ+pzW2GupRyZmfFl6Ux
         0axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711589592; x=1712194392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=uf9wHjnU5HtaV6vnMqE//Edf/a/HfieCUt4uYlwdxYVdyKEXoIR0vF3GZrVGVuLDw+
         igOs4csllIX2vXmHMqAL3WH+6ikrdW33Siz+QIoKA6BPM5O47rwY3avPdXlZE/xQyTHJ
         MEbEqJTl4MoV2E0wOyZ/IMGpvIceJTKlB1aTlcQBSOHaLusznL2/m1Mlq9AC/zyJWHiN
         FJ/zXrV8hSImw/X74I5qW6G71PwcQsFAi2kLA5SFEZxJJnVQxoLieAqAy7+9bn+dd4UX
         iycjfSZC3AGrr608VkUHWj9vojmEKewp236or06au/1pv4piAmn+zkwAbGcPETZc0Pkr
         xjKw==
X-Forwarded-Encrypted: i=1; AJvYcCUEC1ZY42+T+racKh628QetjSc+owwSjH1qsOfsfnJgYlmecWBdwgVjYDQiH717UCsSrLprk39xfL6v5DynomTluyTsJTtGV03XXnRZxQ==
X-Gm-Message-State: AOJu0Yxh5W4MRG5s0YJ7iiZB6xkhZ36hT19Od3B/1Z6KfMHUtY1F3xD/
	KgoaXMk8o9ih1Ef6spGBvRbgoCsHkCLIgPWmISwxeIRyufYn5o/m
X-Google-Smtp-Source: AGHT+IEZEoeW2NdDTGEuRTb0RH18Hq2hYgJ7S9WDoccBaiJjGZNW9oQwol0ryh3GxnsQsqJ4xh8gVQ==
X-Received: by 2002:a17:902:cf4b:b0:1dc:418f:890b with SMTP id e11-20020a170902cf4b00b001dc418f890bmr1550409plg.40.1711589592392;
        Wed, 27 Mar 2024 18:33:12 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-b4d0-66d2-2269-ef6c.emome-ip6.hinet.net. [2001:b400:e355:7eb0:b4d0:66d2:2269:ef6c])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b001e0e85a21f5sm201338plg.32.2024.03.27.18.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 18:33:12 -0700 (PDT)
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
Subject: [PATCH v5 1/4] ARM: dts: aspeed: Add the AST2500 WDT with SCU register
Date: Thu, 28 Mar 2024 09:32:59 +0800
Message-Id: <20240328013303.3609385-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
References: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
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

