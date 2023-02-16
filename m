Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF596699003
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVGl5Bw3z3cgq
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:37:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FKE1fukM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FKE1fukM;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGJ1Xlzz3cdm
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:12 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id g28so2097206lfv.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUwqrFTLFAU2Wpt+jNvlKO1l1kBqCDjJYKHVGVnnigQ=;
        b=FKE1fukMsR0Tm5XtGnsMGLct54w/I07oP0cUri/SJoPg0B8NYuumykZ0pndUHEH7En
         Vj7r/MtTOqEnJTsxrlNbLH2L+NwwP00QQ9ChR4I6YgYJCukK5gl2777zr5SOo/prOmJ3
         JN5LbKho953JLWHJkUay4193xpWPUEbGYG+RLZHWqnG/FWUzb6WM74IcpclmscYw45ls
         7arQ2iboP+zVGQQ0mPz4yZJYZZ/Z96xz8vQ5CvX+eGD5fef/M64Bvs4NEVm7Y1bF6MG3
         c+JppRDou4IeBPrr6clyyY790CuY89EUq3Vwy7v6wUKNUC02a66N7x/QVjAraJi1NEhS
         yBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUwqrFTLFAU2Wpt+jNvlKO1l1kBqCDjJYKHVGVnnigQ=;
        b=PfSBjsssngDxEU3D9l9T5t4rtTPrkruJt2b4TV45GNa7LaKf4eXb8uodq+1v4KOrop
         gDDzJwstIUUFIKddqeCux/f1YFda+XgRdZ/N/Twp1oaBm5ZhfQoGDkfLJ6ISIUHxNv3y
         t5RMJCRD8PkiZwvquWfGO32QIqFwhZvZDXlMVh/RwwM8SnhZQVRxx35AFmL13iKhfRlp
         uh85fekns5itd6R4QlwCco0ZcibRVxoyYdo5kK/Y4+NiI7zACxxKzSPrgStOabBdp+/U
         Z6KViRww4GLmYye+895DP5PnmkTPx5nGrkc7fXGV7+pPb3FCe0bUu9nuS5BDXtt01KjE
         sfJw==
X-Gm-Message-State: AO0yUKUo7cbrWjke8k4jn78sKyAfDs6a2PXf/ZOsv2pg6fpoYyZyoThz
	2llNUaP3sr34/iR/VyYTt+Z3TQ==
X-Google-Smtp-Source: AK7set+E7vKNTfSTdgcfNwR5oOekOEvePWpLlCddotGfUrTyZMVDFaq9A2qMy5kzfuDK//y9D2G/gQ==
X-Received: by 2002:ac2:43d0:0:b0:4d8:537a:753f with SMTP id u16-20020ac243d0000000b004d8537a753fmr2078712lfl.6.1676540229088;
        Thu, 16 Feb 2023 01:37:09 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:08 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:05 +0100
Subject: [PATCH 04/17] gpio: aspeed-sgpio: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-4-51a8f224a5d0@linaro.org>
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
 drivers/gpio/gpio-aspeed-sgpio.c | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 454cefbeecf0..3c1c0fc21fc5 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
@@ -29,7 +30,7 @@ struct aspeed_sgpio_pdata {
 
 struct aspeed_sgpio {
 	struct gpio_chip chip;
-	struct irq_chip intc;
+	struct device *dev;
 	struct clk *pclk;
 	raw_spinlock_t lock;
 	void __iomem *base;
@@ -296,6 +297,10 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
 	addr = bank_reg(gpio, bank, reg_irq_enable);
 
+	/* Unmasking the IRQ */
+	if (set)
+		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
+
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
@@ -307,6 +312,12 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	iowrite32(reg, addr);
 
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	/* Masking the IRQ */
+	if (!set)
+		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
+
+
 }
 
 static void aspeed_sgpio_irq_mask(struct irq_data *d)
@@ -401,6 +412,27 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
+static void aspeed_sgpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	const struct aspeed_sgpio_bank *bank;
+	struct aspeed_sgpio *gpio;
+	u32 bit;
+	int offset;
+
+	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	seq_printf(p, dev_name(gpio->dev));
+}
+
+static const struct irq_chip aspeed_sgpio_irq_chip = {
+	.irq_ack = aspeed_sgpio_irq_ack,
+	.irq_mask = aspeed_sgpio_irq_mask,
+	.irq_unmask = aspeed_sgpio_irq_unmask,
+	.irq_set_type = aspeed_sgpio_set_type,
+	.irq_print_chip = aspeed_sgpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
@@ -423,14 +455,8 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
 	}
 
-	gpio->intc.name = dev_name(&pdev->dev);
-	gpio->intc.irq_ack = aspeed_sgpio_irq_ack;
-	gpio->intc.irq_mask = aspeed_sgpio_irq_mask;
-	gpio->intc.irq_unmask = aspeed_sgpio_irq_unmask;
-	gpio->intc.irq_set_type = aspeed_sgpio_set_type;
-
 	irq = &gpio->chip.irq;
-	irq->chip = &gpio->intc;
+	gpio_irq_chip_set_chip(irq, &aspeed_sgpio_irq_chip);
 	irq->init_valid_mask = aspeed_sgpio_irq_init_valid_mask;
 	irq->handler = handle_bad_irq;
 	irq->default_type = IRQ_TYPE_NONE;
@@ -524,6 +550,8 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
+	gpio->dev = &pdev->dev;
+
 	pdata = device_get_match_data(&pdev->dev);
 	if (!pdata)
 		return -EINVAL;

-- 
2.34.1

