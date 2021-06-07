Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B339D352
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 05:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyz3Y5sh5z306J
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 13:13:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XnsM54/q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XnsM54/q; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyz3V3Fpyz306K
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 13:13:42 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso7535679pjx.1
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Jun 2021 20:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DK+LzxMzq0wBGnPJSo6/RsQE1ihBrpOb6kLc3n55jE=;
 b=XnsM54/qkjl2E0a3iShg2NexBn9mvgmWdpGOYKpfCIdIwyY6a++rTQfqWNmmUze3zr
 3fi8f+dA1l1AG7UMCE+yyBjASoUC+dCj1AJsLNU/DDEDsZsy2stgZhvuGCCaFi97SZQO
 nz92vlmuFTMd2GMk454wIQ+yLYnTpyHO2gpFY2KmEJi2gUEkZFqnN53/OAhnKrAa84yo
 wfbcS5DI5tTDt82qL3VfYYw2f6qyY37f5qd1oStunC8ngsBztUrR78ixeqRScvLPXQ1H
 KwUJoQ6yLzkjdgjENy54oDkcT4U0UeugEsQZ4u1k4W7twtgGJ1U4os2ekKCpOWlMGabS
 K+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/DK+LzxMzq0wBGnPJSo6/RsQE1ihBrpOb6kLc3n55jE=;
 b=EFP7kF04SpywRGmrZwAwK3BqyFueH56ryDUYVxrQrImfnDIcR0QprvT7JQU7eGQc9I
 aO/ky+F+hG4+xkbblXNRGm+enHDucfRBVp/M5auyAUNOg3iBINNAJtxWqdGvBpp4ySEU
 Mgws+j5E2YMTvLVziasqeCaeyQ74QEVGjqNMhiwEpX99DAlx+NYgawjydL7m+GT9nC1A
 IjsR6ARn+LxCI8uztnVNsQzXpuBL8+1RQtiufP7UUmrHsEUINoR6ixsv5odwFEOXZABg
 BoDoFh/Xzew7sPrBZVfHzm62HZ5tgjRR9hW014Pn8N+QaFqCfB/9S5iNP+U6h7KpEADj
 NcyQ==
X-Gm-Message-State: AOAM532tEKq2d8KNxND6rpYoW7jwb02TEvZ2s7XaQM0vQZXe4ndNjni0
 Z8uMqBHa2OdZbrPCaeMQjVg=
X-Google-Smtp-Source: ABdhPJxp+Lua5lWWlOdwzAqaymiSn9BGe7NHWIhRr3/2rq3ssg/jd892+kC6QbGKeRZT8NM9ERMKzA==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr30375171pjb.93.1623035619635; 
 Sun, 06 Jun 2021 20:13:39 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x33sm5763751pfh.108.2021.06.06.20.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 20:13:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH 5/6] ARM: dts: aspeed: everest: Add vrm and other indicator
 leds
Date: Mon,  7 Jun 2021 12:42:58 +0930
Message-Id: <20210607031259.475020-6-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607031259.475020-1-joel@jms.id.au>
References: <20210607031259.475020-1-joel@jms.id.au>
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
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

This commit adds indicator leds for vrms, processors, opencapi
connectors, tpm, planar, power distribution card and dasd
backplane and are driven by PIC16F882.

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 270 +++++++++++++++++++
 1 file changed, 270 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index db8555e7abf9..2bac7d1f8a03 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -1400,6 +1400,276 @@ led@15 {
 			type = <PCA955X_TYPE_LED>;
 		};
 	};
+
+	pic0_vrm_misc: pca9552@34 {
+		compatible = "ibm,pca9552";
+		reg = <0x34>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "planar";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "tpm";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "cpu3-c61";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "cpu0-c14";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "opencapi-connector3";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "opencapi-connector4";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "opencapi-connector5";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		led@8 {
+			label = "vrm4";
+			reg = <8>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			label = "vrm5";
+			reg = <9>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			label = "vrm6";
+			reg = <10>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			label = "vrm7";
+			reg = <11>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			label = "vrm12";
+			reg = <12>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			label = "vrm13";
+			reg = <13>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			label = "vrm14";
+			reg = <14>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			label = "vrm15";
+			reg = <15>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	pic1_vrm_misc: pca9552@35 {
+		compatible = "ibm,pca9552";
+		reg = <0x35>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "dasd-backplane";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "power-distribution";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "cpu1-c19";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "cpu2-c56";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "opencapi-connector0";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "opencapi-connector1";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "opencapi-connector2";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		led@8 {
+			label = "vrm0";
+			reg = <8>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			label = "vrm1";
+			reg = <9>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			label = "vrm2";
+			reg = <10>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			label = "vrm3";
+			reg = <11>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@12 {
+			label = "vrm8";
+			reg = <12>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@13 {
+			label = "vrm9";
+			reg = <13>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@14 {
+			label = "vrm10";
+			reg = <14>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@15 {
+			label = "vrm11";
+			reg = <15>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
 };
 
 &i2c8 {
-- 
2.30.2

