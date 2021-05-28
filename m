Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E499393ED9
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 10:36:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fryh31spsz2ymb
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 18:36:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eKWJz4ar;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eKWJz4ar; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frygz5YtWz2xtj
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 May 2021 18:35:56 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id b26so4171040lfq.4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 May 2021 01:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qXzQIPasUcthmSDz8eSF+P9ruKadFcmRFPG5VSNQtL8=;
 b=eKWJz4art9JMWcy6y6iWK9LFwP2pQvAov+Vsbn1np7ccpJfXlVE+B9uDjzPJkkISWg
 2jHaOl5Oe3gGxfXA6LgeTrMqL3Gcw59pnwKpxvt8qVyoVD3gBZ5kgubk2uIVa3+XtnMV
 2V92ED5sEIA5YUZIqSGlECauLUkp+VLy0BPS29E5R4b1OW/oEDzMGfRYxzM+31d+6868
 uf5AXz1khjan90xUAKlOHv+5eb4/32xWzgjOA4a4yMZ67GancPJwneDU6vE1rcZ2041T
 2ZfGpbwNnxRzyB+Cw/7D8H11DdXHZHN53I7V1Mhgpvu3OZ8ELlLXIA0P4KJczeoWtWpC
 AsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXzQIPasUcthmSDz8eSF+P9ruKadFcmRFPG5VSNQtL8=;
 b=GpjWvmrdhZ+OG8j4ghOlUluzQIsR1ZJ8r1nO4VHNgU5ehqQtLgkXsD4POmgbwSVSc0
 UgO/SAe74ksOra2r3lBd9IC5X387dHhwXgramLZrJAEu2r8aj77AvHTEWSORyFrDRgQ9
 0RoI0q/IHQp/Xm9qjFNZrOcVQ+sQ5uLW4G2ljQSF5xD0I/zxlH49UZ99ZIG/OfD4br5h
 a5il+Zs8R4P1pfSyWuRSKUUbMmz2DtxA95a+HHApIgzSj9qAIeVlFhca8emLCc1soNlK
 c4BQgorwtw+rQMvMTVClB39PtMW3vhaKOrM7mo9yAI4ayrNG6Q6nToI2zkAHm3/tKmPV
 90Cg==
X-Gm-Message-State: AOAM5339TUpFawDhwfQIAcLGD+C+rCVPs74zs3AiWH/TpEHc0RY5XLht
 vAonfTB4nvv6WjIQ7Fw4ZH20t4tNskOYE6fH+LdHhw==
X-Google-Smtp-Source: ABdhPJx7fY2eoo3ewpiwsQcdfnOZOMZDOGzICz8TqAeiPIIG9rFXZg0ycCOFOJyYz6YC0EypW/bfzb3UTuupkbD3PwU=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr5005230lfp.649.1622190949032; 
 Fri, 28 May 2021 01:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com>
 <CACRpkdZFcFuT9rdrc8BfEBmhy0--9uLMSJWfr=A+nU117_BT8A@mail.gmail.com>
 <20210528040934.GA28403@aspeedtech.com>
In-Reply-To: <20210528040934.GA28403@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 10:35:37 +0200
Message-ID: <CACRpkdYnvzOW_86QgLAsNpNXWZXpaMiE7g9_jHZ0ZsFyhOjjAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings to
 yaml.
To: Steven Lee <steven_lee@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, May 28, 2021 at 6:10 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> The 05/28/2021 07:51, Linus Walleij wrote:
> > On Thu, May 27, 2021 at 2:55 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > > +  max-ngpios:
> > > +    description:
> > > +      represents the number of actual hardware-supported GPIOs (ie,
> > > +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> > > +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> > > +      device. We also use it to define the split between the inputs and
> > > +      outputs; the inputs start at line 0, the outputs start at max_ngpios.
> > > +    minimum: 0
> > > +    maximum: 128
> >
> > Why can this not be derived from the compatible value?
> >
> > Normally there should be one compatible per hardware variant
> > of the block. And this should be aligned with that, should it not?
> >
> > If this is not the case, maybe more detailed compatible strings
> > are needed, maybe double compatibles with compatible per
> > family and SoC?
> >
>
> Thanks for your suggestion.
> I add max-ngpios in dt-bindings as there is ngpios defined in
> dt-bindings, users can get the both max-ngpios and ngpios information
> from dtsi without digging sgpio driver.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-g5.dtsi#n354
>
> If adding more detailed compatibles is better, I will add them to sgpio driver
> in V3 patch and remove max-ngpios from dt-bindings.
>
> Since AST2600 has 2 sgpio controller one with 128 pins and another one with 80 pins.
> For supporting max-ngpios in compatibles, 2 platform data for each
> ast2600 sgpio controller as follows are necessary.
>
> ```
> static const struct aspeed_sgpio_pdata ast2600_sgpiom1_pdata = {
>         .max_ngpios = 128;
> };
> static const struct aspeed_sgpio_pdata ast2600_sgpiom2_pdata = {
>         .max_ngpios = 80;
> };
>
> { .compatible = "aspeed,ast2500-sgpio" , .data = &ast2400_sgpio_pdata, },
> { .compatible = "aspeed,ast2600-sgpiom1", .data = &ast2600_sgpiom1_pdata, },
> { .compatible = "aspeed,ast2600-sgpiom2", .data = &ast2600_sgpiom2_pdata, },

There is a soft border between two IP blocks being "compatible"
and parameterized and two IP blocks being different and having
unique compatibles.

For example we know for sure we don't use different compatibles
because of how interrupt lines or DMA channels are connected.

So if this is an external thing, outside of the IP itself, I might back
off on this and say it shall be a parameter.

But max-ngpios? It is confusingly similar to ngpios.

So we need to think about this name.

Something like gpio-hardware-slots or something else that
really describe what this is.

Does this always strictly follow ngpios so that the number
of gpio slots == ngpios * 2? In that case only put ngpios into
the device tree and multiply by 2 in the driver, because ngpios
is exactly for this: parameterizing hardware limitations.

Yours,
Linus Walleij
