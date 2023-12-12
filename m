Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C980E536
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jwmY+Oeg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9qr5hK2z3c2b
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jwmY+Oeg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qZ71LWz3bt5
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:18 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d8029dae41so4141592a34.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367656; x=1702972456; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wECkqtuJuNq4vKf49CMC3VZgJYROzMEL16NeUTjnLOQ=;
        b=jwmY+OegIoWDYIDjjeUZxL6NhFPJvp83YtWYTtOr/rmH2vE1Voa8jXTEqZ8XDIq3s8
         OScoZpc5Xz3i8vfmMh07LoST7iL0Xyntq9Lqb2Scr/bQgEvLyOiSqAIR4FJ+kVkYpR6V
         t2vagzjB9CzU7HZoT1t2u2NsfBQSbFg8SuETVQ6xpqmYACy4mFcWIhtw3IvbAFtNM0C0
         UU17tTCzIuqM9k9F+G+bzwBLUuzsvPai76AcUD9cBljAKyTz0+bd8vTmFL0A4w0ya77p
         t2iIkLkrIOz3jB3Qti3b1u4pRJsBDl6POcK+ngEQGZ3hRiqbgjSZpi+fqATEUviWdNBh
         HxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367656; x=1702972456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wECkqtuJuNq4vKf49CMC3VZgJYROzMEL16NeUTjnLOQ=;
        b=EzoxlMsRGuhRQWJnzdnVAkYx47RlgDDFyNv0u8derST5EH3cjHGTW0W6ONoizNBbpE
         iBkEBFMzEoucGGv8AgsO56swFUXSlT+n5Yq3N9uAYqNY72JaVEIfiGVCYJA7WqC/+BFX
         7zEAMu7uV/fkmg8NTOJJvbvluJx/1hqgjj/ckDv7u8ic/K5OJU+rrzeRhIQ35ZsklMwM
         CMfaedpxnd1/jYjOJRAUV6hDeZD2w/grjI33f0aXMk+Zti7A7rPsn2Uk92DXe3VJx1yi
         a69431anlaAlivorhDzhfHOGL8rw3YhUqwgJ7wMfp7fWQ4CZIXUfADPrX3LCMXucMWOV
         teDA==
X-Gm-Message-State: AOJu0Yy6aUG4H0kWddTOz7zXRXq4sIo2k0zkypuq+w406HO740V0SBFf
	2o2zvgiPppOKZ5Ub5zCZZFA=
X-Google-Smtp-Source: AGHT+IGQGVQfpsD+7aVeGROKJ2gCtJW313/hYWDkA6RE83+q24qAb7TXxK2YreBWYGv+y6b18OOdJA==
X-Received: by 2002:a05:6808:640f:b0:3b9:f10f:b69f with SMTP id fg15-20020a056808640f00b003b9f10fb69fmr6399289oib.11.1702367655768;
        Mon, 11 Dec 2023 23:54:15 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:15 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] ARM: dts: aspeed: minerva: Enable power monitor device
Date: Tue, 12 Dec 2023 15:51:53 +0800
Message-Id: <20231212075200.983536-5-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable power monitor device ina230 and ltc2945 on the i2c bus 0

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index ad77057f921c..ee9691647e4a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -86,6 +86,28 @@ &sgpiom0 {
 
 &i2c0 {
 	status = "okay";
+
+	power-monitor@40 {
+		compatible = "ti,ina230";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	power-monitor@41 {
+		compatible = "ti,ina230";
+		reg = <0x41>;
+		shunt-resistor = <1000>;
+	};
+
+	power-monitor@67 {
+		compatible = "adi,ltc2945";
+		reg = <0x67>;
+	};
+
+	power-monitor@68 {
+		compatible = "adi,ltc2945";
+		reg = <0x68>;
+	};
 };
 
 &i2c1 {
-- 
2.34.1

