Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A8B80E539
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lslV0rYh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9qx2ChKz3c44
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lslV0rYh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qc6nLNz30Pr
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:20 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d32c5ce32eso9183505ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367658; x=1702972458; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHK3yF+RxEWhkQj0oQiehpX/wc8FrqHwrN6Jvm7FyVU=;
        b=lslV0rYh9oK+M+zGQyMODyeNvSKpjhrGXAkaMfIi7sm3FhYbcrmRxIE3W8VM2QCiO/
         p/qY9c6N7Fe35nDdTNHcHyMK4c0Z/Tfkg91PORFgwifFBXwfKeRjwJeUC/Vm4LtCHyNb
         FGKVWtUob6KQfmDTCf0zCLXHHaNi3kSoF3qaczrTRXB6HVUZRaZf/UYu1y3okDu6DBwX
         YsvsjEW7iP6Vg/fjF7w4lx1bhlx4erDkhw2YvV8vd+Q7bGFzSgZq8Wwo2eaQDdV5x8IQ
         +uHr0vOmUGpgb4CZgNohp96kf6eRVnleQt5XtTUhuXoZ33S9KbcTvYWEa4CGke6+CkD5
         NG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367658; x=1702972458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHK3yF+RxEWhkQj0oQiehpX/wc8FrqHwrN6Jvm7FyVU=;
        b=CKLEBBgTpPHFqUrlWvB1QKU3dxAOPAx4hv6BKDv35bWwPIyXeEvSr3DWWO4fJLWKog
         4Dd2zPbmRqFpeAd1iEFHIx5LfMukvCJLN6DlcmFFJ4ONOG7hs5r6pffkHA/PtRNpivko
         xIBiUxFSpLgTZiGxDc030Gb48UdO7QSVWJ+rVjjm3V2CsDfdrTqo6aYbCFQlaGqU1N6C
         s1vus+oQk8YW2JV24gWB2E6Yu/1NYp7+iUUjTmbEVcQ7iyyCXP4OQ15tNE23Kw/dM3jp
         SyoYHx0gHRn99ysusWLzVN05p5YWs71hhzrLzIKrwPMEDLdNfEa66Ky0nQJHDjyIXE5e
         N+Tg==
X-Gm-Message-State: AOJu0YxB9NAlt1sSnfy0JUwOFY841lOC1JqLTtFh7gmzBrWBk+2Jbayy
	eH6Ngpngmx+JfWAquO2kRV0=
X-Google-Smtp-Source: AGHT+IHfL94iq6tfgSml3eIh4XF0ifueCrBJMXSaicX+WmA5/rXwJDYCuVr3HYJ2SB4JyYi4ZAuA5Q==
X-Received: by 2002:a17:90a:c90e:b0:28a:bf87:90e0 with SMTP id v14-20020a17090ac90e00b0028abf8790e0mr603993pjt.22.1702367658484;
        Mon, 11 Dec 2023 23:54:18 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:18 -0800 (PST)
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
Subject: [PATCH 05/11] ARM: dts: aspeed: minerva: Add temperature sensor
Date: Tue, 12 Dec 2023 15:51:54 +0800
Message-Id: <20231212075200.983536-6-yangchen.openbmc@gmail.com>
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

Add one temperature sensor on i2c bus 1

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index ee9691647e4a..783d4d5a8f3d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -115,7 +115,12 @@ &i2c1 {
 
 	temperature-sensor@4b {
 		compatible = "ti,tmp75";
-		reg = <0x4B>;
+		reg = <0x4b>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
 	};
 
 	eeprom@51 {
-- 
2.34.1

