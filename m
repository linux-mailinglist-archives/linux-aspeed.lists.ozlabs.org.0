Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 474982922F8
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Oct 2020 09:30:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF7h958z9zDqcP
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Oct 2020 18:30:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dHxcpHMG; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF7h31yNxzDqXr
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Oct 2020 18:30:10 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id 188so7052482qkk.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Oct 2020 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCInhAihFUcCpT7knzBgZ6WU9Eh9FYnKZwNfURzaMMs=;
 b=dHxcpHMGJ1PAhEaksLz7FZvDQOLysBNLbNSuihHHruNZTn03gxWyFdXcTHQ2DDwNZR
 mQjE0nhOEaX5tJZZkQZS0yGqdRm98t67eDqwdd1+rIBh6uBlbLKsuEUDZa5hGKJ2Twy5
 a7jMqx3WEby9eKaY5YZyW+ItKFJueZ74CqRfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCInhAihFUcCpT7knzBgZ6WU9Eh9FYnKZwNfURzaMMs=;
 b=HB/48Zn/xB1BS0L1pghmIT4pBe9OjBhFjmJn0lrzTB4ZkYhtRddlhb1dPcox2gI6Le
 5doB9ukB4S/i7b+16d36SDUGmI/20BjpDh9tEHh8qFyJ0KcMD1TT+3aTpN39761tmAtB
 +YNOHFgkq5qcdZnF/gOKzh/DZpjPsGwersUgz7O3sniS4+U8TF3hkxKj7/dx5X3l/7kg
 T2WVDuPhgkmXDJB6V9aK7ynbND8sz+1sSXU0fsgvNvHzWVO33gbSKpV4zsFBjZx4Rt0F
 o5RYGoUCx60Ql7JHBTzThjNC31i45AIX4kA8NY/ArzxGd0G6SIuw1e1CSaZtQE1g4TJt
 vOVQ==
X-Gm-Message-State: AOAM530a2XYH0mRgAD4QfUMviX5V8Dx5iS78Ks1JPRWO63d7WQfIQ4eS
 XR8kv9GRnq3+Q2gndVCN5QpJSnEeLQx67Xt/2hY=
X-Google-Smtp-Source: ABdhPJw/IqE3LR106FT98SjcxaRDqwmMNgsw+032qhQPFInhOWVOU0mUQsS5kxQBPJ5GWZg0+3LYkurMiUUcs13u/4U=
X-Received: by 2002:a37:4a4d:: with SMTP id x74mr15107575qka.55.1603092606847; 
 Mon, 19 Oct 2020 00:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Oct 2020 07:29:54 +0000
Message-ID: <CACPK8Xdp16BJYpGOB9qmXjYDgU7s8eOAiYNDPniRwq3qnG8d5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Mon, 19 Oct 2020 at 04:50, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> GPIO_T is mapped to the most significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_T is input only. All
> the other bits need to be 1 because GPIO_Q/R/S support both input and
> output modes.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is a very similar commit message to the one that Tao sent out, so
I thought for a moment that it was a duplicate patch. I can see now
that it's a different change.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")

Cheers,

Joel




> ---
>  drivers/gpio/gpio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d07bf2c3f136..f24754b3f6d1 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,6 +1114,7 @@ static const struct aspeed_gpio_config ast2500_config =
>
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>         /*     input      output   */
> +       {4, 0xffffffff,  0x00ffffff}, /* Q/R/S/T */
>         {5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
>         {6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>         { },
> --
> 2.17.1
>
