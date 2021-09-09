Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CBE4053CC
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 15:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4zzs1c5qz2yN1
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 23:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KFmFzX85;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KFmFzX85; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4zzl2ZCKz2xXP
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Sep 2021 23:16:34 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id j12so2915519ljg.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Sep 2021 06:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0CDO+tNDKR7sAS9E0dGNVhCsigTKCV2xMySlatffqaM=;
 b=KFmFzX85xkkXJWCuj3RMXSrO8cwW6IYyEktcfF672pWiA5Zc4VCmmYr0vvafjoJBFe
 syvkIikNKLmFTmHWzY5PZXQurs7kV9NfFuLLkwr89nk3csP6PkZILkopZVK8RfRsXQ32
 OA0S63l2F/Dp7gVPQpRkUhWrMEPPC1/CHtOCmOfnLEZSVevJr3iDoslq14CJGO/oSCPn
 LToPo6wDP59IpcUPjUx29c/RDTVa6V6gXCAetyycXOFYuOVCrank1K+xlFRStbdBDtn+
 HyAAvVdfWJ/v3qXLiGqna5WrcHP1OHprVGiOJk4dOKQC+vT/Y+2NjFo1CTJ+gcRZf/oX
 lQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0CDO+tNDKR7sAS9E0dGNVhCsigTKCV2xMySlatffqaM=;
 b=ulDf2oWNu7GMc9RkhB3/SUhY0fmE3GoDLRtGesgqGPozkiP7d0yJCdkrijzFkb+npq
 /SS4d99ZVNCvVW2eWjVhmIDFbnJxFO5wdAFYdofcTz9dQ0LIyFZZMMI2giK+JajLVLzh
 LGFxYLE5KiT+WEFE9s2LJTYDfZZTsnb2EcK+CB/CR4gspGS8xFB9EcrJawUZ4V2AYgQM
 blPvmycF62uCI5VLkJfZYT64IB4IBLk+NOwocN/X8xRy6x1mVtLMibWNHMMFv8/lvQ7J
 J2/2S+Fxgb59Yv270FSbBO8o3zcLS8QG31TjwMHcrQt6CxiYJDanxY/IgAZooXVryjun
 d5NQ==
X-Gm-Message-State: AOAM531QliHIyj2X8JATbXogfoHHCxLhnChQQokiGFF+hjvkcuoT9yuo
 oFv3ApVHkq494CkbHcemeFs=
X-Google-Smtp-Source: ABdhPJyoKYKHyicTn1KjyPbjopD1FldRscDaiSzCwaDkeHsqC7bzAvGyGYwQbNQkf9/a6Oac55Cl0Q==
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr2238411ljg.324.1631193386103; 
 Thu, 09 Sep 2021 06:16:26 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
 by smtp.googlemail.com with ESMTPSA id p5sm197745lfu.272.2021.09.09.06.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 06:16:25 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: aspeed: amd-ethanolx: Add FRU EEPROM
Date: Thu,  9 Sep 2021 16:20:48 +0300
Message-Id: <20210909132053.3919-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 aladyshev22@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, supreeth.venkatesh@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

AMD EthanolX CRB uses 24LC128 EEPROM chip to store its FRU information.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 79d17841b3d7..6406a0f080ee 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -159,6 +159,11 @@ &i2c2 {
 //24LC128 EEPROM
 &i2c3 {
 	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+	};
 };
 
 //P0 Power regulators
-- 
2.25.1

