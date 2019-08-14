Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 067138CDAF
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 10:09:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467j152QCNzDqkR
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 18:09:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="B5hCQPPM"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467j0x2PwTzDqTZ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 18:09:36 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id b17so78689332lff.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3pu4WqgZpVtxAPpr6WRRG6CgvXxsRt/IJW7QWZZBkQ=;
 b=B5hCQPPM/FOpJJlOBHnIL4YX7ZnsrCAX7eRZbnz2PJMhtcI0fVe6V4tL+rTL5JoHgZ
 CHqDhH41nc5wKh+bC3n8fdrhtv10H700YfIlpEyJHujfqhUrKrq1Do8k8+av41R3vJeL
 qs0QfYp8SOYllcOBS3PKhtLI4alQkT7Kt94EHplLYwzMh9sG1DGikunIPOdaoMVMjVwP
 rN4aKmc05L+cbA9//qjMoTgsIYtOUYVIVrpo/q+SMLJzJZahwtGzHuBN85pWOa2Qdbu4
 T8V7sVe3UoVNzPP82tcfVm/NqmzSFZEFfwoH/i5jHXfTKL1QicnXiUITV3szo9S/2uof
 WWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3pu4WqgZpVtxAPpr6WRRG6CgvXxsRt/IJW7QWZZBkQ=;
 b=QWPl2Cv7BLEeaZIzwe3mcSRH2xpTuCc+62QUF08XIWFRfkgZ3QjbkKWbIyXUt2HQ5r
 adk8YIs0J4+dFuAoUGB7yEjLJy3FhvrH3+CIK1CQl2uXLc7IWNy3LuAZCsu4pGrQYuxJ
 IpFjFKIgxozvx/SsdDMJOs2hDngnlz6R07T6WYbasdpz23v4MK4KD4O868QgIaWTTzG6
 0iMGtQ/AauVlRG9nqXRZPIbPxfEop3C1p303FfBDyqT7NRgrOipQYapGk8rH9KvPfAQS
 P51llkrU53J7qd5RKI0IT8H/vm4PPCUjREhliEOqZWSexK0Fi6zjj0N3yv5entuhazOM
 l02g==
X-Gm-Message-State: APjAAAUaLATqfLasi0+JdrRN1dJb5NZWpI+GzOFajxMqQC/Yl3dy3ly/
 l7L+MSsCH1HO/DvAlltTSWjMHeSoNf3gcS5x/7EJIA==
X-Google-Smtp-Source: APXvYqxBCrpxYicv9hI8gzWTP6SjkdBV0kiAs9w9dXlSllL/56vgciBYrqOy9aeSFx8Aqqn7+5gXG80m6la1l53JTPU=
X-Received: by 2002:a19:e006:: with SMTP id x6mr24363756lfg.165.1565770171843; 
 Wed, 14 Aug 2019 01:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <1564603297-1391-1-git-send-email-hongweiz@ami.com>
 <1564603297-1391-3-git-send-email-hongweiz@ami.com>
In-Reply-To: <1564603297-1391-3-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Aug 2019 10:09:20 +0200
Message-ID: <CACRpkdaojLe3UTc0=66b5J2yrSOo7t8o5bAY=WRscL+met3iWQ@mail.gmail.com>
Subject: Re: [v7 2/2] gpio: aspeed: Add SGPIO driver
To: Hongwei Zhang <hongweiz@ami.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Hongwei,

thanks for your patch!

I have now merged the bindings so you only need to respin
this patch.

On Wed, Jul 31, 2019 at 10:02 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPIO driver support for Aspeed AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> Reviewed-by:   Andrew Jeffery <andrew@aj.id.au>

I guess I need to go with this, there are some minor things
I still want to be fixed:

> +static void __aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)

I don't like __underscore_functions because their semantic
is ambiguous.

Rename this something like aspeed_sgpio_commit() or
whatever best fits the actual use.

> +static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
> +                                  struct platform_device *pdev)
> +{
(...)
> +       rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_sgpio_irqchip,
> +                                 0, handle_bad_irq, IRQ_TYPE_NONE);
(...)
> +       gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_sgpio_irqchip,
> +                                    gpio->irq, aspeed_sgpio_irq_handler);

We do not set up chained irqchips like this anymore, sorry.

I am currently rewriting all existing chained drivers to pass
an initialized irqchip when registering the whole gpio chip.
See drivers/gpio/TODO.

Here are examples:
https://lore.kernel.org/linux-gpio/20190811080539.15647-1-linus.walleij@linaro.org/
https://lore.kernel.org/linux-gpio/20190812132554.18313-1-linus.walleij@linaro.org/

> +       /* set all SGPIO pins as input (1). */
> +       memset(gpio->dir_in, 0xff, sizeof(gpio->dir_in));

Do the irqchip set-up here, before adding the gpio_chip.

> +       rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> +       if (rc < 0)
> +               return rc;
> +
> +       return aspeed_sgpio_setup_irqs(gpio, pdev);

Yours,
Linus Walleij
