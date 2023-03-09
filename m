Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DAC6B1CBB
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLq76tCFz3cLx
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 18:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t8rkah65;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t8rkah65;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLpR0PQMz3cNM
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 18:46:06 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id r27so1134874lfe.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 23:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxZa+3MhOrXUUjhkc+LrGW+xXurv1Litsrz7qLnZ7aI=;
        b=t8rkah655HCn9cL1h3Am/2+vV9AgN0P4gZ9nz2b0HxputsAayTbj821PqUa7otUYtR
         4rT352da4OCJCfzzGkx9v813htRdIT96XMYNv1//VWUxakgKq165OFenRYcp5/5kdn30
         Ag75I+gOCogp/+q0kzxvJtJZogUvIVcQ6yVAT6f0Y/qOf2S88dCiQqa5kz0UCIj+C6e6
         1m4ygY3ig91t87dlglPlwRBVeCJWVMX0RsTwJN65yun6okbknftwuSQ0DyUnVS6P73If
         0ODs59J99Vwr19HNTlOec8uCB7RYpPoN87qHQYs/v3qQNAJdhj0QMK29Zyylffu6ehsm
         KNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxZa+3MhOrXUUjhkc+LrGW+xXurv1Litsrz7qLnZ7aI=;
        b=n4hC4pSCN//4cPGDr0AW20ll/ZJjQgUCQU52b1xQClU+O+qnblVaic0HfAnfMcpRb+
         QL4d0WC5jNWRGWtH8MAEoVsHQ3zWbIQHdpdud2qI/EyaIR2wzF26bXVNGBSjaFdXrmcN
         z57VwPeqmyzSN1s5qk5baTIxbAfk08MxwvK41wUcg3unIzorIiGpfvHLcOOBOxTwq8iu
         g7ah3nclSTcMSisr1ypzn0k3Q3B2toCU6q8Kb0Xlo7m6ARQQX0afatUTEzqp6QwBIj7l
         +c6XVWjz2smSozYXpSIW1dHm7rRsss67M794gEmD4fiFi92fu++h/kXjlI2DhCIuMdSs
         WWTg==
X-Gm-Message-State: AO0yUKVV+f2Z1S3Dr7EsSQe6QDRbAbo9VX/UUNbO8O/XtUBBtoB1tXlB
	7AMvGk8hvcrIGd6fDHUfaDR3Dw==
X-Google-Smtp-Source: AK7set9+YUkmbffwVNF3AIk/o8rXQz65/wJCi4qVl7hoX4l3kYgknjGEoz/Z3F52gOsCNKsSA4bbQA==
X-Received: by 2002:ac2:4475:0:b0:4b0:1305:6e02 with SMTP id y21-20020ac24475000000b004b013056e02mr6031006lfl.8.1678347962992;
        Wed, 08 Mar 2023 23:46:02 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:02 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 09 Mar 2023 08:45:55 +0100
Subject: [PATCH v3 07/17] gpio: cadence: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-7-972542092a77@linaro.org>
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

