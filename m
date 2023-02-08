Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F369BF0B
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 08:48:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHj33cxZz3bXv
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 18:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxdaKe43;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=william.gray@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxdaKe43;
	dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHYZM0v4tz3cQV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 23:06:16 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id g15-20020a9d6b0f000000b0068db1940216so524424otp.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uglBygBs9ijyHk9bCgsz1JnjSH+tWIY8t2J8IkoGaKg=;
        b=OxdaKe43FG9pkV/bxMqLQm3QB4w5+H6Nr/d+Bjy8+kEDM3NJEhkGNiSMjs3fsLD7nX
         3FQL3VJawYluNdpGWKhI0CjkAQEJJ0k3lKaioo9f336frqO1cuVZtKtUcEpMmj3Q8HnO
         VKlCxnjEruwsZ+y9RMnSfEXge6AGxzVKYQ7rMLP5iJEMNcZjr4oT5VDcToTZjzAtvSja
         3xs6UQaKA5O5AAeox08IcxpMEml2d+IZwaPiKmacDw3lWpGyRi4/ovKLZPZ+2llCiSRY
         UOZt0X5DNWwDYjiNEGh4ij+s8vL2gbmYTOLAdfTolGGIPH7/Y12V0HHcEyXM3THm3ctI
         1HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uglBygBs9ijyHk9bCgsz1JnjSH+tWIY8t2J8IkoGaKg=;
        b=lGKa8KZ+goVaYWAm906tfcMPq0Dv0xT5DIbYGaSHQ7a+lqh4OAu0YCJdH0IqspvHuY
         ZyTPVY9rnl1B3H/W9qJ6Pb89wU2lK39C/9UPOQ3Mg738fuQSSLeVgoyTL6sCmQVeB5iu
         9DovGwSMcgNO3cXivtP6oQE5JDAGm/QsOTSBghR65O7diSPJHKq1mV8jgqbATaEw5gbc
         ChhiIbhPOwg5E46Y6o3sA/zeYkKmUEpnwWrw0/4QkAhgQsg+o0PsEwVOYAMOmjpiLrn8
         l7luxHxbECm0j7M+/tQPb9+/7WFFDZDkbq5MCohibkSi7GGyVTxNUAzWmImZCk6VtNIH
         ZrpQ==
X-Gm-Message-State: AO0yUKU/ITBx5fZeguIJaY8UhyQJneMyr8XWJlCaQ7TupUN6w80w+bjT
	hVVKJrWWQdZ3Xg/2lc5gOXzQSw==
X-Google-Smtp-Source: AK7set/QViwHWfznjRNuw1BE1wQ1msM8bPS/oX7O9gJb49xGfWna2ZIBMwHXu83+kYvTCy95yhddwg==
X-Received: by 2002:a05:6830:2a04:b0:68d:6175:d5b9 with SMTP id y4-20020a0568302a0400b0068d6175d5b9mr778243otu.19.1676549173177;
        Thu, 16 Feb 2023 04:06:13 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id n12-20020a9d64cc000000b0068d4a8a8d40sm544774otl.81.2023.02.16.04.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:06:12 -0800 (PST)
Date: Wed, 8 Feb 2023 06:16:44 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 16/17] gpio: pci-idio-16: Convert to immutable irq_chip
Message-ID: <Y+OEnM/gZ+lLRELc@fedora>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
 <20230215-immutable-chips-v1-16-51a8f224a5d0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AySwEFEhj9sTbaXz"
Content-Disposition: inline
In-Reply-To: <20230215-immutable-chips-v1-16-51a8f224a5d0@linaro.org>
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:42:49 +1100
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
Cc: Marc Zyngier <maz@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-omap@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Romain Perier <romain.perier@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--AySwEFEhj9sTbaXz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 10:37:17AM +0100, Linus Walleij wrote:
> Convert the driver to immutable irq-chip with a bit of
> intuition.
>=20
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

FYI, I'm migrating pci-idio-16 to the regmap-irq API soon, so this patch
might not be necessary once the code is removed. Anyway, here's my ack
in case this patch series is merged first.

Acked-by: William Breathitt Gray <william.gray@linaro.org>

> ---
>  drivers/gpio/gpio-pci-idio-16.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio=
-16.c
> index a86ce748384b..6726c32e31e6 100644
> --- a/drivers/gpio/gpio-pci-idio-16.c
> +++ b/drivers/gpio/gpio-pci-idio-16.c
> @@ -107,6 +107,8 @@ static void idio_16_irq_mask(struct irq_data *data)
> =20
>  		raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
>  	}
> +
> +	gpiochip_disable_irq(chip, irqd_to_hwirq(data));
>  }
> =20
>  static void idio_16_irq_unmask(struct irq_data *data)
> @@ -117,6 +119,8 @@ static void idio_16_irq_unmask(struct irq_data *data)
>  	const unsigned long prev_irq_mask =3D idio16gpio->irq_mask;
>  	unsigned long flags;
> =20
> +	gpiochip_enable_irq(chip, irqd_to_hwirq(data));
> +
>  	idio16gpio->irq_mask |=3D mask;
> =20
>  	if (!prev_irq_mask) {
> @@ -138,12 +142,14 @@ static int idio_16_irq_set_type(struct irq_data *da=
ta, unsigned int flow_type)
>  	return 0;
>  }
> =20
> -static struct irq_chip idio_16_irqchip =3D {
> +static const struct irq_chip idio_16_irqchip =3D {
>  	.name =3D "pci-idio-16",
>  	.irq_ack =3D idio_16_irq_ack,
>  	.irq_mask =3D idio_16_irq_mask,
>  	.irq_unmask =3D idio_16_irq_unmask,
> -	.irq_set_type =3D idio_16_irq_set_type
> +	.irq_set_type =3D idio_16_irq_set_type,
> +	.flags =3D IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20
>  static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
> @@ -242,7 +248,7 @@ static int idio_16_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
>  	idio_16_state_init(&idio16gpio->state);
> =20
>  	girq =3D &idio16gpio->chip.irq;
> -	girq->chip =3D &idio_16_irqchip;
> +	gpio_irq_chip_set_chip(girq, &idio_16_irqchip);
>  	/* This will let us handle the parent IRQ in the driver */
>  	girq->parent_handler =3D NULL;
>  	girq->num_parents =3D 0;
>=20
> --=20
> 2.34.1
>=20

--AySwEFEhj9sTbaXz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY+OEnAAKCRC1SFbKvhIj
K5eCAPwLmxXCtGXXgP0akD13UFw7dXSdGyxVszeP+0DYBG+nUwD9GF6hkUXvQwOW
2bR53NrSasEyxAdN84aY3rFim+gKKQE=
=Zw1V
-----END PGP SIGNATURE-----

--AySwEFEhj9sTbaXz--
