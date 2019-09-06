Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA279AC0D5
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 21:47:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q7PK3FbwzDrDy
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Sep 2019 05:47:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="JV3Gxop+"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q7PD1RPQzDr2c
 for <linux-aspeed@lists.ozlabs.org>; Sat,  7 Sep 2019 05:47:10 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id f13so6816950qkm.9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2019 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlriHQcPoNAAyA0m3FTNkIoAvIrt6CyS5DffxYEz37k=;
 b=JV3Gxop+nVe6QmZ91Cy718WYBKBAy8NjiGK4vtv+HjEfMdhIIBjEhWnBJdsRgYlyWr
 6Q0JSuJelzRFEQ/cvRNurMHnh4RnezG6ayGXFbCJDsZWwhDYiN8Rj8VgPLvDUmKAjXst
 DOD3sL8OIY+m5zWDXSDXsKLu+c86L3M9Esd0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlriHQcPoNAAyA0m3FTNkIoAvIrt6CyS5DffxYEz37k=;
 b=Qn64K4W3GWxAQrkM4XBVvijgIG3KgZYfj8UHO7NiycvIXc8khHHhsj6eDy0KcSq/ic
 z4jfxi4YK6tdlQR40fmO16RIW5x1eSL62p+XDVy48kUpULNXUGVG1uzb+KbGwL07XL8q
 SUN5WuN1KFca9q6AzqerAusCq5ZgzTzOmwimc3BdigRO2gYUSyRDU9TaREAhQZWPJs6p
 K0SRRdIHVYHmAtKOx9QZfQVs2GX73Jop5ICjnq3eqEtNEY3B4Ej+MXLWjK0pDvLh4dr9
 3bApCUOET8QvKOP4oXwsoL40xEaOk0am9Zb0dbr5iPCpEp1lP/p3S3Fae110hbbpQNJT
 3x4A==
X-Gm-Message-State: APjAAAUN3uuve8sJk7YkXuo4L4HAvSsosICzx8pIr5alveyEBUSYODTU
 8w36WkDxcHZ74Nh6j2raL4vTyPfqoMOC/FQIgJk=
X-Google-Smtp-Source: APXvYqzPbIKN8fLMP3JKF0jTbxrj163kAl2OUg9AwS3DSyA2kYmIJr9dAtyu/yz9wztF6mdPxhcTuHhbFMrrusGOrNI=
X-Received: by 2002:a37:bd5:: with SMTP id 204mr10857479qkl.330.1567799226454; 
 Fri, 06 Sep 2019 12:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062644.13445-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062644.13445-1-rashmica.g@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Sep 2019 19:46:55 +0000
Message-ID: <CACPK8XdWtg73-ZewJ7jThs0G-j5a3PL3Y9HLcMiEjU+8W_-_Uw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio/aspeed: Setup irqchip dynamically
To: Rashmica Gupta <rashmica.g@gmail.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 6 Sep 2019 at 06:26, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> This is in preparation for adding ast2600 support. The ast2600 SoC
> requires two instances of the GPIO driver as it has two GPIO
> controllers. Each instance needs it's own irqchip.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index b83e23aecd18..16c6eaf70857 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -52,6 +52,7 @@ struct aspeed_gpio_config {
>   */
>  struct aspeed_gpio {
>         struct gpio_chip chip;
> +       struct irq_chip irqc;
>         spinlock_t lock;
>         void __iomem *base;
>         int irq;
> @@ -681,14 +682,6 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
>         chained_irq_exit(ic, desc);
>  }
>
> -static struct irq_chip aspeed_gpio_irqchip = {
> -       .name           = "aspeed-gpio",
> -       .irq_ack        = aspeed_gpio_irq_ack,
> -       .irq_mask       = aspeed_gpio_irq_mask,
> -       .irq_unmask     = aspeed_gpio_irq_unmask,
> -       .irq_set_type   = aspeed_gpio_set_type,
> -};
> -
>  static void set_irq_valid_mask(struct aspeed_gpio *gpio)
>  {
>         const struct aspeed_bank_props *props = gpio->config->props;
> @@ -1192,7 +1185,12 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>
>                 gpio->irq = rc;
>                 girq = &gpio->chip.irq;
> -               girq->chip = &aspeed_gpio_irqchip;
> +               girq->chip = &gpio->irqc;
> +               girq->chip->name = dev_name(&pdev->dev);
> +               girq->chip->irq_ack = aspeed_gpio_irq_ack;
> +               girq->chip->irq_mask = aspeed_gpio_irq_mask;
> +               girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
> +               girq->chip->irq_set_type = aspeed_gpio_set_type;
>                 girq->parent_handler = aspeed_gpio_irq_handler;
>                 girq->num_parents = 1;
>                 girq->parents = devm_kcalloc(&pdev->dev, 1,
> --
> 2.20.1
>
