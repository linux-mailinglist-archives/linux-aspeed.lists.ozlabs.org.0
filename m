Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BA6B1CC1
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:46:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLqJ6Z6yz3cMy
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:46:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xwf8KALZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xwf8KALZ;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLpR75G3z3cNj
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:46:07 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id r27so1135070lfe.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nj6jio3cM/arnjJ3w8Z7XTVvD/CZOiBuUJssoRypJa0=;
        b=xwf8KALZLR0nIYkuFjQZGVcY2mmqSH9Bfzggzf2PNDHJUzO3FLSp55bkFvwwJSjugU
         bySHixGlQTucE5mALVhMAqd0U+SRxp4YOp92wG1995YoeXHMhdFR3yToSBGokblA+vvP
         memzY3k/ZT9CqUyFJw0X9S2BjjUsf9rzmVL+yqMBnchOcpNOFJ1qUcxjGEm8hYv+nACV
         BjEEZ/dQQF5gc2Is9vQYGVC+P6zD65aux1fObZAcWAyhb9Uw2cwVjkKt23QS8an5bAgg
         zOP52WaV4fGwrWmCuf1qkEqT69qCzTzLIdQrXVCadt6QYxOuR83ew8G9YRq2lNEF30VF
         DUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nj6jio3cM/arnjJ3w8Z7XTVvD/CZOiBuUJssoRypJa0=;
        b=LCOSUGp+ZDVJEKHoDW0ghcZg2XyNzeq/RSd/7n4JbysvRiQxxHnGy2VEolk0OnvrSq
         79MclWSOxkQiaO4O5DJQrtxZzWzSazQH5rVesOvCAvgnt5F9gTYLLZfyBX9dDHU8sr4R
         wbIRAuBiL4E35oc6UnEeOazhBnzxVE5HpjyLKIMg6nvxYP1o4GM438asZjNNejKCWhhZ
         +yva290HxQZxEcv8VGeg528D9gFMpEfLHMiBoG2+AWm6gkBseH56ouluq+gHINKRomUS
         UkXqGbsPZ3jD04Qs6kmHzVqMVI15+5ZyxFKnvh5U8lLFxWcPjKS6MTFcPoDps0W+mtXM
         369g==
X-Gm-Message-State: AO0yUKXu0c1I7XXNlPDcg3FHBcTncqgVdCnwt0PhDoRPdE+f0+KnuS1M
	81UQb7AFCGZcLhRc9/dEZHzm/Q==
X-Google-Smtp-Source: AK7set+7SeKoeP6ww+p3rAPDNpLbeniGpZIzW6H3NPKfLtikv3/3WvapNsR2GFMi6AMLr1TPdSWKnQ==
X-Received: by 2002:a19:a416:0:b0:4dd:a025:d8e with SMTP id q22-20020a19a416000000b004dda0250d8emr6336857lfc.47.1678347967362;
        Wed, 08 Mar 2023 23:46:07 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:07 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 09 Mar 2023 08:45:59 +0100
Subject: [PATCH v3 11/17] gpio: msc313: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-11-972542092a77@linaro.org>
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jay Fang <f.fangjian@huawei.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
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
Cc: linux-aspeed@lists.ozlabs.org, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert the driver to immutable irq-chip with a bit of
intuition.

This conversion follows the pattern of the gpio-ixp4xx
hierarchical GPIO interrupt driver.

Cc: Marc Zyngier <maz@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-msc313.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index b0773e5652fa..036ad2324892 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -532,17 +532,35 @@ static int msc313_gpio_direction_output(struct gpio_chip *chip, unsigned int off
 	return 0;
 }
 
+static void msc313_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	irq_chip_mask_parent(d);
+	gpiochip_disable_irq(gc, d->hwirq);
+}
+
+static void msc313_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, d->hwirq);
+	irq_chip_unmask_parent(d);
+}
+
 /*
  * The interrupt handling happens in the parent interrupt controller,
  * we don't do anything here.
  */
-static struct irq_chip msc313_gpio_irqchip = {
+static const struct irq_chip msc313_gpio_irqchip = {
 	.name = "GPIO",
 	.irq_eoi = irq_chip_eoi_parent,
-	.irq_mask = irq_chip_mask_parent,
-	.irq_unmask = irq_chip_unmask_parent,
+	.irq_mask = msc313_gpio_irq_mask,
+	.irq_unmask = msc313_gpio_irq_unmask,
 	.irq_set_type = irq_chip_set_type_parent,
 	.irq_set_affinity = irq_chip_set_affinity_parent,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 /*
@@ -644,7 +662,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	gpiochip->names = gpio->gpio_data->names;
 
 	gpioirqchip = &gpiochip->irq;
-	gpioirqchip->chip = &msc313_gpio_irqchip;
+	gpio_irq_chip_set_chip(gpioirqchip, &msc313_gpio_irqchip);
 	gpioirqchip->fwnode = of_node_to_fwnode(dev->of_node);
 	gpioirqchip->parent_domain = parent_domain;
 	gpioirqchip->child_to_parent_hwirq = msc313e_gpio_child_to_parent_hwirq;

-- 
2.34.1

