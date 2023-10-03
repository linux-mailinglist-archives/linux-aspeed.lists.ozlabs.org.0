Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC93C7B74F5
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Oct 2023 01:31:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fup1rsQj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Ywd0zSXz3cGC
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Oct 2023 10:30:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fup1rsQj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0YwT1rjjz3c57
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Oct 2023 10:30:49 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-175-196.adl-adc-lon-bras34.tpg.internode.on.net [118.210.175.196])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 799B620059;
	Wed,  4 Oct 2023 07:30:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696375842;
	bh=0DwoPwHtvsNHshbiX0L5U/GGpl/naUYap0pFgc5OoPg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fup1rsQjI6vuo9F7ghDudR0GDrJtiWkokCJjW2gEiNomV9EFA+PifQ1z6X65JDVkd
	 eu3Qv/lLuC/Xq/QAnP32VuWQAfPKFpJzXS1H3PihTjA39WDeswTe+PKzcqmiz2KxQZ
	 dVzI57qBkV+WXOLxQrBqfh2lCBko/TlO9vs3XiGBTOHyVN+JSmU7EGD4s//VaOyqxM
	 TZAkCouYeQyfBDttjPDWLxV/mAlDk6DJTwDKfVpd1jW7I8HzH+qC6odtOmBLtUwjkR
	 Sk68RYBMauvX7fA7NrjYc0l1MWfywAoOQYP1prkTO/rCRRoGP2GBox5XhfvIaCqSen
	 26vRJ1Qd4NMKQ==
Message-ID: <6608b6ea673454672fb5930b57e9e7a5570d96d5.camel@codeconstruct.com.au>
Subject: Re: [PATCH 08/36] gpio: aspeed: use new pinctrl GPIO helpers
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	 <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
Date: Wed, 04 Oct 2023 10:00:38 +1030
In-Reply-To: <20231003145114.21637-9-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
	 <20231003145114.21637-9-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2023-10-03 at 16:50 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Replace the pinctrl helpers taking the global GPIO number as argument
> with the improved variants that instead take a pointer to the GPIO chip
> and the controller-relative offset.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index da33bbbdacb9..d3aa1cfd4ace 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -750,12 +750,12 @@ static int aspeed_gpio_request(struct gpio_chip *ch=
ip, unsigned int offset)
>  	if (!have_gpio(gpiochip_get_data(chip), offset))
>  		return -ENODEV;
> =20
> -	return pinctrl_gpio_request(chip->base + offset);
> +	return pinctrl_gpio_request_new(chip, offset);
>  }
> =20
>  static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset=
)
>  {
> -	pinctrl_gpio_free(chip->base + offset);
> +	pinctrl_gpio_free_new(chip, offset);
>  }
> =20
>  static int usecs_to_cycles(struct aspeed_gpio *gpio, unsigned long usecs=
,
> @@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *c=
hip, unsigned int offset,
>  	else if (param =3D=3D PIN_CONFIG_BIAS_DISABLE ||
>  			param =3D=3D PIN_CONFIG_BIAS_PULL_DOWN ||
>  			param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> -		return pinctrl_gpio_set_config(offset, config);
> +		return pinctrl_gpio_set_config_new(chip, offset, config);

Ah, this looks like it removes a bug too. Nice.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

>  	else if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN ||
>  			param =3D=3D PIN_CONFIG_DRIVE_OPEN_SOURCE)
>  		/* Return -ENOTSUPP to trigger emulation, as per datasheet */

