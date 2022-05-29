Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24C537095
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 12:51:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wMX4Zzcz307F
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 20:51:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SNlPaMUB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SNlPaMUB;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wMJ11lmz304J
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 20:51:23 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id gi33so16083399ejc.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NgMauWvxEUuOeuS3Y92cUsJTownNgikY7PKvyEqLIJ0=;
        b=SNlPaMUB+7zeMZ40NRYDTHGbFJ7bDg8bNcjtSrbo2g/09zCuKS0mzczq2VajsJFjtM
         5B6l/FIwo+u9FUTS2Dw2RgVb9ud/cTfiUKG7WPQQtbsSxi/74pfHC+BCkiRtAMhokGU3
         wAA0uVLbDozClvVb8yw/H2MSJFnjZIOwIBJeGLlcoo5mFUlkx0VPSLF/pdRZjCtNLcdG
         +V2MmFhUirx6phG6SaHWfuLUMwnxDF/dWDpnVizRe14bsbVwLjTTqcYIiWFXhkW2RKts
         /lnHt8qnGIP1kxLSokpN8qLmJbMw4ri+p8DaJWTZ8SyDtGSbEaN+9a51q+SehkuyqmYD
         O5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NgMauWvxEUuOeuS3Y92cUsJTownNgikY7PKvyEqLIJ0=;
        b=K7eZTj7zE8wROX3+k+S/EHHXROeWHf8noRh40nhTMz6VDmKTkJZXbWvSdrJ0AT6SEH
         +5aNKizKbBm6/Mxq7gsovT9XeiMT1a5hb2L5r+saYfaAgHuBfpYycGWutiIw/g6GwWgX
         ZZwAvA5xLcmsJv3Fjl7GRiZmbdD+ahd2SZyVWpJP/UIAU91lQA9y6CuubNRxvnQo+/zP
         CUbo69TGInjEPKkI1u0R5elMsPndlfLiLUtCgoZgBpbvzqgfzkowmyuDJg+9QgRo38Bf
         f0piQXdG943zol2iS2H+7t8LvKptU9OpRU8i26Tew72FaJa80BZDH49bEbUMxiO9HqP4
         rSsw==
X-Gm-Message-State: AOAM530ae+f3dSCJ5noDSpYHaKSaRcu+D6NY674mk4vGSvSnDWIAzlxv
	KcV9StTS2UYFCIb24Ht5XghukA==
X-Google-Smtp-Source: ABdhPJxhghDhXPcQraQ2UX4g1HUR3BAj9m0/Qjzp5NPytdTY43MUPg3GjwR3iLHl3b1OD9CFysiuSg==
X-Received: by 2002:a17:906:9743:b0:6d8:632a:a42d with SMTP id o3-20020a170906974300b006d8632aa42dmr3476540ejy.157.1653821480511;
        Sun, 29 May 2022 03:51:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w25-20020a50f119000000b0042b0fcfe966sm4746991edl.37.2022.05.29.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:51:20 -0700 (PDT)
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
Subject: [PATCH 6/7] ARM: dts: ast2600-evb-a1: fix board compatible
Date: Sun, 29 May 2022 12:49:27 +0200
Message-Id: <20220529104928.79636-6-krzysztof.kozlowski@linaro.org>
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

The AST2600 EVB A1 board should have dedicated compatible.

Fixes: a72955180372 ("ARM: dts: aspeed: ast2600evb: Add dts file for A1 and A0")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts b/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts
index dd7148060c4a..d0a5c2ff0fec 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts
@@ -5,6 +5,7 @@
 
 / {
 	model = "AST2600 A1 EVB";
+	compatible = "aspeed,ast2600-evb-a1", "aspeed,ast2600";
 
 	/delete-node/regulator-vcc-sdhci0;
 	/delete-node/regulator-vcc-sdhci1;
-- 
2.34.1

