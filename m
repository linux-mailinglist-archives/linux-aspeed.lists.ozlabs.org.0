Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8126ADFBB
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 14:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWFzh72Rqz3cP0
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 00:05:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LaGKvhnO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LaGKvhnO;
	dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWFz92lY0z3cGk
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 00:04:53 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id x6so13094889ljq.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 05:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71KSFXipPt6AFUXeJ7X4eL7ZzgFaUvhDfIYjlqtJPYo=;
        b=LaGKvhnOuEdjQlskLsAk3XTkexGofp5EYb2xlFvIN7HrICTe8agB7umlUaSpjQtRGb
         mATWkUpjInHrxhvx98qMCuSYPZFcPI+TjrZdC0rnVMh9Um0xmPLCPNk3dwIys+irE8BX
         PfTyCTn2IPe9tuiyPRC2j//RWo67afoXMKrhi3fgqY+fPYX8z3B1OqJEvSdfGBsr5H/I
         l9HEpeWtmW0OHCe05sHzT3w0AyTgM51/RbaEC0MZVZN5JJ56B3/+9gVQ78gskQIM4hMi
         5sxsXjqvrxy2K/nY4JInBGHzBp+OmjQ/TP7zw27rRqtRqKhffAX2atnU6MygylR5fnlj
         UD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71KSFXipPt6AFUXeJ7X4eL7ZzgFaUvhDfIYjlqtJPYo=;
        b=iKFVlCO15CgOiyOF6RSLPStIEFNIYZmvFXrz24regaE29YgqSPfW90qErm4eTP5Ot6
         5wnqDKnFCG3UnPTc3CD2PbkMn44PJhTUX6nFrP/a7wWytRNToj1d0Y0L7JBXgKkkcR/O
         KA7orae95kwTEiZL/t9E9jh9KZFcruBCFNXOVif56UOPX1skJEVvdAeNg2uX3mrcvg6F
         CM+OKN/TQNeAjg3zsaCTNiKBr1lMgvBETSG8JMliMMunm+BZFt/VeVT0DTQUml0NNB7s
         Zc/6mqnn27zPx/kqlSrgcykw4LovUPcSm1m5Oh68imABatkJT8aQKNImVWGBKm1o8kl9
         ug9Q==
X-Gm-Message-State: AO0yUKWv2dSOQyMBhSivg270wmXYJmWxWL5CD0LLj/iieXmxuEDKGYpi
	pXymmMqKJ5X7DUrGyquMLCYYRQ==
X-Google-Smtp-Source: AK7set91P59ZVpgeiHIrGZ/D7uM9gIerZi/78626uHZzkgh5XEVGvwp3vnbYmPvDHtoflFY+Jfnbww==
X-Received: by 2002:a2e:8085:0:b0:295:a32b:92ed with SMTP id i5-20020a2e8085000000b00295a32b92edmr4144886ljg.48.1678194289545;
        Tue, 07 Mar 2023 05:04:49 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Mar 2023 14:04:46 +0100
Subject: [PATCH v2 04/16] gpio: aspeed-sgpio: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-4-d6b0e3f2d991@linaro.org>
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
Acked-by: Marc Zyngier <maz@kernel.org>
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

