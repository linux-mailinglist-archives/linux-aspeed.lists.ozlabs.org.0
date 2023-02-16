Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93ED69901D
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:38:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVHT3S3Tz3cgR
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:38:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SGT5ef7o;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SGT5ef7o;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGV2dL9z3cjb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:22 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id x40so1987860lfu.12
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ry5OnWVskBi4BrdDCKYO13gYLHKJ1rB2gI1jhA/bpo8=;
        b=SGT5ef7orsKNrCqYQFZR22y2iea9Iq5Hu+B/zU6a2XbuRnlsvavElsveBuqKa9ipo0
         K2zLjQB/xujmDJfJx8M7Z88EO4D6nqL7vbRG93o0NtCNT5b6aA3Sr5YfJ8r6VwXObRmW
         Lw7fDTmesulU3WDDKo/PV7r1U5XPrL7RDsVEehUckXswMsXW+Zzv/B0WGbk+NeB7edEa
         bhNitulJI/sjTNDYrM1hmGbRGUM2Tf9Tm+86lcWO18zzEYIyS4ARSQYrqtdMUUejuYZc
         425teKK5KJzqs3reT1HUblsELON0U4gsnobVTQJmqiz/V8WUxfdy9FSaQhM6pZ8/TcQh
         Nf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ry5OnWVskBi4BrdDCKYO13gYLHKJ1rB2gI1jhA/bpo8=;
        b=4po8609MZhnwot8KvFMh9Y//3Q0r3BUQ8d74q6XMY9+QaQvzj5y+cNaCHfv4m4iox3
         SBXoSLOWvun+JwuU3kCqXab8n/a2CSLfF0g30j+Wy57GqzOd5lKSws1mL/93vK7/QgwA
         VF34QQj1I7DCZuz7zEEZemZJmfyylPcRsnQQ8jPvWlAHUkS3haL6zDoV36Ry0rgAr7t1
         FQtvHxGyZZIA3r89osNq0Fx3/p6oX42Cntcn722ulwYWkUol9SX2B7J0J0R2jILBENMI
         NsXEz0BAxHvs1vhHAuDbYadeq1c+TaWanz7f4oBIT+m5tqO37Ha7w9a1gukA7nNIiWsL
         k/2w==
X-Gm-Message-State: AO0yUKXFoS51iadi6UrGRgotm7y47Y1VZRIl0tSfvszXrBMDuCrxuyLp
	pqbipni4mCpcfbCmmCyeNsaXWg==
X-Google-Smtp-Source: AK7set+Ei8dmPA2TKd7Lgl9zrfTFJBr1TygLew3k3innm7y6MvkDs03iup+HYl8iKgVlIR79HK7D8w==
X-Received: by 2002:a05:6512:69:b0:4d8:6b96:dae8 with SMTP id i9-20020a056512006900b004d86b96dae8mr1375547lfo.43.1676540239273;
        Thu, 16 Feb 2023 01:37:19 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:13 +0100
Subject: [PATCH 12/17] gpio: mlxbf2: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-12-51a8f224a5d0@linaro.org>
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

