Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7807B787B
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Oct 2023 09:14:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ERUZCpQ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0mC81ZX0z3cHF
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Oct 2023 18:14:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ERUZCpQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0mC21MTpz3c3g
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Oct 2023 18:14:03 +1100 (AEDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49abb53648aso766581e0c.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Oct 2023 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696403640; x=1697008440; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QVaru3aSoKJ46q6kHIF95rs3QTWK4J1La37jYhgEOI=;
        b=ERUZCpQ6g3HldW2mo4voopH+jxUWymEjyE/22w3UGKxT5u1ylPpEp2UYJmzEPkbiHC
         z9iO3vU3pb8uZHvTIv/y7P/mRaVlHil0/6ryzHhtINbVrKUGVodW6tCYBpRAT8q9X6Fx
         65unnbKiRnbneEApfP+9IWR1Oi3AWbygNrUo80BAnPetf3meCahgNqnvcLx1ELm23cBc
         bQUxOaBJqbkV+hsjJR3ZcHCeKF6UGW9EKeGdDO6jJEoDekjTqXAKyI2o6yA/BZwnuBI+
         OTWsEIptT4qdeGAjtc2aC95qw1IIjZeQvvrkEJoDB/NQK7XjQ7JrJzLAiUBJ/HdiTe9l
         0nUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696403640; x=1697008440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QVaru3aSoKJ46q6kHIF95rs3QTWK4J1La37jYhgEOI=;
        b=P0iGm4xPsSvcm4mhFrul2Ie9w9+mqrFTxaz6fGFfjivbxVsh+vXeFncJkC2/3/KEaU
         ht8qE3w2RMKeIHkBLsHYsZFNj8/OitgP4fdg5FBCEAiviph1Ajjuq+A4Uajnhymygvke
         uJOB9Kf5fLNIoIzXAMJzOOPjraxogYMbsiKC7HWyfF8+kpZA0HLJmC2D+Fvz7ZOIDC5t
         baT26glLn/NpON7jIA+uCSYfY409iyzxbnXJ/+7OAgMuiUzI06N8Ouw8vAdHcuUhKqgH
         gDBcJsP9AEqIOhHsb+GdJylGL9VuNUR1xRKdE/Sueu8Bfg6DCWXRSUHkIHV3bzo65DuU
         n3Zw==
X-Gm-Message-State: AOJu0Yyk92eLgqC/howYScBBQ5jJPZjGuS3RVaqYBm1I6NntOPyk+g/m
	gLlaCKYQWw6Yjz6HKvvfxSlQFsRSkL4HIHhr9KrNgw==
X-Google-Smtp-Source: AGHT+IEAheGN4u/b6R2oY17tnd628GPgVY2HjXw6hyOOK1exO4/ZvyYR21mjv4Q+Rpof2QDHqpNJOZVIfu16JQ9fiNA=
X-Received: by 2002:a1f:4905:0:b0:49d:d91:8b13 with SMTP id
 w5-20020a1f4905000000b0049d0d918b13mr1055911vka.8.1696403640393; Wed, 04 Oct
 2023 00:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <20231003145114.21637-9-brgl@bgdev.pl>
 <6608b6ea673454672fb5930b57e9e7a5570d96d5.camel@codeconstruct.com.au>
In-Reply-To: <6608b6ea673454672fb5930b57e9e7a5570d96d5.camel@codeconstruct.com.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Oct 2023 09:13:49 +0200
Message-ID: <CAMRc=MfrJHWppvWv=Gh0cQRjFG69UoqLyguu-zE2NB6Yga-3xA@mail.gmail.com>
Subject: Re: [PATCH 08/36] gpio: aspeed: use new pinctrl GPIO helpers
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 4, 2023 at 1:30=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2023-10-03 at 16:50 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Replace the pinctrl helpers taking the global GPIO number as argument
> > with the improved variants that instead take a pointer to the GPIO chip
> > and the controller-relative offset.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-aspeed.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> > index da33bbbdacb9..d3aa1cfd4ace 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -750,12 +750,12 @@ static int aspeed_gpio_request(struct gpio_chip *=
chip, unsigned int offset)
> >       if (!have_gpio(gpiochip_get_data(chip), offset))
> >               return -ENODEV;
> >
> > -     return pinctrl_gpio_request(chip->base + offset);
> > +     return pinctrl_gpio_request_new(chip, offset);
> >  }
> >
> >  static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offs=
et)
> >  {
> > -     pinctrl_gpio_free(chip->base + offset);
> > +     pinctrl_gpio_free_new(chip, offset);
> >  }
> >
> >  static int usecs_to_cycles(struct aspeed_gpio *gpio, unsigned long use=
cs,
> > @@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip =
*chip, unsigned int offset,
> >       else if (param =3D=3D PIN_CONFIG_BIAS_DISABLE ||
> >                       param =3D=3D PIN_CONFIG_BIAS_PULL_DOWN ||
> >                       param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> > -             return pinctrl_gpio_set_config(offset, config);
> > +             return pinctrl_gpio_set_config_new(chip, offset, config);
>
> Ah, this looks like it removes a bug too. Nice.
>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>
> >       else if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN ||
> >                       param =3D=3D PIN_CONFIG_DRIVE_OPEN_SOURCE)
> >               /* Return -ENOTSUPP to trigger emulation, as per datashee=
t */
>

I sent a separate patch that fixes this issue for backporting, once
the other one is in next, we can update this series.

Bart
