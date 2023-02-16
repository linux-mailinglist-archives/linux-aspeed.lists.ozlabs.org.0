Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9D698FF0
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:37:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVGQ1FCVz3f39
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:37:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CIEs55h+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CIEs55h+;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGH2ksKz3cH9
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:09 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id b3so2051374lfv.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=socMBmV/RtzXdC0lENqhNAKtiRaFWq2x7qFneE75pvo=;
        b=CIEs55h+qegmVCQQtvSRFL7kkeH+n1eQEXzGWKvslE0c0ZGnl4tZJVn/G/ZveZVNXi
         G16QjP6aWUW1Fn3Iw6Ldy3JlsMlH1s3slkjVwl7aO+beFJ13JTeYhQzshPByQ9EC35KW
         6Me3e0BI5Dcoz4+o1pjiUZ/wnCxlhW4XHe4ngqRrI9t/LzyL/6iy2nm9MLsGl6NiMwzN
         NAQGLltNargU3RS/cc8YdMWjspyKkY/Xmc5WXHaZZhgoLOMQPvvO0rIS0hqRDAuIcj10
         xczHKBRvI9HaL0XTXHiO8l/3qPoahVtdwH0hR/aCGxGR77E+/E5K8T4AsNFxpZD7TsIS
         bTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=socMBmV/RtzXdC0lENqhNAKtiRaFWq2x7qFneE75pvo=;
        b=FY7wPgR7g5RxEMvdHwDYD3msw5pTUWA7ipqvZECYAGWe8g7SmRrcoZsWNh7If9WhxW
         PuPKexwPPMCT7coOcFtXie4IeLr5PjXb8JARzNRvOBGu5GFHlDwEMIgnVU1UHmEEZpyM
         V6g65XUPbI/8bFHFB/c2mCRWky1IO7SEBwyp/YyPG8wRDAGWslUZvLlOy6a1gvCi5Cks
         qG+CuRBl7zeh69AJMDk+0qzWghh+VO2ccyAzPqWUd/CCe5WkJPU+P60KJlNASx5pP+SW
         1RVDRI6japKLCfh6tlHPpJB+RaDUuuYscsd7x1nTk/8snXD4jBTfJ+Kqz9CNFy+/NYyT
         M8Pw==
X-Gm-Message-State: AO0yUKXp2lnfxk21SIb1sbUqNVulzmMVsvYgvpaOzNif0TARM61HwOiu
	TwJD3HD/c0zv32elJpXvoTxzeA==
X-Google-Smtp-Source: AK7set+ZbKFnwzlE7WSgdc2N9QgzemmI+prUvUkugK9IyS4roaQBmY5qLq4edobITtzsUKzBjELvLw==
X-Received: by 2002:ac2:53a8:0:b0:4b5:178f:a14c with SMTP id j8-20020ac253a8000000b004b5178fa14cmr1412575lfh.16.1676540225687;
        Thu, 16 Feb 2023 01:37:05 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:02 +0100
Subject: [PATCH 01/17] gpio: altera: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-1-51a8f224a5d0@linaro.org>
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
Cc: linux-aspeed@lists.ozlabs.org, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index b59fae993626..c1599edb3453 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -24,14 +24,12 @@
 * @interrupt_trigger	: specifies the hardware configured IRQ trigger type
 *			  (rising, falling, both, high)
 * @mapped_irq		: kernel mapped irq number.
-* @irq_chip		: IRQ chip configuration
 */
 struct altera_gpio_chip {
 	struct of_mm_gpio_chip mmchip;
 	raw_spinlock_t gpio_lock;
 	int interrupt_trigger;
 	int mapped_irq;
-	struct irq_chip irq_chip;
 };
 
 static void altera_gpio_irq_unmask(struct irq_data *d)
@@ -43,6 +41,7 @@ static void altera_gpio_irq_unmask(struct irq_data *d)
 
 	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	mm_gc = &altera_gc->mmchip;
+	gpiochip_enable_irq(&mm_gc->gc, irqd_to_hwirq(d));
 
 	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
 	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
@@ -68,6 +67,7 @@ static void altera_gpio_irq_mask(struct irq_data *d)
 	intmask &= ~BIT(irqd_to_hwirq(d));
 	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
 	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
+	gpiochip_disable_irq(&mm_gc->gc, irqd_to_hwirq(d));
 }
 
 /*
@@ -233,6 +233,17 @@ static void altera_gpio_irq_leveL_high_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static const struct irq_chip altera_gpio_irq_chip = {
+	.name = "altera-gpio",
+	.irq_mask = altera_gpio_irq_mask,
+	.irq_unmask = altera_gpio_irq_unmask,
+	.irq_set_type = altera_gpio_irq_set_type,
+	.irq_startup  = altera_gpio_irq_startup,
+	.irq_shutdown = altera_gpio_irq_mask,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int altera_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -278,15 +289,9 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	}
 	altera_gc->interrupt_trigger = reg;
 
-	altera_gc->irq_chip.name = "altera-gpio";
-	altera_gc->irq_chip.irq_mask     = altera_gpio_irq_mask;
-	altera_gc->irq_chip.irq_unmask   = altera_gpio_irq_unmask;
-	altera_gc->irq_chip.irq_set_type = altera_gpio_irq_set_type;
-	altera_gc->irq_chip.irq_startup  = altera_gpio_irq_startup;
-	altera_gc->irq_chip.irq_shutdown = altera_gpio_irq_mask;
-
 	girq = &altera_gc->mmchip.gc.irq;
-	girq->chip = &altera_gc->irq_chip;
+	gpio_irq_chip_set_chip(girq, &altera_gpio_irq_chip);
+
 	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)
 		girq->parent_handler = altera_gpio_irq_leveL_high_handler;
 	else

-- 
2.34.1

