Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE9D399AF2
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 08:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwbyB2Gctz300C
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 16:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=migFXa5B;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=migFXa5B; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwby62VRKz2yXh
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 16:45:49 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id t21so2391012plo.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Jun 2021 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gOVaeGhINvElngXqcXifFrg2yoy7oF8xU4nLOJbg6Zw=;
 b=migFXa5BhEz3W4VoYl+s3uispNKTXoBZe7eZNz/FlQ1Oa7bLAdBl918xxzPt1f9LTc
 2coffXOqLLr6+81wiwVIA24+BB7R8Uc3jiMhtGjg880B2XFyHp7vVVbwIrhZ5TUCtXt6
 tv9ryp3hE6FiJ/a4pLOM6Dpr2MTmh8qsoxautiZbYkac6NaJlPg8evoi9xFsdR3Piv4Z
 wccCnDH0pI3z3vbV2W6P9wRqcv8TXspdtSPH3de4HEIVNp9p5lAiyx3ZkKvEtEmDdGpR
 bzsDNYDl1nurjrb+6iJL22o+ADodITMrnqsVt6Y2kx2qQDAo1LiSe3QGD76AdmH/rbSu
 IVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gOVaeGhINvElngXqcXifFrg2yoy7oF8xU4nLOJbg6Zw=;
 b=QaXyfI1VAyIQ9vFFPk1I8O0q//TFau0bhWdAzPAOf6LYVjkQJhD9VP9nKAqeYIquEM
 4gqtVVhnRN88k6Puo7Lcps318l2Y14Ap1XngeTH79qABPTISN281pMIrUR06rLHlnClM
 1S+qT9nV8mzrHCjUvodmMraLC8olNGmekTFZsKKkuQx5tYpyoqqRHxrJRQIK/VRPbgfp
 /JwensSWTwvpRlNQRQ3X/c7rzKuQEKOQW3zYB2NQppf5QsJud0dNwWoZiiz1qBUr5vAC
 OUXf6Gsw8FJvSv6rDBFBQstPPV6cGDIXXVSOj2ocEJUUwXeLXi5AfbkxmmM/V1IuHSf8
 ZRMQ==
X-Gm-Message-State: AOAM531UFaVg6OKaftt1vZDa1dGtsVd+zPRU5N+O3/Sk2A9gpc0vV1zo
 IK2iU6GnHWRtPHPq61NRVpdiMbrVELA=
X-Google-Smtp-Source: ABdhPJw/aeX5rR9jZj3pDE2QrPHYh2MTEhkiZHmV3lZZ9QJ4T0J2Y4j8EiLsAiErQ4EUlPiodvMMVQ==
X-Received: by 2002:a17:902:aa95:b029:fd:8e4a:f341 with SMTP id
 d21-20020a170902aa95b02900fd8e4af341mr34214783plr.78.1622702745304; 
 Wed, 02 Jun 2021 23:45:45 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t17sm1156210pji.9.2021.06.02.23.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 23:45:44 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed-g5: Add SCU phandle to GFX node
Date: Thu,  3 Jun 2021 16:15:36 +0930
Message-Id: <20210603064536.165297-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In v5.13 the DRM driver gained support for using a phandle to the SCU,
instead of matching on the scu compatible.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d733c1f161c1..329eaeef66fb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -264,6 +264,7 @@ gfx: display@1e6e6000 {
 				reg-io-width = <4>;
 				clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
 				resets = <&syscon ASPEED_RESET_CRT1>;
+				syscon = <&syscon>;
 				status = "disabled";
 				interrupts = <0x19>;
 			};
-- 
2.30.2

