Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29350EE97
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 04:13:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQQY3NlKz2yPj
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 12:13:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tLzEnTlR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tLzEnTlR; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlmXW0y2Tz2yQ9
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Apr 2022 19:42:34 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id b24so13102339edu.10
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Apr 2022 02:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u792v8dWSrl2ZKGoVimsoHmq0ePG9eKFTfKDgwzNgLI=;
 b=tLzEnTlRJkNulWYGLlGFKEq9rQVE/xl45c4QwO1bEH2T8ymzoHyxbBq5m8vjsguIbF
 JKuoB2NdjGJEqtHZi36LJ8IfeeMQRW86pAUqO3IZR+MXzsXwiocaSY6XrEuoKOPms1/Y
 9zalCOkRBlbLygpsMcBB5nU0JM6EbgVqdmNKPS3ASAlr9LXKWq7Nouwn/gwrPleF2XGd
 hLxfpICzbnHPYudDkyP3gc6W08cEeYa+pFoJafVIq0qaDrZLLkEZ/FQ4HKq90n08cMC9
 WAw7S1LeVUgdHZIGkzfi8c5NJnzkZFvpbqJDxIg2w+OXDS5hwhDgjPe4KBHLWh0rv5gH
 QJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u792v8dWSrl2ZKGoVimsoHmq0ePG9eKFTfKDgwzNgLI=;
 b=4yNHlUgxeCaW44VzK29NDXSC6EIbd8iVxcyxAFYhrIbyE0P1Sc8X3HSM1Inkt2Q1+2
 bogDoSMPTa1S3mgYouhRTu17y49TeF5U/c7W2Coyd7GX4hDr0miYsJvTG/Wn/cowTONv
 Dr613vsOslSF7u3Zdb1LdRo9YKoqWR+SxtPw8GJQr6I8fdcUInxV/7FSL2Ps9g9Xfexg
 S+r5VP49s0EB9iLwvqE/3rxUeyBLOZUwwnb8fPg4whRmIGe3rAdY2/0TwlOa7PEv7hpj
 NDdWi3FioQACZU/x2/C1NcI4XjwxKb1Sj+eGJU3WfQ0nL4egJ0Fpdpfvv3oA0uD96X61
 ezoQ==
X-Gm-Message-State: AOAM530V9s7eXfypP5anPqAktSJqH9PP0GJrS+WpHiMZYvfMGdfdJXqe
 BOD2P1GgTrsfO6D75vD5WJlSgw==
X-Google-Smtp-Source: ABdhPJwvkG22uMan8o05CdMC4hjydmtl4dSRgwNbR/T9fkB9oinekkKjiP8fjsgtBL8oL2FOJtfwLw==
X-Received: by 2002:a05:6402:42cb:b0:425:d34f:e8ca with SMTP id
 i11-20020a05640242cb00b00425d34fe8camr2337767edc.126.1650706951641; 
 Sat, 23 Apr 2022 02:42:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056402281600b004206bd9d0c6sm2069067ede.8.2022.04.23.02.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 02:42:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 2/2] irqchip/aspeed-scu-ic: Fix irq_of_parse_and_map()
 return value
Date: Sat, 23 Apr 2022 11:42:27 +0200
Message-Id: <20220423094227.33148-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220423094227.33148-1-krzysztof.kozlowski@linaro.org>
References: <20220423094227.33148-1-krzysztof.kozlowski@linaro.org>
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

Changes since v1:
1. Correct the return value passed further.
---
 drivers/irqchip/irq-aspeed-scu-ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 18b77c3e6db4..279e92cf0b16 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -157,8 +157,8 @@ static int aspeed_scu_ic_of_init_common(struct aspeed_scu_ic *scu_ic,
 	}
 
 	irq = irq_of_parse_and_map(node, 0);
-	if (irq < 0) {
-		rc = irq;
+	if (!irq) {
+		rc = -EINVAL;
 		goto err;
 	}
 
-- 
2.32.0

