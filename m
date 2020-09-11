Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08532656F3
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 04:21:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnfdY0CR2zDqkq
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 12:21:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fUHEbIAz; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnfdQ3BTHzDqhN
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 12:21:30 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id n22so8410294edt.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 19:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tj2t95Ze73swWD6k2tc6L6Ey6C/gEPP1/6YDyLUTQ8s=;
 b=fUHEbIAzuvX+0lTwzuC8LNuolHbBFlk8nal7opR3A4AYrMOVp5u3EHzNG8XU367FPl
 A1DR6RG7yq3DRgHil/V6nRD0SNEbpfnPWsl0G2WUKz//MHwEPiBRgK3mHYya2lNzQb6P
 Uwg4QaGKgpsFlp4IxLHYNedVFmN86/+OOcgU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tj2t95Ze73swWD6k2tc6L6Ey6C/gEPP1/6YDyLUTQ8s=;
 b=MxzbdctmbkVKzghRiXTw36/idyPE4M8SFbN+uTdb64VOA6c4knhcAezo0LHL69XOLo
 qfYlwx/JyY+bnLNmFrIIs1Ebq2mfDctQCkFknBDniEne7a+W7O2I3KQQ3NvAx1LHQGSx
 /WDUeo9KM5Sxkup+cinkefW3IsgLDJgpASzXZtidn5VV4hYVxS3m4gV/7S1Ei8H4FYo8
 qSDTapUosd0wFT08rkur9loXO0X7siLkQgJ8Aouyvdu0bjuJAScSk60GheuM4+Izdrs8
 Go+Z0ph6P0K1/HhYPrAEiQ678bX+RrCi786Fuvu6p13DBLEfq5regIl71OUFdlALfY4N
 8IJw==
X-Gm-Message-State: AOAM532eojDNpC4k9A/bEeu9OBlXmRgmx0pCM9F5bHFN43Bl2GIeUEC9
 IpDxmjfqcI02VqdDh+eBS61qJUyTTphsJ23/A4k=
X-Google-Smtp-Source: ABdhPJya3ZCopKPQvKtv2oSG4E1csSZD3pBVuEyBwyhlBblULY0YLM3Kl7f6y8yg8qzJsr6cX3SJ9Plad+UvzYNKkCs=
X-Received: by 2002:a50:fb0e:: with SMTP id d14mr13120668edq.172.1599790887514; 
 Thu, 10 Sep 2020 19:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <20200911015105.48581-2-jk@codeconstruct.com.au>
In-Reply-To: <20200911015105.48581-2-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 02:21:15 +0000
Message-ID: <CACPK8XcK6pQpLZZudr1ovzxRqxT5ph5un+m3OwhnsFr+2-YtUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio/aspeed-sgpio: don't enable all interrupts by
 default
To: Jeremy Kerr <jk@codeconstruct.com.au>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Currently, the IRQ setup for the SGPIO driver enables all interrupts in
> dual-edge trigger mode. Since the default handler is handle_bad_irq, any
> state change on input GPIOs will trigger bad IRQ warnings.
>
> This change applies sensible IRQ defaults: single-edge trigger, and all
> IRQs disabled.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> ---
> v2:
>  - update comments to reflect trigger mode change
>  - tweak wording to reflect disabled state & single-edge trigger mode
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index a18ca52432e0..64e54f8c30d2 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -452,17 +452,15 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
>         irq->parents = &gpio->irq;
>         irq->num_parents = 1;
>
> -       /* set IRQ settings and Enable Interrupt */
> +       /* Apply default IRQ settings */
>         for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
>                 bank = &aspeed_sgpio_banks[i];
>                 /* set falling or level-low irq */
>                 iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
>                 /* trigger type is edge */
>                 iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
> -               /* dual edge trigger mode. */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
> -               /* enable irq */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
> +               /* single edge trigger */
> +               iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
>         }
>
>         return 0;
> --
> 2.28.0
>
