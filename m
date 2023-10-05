Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84B7B9976
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Oct 2023 03:12:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eoIzp3TL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1D7F24Z3z3cRF
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Oct 2023 12:12:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eoIzp3TL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1D780gKqz3c4R
	for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Oct 2023 12:12:19 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-84-62.adl-adc-lon-bras32.tpg.internode.on.net [118.210.84.62])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 22EBF200DB;
	Thu,  5 Oct 2023 09:12:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696468337;
	bh=xAxBkEJVdrWYBdGjmgEXDdPp5zXscmuH8qacPOd7/ek=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eoIzp3TLvlOLS2As2yWm6Y+lulUfPoFLMN47c8hyhA4en1MViwWxFtCxFb5CLJz+e
	 ufeii4Unrj8ebwvcJ2VWtid0g87OtRmQTf4H26qSsbsd3QnDCSj0zWHiRJyCe6fOZr
	 6sSsZtCjxR2ZctKxXpzuhGMdD2uL5x7Zr3Pr2Y/rmU7w0cllCW7X+JaQyspLJ15L2+
	 diC9oBgd1ko/KUlqQIFpkDoYOxR4KmxscrR1sN82SL6TJua+G7QAl6w5d9wE8Ja294
	 O6LfaLRSBm/8j/N4fx894/+5i2/yNSqL1W1EpbkdP50GL8nOFRme+uiW5lg3BIMQNk
	 yYUeJkyzZgt1A==
Message-ID: <b5b813d156c31d73baf1e153f495e69d3367718b.camel@codeconstruct.com.au>
Subject: Re: [PATCH] gpio: aspeed: fix the GPIO number passed to
 pinctrl_gpio_set_config()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 05 Oct 2023 11:42:12 +1030
In-Reply-To: <20231003073926.10771-1-brgl@bgdev.pl>
References: <20231003073926.10771-1-brgl@bgdev.pl>
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
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2023-10-03 at 09:39 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> pinctrl_gpio_set_config() expects the GPIO number from the global GPIO
> numberspace, not the controller-relative offset, which needs to be added
> to the chip base.
>=20
> Fixes: 5ae4cb94b313 ("gpio: aspeed: Add debounce support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks!

> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index da33bbbdacb9..58f107194fda 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *c=
hip, unsigned int offset,
>  	else if (param =3D=3D PIN_CONFIG_BIAS_DISABLE ||
>  			param =3D=3D PIN_CONFIG_BIAS_PULL_DOWN ||
>  			param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> -		return pinctrl_gpio_set_config(offset, config);
> +		return pinctrl_gpio_set_config(chip->base + offset, config);
>  	else if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN ||
>  			param =3D=3D PIN_CONFIG_DRIVE_OPEN_SOURCE)
>  		/* Return -ENOTSUPP to trigger emulation, as per datasheet */

