Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8D868658
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:48:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lPLT/TN3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL3k4slMz3vYb
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:48:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lPLT/TN3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL3H0xKJz3dXM
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:55 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dba177c596so23679925ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998473; x=1709603273; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrsvdI1lEYG0uIgU/VTd61D6Q1rZXhoZ89VFb5WgrsQ=;
        b=lPLT/TN3AslAiL8aY2ElcaKPCq1OvgYpmzzcajnoRqyV9kYonzYuQOyhkqDcLyAO9c
         ie3cJLQSc+m/+Y4BcB8/VIY//owqzJ81oC6Hw4KPztg2yIgGs85MShQ7OftZN3LxHvgJ
         D/C5JesQugtD/makRnVWdvQAkk7tkREh/0DFZJOmt7NYkwQNdxSrjCWppri7iDMpLnsi
         I1evvoLsrhJi5sdAokry3CnVzhpTy06ypF8YK6bndaFsThaNPK5uT58ZlyD/tnrM9OEt
         NY1lXRCHbnhUcO9hR0sxSouPlwFzNfURbP8UT3Jk/eRuK3D1upnE+MwYr0qX612khO0S
         4a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998473; x=1709603273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrsvdI1lEYG0uIgU/VTd61D6Q1rZXhoZ89VFb5WgrsQ=;
        b=d60ZnSCk4MoofQG1RmqU+r5qrwjVytuzC5YpaH5W0TW00ihbhHm9CCtBLuSnW1Bs1f
         Rfwh/ewwnI6SI7vg25sqSw3SBmcCcqLXw5QmTm0dgyhA2Xu9jZuK9u78yghCf6dF+zeJ
         bT8bbfK1IBCfSYi49Gd7HTnjKKRLkEbnvp74QJqXaUfxD2PYUt23Yfcgf9LZmeSZq82I
         ComAE+5qD2jMcozgOgepJLJVHpivUAvtGdfIZQpU8rtjP+NE4rS5rEZCdDppAf3OjllM
         k2q16zuRzBmLEkb09HJOKvCGq6Ia94KUIbU0WpVg387Ar+jlR76tAE0X+R+QAdzv5wBU
         ggOA==
X-Forwarded-Encrypted: i=1; AJvYcCVy6tHRsUqF8XaWS/0hTJXnGwvM5vTMAl1rtBlsSXddnDqM76D3eICiyqcXZLApW4bDl2rTP3+WEWhIVrrr5gGR3BuTXZeYeCmDwnZQ5A==
X-Gm-Message-State: AOJu0YwDceuoTI8QR6oZ7CuRQUYkt3z+EGMYBr644eDwtBDW1wUGbx9b
	ViVOyU2Pif2e16ota4gEOycjztf5laA2oKcpt045Xq5jh5UvvmOR
X-Google-Smtp-Source: AGHT+IH1epM57xXjOkh3hVvEgpaSGXhUd8RokuHIrZStTeRvVbdlTK3D3B+Zt3WIw8AxLNLwL73gNw==
X-Received: by 2002:a17:902:c946:b0:1dc:8546:1584 with SMTP id i6-20020a170902c94600b001dc85461584mr10319395pla.0.1708998473472;
        Mon, 26 Feb 2024 17:47:53 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:53 -0800 (PST)
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
Subject: [PATCH v4 10/10] ARM: dts: aspeed: Harma: Revise node name
Date: Tue, 27 Feb 2024 09:47:19 +0800
Message-Id: <20240227014719.3037588-11-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

Revise max31790 and delta_brick node name.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7dd48c384a4d..530f69005857 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -192,7 +192,7 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -218,7 +218,7 @@ eeprom@50 {
 &i2c2 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -262,7 +262,7 @@ eeprom@52 {
 		reg = <0x52>;
 	};
 
-	delta_brick@69 {
+	power-monitor@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
-- 
2.25.1

