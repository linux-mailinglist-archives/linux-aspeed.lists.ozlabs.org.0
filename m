Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E56A35FE
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Feb 2023 01:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQ1ws72Mqz3bY0
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Feb 2023 11:44:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lEUzkWrp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lEUzkWrp;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQ1wk4kLbz2ygG
	for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Feb 2023 11:44:36 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id da10so19422108edb.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 26 Feb 2023 16:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KpmrTnzuyhRKv0JCadD+iEKjwnk+xgAUYhsA4Gj5pCk=;
        b=lEUzkWrptP2BxOmhswDXzWsZ0ehiM8/64HoGXTZcqkHkv2YWI8+nuRbT65vlupUzMS
         7w8MqMI2U+FruxAzue0e3DtDrNV4LzB9aOC0VZgB8T1qAeEIE9/kPejWRM30AvpjhzUW
         N27uX3f5pU49IXsrgSb5GYiqetcZIVkPGMv/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpmrTnzuyhRKv0JCadD+iEKjwnk+xgAUYhsA4Gj5pCk=;
        b=qhOBwMskmXRluXL95CYo6PtUQXyeJo9/uxdiNaZ83meiosU1YNAFCXUTU0Yyw7XWHI
         HnG0VZXMj/Aug07rpRnwiXBZ/MCmhMeo9aiJjFoKG+3GdFxrPOuwIcVbnH5EEJLqjll/
         yNi1wCkJRL7pKCb7Upq8DHbrIzwZYO/ma+D/3FrI5MCiHZ47aQCSI5Zd0ufyQMzDeOj9
         zJndYhZxPAxnoU0yaVoFgjEvRid0NCq1eCBjC2RZsTwBPSzJgAdNfoYDKysUJ8M5Sql6
         8OjSstXoeed8XAK7jGuLivm/NtXk2MohnnUp+3asKHQ6keBVk+RgOZH9Lgi0634uBPF9
         q5oA==
X-Gm-Message-State: AO0yUKVMNsE/L7XKvr0nC7zXqPbTElhIxZCTNl1Viht7JfsPaldRuIZn
	qU+UNdDKahut8h9gv7eq6VKtU2U8k1zSEL8HBkY=
X-Google-Smtp-Source: AK7set8rl0f6TKFK0MCg8M27+KjTjlNg2cWCQUqa5PUZCFS0jw2dMu+Oq+N5ni/aMuL+aXTb9+25i414NSsNLCwp4u0=
X-Received: by 2002:a50:9f28:0:b0:4ad:7ba3:5bce with SMTP id
 b37-20020a509f28000000b004ad7ba35bcemr10771163edf.7.1677458670886; Sun, 26
 Feb 2023 16:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org> <20230215-immutable-chips-v1-3-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-3-51a8f224a5d0@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Feb 2023 00:44:18 +0000
Message-ID: <CACPK8XeqDeXvF9RJ5ppSdjFAGHWDbojCr01Q5W=k=mkFgwQgPg@mail.gmail.com>
Subject: Re: [PATCH 03/17] gpio: aspeed: Convert to immutable irq_chip
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
Cc: Marc Zyngier <maz@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-omap@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Romain Perier <romain.perier@gmail.com>, William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 16 Feb 2023 at 09:37, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Convert the driver to immutable irq-chip with a bit of
> intuition.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Tested-by: Joel Stanley <joel@jms.id.au>

I attempted the conversion but wasn't sure how to proceed because we
dynamically create the irqchip depending on the presence of the
interrupt in the device tree. However, every device tree contains this
interrupt so perhaps we should clean that up.

Cheers,

Joel

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
>                 girq->parent_handler = aspeed_gpio_irq_handler;
>                 girq->num_parents = 1;
>                 girq->parents = devm_kcalloc(&pdev->dev, 1,
>
> --
> 2.34.1
>
