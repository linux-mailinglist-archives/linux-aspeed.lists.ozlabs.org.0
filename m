Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1B88C61B
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Mar 2024 16:00:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QWPVWo8Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3tKL2P8bz3vZY
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 02:00:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QWPVWo8Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3tK80MyGz3vYt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 02:00:43 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso3887820b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Mar 2024 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711465239; x=1712070039; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=QWPVWo8ZSQCiQX9ase01RL5l/cpgEETAlwkYMYicpE3OlELFXK9zVVQgYpeBrUFYyh
         4j9iyxDCq6OPERVZGtO/rwJKlsOwAYxGUN1EMncs53DF7Cje1dIqDE9JO/fQURqeQXc1
         cR/Nl08BnfOVZmBI+enHsvF9cZlD0nDQpgYklhER1wPx/E9lmg8QE8qXK1jdUSf9q8Xm
         5K7kOWBmzE4Jy39I6Psb2knIj+pcZGM9RLxQ18UddaLHJW0Ay7iGa9QC3SxLrbOUKvbo
         qszMSZFKTE8AVv3HSmM0ZMMhqPMrw4FOqvnRRifsIgBSnIA7JuYYxkjHNkQA+63G/y8O
         rNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465239; x=1712070039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axYCeiGWmH5zGIGoROlm87X0Iv4FCoHgVdnjtyDTc9Q=;
        b=kxJmJXSWu51UB2l+yiiTuMdERcClVmlA4APvHPsDNt0ZOYgT2DhvyT0SbHgbpbb8eY
         n2+vWyW5jjtP1SZVMGz5Lp0kDeThdYhVPKZRxZnb3G1koHp+M1b0I9pcaHp/oXVpolbL
         u5A7GeR6/R3hfYbW0FWftV4x9YTJc40H9+5+Pe58Fvw9Q2geKwCUwlkl4D8Lng7/vSke
         LWtPwPTnt3djsmw1affP6QAURoR+gr1Hh4wHKLc7nA4t0vdxW2bW1wA8/sEYwJ3XisVb
         2DeoxH4//ofcvj9bVxXHNIs0cFl915AZDIXhQykvpi318jrcydtdVDlMl+WIScCxhnPJ
         CPKw==
X-Forwarded-Encrypted: i=1; AJvYcCUVfnCxMtz6kBv0YG3TnkRCpk3Z09JDnaK1Lr9K4dMJ9jXoFV5QuzX9IJShDLsa62fw2j5E5Ebncgjgo+vhQnuYkrSLboTrbt+TnXPyig==
X-Gm-Message-State: AOJu0Yy1buIviJB6Ub8/ilOB4YsaqrvqisfY2KsWDx4GFlTiZS/8imnD
	YEvwu28bjv8RxIzFUHM4qbnR6ZbHRTyaBbGvSKcCjflRc6kLJOqm
X-Google-Smtp-Source: AGHT+IF0agEOL3Fig3++nGEEQ7VbXvH89pPROnJTx7czX7BhvNTMXX3BGpNPSZ/xbiPnOM52Kd7b+g==
X-Received: by 2002:a05:6a20:958b:b0:1a3:dd51:1922 with SMTP id iu11-20020a056a20958b00b001a3dd511922mr1436278pzb.7.1711465239120;
        Tue, 26 Mar 2024 08:00:39 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l27-20020a635b5b000000b005dcbb855530sm7658404pgm.76.2024.03.26.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:00:38 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] ARM: dts: aspeed: Add the AST2500 WDT with SCU register
Date: Tue, 26 Mar 2024 23:00:24 +0800
Message-Id: <20240326150027.3015958-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
References: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
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

