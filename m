Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091176B3815
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Mar 2023 09:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXzD45j2tz3ccg
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Mar 2023 19:07:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cbg0wETP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com; envelope-from=romain.perier@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cbg0wETP;
	dkim-atps=neutral
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXzCy0kDSz3c6C
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 19:06:53 +1100 (AEDT)
Received: by mail-ua1-x936.google.com with SMTP id f17so2951435uax.7
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 00:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678435609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ompnZ/3O4+0ABFbvCAC6GsX78rObx/mdpREpnU4Oecc=;
        b=cbg0wETPSFur5F3ohH6/3YUQUCSwXh/+CObEvJt4g2MpmNZh7VpVTvfi+R/DkrLdME
         Gl5ebrrnijQocAEx1ZUwF/botmS0rV7JbhaOZnwtPhrb1YszIIwNq+lpGzW9SZcp4u3x
         fj2aCPNJ8i6ajYYyaZOiicTI8Mo72RX0aXW/q2JKVKxHymZurjK1l1+OLwoMr/ttGeR/
         KRFDIifCS28nqitPTq3c0/oMJO8bt3E4FDu0ly5uFd0RyfpOcoGG61XQDAp8NKrfg9gX
         7ZYrdVAy0ae78C8fCXP07GddGi6Bd6X5GAw7eR5LcTAqu5bdW9s1EuhcOvzDyoWqYzD2
         txdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678435609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ompnZ/3O4+0ABFbvCAC6GsX78rObx/mdpREpnU4Oecc=;
        b=TzrXIgtrALG1vimLVuQmambDXfKzuJiUt4hUmblvVbIVvX019mDwK33lSsMOjElRhi
         xqp26HxJq7QlLdRofCpb4TCArdyHTQ/hf5rLYkI9zViky7ANIs4T5gEtjlTD+CdHdqVL
         ive9HefjBT8zfWVqbjvyHUKv0IiBaBc7zC324hhdv2wEOyLArhbZHN2ng/Or8wSTWVUr
         GPQ6TY57IVxyoZRi3i7SKxLmyAKUdXGsWkX4mwiBD2NCWQehulV+FdAmow6kaQ5HYmO/
         r0810MAytOFT4z9+73diyVHyz/1Z85PEbGcmmDJg2z/hnk7fJej0xpHaTwyMWN9xycRe
         /9rQ==
X-Gm-Message-State: AO0yUKVQU5MQrhcrri9cWBBmH30WMIThWfqz1XmxDMq7v+U5iwwcdIre
	nily2M1BMu0/P+naVdQP6BoNr0jOq/5KFzpi2fM=
X-Google-Smtp-Source: AK7set/qlJvjYuXoCyUYfAj6ozy+Oqc/tvsnLRcTu8sRCueO0ZP2nsCHjERtM+2sxUEh0L/Qs4oOjOXfDAA0Sh/rI6w=
X-Received: by 2002:ab0:5402:0:b0:688:d612:2024 with SMTP id
 n2-20020ab05402000000b00688d6122024mr16280357uaa.2.1678435609291; Fri, 10 Mar
 2023 00:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org> <20230215-immutable-chips-v3-11-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-11-972542092a77@linaro.org>
From: Romain Perier <romain.perier@gmail.com>
Date: Fri, 10 Mar 2023 09:06:38 +0100
Message-ID: <CABgxDoLkhOR=eq5TAoLk-GfOvPgKzbRyedaM+j-8YsRYn27DMw@mail.gmail.com>
Subject: Re: [PATCH v3 11/17] gpio: msc313: Convert to immutable irq_chip
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marc Zyngier <maz@kernel.org>, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, linux-omap@vger.kernel.org, William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le jeu. 9 mars 2023 =C3=A0 08:46, Linus Walleij <linus.walleij@linaro.org> =
a =C3=A9crit :
>
> Convert the driver to immutable irq-chip with a bit of
> intuition.
>
> This conversion follows the pattern of the gpio-ixp4xx
> hierarchical GPIO interrupt driver.

Hi,

lgtm

>
> Cc: Marc Zyngier <maz@kernel.org>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Romain Perier <romain.perier@gmail.com>

> ---
>  drivers/gpio/gpio-msc313.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index b0773e5652fa..036ad2324892 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -532,17 +532,35 @@ static int msc313_gpio_direction_output(struct gpio=
_chip *chip, unsigned int off
>         return 0;
>  }
>
> +static void msc313_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +
> +       irq_chip_mask_parent(d);
> +       gpiochip_disable_irq(gc, d->hwirq);
> +}
> +
> +static void msc313_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +
> +       gpiochip_enable_irq(gc, d->hwirq);
> +       irq_chip_unmask_parent(d);
> +}
> +
>  /*
>   * The interrupt handling happens in the parent interrupt controller,
>   * we don't do anything here.
>   */
> -static struct irq_chip msc313_gpio_irqchip =3D {
> +static const struct irq_chip msc313_gpio_irqchip =3D {
>         .name =3D "GPIO",
>         .irq_eoi =3D irq_chip_eoi_parent,
> -       .irq_mask =3D irq_chip_mask_parent,
> -       .irq_unmask =3D irq_chip_unmask_parent,
> +       .irq_mask =3D msc313_gpio_irq_mask,
> +       .irq_unmask =3D msc313_gpio_irq_unmask,
>         .irq_set_type =3D irq_chip_set_type_parent,
>         .irq_set_affinity =3D irq_chip_set_affinity_parent,
> +       .flags =3D IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
>  /*
> @@ -644,7 +662,7 @@ static int msc313_gpio_probe(struct platform_device *=
pdev)
>         gpiochip->names =3D gpio->gpio_data->names;
>
>         gpioirqchip =3D &gpiochip->irq;
> -       gpioirqchip->chip =3D &msc313_gpio_irqchip;
> +       gpio_irq_chip_set_chip(gpioirqchip, &msc313_gpio_irqchip);
>         gpioirqchip->fwnode =3D of_node_to_fwnode(dev->of_node);
>         gpioirqchip->parent_domain =3D parent_domain;
>         gpioirqchip->child_to_parent_hwirq =3D msc313e_gpio_child_to_pare=
nt_hwirq;
>
> --
> 2.34.1
>
