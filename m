Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE72699016
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:38:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHVHB6ftRz3cj1
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:37:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wToZTfdu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wToZTfdu;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVGP0tptz3cjb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:37:17 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id o20so2033040lfk.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8DZXGe1xObRdMsVrQnS0lb6atFLew5i7Tuuw+JmgFw=;
        b=wToZTfduTW2q2j/bGKbgja2LztHwIOlTvQClVG+7cNvEpVrBrdTXDxJ3tqPsww+jAU
         uFKNuUgQk59p9xMCGS4hUu4Fdd6MZKvHWYPIa0qNjOMGCRBdwNtBYOITKDvhHAgElWY7
         OsAu34b1GzQnWgTTZ+jNFlF/b4vZxwTmq9EYK74hhDBVZyhirLKzDGeIP66uzG/msCPG
         EhqEBh4GTOejc0igvcr/8lok1FfaznsI+Jh+fKN4YUo0LSZuLC+VW2yIKfWcdj5AqvLY
         YIe1/gi0msoyPZ/Ipp8ej0AR/br+SV8hO42S+eX7KVzs9Q1+mTxdIJWASXjIzYE8hR03
         wIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8DZXGe1xObRdMsVrQnS0lb6atFLew5i7Tuuw+JmgFw=;
        b=p8e8WNzhYNnefzWiHEjCoPw0SkP8R+LxKhbrv8NZUbHBQ4tt1d02U26LXw3dMXY5ZX
         RL2pVruDydfesIHFlRoswdsDdd5hiVjrm9DXsZNPixrzFposRwDGxgZ3Q6Zfs2CM1O6p
         R05ad58LyUrwxt6SJwhrsvljwCm6MWCSRIPYZDGYugHqvF8wjVBd7xP8kzcUBg5GycgW
         OzM16FgRykGwwNm7XBjKzBsTAFD18MGXHZ3d7mF6Bbjf5gEvMcdSa7/DUNTr5lNEGT0I
         OIAAnAWUDMhkPyiqdE5ZW2k2ngslJMQDLtZf4kR3/8hMJiMjOmVfQv0QUhvoAQQCclBF
         rG9w==
X-Gm-Message-State: AO0yUKWcpWs7hIqzvNisNLqZIzK+4adjK5gxvjAA2UTVG97UCy4GgulA
	IRjQ1osuONsvvIxIn5Q3n3p0cQ==
X-Google-Smtp-Source: AK7set8Z0okFMceuj7JkpWst6furWlPvgO9yX4syLTxbrHFyCV29/k8L68uKNAT/IDo4m+Q4vgpHJA==
X-Received: by 2002:ac2:5088:0:b0:4db:80:fba2 with SMTP id f8-20020ac25088000000b004db0080fba2mr1742040lfm.63.1676540236497;
        Thu, 16 Feb 2023 01:37:16 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Feb 2023 10:37:11 +0100
Subject: [PATCH 10/17] gpio: idt3243x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-10-51a8f224a5d0@linaro.org>
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

