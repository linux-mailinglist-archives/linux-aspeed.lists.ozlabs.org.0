Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808BD5370A1
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 12:51:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wMm2cyLz3blk
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 20:51:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nwkcY8aS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nwkcY8aS;
	dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wMK14GMz302c
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 20:51:24 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id t5so10261377edc.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tjHmH/k5OnwGTIX8JGp/u7wV+TKFsiA0hlmVPnIEjOI=;
        b=nwkcY8aS85BC02SBgalxJjxF5X2sRSHiazRKBPvxeWltyh9GpA2Y/3GJSo5hGdRmle
         B42JQYxzwweiSJ8LUiu/0L7nRLZ6OuJJM4d1ryf5X9RrEknmc6LB49n1uNuct3+wHA5l
         ZZiG8LJYgR+o6V83OmVlIQD2lGL1/5W8Fnyf8x26d6EDCa1gnEsyVdHkdWfllYr35Zh5
         nELvWJBSoAq9etnJ+aw4Jxf7FeK9Wr+4MMsMhRXm5xwggEt8NvoAm7rqHfnYDb4EV9ZI
         HFvGZy0WrhlqoaLBJdbstaO/JeRuZwLzTfg9+ZCQgs1g4xMy15DZ6lRyq/WnTvn3Nu8e
         lIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tjHmH/k5OnwGTIX8JGp/u7wV+TKFsiA0hlmVPnIEjOI=;
        b=jxFosm4keag4m/XTG15awW2BxOWMtQlzf0B/DZLyjTphIQiyh9Jl/vSIeJsvS6hL9r
         m7+X2NUb51Jrdg26HOSDoGi0T6KgvzVLs6gkN7tRR21QMs8N9x9MqtLpWQ4GkO7D1SWx
         TkJjykGQA7RjGYuhv3ISdVzXWl6760rrpwurXPXYPW83IMX9PoHePppzIOCJ7Znf7t+1
         Yi2sKHCV5Emar7lfQQDUclBZ1TfDKcSR2TfMY0pFSPw4a7W/WgZUFEUH8Y/0i+1LGq6V
         eeI/k2t3lMDGhc3mU3L2SSLyrPnA2dN9z9r6mbBpqTOYiyl0jswGYbisXdZedDfdZTcJ
         sOsg==
X-Gm-Message-State: AOAM532JrpuWH4NtaSPbegA1dBtSKbjounhwWFM/VQTrt9jhdGcsmMjx
	88yr73dtsbsCTV5hFY/n4foAUg==
X-Google-Smtp-Source: ABdhPJzPfF++CclA17wW8Tsy2/nq+Rvo6+fQTJ+x5gV7m58QRmV067rGaFZx7OsF+daXLjfPYqqw1Q==
X-Received: by 2002:a05:6402:1b1e:b0:42b:cf35:2621 with SMTP id by30-20020a0564021b1e00b0042bcf352621mr20338321edb.352.1653821481695;
        Sun, 29 May 2022 03:51:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w25-20020a50f119000000b0042b0fcfe966sm4746991edl.37.2022.05.29.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 03:51:21 -0700 (PDT)
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
Subject: [PATCH 7/7] ARM: dts: aspeed: centriq2400: use qcom compatible
Date: Sun, 29 May 2022 12:49:28 +0200
Message-Id: <20220529104928.79636-7-krzysztof.kozlowski@linaro.org>
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

"qualcomm" is not a documented compatible and instead "qcom" should be
used.

Fixes: 3719a1b13056 ("ARM: dts: aspeed: Add Qualcomm Centriq 2400 REP BMC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
index 3395de96ee11..2e8b87783717 100644
--- a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
@@ -6,7 +6,7 @@
 
 / {
 	model = "Qualcomm Centriq 2400  REP AST2520";
-	compatible = "qualcomm,centriq2400-rep-bmc", "aspeed,ast2500";
+	compatible = "qcom,centriq2400-rep-bmc", "aspeed,ast2500";
 
 	chosen {
 		stdout-path = &uart5;
-- 
2.34.1

