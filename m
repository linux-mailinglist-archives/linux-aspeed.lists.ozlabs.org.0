Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54A6ADFC2
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 14:05:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWFzy2TLsz3cMc
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 00:05:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FOsLAFR4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FOsLAFR4;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWFzB5wmDz3cGk
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 00:04:54 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id n2so16923964lfb.12
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 05:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxZa+3MhOrXUUjhkc+LrGW+xXurv1Litsrz7qLnZ7aI=;
        b=FOsLAFR4aJaT6cegudEG+nQzhg/px9P0RBR3m2KqmJXANgyhdZkOgw0Oqs/2NwomjO
         cNp7npQYIZ+zBcHN1RcsOqNPaVgcLdlTzLmwbqXXbqyAa6DWI8nttbGR7YVg52zyxiR8
         QffXvLy84zDBN8oWts17U5XpHOEecbe58+/BwLQ4VQrLqhk6whlyMPWoOYE4iA63xJ+j
         4wJ+sxiQhb3y2ftp6oQrPLYWIJ4Cbk97ymR5SrP+I1yi/Jf4gNaYHRxRtJ+R4gpuOI/F
         /Zdq9EgQ+4blVaLXq6zhOfo0Nkyxh1Hprys2CEK6+yjk/dZCdyWL79gAm8XIOJ+ew0Dx
         xepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxZa+3MhOrXUUjhkc+LrGW+xXurv1Litsrz7qLnZ7aI=;
        b=k1NQ7PAhp1lLbRDaL0zwxEXSJUQGzOjfbWe3dJHBALNX5Ij5KUSc3H6eL4PSowop7o
         WahDxoI4uWjYL2lTApdk7t6mO8gibS+r2OEJua4R03EuRL4mV66DhgS7Kw6k+r5c5qhI
         IZsytVm/gmsbd7rdPK8ZNiW28mzPbRwb48f6dflwRSrExFBF/45fP9/n1uJ1nqv5cr8g
         C3YIbvYx5pBmeMUuPW5EZ0PlDY0CKHSiCXJ+UAg9h0Gxsl461HfbGlPle7bY2uJjy6SQ
         qk9X9zO81JrqgKUizmnZZhUQQ9NSM+wzxJVQ8WSGr3X3eaVdeyTzi5xs06A/yk9RtPVb
         ZcIA==
X-Gm-Message-State: AO0yUKW89Y/CSi54YzLmxHwVEmRp9yQhScM+Ul+4+VImmaKJLrp29Vbk
	qPsKMclD4io3jn6UvY9jbIyQQA==
X-Google-Smtp-Source: AK7set+G1fG9oVwtlrbXsTuC1Xj1dVb/epzn2WdT/mLhlI1kqvrL2HGEs2SVGZUSSYmXicyy5x+ljw==
X-Received: by 2002:a05:6512:10c2:b0:4d8:86c1:4772 with SMTP id k2-20020a05651210c200b004d886c14772mr4298774lfg.7.1678194291670;
        Tue, 07 Mar 2023 05:04:51 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:51 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Mar 2023 14:04:48 +0100
Subject: [PATCH v2 06/16] gpio: cadence: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-6-d6b0e3f2d991@linaro.org>
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
 drivers/gpio/gpio-cadence.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index 137aea49ba02..3720b90cad10 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -70,6 +70,7 @@ static void cdns_gpio_irq_mask(struct irq_data *d)
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
 	iowrite32(BIT(d->hwirq), cgpio->regs + CDNS_GPIO_IRQ_DIS);
+	gpiochip_disable_irq(chip, irqd_to_hwirq(d));
 }
 
 static void cdns_gpio_irq_unmask(struct irq_data *d)
@@ -77,6 +78,7 @@ static void cdns_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
+	gpiochip_enable_irq(chip, irqd_to_hwirq(d));
 	iowrite32(BIT(d->hwirq), cgpio->regs + CDNS_GPIO_IRQ_EN);
 }
 
@@ -138,11 +140,13 @@ static void cdns_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irqchip, desc);
 }
 
-static struct irq_chip cdns_gpio_irqchip = {
+static const struct irq_chip cdns_gpio_irqchip = {
 	.name		= "cdns-gpio",
 	.irq_mask	= cdns_gpio_irq_mask,
 	.irq_unmask	= cdns_gpio_irq_unmask,
-	.irq_set_type	= cdns_gpio_irq_set_type
+	.irq_set_type	= cdns_gpio_irq_set_type,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int cdns_gpio_probe(struct platform_device *pdev)
@@ -222,7 +226,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		struct gpio_irq_chip *girq;
 
 		girq = &cgpio->gc.irq;
-		girq->chip = &cdns_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &cdns_gpio_irqchip);
 		girq->parent_handler = cdns_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, 1,

-- 
2.34.1

