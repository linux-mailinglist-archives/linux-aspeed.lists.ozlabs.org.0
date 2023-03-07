Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C05036ADFB7
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 14:05:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWFzX218fz3cNj
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 00:05:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xFEOAYGu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xFEOAYGu;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWFz819Dhz3bby
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 00:04:51 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id f18so16985616lfa.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 05:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0p5EbpuJP6hwcjXoMYtiND4JppiiLVgXD+CFpX3rE4=;
        b=xFEOAYGuIoPsxPVhSwnYu52ahL7geiD4JVsX78tkiKB0nDxX66O85TkmquqlMnV3Cf
         KFT9X4bqt5tlWpqJAvS5nYwxT8BHqoEvAJLGm07IPzLBcFnoUfUsxg2mF5Bh7UxTpmcY
         br0YeIBO98Hp3nNOFbKpVqEqKRqnlIFsR0xn2ggRhWM1OOw0tzyYYawGXjt8jdbc8tP9
         EJZOC7XmbmHahw2Q/qcEC1YKAtlX49HY9TO16gaaJt6v1uDqU55HClT+gx6G5+/3mLaQ
         Kb94zbPBynfFJXDzuqWS4ulOsWjA61IsdxelOB/Cc8MSGiAMkj8fP5wzey3fV3vui+RG
         1pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0p5EbpuJP6hwcjXoMYtiND4JppiiLVgXD+CFpX3rE4=;
        b=HnMBaf941j+TwauD5Im4Zrv0AY9LT4E43/rKxiVIvSDnlm2ipzDKw2O1HLVIVRpf1a
         kW3zRJaF2EgFnVkBQyRJKIGSKsYW8n3A5G8ZaZrUgsXb/tCVdD/lN5IrLH+9oTRZEVO9
         eSxjAUnyU4CovzAl9dpgu/1H/gLMgP3RS145UB4FY1scsk1SEfKpUqE5CxcsP6ap0k4Q
         omuT8IIUHdghbjrvIzl4BuvaMDIMroyjGSAlTMgJn7yPVLKSr3nlcm2ikpFFi0PkQyjr
         zc++m1jgF9bfbSbrW+MYWqMDum2vwIcPKwZcX/nDvYxBFBr8fEdZFcDiOZafV4nof5Kd
         uRcg==
X-Gm-Message-State: AO0yUKUr/KjBxLe8u+gJnVnecl06y0gdXhpmX/Zaud4FFF0XoRgqKoKo
	yso20WcnQKfn6FPbMxeb8KD75g==
X-Google-Smtp-Source: AK7set80tiqRps6GnP0ry1iYfsh+Gyc80TWyuQ9ZZB6e138GElBWWZ9wf8irKeXrZucKvQPf+SK3Lw==
X-Received: by 2002:ac2:551d:0:b0:4dd:9a38:fcc with SMTP id j29-20020ac2551d000000b004dd9a380fccmr3973440lfk.63.1678194288471;
        Tue, 07 Mar 2023 05:04:48 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Mar 2023 14:04:45 +0100
Subject: [PATCH v2 03/16] gpio: aspeed: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-3-d6b0e3f2d991@linaro.org>
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
In-Reply-To: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
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

Cc: Marc Zyngier <maz@kernel.org>
Tested-by: Joel Stanley <joel@jms.id.au>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index a94da80d3a95..9c4852de2733 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
@@ -53,7 +54,7 @@ struct aspeed_gpio_config {
  */
 struct aspeed_gpio {
 	struct gpio_chip chip;
-	struct irq_chip irqc;
+	struct device *dev;
 	raw_spinlock_t lock;
 	void __iomem *base;
 	int irq;
@@ -566,6 +567,10 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 
 	addr = bank_reg(gpio, bank, reg_irq_enable);
 
+	/* Unmasking the IRQ */
+	if (set)
+		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
+
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
@@ -579,6 +584,10 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	/* Masking the IRQ */
+	if (!set)
+		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
 }
 
 static void aspeed_gpio_irq_mask(struct irq_data *d)
@@ -1080,6 +1089,30 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);
 
+static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	const struct aspeed_gpio_bank *bank;
+	struct aspeed_gpio *gpio;
+	u32 bit;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
+	if (rc)
+		return;
+
+	seq_printf(p, dev_name(gpio->dev));
+}
+
+static const struct irq_chip aspeed_gpio_irq_chip = {
+	.irq_ack = aspeed_gpio_irq_ack,
+	.irq_mask = aspeed_gpio_irq_mask,
+	.irq_unmask = aspeed_gpio_irq_unmask,
+	.irq_set_type = aspeed_gpio_set_type,
+	.irq_print_chip = aspeed_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /*
  * Any banks not specified in a struct aspeed_bank_props array are assumed to
  * have the properties:
@@ -1149,6 +1182,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
+	gpio->dev = &pdev->dev;
+
 	raw_spin_lock_init(&gpio->lock);
 
 	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
@@ -1208,12 +1243,9 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 		gpio->irq = rc;
 		girq = &gpio->chip.irq;
-		girq->chip = &gpio->irqc;
+		gpio_irq_chip_set_chip(girq, &aspeed_gpio_irq_chip);
 		girq->chip->name = dev_name(&pdev->dev);
-		girq->chip->irq_ack = aspeed_gpio_irq_ack;
-		girq->chip->irq_mask = aspeed_gpio_irq_mask;
-		girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
-		girq->chip->irq_set_type = aspeed_gpio_set_type;
+
 		girq->parent_handler = aspeed_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, 1,

-- 
2.34.1

