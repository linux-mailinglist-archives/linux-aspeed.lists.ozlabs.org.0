Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A746AFC36
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 02:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWZKy75BWz3cfj
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 12:22:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EBSM/OKB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EBSM/OKB;
	dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWZKp6Gdlz3bh0
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Mar 2023 12:22:05 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id j11so40262502edq.4
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 17:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1678238523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kgCshYxZS/Jm2b+NgeZjnnNv6WQ+2nHoInOLBGQV6es=;
        b=EBSM/OKBjqJulrz6TQNgJmChnhPr0q4Ih/pJ8qfs1lFfhYhl7MmNufwH7KyopSrkiM
         /hYj//hqzBibHr71DguP6GZ8jz9ZuzXSPyIw+7TDHNCcOZCg/SAEP3LQVmc4pMlZf+ra
         OVoGWdaPjkoIpHiwMugodeNzumVR4mfmhZcQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678238523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgCshYxZS/Jm2b+NgeZjnnNv6WQ+2nHoInOLBGQV6es=;
        b=BI0FWV1eQFZAQhl/cLGlXu5BoClJ7mfwHoHXRg7Of21x18P7EEFL1Aj5HxuVw9mw4Z
         k29Ejh5x6O2lIcfuV0zKaGT1TaFmsQpMCJpBC57SkInGtE1wbT5uk5lhLt/gHefm7R7v
         pROlIojfNGv0TNfvVql61ZyrD1ojinHCrTRtsggzXSf4EvKFIA1vE0h1LLJnstOvm+AY
         tkJryKPhz48K2Q8Yrb/S8SnkTA8zliEBKssYvdU2Nd/FRewcwvfSf63FvZBLONdhpdWw
         UHg7+KV8CRp2H5B3OJQou2ghGTdIWICwyIHPbERHKVwY+Mg7jbnKJPgtyLEsjCBb4klI
         Uk+w==
X-Gm-Message-State: AO0yUKUFVUiL4RJmchRLG7mCV1+7l9ZBQOpA7+3Ky+wFmGwd9TSNh1eY
	eP28CWdQZOHlza5l3jC9Luaa4HhDxr/kH4Qa4Kk=
X-Google-Smtp-Source: AK7set88tsv/WvfOjstIfDoVJMzUSUbMMHZrM4x7KZhGl281R5lLlHUX/2cFaTNKcE7r7eZzaz9BIYn25v2RRmY+iGU=
X-Received: by 2002:a17:906:a01a:b0:8f5:2e0e:6dc5 with SMTP id
 p26-20020a170906a01a00b008f52e0e6dc5mr8445498ejy.0.1678238522506; Tue, 07 Mar
 2023 17:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org> <20230215-immutable-chips-v2-3-d6b0e3f2d991@linaro.org>
In-Reply-To: <20230215-immutable-chips-v2-3-d6b0e3f2d991@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Mar 2023 01:21:50 +0000
Message-ID: <CACPK8Xc7ekzM9oeR7+fYuK8RfZ4jA8gpH=nUJ-OTp0XZoKwzHQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] gpio: aspeed: Convert to immutable irq_chip
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marc Zyngier <maz@kernel.org>, linux-omap@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Romain Perier <romain.perier@gmail.com>, William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 7 Mar 2023 at 13:04, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Convert the driver to immutable irq-chip with a bit of
> intuition.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-aspeed.c | 44 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index a94da80d3a95..9c4852de2733 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
>
> @@ -53,7 +54,7 @@ struct aspeed_gpio_config {
>   */
>  struct aspeed_gpio {
>         struct gpio_chip chip;
> -       struct irq_chip irqc;
> +       struct device *dev;
>         raw_spinlock_t lock;
>         void __iomem *base;
>         int irq;
> @@ -566,6 +567,10 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
>
>         addr = bank_reg(gpio, bank, reg_irq_enable);
>
> +       /* Unmasking the IRQ */
> +       if (set)
> +               gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
> +
>         raw_spin_lock_irqsave(&gpio->lock, flags);
>         copro = aspeed_gpio_copro_request(gpio, offset);
>
> @@ -579,6 +584,10 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
>         if (copro)
>                 aspeed_gpio_copro_release(gpio, offset);
>         raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +       /* Masking the IRQ */
> +       if (!set)
> +               gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
>  }
>
>  static void aspeed_gpio_irq_mask(struct irq_data *d)
> @@ -1080,6 +1089,30 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);
>
> +static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
> +{
> +       const struct aspeed_gpio_bank *bank;
> +       struct aspeed_gpio *gpio;
> +       u32 bit;
> +       int rc, offset;
> +
> +       rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);

Why do we call this instead of using irq_data_get_irq_chip_data?

Actually, the callback appears to do the same as the default
implementation, so we could just drop it?

from kernel/irq/proc.c:

        if (desc->irq_data.chip) {
                if (desc->irq_data.chip->irq_print_chip)
                        desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
                else if (desc->irq_data.chip->name)
                        seq_printf(p, " %8s", desc->irq_data.chip->name);

A test on the rainier ast2600 bmc machine:

# gpio-event-mon -n gpiochip0 -o 123 -r -f &
# cat /proc/interrupts  |grep gpio-event-mon
 60:          0          0  1e780800.gpio 123 Edge      gpio-event-mon




> +       if (rc)
> +               return;
> +
> +       seq_printf(p, dev_name(gpio->dev));
> +}
> +
> +static const struct irq_chip aspeed_gpio_irq_chip = {
> +       .irq_ack = aspeed_gpio_irq_ack,
> +       .irq_mask = aspeed_gpio_irq_mask,
> +       .irq_unmask = aspeed_gpio_irq_unmask,
> +       .irq_set_type = aspeed_gpio_set_type,
> +       .irq_print_chip = aspeed_gpio_irq_print_chip,
> +       .flags = IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  /*
>   * Any banks not specified in a struct aspeed_bank_props array are assumed to
>   * have the properties:
> @@ -1149,6 +1182,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         if (IS_ERR(gpio->base))
>                 return PTR_ERR(gpio->base);
>
> +       gpio->dev = &pdev->dev;
> +
>         raw_spin_lock_init(&gpio->lock);
>
>         gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
> @@ -1208,12 +1243,9 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>
>                 gpio->irq = rc;
>                 girq = &gpio->chip.irq;
> -               girq->chip = &gpio->irqc;
> +               gpio_irq_chip_set_chip(girq, &aspeed_gpio_irq_chip);
>                 girq->chip->name = dev_name(&pdev->dev);
> -               girq->chip->irq_ack = aspeed_gpio_irq_ack;
> -               girq->chip->irq_mask = aspeed_gpio_irq_mask;
> -               girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
> -               girq->chip->irq_set_type = aspeed_gpio_set_type;
> +

I was thinking we could make the interrupt registration unconditional,
as there's always an irq in the device tree. Happy to send a follow
up, or for you to fold in a change along the lines of this:

--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1091,14 +1091,7 @@ EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);

 static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
-       const struct aspeed_gpio_bank *bank;
-       struct aspeed_gpio *gpio;
-       u32 bit;
-       int rc, offset;
-
-       rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
-       if (rc)
-               return;
+       struct aspeed_gpio *gpio = irq_data_get_irq_chip_data(d);

        seq_printf(p, dev_name(gpio->dev));
 }
@@ -1108,7 +1101,7 @@ static const struct irq_chip aspeed_gpio_irq_chip = {
        .irq_mask = aspeed_gpio_irq_mask,
        .irq_unmask = aspeed_gpio_irq_unmask,
        .irq_set_type = aspeed_gpio_set_type,
-       .irq_print_chip = aspeed_gpio_irq_print_chip,
+//     .irq_print_chip = aspeed_gpio_irq_print_chip,
        .flags = IRQCHIP_IMMUTABLE,
        GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
@@ -1170,6 +1163,7 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
        const struct of_device_id *gpio_id;
+       struct gpio_irq_chip *girq;
        struct aspeed_gpio *gpio;
        int rc, i, banks, err;
        u32 ngpio;
@@ -1238,27 +1232,25 @@ static int __init aspeed_gpio_probe(struct
platform_device *pdev)

        /* Optionally set up an irqchip if there is an IRQ */
        rc = platform_get_irq(pdev, 0);
-       if (rc > 0) {
-               struct gpio_irq_chip *girq;
-
-               gpio->irq = rc;
-               girq = &gpio->chip.irq;
-               gpio_irq_chip_set_chip(girq, &aspeed_gpio_irq_chip);
-               girq->chip->name = dev_name(&pdev->dev);
-
-               girq->parent_handler = aspeed_gpio_irq_handler;
-               girq->num_parents = 1;
-               girq->parents = devm_kcalloc(&pdev->dev, 1,
-                                            sizeof(*girq->parents),
-                                            GFP_KERNEL);
-               if (!girq->parents)
-                       return -ENOMEM;
-               girq->parents[0] = gpio->irq;
-               girq->default_type = IRQ_TYPE_NONE;
-               girq->handler = handle_bad_irq;
-               girq->init_valid_mask = aspeed_init_irq_valid_mask;
+       if (rc < 0) {
+               return rc;
        }

+       gpio->irq = rc;
+       girq = &gpio->chip.irq;
+       gpio_irq_chip_set_chip(girq, &aspeed_gpio_irq_chip);
+       girq->chip->name = dev_name(&pdev->dev);
+
+       girq->parent_handler = aspeed_gpio_irq_handler;
+       girq->num_parents = 1;
+       girq->parents = devm_kcalloc(&pdev->dev, 1,
sizeof(*girq->parents), GFP_KERNEL);
+       if (!girq->parents)
+               return -ENOMEM;
+       girq->parents[0] = gpio->irq;
+       girq->default_type = IRQ_TYPE_NONE;
+       girq->handler = handle_bad_irq;
+       girq->init_valid_mask = aspeed_init_irq_valid_mask;
+
        gpio->offset_timer =
                devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
        if (!gpio->offset_timer)


>                 girq->parent_handler = aspeed_gpio_irq_handler;
>                 girq->num_parents = 1;
>                 girq->parents = devm_kcalloc(&pdev->dev, 1,
>
> --
> 2.34.1
>
