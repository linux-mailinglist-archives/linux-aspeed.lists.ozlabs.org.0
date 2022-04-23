Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA250EE96
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 04:13:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQQV4nDxz2yHB
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 12:13:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KRIHh6Zr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KRIHh6Zr; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlmXT4Pxlz2yQ9
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Apr 2022 19:42:33 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id b24so13102289edu.10
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Apr 2022 02:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2JyJCHnFqV/teN11xc8Ra0BCGSJBCzawqxSj6rs9BuY=;
 b=KRIHh6Zrfwkp2eXxHzhPObVxfGRom4pBnvXTWIy7F3cY7E1s9yx48UvMha7lXDbBya
 OX5dfInbZCEwbtUFcdbSrhTi6+bgxN1xf3CnMvFti1rCilXVUlzJBhG14tLiesnmDLly
 Mm8U3Xdngj8V8ydkZq5U7UYrB00dgci1gWG9RpabssvWH+ePN37KWQi7c+dDNNCJKupw
 r0n7EyuwjT9bOB/DuPguKR5Mv8LL98Z52jvv5Bg1D15p+v6rj9mCWgihl28r9aocPcjf
 C7BwIb5mS7iRzrVHLj0xriZ2YCHz8XcEsAKZSLQaFj5IIW9v8JOZt5Qfk++ossQsQ4+c
 /6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2JyJCHnFqV/teN11xc8Ra0BCGSJBCzawqxSj6rs9BuY=;
 b=Y50UKzimPAT75nGwFkxOoi0SdosEBXwRb89kAVHd6A72CVP4Unkz/HLPB671bkfeID
 0yoMvK5Uu3ShOpavj3VM2KgZjCwVXqo18iD5l8wULpw8yQ0gxQ59J/jC1gRHGHbMgMOb
 Y7JN+cEnBB80qKOqGrxO1lqoK1ZmhCtv5nda2OS8PRJccjWC23hHB2U8bLIsp4jbTj55
 Y9uZK2GbGLNmJa1SOsbeACGBFpQeDaT00cFFSPZD1qoAIE5dmFTHFVsrwpHI3MTvhcRi
 LlArtmCkyCbdTzHmALhR5SbwDR+3okJxeN7Ba5+eMu0ID4cdBX3D7hmf7Yo0jj6NvdNP
 7b3Q==
X-Gm-Message-State: AOAM531uP0ArGASPcLal77Qeu5sTz6o9KQo+GdC3nnglZ3RHryC0fNi6
 oxoYnqYdRt1mFwVcn+eaf7eyCw==
X-Google-Smtp-Source: ABdhPJzQWKCnu49QHC1FYDxk/aID7ZSBrgOlJHXY7G9WJEGQtcGMlBNQWVAYRg+IQQKA1LyqY4MHNA==
X-Received: by 2002:a05:6402:b1c:b0:41d:798c:78e3 with SMTP id
 bm28-20020a0564020b1c00b0041d798c78e3mr9309747edb.188.1650706950418; 
 Sat, 23 Apr 2022 02:42:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056402281600b004206bd9d0c6sm2069067ede.8.2022.04.23.02.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 02:42:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 1/2] irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map()
 return value
Date: Sat, 23 Apr 2022 11:42:26 +0200
Message-Id: <20220423094227.33148-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Fixes: f48e699ddf70 ("irqchip/aspeed-i2c-ic: Add I2C IRQ controller for Aspeed")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct the return value passed further.
---
 drivers/irqchip/irq-aspeed-i2c-ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index a47db16ff960..9c9fc3e2967e 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -77,8 +77,8 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
 	}
 
 	i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
-	if (i2c_ic->parent_irq < 0) {
-		ret = i2c_ic->parent_irq;
+	if (!i2c_ic->parent_irq) {
+		ret = -EINVAL;
 		goto err_iounmap;
 	}
 
-- 
2.32.0

