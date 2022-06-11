Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2550547380
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 11:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtbD5247z3cg5
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 19:59:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I3jVrJeQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I3jVrJeQ;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtZl6kz8z3cFF
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 19:58:54 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id y15so1528576ljc.0
        for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qqG1jqR6TJ+ossn/Taa42wkdLkXZRIkBpKhqix1o0Nk=;
        b=I3jVrJeQfeeEUpRXX4j3bFLN0JDYjpr2/5CF5Ik1W8de2CQMNAm+DQ8l6O1LxRezCl
         GO7TAEVgwFdIyUxbkSZLBQQHjW5fbDzNuW6cGfVBRkFFOGXg1qUGscG1EiBXj/Wl3huE
         YuvsuRlKxsEPGE3Vt5q8+Sw42lqCnFmfeYGCZJFaa2PyufPGXbvbYxTPYy2C4WxHkRs7
         Jw/k4KuQogmXlcH2SnSQC1wHD7JdEYymLagxxUuXNYWqzIR5LOOptL92cp1tO6Cg/I+1
         R1+B+04LJC13sj0LyVR5KGxpSaD1k7M2iPIhk0tT2uLZgrQjWgzod6uPTCXPWAh3c1/P
         CZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qqG1jqR6TJ+ossn/Taa42wkdLkXZRIkBpKhqix1o0Nk=;
        b=bCWmM9oeLjtswxDroatS9I2EW4LqsGUseA6m6VzTMI++Q1KuhUlgTrFsfcCFnuMLCs
         FbkGvzA/wmo34bzPESh+e+Eadh0Xr4a0iAR/kYqutap0AeFYpzXqndNC/A00RLVtyUx0
         ADyPpZVazhGPD3LC+NrGqsRWznA3Te0tqD0I1rT/oDJiUcfxyMhTwqT1eyEyWBhf3a3g
         l8w1Xp+bBWH9YywiOjiWectB4Ah6cfU4VTx8htOhEFYxvjaAxn42coq3RRG8bsUvRi/O
         afYT35YqWj8DewJXvRUUq2JAP+JKjWGWqsxPUKAxTKGIFKWSHZFM8oFgpxmaz0hjga/q
         ensA==
X-Gm-Message-State: AOAM533F5HRBWZxa/GExpiDW4cYG91Y4zywniRoHwoRVq5Kbmx2J/Fz8
	5svhHqWsE5oXcw6qbs4Qhm0=
X-Google-Smtp-Source: ABdhPJxbCZOKur9tOGLWFf7ulXImGftDF4a+Z/DYBqIigxmKroh1yds8o/DKWkS8ynJgTeWngkHLfg==
X-Received: by 2002:a2e:3112:0:b0:24f:132a:fd71 with SMTP id x18-20020a2e3112000000b0024f132afd71mr64922689ljx.522.1654941531058;
        Sat, 11 Jun 2022 02:58:51 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-90-154-71-254.ip.moscow.rt.ru. [90.154.71.254])
        by smtp.gmail.com with ESMTPSA id h18-20020a056512055200b004785060bad6sm200634lfl.201.2022.06.11.02.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 02:58:50 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 3/4] ARM: dts: aspeed: ethanolx: Use correct driver for the FRU EEPROM
Date: Sat, 11 Jun 2022 12:58:27 +0300
Message-Id: <20220611095828.1090-4-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611095828.1090-1-aladyshev22@gmail.com>
References: <20220611095828.1090-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, aladyshev22@gmail.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, supreeth.venkatesh@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AMD EthanolX CRB uses 24LC128 chip as FRU EEPROM. To bind correct
driver for this device "24c128" compatible string should be used in DTS.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 0354a7d8f9f5..428fa9f673f9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -163,7 +163,7 @@ &i2c2 {
 &i2c3 {
 	status = "okay";
 	eeprom@50 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x50>;
 		pagesize = <64>;
 	};
-- 
2.25.1

