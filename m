Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C8C537093
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 12:51:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wMR12DTz3blc
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 20:51:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CZp/I0K3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CZp/I0K3;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wMJ0wbQz300B
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 20:51:22 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id gh17so16056711ejc.6
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qgQq5YY5g1jPHR+HWdKtiA4Zjs/eV4wGZhb7rjwkR2c=;
        b=CZp/I0K3BY1MJhVXmiwcSl4w55kavz2JEgA9VVfOUNFe9TYHUEI9o+r6NXa4RRh06P
         M5Xmqkws+7WycCGLkbBVkeaW86bvoAR5S/kIn38WFdB8haiYQLILehufzOYpLXeu/TOA
         uIvEJ+X8NKoFKkcN9Bwskyh6rraK0WMKWAkuUbc6/A0OKtkjij745oq5KYqRuohdXiAn
         1V2eG0z9mltbHoD5rn24y7OJrjFfF4NV5HlMORcW4z7T4tZMhJpe8YoxVp7JXhmnC03M
         fv2zvYOFGoo82UpCc779fZve3dkYARyOtE70iY92QUTgXpoq0PAlkMDHM9vAWU25/oYB
         RbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qgQq5YY5g1jPHR+HWdKtiA4Zjs/eV4wGZhb7rjwkR2c=;
        b=flhywt3jsp3Mn7DV23ACrSBY/NvsWVHJTACxwxVtk8hMa0fWBOJdRmDp5rKrNLblC1
         112qGFWWFLYSUaI62UT5LY6P+42kDMwuV0gVmzbFwgRXIKfqWLbQAWDW0TW044yxzw+7
         R+2RGMeJkAULzGfDeL2evhgTyO/u7SdunXtZOjIRyCVXp/TZeLl59DFPVFL/edfsGXtP
         /G/1ywtLGfjjWftLxD8yBkGOkcXDlRrqBL8K6Q33t4xUO8ssG1Y0Up0btCfQmv/szBD1
         urWoz7OMRt4yZZHzbcThyKMqqWZVb8m+na/yi89Q2RtjX//Dj9C1veK19Xz2mMWOT5OP
         9AuA==
X-Gm-Message-State: AOAM530QEbafJ5rwLc+G1iWb0ZqzszNrQCZejmff5D2o+niGuyQfkiw5
	8g/fqnE5TfBHpUEOtEJXrW54Sg==
X-Google-Smtp-Source: ABdhPJwLrlyqp191ide0tQO3BUOEryml6g7D35IAw9JkMrAdj0vMgCpLMo/FFIQ2sXKYs9UF7t4QbA==
X-Received: by 2002:a17:907:7207:b0:6ff:d25:ee3f with SMTP id dr7-20020a170907720700b006ff0d25ee3fmr20068800ejc.389.1653821478248;
        Sun, 29 May 2022 03:51:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w25-20020a50f119000000b0042b0fcfe966sm4746991edl.37.2022.05.29.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:51:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Ken Chen <chen.kenyy@inventec.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: ast2500-evb: fix board compatible
Date: Sun, 29 May 2022 12:49:25 +0200
Message-Id: <20220529104928.79636-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, David Wang <David_Wang6097@jabil.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2500 EVB board should have dedicated compatible.

Fixes: 02440622656d ("arm/dst: Add Aspeed ast2500 device tree")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 1d24b394ea4c..a497dd135491 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -5,7 +5,7 @@
 
 / {
 	model = "AST2500 EVB";
-	compatible = "aspeed,ast2500";
+	compatible = "aspeed,ast2500-evb", "aspeed,ast2500";
 
 	aliases {
 		serial4 = &uart5;
-- 
2.34.1

