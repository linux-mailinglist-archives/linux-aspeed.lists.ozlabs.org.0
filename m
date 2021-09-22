Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D541450E
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 11:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDtCz00WDz2ym5
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Sep 2021 19:24:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20210112.gappssmtp.com header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hdQl6Jhv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=hdQl6Jhv; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDtCv2X9Wz2yQ8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Sep 2021 19:24:23 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id p4so7602502qki.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Sep 2021 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qQjS+YUNUrQvd5p8/QPjpYBhtl8QQcNn03ovFra/KVc=;
 b=hdQl6Jhv3nKZPrRqxUD2kabVRg98+lvqgn0CoqSwGnnrDujQzC69v6nON0dRjJfVec
 52e8QEZnDENir/5Twp754+5olSRwaYd0d5E/NnqVPxxjpekU2VL/Odg2EWucQDC3/zwZ
 GOIxWYwg42AitFyF696e21sf16kvS2qJAH6Tmk4y0gd2wig/p+DTZ2Nyh2ddnLuFPnvF
 pw1zBFHBP6s8LCkmIwy/WSMjvdSVi8OUdLSArKRpuafTBOy0bEPLl9SRuC0vBfL7iLKv
 PG4LJhWp+8brmA7zsWKrcgqOJxYHGIB4OKydFwYovbcsFc0C4zhQBuP3bplk6SoLP/VW
 opbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qQjS+YUNUrQvd5p8/QPjpYBhtl8QQcNn03ovFra/KVc=;
 b=MSIWc7jAbAJG6SJpr/hGFntrk9wGjDUC2m/1OWCzVfeWdnE3bX/s6VUR/Seqb+xhfk
 49ead+MNoCW6EXUnNZWp6PSJ688Yj/XZAwH7HMsxipPYFHViKSqe+p2IoSVbZnpd+poe
 GTfrLlr6wD7and67pU7FX9tAgkWwySf7DltX7PcvQlCt4oukSyWZGiybFxtu+RexgNIE
 U8xgjxQWlckA+BydK+kBdLzqimQx3mNHdZDB3dMR+1W4We+O9A+6XxZ6pCI5NHjNhaP4
 9MRGojkNbc9Z/E7ePgWJyjxVp2pPR2uIP9pYn8RYKSUHwIaewHf4VtVYIk6mbppNcwOR
 f1Kw==
X-Gm-Message-State: AOAM530TL1I4tGNbKOUcfARIc1hI4OA5slxFwYCmS7Gff4at+V5uKzWV
 3M68xzmh6Fwtfav3laaeW924qTG0qQNFxbkpWGYH8g==
X-Google-Smtp-Source: ABdhPJwLDef2xFFrYqwxuqRg5CszN9RklipON1tm1Qj57SF5l366b9nDgkBGGoz51etUG4uuzzrqW2ZyVSSBfmmG7JM=
X-Received: by 2002:a25:7146:: with SMTP id m67mr43571579ybc.353.1632302659089; 
 Wed, 22 Sep 2021 02:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210907095525.24668-1-steven_lee@aspeedtech.com>
 <20210907095525.24668-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210907095525.24668-2-steven_lee@aspeedtech.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 22 Sep 2021 11:24:08 +0200
Message-ID: <CAMpxmJVzAiZvg2xfUGgt5RqTyRbZggkxUTGZJod_5Tq2pzsS8g@mail.gmail.com>
Subject: Re: [PATCH -next v1 1/1] gpio: gpio-aspeed-sgpio: Fix wrong hwirq in
 irq handler.
To: Steven Lee <steven_lee@aspeedtech.com>
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
 <linux-aspeed@lists.ozlabs.org>, Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 7, 2021 at 11:55 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The current hwirq is calculated based on the old GPIO pin order(input
> GPIO range is from 0 to ngpios - 1).
> It should be calculated based on the current GPIO input pin order(input
> GPIOs are 0, 2, 4, ..., (ngpios - 1) * 2).
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 10f303d15225..3d6ef37a7702 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -395,7 +395,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
>                 reg = ioread32(bank_reg(data, bank, reg_irq_status));
>
>                 for_each_set_bit(p, &reg, 32)
> -                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p);
> +                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p * 2);
>         }
>
>         chained_irq_exit(ic, desc);
> --
> 2.17.1
>

Applied for fixes, thanks!

Bart
