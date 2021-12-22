Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767947CF08
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 10:18:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJnnY0WKqz2yqC
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 20:18:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=pxusAbbW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=pxusAbbW; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJnnR52X9z2xsx
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Dec 2021 20:18:49 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id y22so6124294edq.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Dec 2021 01:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HWSjPah2c2AaRSP+2vHU6yInVlSDXI70ImIfpbXN8E4=;
 b=pxusAbbWkBP8vA3FVas18AbqOH3j0+P39gHD1PiNPE+veMjKeURYaGR2eFOeBB01PF
 8Fj+NJU2IougbIMEWqzIy+ekGrkV++QGSTrw2itZd6TzRtUkmHeuSg7WswBRKf9NQPYx
 eah3fr/rMVIakHtSBSAf3LQqOFDI4IzYO+PsqUT1BtypJ4FL+reEw8D6HK06IGC7M1y8
 peOyuf7CT5cb2Jti3eQ7JBlGp/xP9HfCtRopVV1SfHep7KQ9yOSOppztuoGgUw1gkxK8
 nOVDsUwekpzbqXxNCZKSBkPpCnUV4vWpGYpMSnpX7YFe6dnLU2ORnAiA0Y8iCdOcsjw8
 8Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HWSjPah2c2AaRSP+2vHU6yInVlSDXI70ImIfpbXN8E4=;
 b=DEJMhWg0dU+0Asiu/n0KrLCT41e9C9o84nQl7e3Rhk6cxoz7KrOJw1WHofxafGUIh9
 eMTyqqgJxCIAMGsx3vXCDUgDSIgqArxoqiZgD1IBvvGnycmrDDGopaSVeYxhpmg3MNEI
 t9k5Upk030q5CDM48uxmY4GhNdjXf0LHr1c+Eg0Vz9No3srZaZX4ya/YukLSR7ftiXus
 SuyHSp2fang6m5PVDopi+SEEFz6gi11z6/sdoxpjK3uH0d1Xe1SY3QXclAy8y+hnC2aB
 deNhIvJ1rfq5SCrt01+kjyIar+OQJL5XKzA2O7au2tBF54fcYIUX9J8i/TxleznI0/O1
 MyPg==
X-Gm-Message-State: AOAM533Km7gVwD6NRkV5g39AoKejNA0VYcJOEaq8ru1qD2QagYihWqd8
 U5lkADuM8hP90pNGjS2Go0BNbxH4hD/K8zZUOjFU/A==
X-Google-Smtp-Source: ABdhPJwEJev27Pc2q/Iq5MO4SuuzrQ73ie5VYbxYb/YHRh5CcCGKaz0WlKP0N/rYQvL7TgMmI9IsLY1BsrhRpNwgHe4=
X-Received: by 2002:a17:906:2ac4:: with SMTP id
 m4mr1789058eje.734.1640164722465; 
 Wed, 22 Dec 2021 01:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20211214040239.8977-1-steven_lee@aspeedtech.com>
 <20211214040239.8977-2-steven_lee@aspeedtech.com>
In-Reply-To: <20211214040239.8977-2-steven_lee@aspeedtech.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Dec 2021 10:18:31 +0100
Message-ID: <CAMRc=MdAgK7zKuJ=7cA2T-mSTJD3tWSW2aEB6G=0Tz4X+iHcZQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-aspeed-sgpio: Fix wrong hwirq base in
 irq handler
To: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>
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

On Tue, Dec 14, 2021 at 5:03 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> Each aspeed sgpio bank has 64 gpio pins(32 input pins and 32 output pins).
> The hwirq base for each sgpio bank should be multiples of 64 rather than
> multiples of 32.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 3d6ef37a7702..b3a9b8488f11 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -395,7 +395,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
>                 reg = ioread32(bank_reg(data, bank, reg_irq_status));
>
>                 for_each_set_bit(p, &reg, 32)
> -                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p * 2);
> +                       generic_handle_domain_irq(gc->irq.domain, (i * 32 + p) * 2);
>         }
>
>         chained_irq_exit(ic, desc);
> --
> 2.17.1
>

Joel, Andrew: any comments on this? I'd like to send it upstream tomorrow.

Bart
