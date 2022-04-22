Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2262050EE92
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 04:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQPX6zdKz2xCB
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 12:12:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hMffFfUZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hMffFfUZ; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl9zz1lzxz3bY8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 20:45:49 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id p18so4758883edr.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E0mPDFRf2yGCYjXvBv/hrY8X7EKal2dOh8Gqauv0y1o=;
 b=hMffFfUZGHLuMf4xjuCqC0todGSD5kRTFeTjJ/Kiq1GvDKE7GYPQ3BHfEWcc0+BLRo
 zfNfU1rBTvTUXATzcYtX/G3CPWoziz3HoJYMc7cipZ/SWumhn3QqeoYtqqyMZlGr3WbV
 56kHys/Ez8+9AqYfP78EOQGF8z5jZuNnJCl9IOPLFu2v/38oq2PZOFA9hlupunvO1zDY
 lTAjSXpPU5bqtAkqFbdpdHl3OJngGxgPeFSWr/RBrI33GnVBszAQEjEXLmiT8G1azlst
 xEuBRQlqa0Npblv/r4aiHrALyWxVk9RR5TE/8Addh8txKNshI89Vnr+oT6BqIuKRi4lA
 Kxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E0mPDFRf2yGCYjXvBv/hrY8X7EKal2dOh8Gqauv0y1o=;
 b=yTXY8/TREx/l5ggKhkOafdtiTOO/x5UA/yF4DF9MYriR/PPK7Cc0SsKAfIZDsysLQw
 Wy3s/3OI0IEdMkjDa4UJKKL80yn6tNTJBBm+yeh/eyA6nfY56s7LMZSqWUYrzl7ZJsQC
 MzNlBFGn/G0vhkRBKRzpMNatl4Q0kxkG+MBgaZQeSLTJaMAuFVgJvSdukMQDh1VHGGF+
 Hos6BlBKiLaZyvnEYaCP4juwL72ysWzZ5QQGhNSnP4Tn0P/a7rQPu72M8wT3zqBhy+sj
 II7erq5K9OGyeW8CCp3cP91B/lvyteI2584xWtuchq4VSsuYB1/Efo2lU+nzFQILCdwQ
 mflw==
X-Gm-Message-State: AOAM5314p0Ij4Nszv70XU+VOiOITuwGWxYzlUIHm0WMDTpq/2omnonX2
 LXCrWTSMwD0z8qsO/wh1mGcLyg==
X-Google-Smtp-Source: ABdhPJzJD/7be1sR2YX5lXMsY8HObXb/T1c5dQYSajPOBst6CqwP9QEnjh5GfF1c3sLUGXKVJ3qfyw==
X-Received: by 2002:a05:6402:1107:b0:416:439a:6a9e with SMTP id
 u7-20020a056402110700b00416439a6a9emr4059032edv.382.1650624341298; 
 Fri, 22 Apr 2022 03:45:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 cn27-20020a0564020cbb00b00418b0c7fbbfsm744502edb.32.2022.04.22.03.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:45:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 2/2] irqchip/aspeed-scu-ic: Fix irq_of_parse_and_map() return
 value
Date: Fri, 22 Apr 2022 12:45:36 +0200
Message-Id: <20220422104536.61451-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422104536.61451-1-krzysztof.kozlowski@linaro.org>
References: <20220422104536.61451-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:21 +1000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: 04f605906ff0 ("irqchip: Add Aspeed SCU interrupt controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/irqchip/irq-aspeed-scu-ic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 18b77c3e6db4..9cf67541828f 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -157,7 +157,7 @@ static int aspeed_scu_ic_of_init_common(struct aspeed_scu_ic *scu_ic,
 	}
 
 	irq = irq_of_parse_and_map(node, 0);
-	if (irq < 0) {
+	if (!irq) {
 		rc = irq;
 		goto err;
 	}
-- 
2.32.0

