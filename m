Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4B6B1CC9
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLqT6TNhz3cLx
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p3Kr/WFN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p3Kr/WFN;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLpT07X7z3cMn
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:46:09 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id g17so1162930lfv.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pkmx+b8ik/C6bLfv+4RBCDp/VEmyhMZOMZzx00ojykk=;
        b=p3Kr/WFNbbKFk66agzCT4u42Y5KITAZpT48aFDNPE9ZUZHzzWb76fkK8FF1mTSwXvA
         YN00K6GTgQC1XC+mSoGVipsLmUmGGI2Ditgn5WnNaGmdlVcaT0n1cQsDlfgsKhlAdyIG
         0VD4mueZ56RA8/YbfkwoduJ4nCXDurAqKFa6Rt8oQHpjXxLFrUWlgtfVwrrAoMGpKt0w
         aariaDW/AIcCYsIghKFcThCHY0OPYL8YkfwbdKEkF8qSKkpnlYYSD99dkFG0/dqduNje
         gSlB2/gHJo7+OIQaV7pAaEMDPRnenW8c0PzItdFAYuv0gBV0pV2zXHmS6KtCDIR3Fn+W
         Eg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkmx+b8ik/C6bLfv+4RBCDp/VEmyhMZOMZzx00ojykk=;
        b=UOe8koi+TNvnQvHgYwjq+GWtHNK45SVCSHTXspH1HwZBUHxM2eorIYkTXJR3WLugaa
         qXQl0hpcGzyRiH0aR4iuk3LICCwiDsSdfl1/NEvGl1BoDCVvGhoZpPpk5TR6CFkUEd4P
         cB4WQiagtq4uyJ7VuGv1JRBHdT9PGK+ArNBp14XCzLn8AQXYtXnc7tEvRGHvKYUiwoh6
         rUe7j9ja5twIyDvyBN7YUcH6y39/yf0LiWyCfXFDXkbhlQiCV+NrbnLl40p+VoBNtv45
         fmZLvqD8aJqvZPtWO/eJgzCpXlHm6cf7NCm48JmacJLmKupcOa1y9g1NQSTfVY0QVQr1
         Ckhg==
X-Gm-Message-State: AO0yUKU2zMXvrYZzi4QfffT4kh7YNPAEhiA94a1bFAezuRTcFvcfIUhB
	msXxTEsJ9UWevE4fJyh83n4l2g==
X-Google-Smtp-Source: AK7set/7bPEP30lH2CywZpfXJDDlcTykBdecq0v0yxbUeNWQFNURhNsZZCgZbpHl19Di3POVs7nG3A==
X-Received: by 2002:ac2:5dfa:0:b0:4b6:e405:1027 with SMTP id z26-20020ac25dfa000000b004b6e4051027mr6046717lfq.14.1678347968374;
        Wed, 08 Mar 2023 23:46:08 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:08 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 09 Mar 2023 08:46:00 +0100
Subject: [PATCH v3 12/17] gpio: mlxbf2: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-12-972542092a77@linaro.org>
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

Cc: Marc Zyngier <maz@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mlxbf2.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 77a41151c921..6abe01bc39c3 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/resource.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
@@ -65,10 +66,10 @@ struct mlxbf2_gpio_context_save_regs {
 /* BlueField-2 gpio block context structure. */
 struct mlxbf2_gpio_context {
 	struct gpio_chip gc;
-	struct irq_chip irq_chip;
 
 	/* YU GPIO blocks address */
 	void __iomem *gpio_io;
+	struct device *dev;
 
 	struct mlxbf2_gpio_context_save_regs *csave_regs;
 };
@@ -237,6 +238,7 @@ static void mlxbf2_gpio_irq_enable(struct irq_data *irqd)
 	unsigned long flags;
 	u32 val;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(irqd));
 	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
 	val = readl(gs->gpio_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
 	val |= BIT(offset);
@@ -261,6 +263,7 @@ static void mlxbf2_gpio_irq_disable(struct irq_data *irqd)
 	val &= ~BIT(offset);
 	writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
 	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(irqd));
 }
 
 static irqreturn_t mlxbf2_gpio_irq_handler(int irq, void *ptr)
@@ -322,6 +325,24 @@ mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 	return 0;
 }
 
+static void mlxbf2_gpio_irq_print_chip(struct irq_data *irqd,
+				       struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct mlxbf2_gpio_context *gs = gpiochip_get_data(gc);
+
+	seq_printf(p, dev_name(gs->dev));
+}
+
+static const struct irq_chip mlxbf2_gpio_irq_chip = {
+	.irq_set_type = mlxbf2_gpio_irq_set_type,
+	.irq_enable = mlxbf2_gpio_irq_enable,
+	.irq_disable = mlxbf2_gpio_irq_disable,
+	.irq_print_chip = mlxbf2_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /* BlueField-2 GPIO driver initialization routine. */
 static int
 mlxbf2_gpio_probe(struct platform_device *pdev)
@@ -340,6 +361,8 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	if (!gs)
 		return -ENOMEM;
 
+	gs->dev = dev;
+
 	/* YU GPIO block address */
 	gs->gpio_io = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gs->gpio_io))
@@ -376,13 +399,8 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0) {
-		gs->irq_chip.name = name;
-		gs->irq_chip.irq_set_type = mlxbf2_gpio_irq_set_type;
-		gs->irq_chip.irq_enable = mlxbf2_gpio_irq_enable;
-		gs->irq_chip.irq_disable = mlxbf2_gpio_irq_disable;
-
 		girq = &gs->gc.irq;
-		girq->chip = &gs->irq_chip;
+		gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
 		girq->handler = handle_simple_irq;
 		girq->default_type = IRQ_TYPE_NONE;
 		/* This will let us handle the parent IRQ in the driver */

-- 
2.34.1

