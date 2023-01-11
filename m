Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435D9665A3D
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 12:32:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsQWv0Vqpz3cdX
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 22:32:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X7aXjMRt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X7aXjMRt;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsQWj6Rwbz3cdc
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 22:32:16 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id b3so23071238lfv.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 03:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejDLZHen3G/A6i6n+Ga6Cs9tUQnjBYCtgzbxnqhm2tw=;
        b=X7aXjMRtKGAVT6uPuey5EJm7hw1MAJnqeZKj2DDtFNzhg1QB4q9AwtjUcNRgyTBdR9
         /9/XHgVQQCyUkLQnlHcnBMD0xF9ul2KtjRX50DQZdKuPV5W13PluEfAZ2adDYi35FmKJ
         QDWO+TWR7fN5cFpMEIll1XM7gze4K+HuFhD76yExvSvFNMev3ru+kuJ1YqYA+IZQk8zY
         U5+xRDjvTaPY1Oj/climp0u2KVUTNcDuJ33FuTQzT3sL6Mk5DNuvdR7oqh2dUW9Ub7jc
         8dLqU5N+AG8zoAhMTtrxKt/77TCbXqZAJgB+1eLXuDoQyOgpbu7uzVI9zbYl09NUtyaB
         jErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejDLZHen3G/A6i6n+Ga6Cs9tUQnjBYCtgzbxnqhm2tw=;
        b=ShHeekg5EN0e97r+5hoZ8VCupox5a2L7JIl+nI10VsT5tqYlc9ltxGn+QtESt8sgbS
         E7ZB28ywsvb0Y9x4U+YWmjcPViKGKjRBXUABgHs6Xcrf8eKpfJjcXnW0zMM3LmcyLBu6
         wnBE6GNUp7SZhD3sQOxjoKE2QgY96h1/I19xA5yCTE8JEJbn+z727/mcWR0RXvOWIFrv
         XxVjmM4SiRK8TFzNy0Zq1anY30rTi+7F5zM4I1XgvV1hFx7zN1LI8PuxL9wbj6Xa/Il+
         Ry/pHp6Ghx+n8v1ux4b5AuLJx0d6A+CTuBo7pXuS1s4nPghYoMYB1MjYnCR2W0i/kkfL
         8wdQ==
X-Gm-Message-State: AFqh2kqVHCvH6RPgcSzKvA2cPyk0yt/1SYfqCpMZbJSHyYXlf77+8cpi
	NCFJQkPwUKJytmwhp3gHFj4=
X-Google-Smtp-Source: AMrXdXu9YDss0dVZtYQFXpY41w/3GimjvTmRw2wmCHbYfIj1HxEbAv8V4Rnwn23+U6l9W4DT/zSr7w==
X-Received: by 2002:a05:6512:2356:b0:4b5:6417:43bb with SMTP id p22-20020a056512235600b004b5641743bbmr25824268lfu.51.1673436732415;
        Wed, 11 Jan 2023 03:32:12 -0800 (PST)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id h3-20020a2ea483000000b0027ff22d93a1sm1729589lji.1.2023.01.11.03.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:32:11 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: ethanolx: Correct EEPROM device name
Date: Wed, 11 Jan 2023 14:32:08 +0300
Message-Id: <20230111113208.964-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Konstantin Aladyshev <aladyshev22@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

BMC on the EthanolX board uses 24LC128 EEPROM chip for the
configuration settings. The correct compatible string for this
chip is "atmel,24c128".

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 889b2fdd19cf..8d84dcc06221 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -161,7 +161,7 @@ &i2c2 {
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

