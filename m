Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C26B1CB6
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:46:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLq33zZpz3cP0
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:46:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dpeqQOhA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dpeqQOhA;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLpQ6pplz3cND
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:46:06 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi9so1174101lfb.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=dpeqQOhAC2IXszdN6b8072Sl3bUiKHrw7h4NcCf0ogXh4B0yfqJj4ByencdTElx2aJ
         sKF4q5jllyoAmMUW1uRtjq8pRUmfXSCBbZVRrj3c2xQQ0x0vtVj7XokQal+UY9jqLosg
         Xx+05Ne3vk9lXNGwr8b/JGeQcueOHbwq5PWrmt9z39hSY2nGyWtfcKQRqCpZYWcY6wV4
         JW6F/ONnjvJUwNtFnrrd2R099Hw9dktMpGsFvYioElhFKu6kHxEJVHQ5pqKTod0lk1v+
         vuTU590mZUpAPXNWN4bYA6rqfMeoD8fC6xhG4fbLX/Sz+AO32D4l60l+nwuZPGTHP3AS
         dzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=uibsSyJ3gJ6XuVwGy4vzKDj8sIDqc8v9gwLbmE/Ad9s0PZi2zIPBCuMYIA4zCvz5GE
         ZQu9uzdgYLrwF2IdiufAjWKyHTMIEARiCWmbPv8YoZPpkSfouTLBHwV79ins8mYdzkxi
         xiYaka5jR5aNEowARCvdeACdghOxOUKPhzyDfJzVQSsTWZv/dQZ7WrLnFpw73BJXx5eP
         26iZLHzy6vXRzUuSIRI7bQudlDqetGBbkiJRIDH5FZu4dtxk0afj0USiPaRiwicc3f5T
         ezIxBPAwaza8X9ExdzleKK63eiKDY0HSDKebX90C048uiYzfUlmVOVCmWbiqgv5rLIHo
         XioA==
X-Gm-Message-State: AO0yUKVDUM7nLr015OZCSI79E0QT974ASwqQwhMONNefxp6P1+XB01NQ
	eQ+r+ODCbKY7rxwBNtvWMbxwOw==
X-Google-Smtp-Source: AK7set87fT21JTW4faB6eJ2rms/WTKqyCslnbwT2UP6lQ5L4Z1c0bjHVrhO2dqhxeFk7Qxewgh+FmA==
X-Received: by 2002:ac2:555a:0:b0:4de:6973:82aa with SMTP id l26-20020ac2555a000000b004de697382aamr5913982lfk.68.1678347966337;
        Wed, 08 Mar 2023 23:46:06 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 09 Mar 2023 08:45:58 +0100
Subject: [PATCH v3 10/17] gpio: idt3243x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-10-972542092a77@linaro.org>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-aspeed@lists.ozlabs.org, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-idt3243x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 1cafdf46f875..00f547d26254 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -92,6 +92,8 @@ static void idt_gpio_mask(struct irq_data *d)
 	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void idt_gpio_unmask(struct irq_data *d)
@@ -100,6 +102,7 @@ static void idt_gpio_unmask(struct irq_data *d)
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 
 	ctrl->mask_cache &= ~BIT(d->hwirq);
@@ -119,12 +122,14 @@ static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
 	return 0;
 }
 
-static struct irq_chip idt_gpio_irqchip = {
+static const struct irq_chip idt_gpio_irqchip = {
 	.name = "IDTGPIO",
 	.irq_mask = idt_gpio_mask,
 	.irq_ack = idt_gpio_ack,
 	.irq_unmask = idt_gpio_unmask,
-	.irq_set_type = idt_gpio_irq_set_type
+	.irq_set_type = idt_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int idt_gpio_probe(struct platform_device *pdev)
@@ -168,7 +173,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 			return parent_irq;
 
 		girq = &ctrl->gc.irq;
-		girq->chip = &idt_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &idt_gpio_irqchip);
 		girq->init_hw = idt_gpio_irq_init_hw;
 		girq->parent_handler = idt_gpio_dispatch;
 		girq->num_parents = 1;

-- 
2.34.1

