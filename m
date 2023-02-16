Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA30D699022
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVHg46pWz3cgm
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:38:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vpOt4uId;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vpOt4uId;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGW5flGz3f2j
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:23 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id g28so2097900lfv.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5NV/DiggKvJS6hijrypI8dvD8vGEXvscfdW3OAZ7gw=;
        b=vpOt4uIdS4CejmbNFkjtETdFWC9FSHKvQ24Mu+ZFcoLfxbHaW88ULFuU4G+rZlkDUe
         zNJ1xbJCTmjJpTEZw3KUcXTKtbTwSaftY/fJ/4f71Zm8xO1pNyi6/rOw7OWtA9QMXnc/
         lppLL1EOvafjCqYNHlqCdZL0ronsId+/JAFvK3Z5R09hQVlz4go49yid8vY0lHg03AP1
         fzrhd4chP2Rlh2ZGEuHCK8jAiYTf+guPmN6Jnf6RT1RBmqFmG8cTFHbRJ2guhAb0hAel
         swb0rOA1qCdh189AjisbVRtcDYRZbRfDWAo0c5P3jdsDb57H1DsF0jcVx2v1w9XQos+r
         3+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5NV/DiggKvJS6hijrypI8dvD8vGEXvscfdW3OAZ7gw=;
        b=Chn+Kz1c7+6TsXF9Ds4fV7cYntxVS5qCrsBuA+6lr1ldThweSTCOujxJbtEXQGiVPc
         OHJSTywl2d28bJ3KCW/Z5qFRcL+zJxiE/5AQ59tZLNaTBmf2JI0EmZf5OBpFrKSCOTw+
         cIShji+UTldD0qTajlEe1Oz7slEzxyUe8WMC+Y7hlbgovoTSHL8Aaf2Mj4YJVfCu1KHn
         IgeRSGnviHU8Bnp4DeCRtVdWB/5Ir+1SfyKD/bbQdUMOnvjoItTDdg0ZkQ9PXC79rT02
         OizEsrR4uf2VQb8wj9T93bBwgaKYof3TS9CYe5tmqCBLg6wnRcjSP0WAkS/9gpBiwvtA
         d4Sg==
X-Gm-Message-State: AO0yUKVJKXgrHfSovXVKkowGIPQmX7Sbrh/K6kXo702oyJng/4Fr9VPT
	kiZo6hM1FS6wGw2mmxJXgI6KlA==
X-Google-Smtp-Source: AK7set+qQrC7lMxYHqBp5xLFc7wIVKYwgnuciFyKGblH7dLNUHl12igWqNWavwew9Je0VGw61SCQWQ==
X-Received: by 2002:ac2:5977:0:b0:4d5:ae35:b221 with SMTP id h23-20020ac25977000000b004d5ae35b221mr1395185lfp.34.1676540243189;
        Thu, 16 Feb 2023 01:37:23 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:22 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:15 +0100
Subject: [PATCH 14/17] gpio: omap: Drop irq_base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-14-51a8f224a5d0@linaro.org>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jay Fang <f.fangjian@huawei.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 William Breathitt Gray <william.gray@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The OMAP1 at one point was using static irqs but that time is gone,
OMAP1 uses sparse irqs like all other multiplatform targets so this
static allocation of descriptors should just go.

Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Lindgren <tony@atomide.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 80ddc43fd875..292e62c06008 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -992,7 +992,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	struct gpio_irq_chip *irq;
 	static int gpio;
 	const char *label;
-	int irq_base = 0;
 	int ret;
 
 	/*
@@ -1024,19 +1023,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	}
 	bank->chip.ngpio = bank->width;
 
-#ifdef CONFIG_ARCH_OMAP1
-	/*
-	 * REVISIT: Once we have OMAP1 supporting SPARSE_IRQ, we can drop
-	 * irq_alloc_descs() since a base IRQ offset will no longer be needed.
-	 */
-	irq_base = devm_irq_alloc_descs(bank->chip.parent,
-					-1, 0, bank->width, 0);
-	if (irq_base < 0) {
-		dev_err(bank->chip.parent, "Couldn't allocate IRQ numbers\n");
-		return -ENODEV;
-	}
-#endif
-
 	/* MPUIO is a bit different, reading IRQ status clears it */
 	if (bank->is_mpuio && !bank->regs->wkup_en)
 		irqc->irq_set_wake = NULL;
@@ -1047,7 +1033,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	irq->default_type = IRQ_TYPE_NONE;
 	irq->num_parents = 1;
 	irq->parents = &bank->irq;
-	irq->first = irq_base;
 
 	ret = gpiochip_add_data(&bank->chip, bank);
 	if (ret)

-- 
2.34.1

