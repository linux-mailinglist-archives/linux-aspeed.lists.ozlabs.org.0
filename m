Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161553709B
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 12:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wMf2vHYz3blR
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 20:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SAEms0Q0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SAEms0Q0;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wMJ0yxqz302c
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 20:51:22 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id h11so10238114eda.8
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=32oRUurEdVyP4eLrtlvGULHRT9DbX5ENH78v/cdn0oQ=;
        b=SAEms0Q0LQZLuwDZwbGR3iLBzbV0o7Vp81Z/09GtFOGJgCesGjHseBi5RXC7IOjlJW
         8p8X2mz/+SR7ye1/YPk0rKioOlSjNQ/mzLuZJwoSgdXDa6YJenoY96r+4S20qtT58cnl
         vFpDkgzHomMrDPKgtn+xov2mei0v3oTWwEYs3gfcwfcx5HgENS8bouVTA7dnzDkp695t
         zdSCX4aU+LAyJyou81uLEmuGhZFPoitiheaBtRV6YXqBtsy0KSAIrnEvfocFflrXxQ2B
         LakVs5iA3bFVj4KtDYFyDQtwX5VCdmaqjLEK0sHo731eqQPN7GLgmdKO12mu+R5BhpEU
         pAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32oRUurEdVyP4eLrtlvGULHRT9DbX5ENH78v/cdn0oQ=;
        b=O5Hr1oDKLhZOAxJy82BH/xMsS41mkUGnfyoEuEJp0jP9ZBaUFomOsqdygt2QBikbtK
         4yVFzfOaQSCxU02t8SL8ucC8MUqzIigSl7N6RoLGh8JsTqdSwfZaYSfBDGAMvD5eCuaU
         /yw7T7WcPo9QiZZhwFB1CUajVJoI2JDzV1bhwF2TA3mNRJwi7m3N/mmYuAr6lhFh2z8P
         tYIlaElw9spywIzVkm10gx4vc3eW7HR4BPXDj9REYcaDFQgaDQ/O8PxEldxh/GjtPiOS
         goWj/yns0QHDCfJhhLmsh/UiK6h9RwoMJlJVtYM1Oap3wa9MvAN926F8mqGSHMxHrtft
         Xm4w==
X-Gm-Message-State: AOAM530Q4dUvSZr5YTb3WVb9MOp2fbteg38jTYrKIDq1uPvK8XXg0LIN
	uUIWW2V+iKGmWhYJDgoDg8mtEQ==
X-Google-Smtp-Source: ABdhPJw8d7g2sDkHVBAzTeeMMRQh/0/LdRPavHItYLCzqxQjYX5Jrw7uPOyTtPJx7coy/d5zXNCQPg==
X-Received: by 2002:a05:6402:34c1:b0:42b:4047:20b8 with SMTP id w1-20020a05640234c100b0042b404720b8mr41562410edc.88.1653821479409;
        Sun, 29 May 2022 03:51:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w25-20020a50f119000000b0042b0fcfe966sm4746991edl.37.2022.05.29.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:51:18 -0700 (PDT)
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
Subject: [PATCH 5/7] ARM: dts: ast2600-evb: fix board compatible
Date: Sun, 29 May 2022 12:49:26 +0200
Message-Id: <20220529104928.79636-5-krzysztof.kozlowski@linaro.org>
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

The AST2600 EVB board should have dedicated compatible.

Fixes: 2ca5646b5c2f ("ARM: dts: aspeed: Add AST2600 and EVB")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 5a6063bd4508..c698e6538269 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "AST2600 EVB";
-	compatible = "aspeed,ast2600";
+	compatible = "aspeed,ast2600-evb-a1", "aspeed,ast2600";
 
 	aliases {
 		serial4 = &uart5;
-- 
2.34.1

