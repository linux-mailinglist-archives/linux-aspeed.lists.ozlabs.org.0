Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F4995DA3
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 04:12:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNby722Rlz307y
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 13:12:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728439965;
	cv=none; b=iERsmoqEUmybrjG7OgUfUJDHxPJK9GBWKSEhwRN9Bv6TxckiDcDCl2HPGUwxfHHU2+xiDdL0U4d7uRzGPEulI7sOpbAoK8AWwvFJLa3jdKFJwCVjwl489ORDYff8xtHXHBE9NBr9GImpKdP+SJman6DtE1tyNaiAskvEi00UVNum0ZSOe4OvIJFoKr90wzkjZBBZTKomr2mxXwZAi78o3f0U3t0JtxCY66eW0pB6q/8ITUPGU9bRJMnX8e0tpERyiET8w3DrJ44yVlDKXKYwjkasZ2dujwL7NJ8Mo8SBUTynimCaA7fhbWVQlvnZbXe6ejcVvIaB8Qma67ZZX+lEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728439965; c=relaxed/relaxed;
	bh=w7qyq17nc2TUPZIsLK+Ts256NF7jrNuc8mECRfNXiYU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nLyWRJlhpKICRQaP5x51rNuGTUPcpyG5nEsKXvPjUsq7jRJStH/uCH270a7a3jjIG21OUGSIcOST9W7B9u0KQuxmCrU2FQjQMm6BtmK0UPfh2+L79LEqDknwd31CxzgpglA/1HIhDtS+Y5BQDRTLJASW4nXbt2XIWHrj0GyOmyGPl3nmT8VITpyxv449IeghgswtUBNALBX6SztyM2sTwr+Q4tL0ALz24brFVY5+cp+YsLQSoLSgugtGf/voOmQwDilw4rFZr3xymCHn8L7r0B68cClpOHNHD1r2yTB+CwigFn/5wr7XLutKJUi0PQkLxv/iRgzTxKeAN8SqsCIkqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fTvC5No2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fTvC5No2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNby50nnkz2xZj
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 13:12:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728439964;
	bh=w7qyq17nc2TUPZIsLK+Ts256NF7jrNuc8mECRfNXiYU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=fTvC5No2x2gTlXdS1g2gGF3WjRMe6U7keZi9fSjKdCXi4cQsQ2iFUtwQfyAqokLaP
	 CnTxMiG0ijumGlA2bXf0/PSGvEPmAFyA8WlZbEepwY+NHuboW6vbEjVzck5bimbs2h
	 DFk0zj1KoNHjcjkutqggi58vr/FwazaHTuLZMa09I5G1yRNHZYk8m15lntxOOB3GQf
	 XeX6EGHGtIC5McgdLxNlIG2+4+wUq12PHxJ2vhnqmTaJYUcDOKv8O35fRuBUMT8Pel
	 67+suSEHSR5YETOD9KsddVzqYJDzYibnPq+8YZUo6JD986DX0l/mrZe79xeNrsxhF/
	 gU8wYYzEyPzEQ==
Received: from [192.168.68.112] (ppp118-210-190-105.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.105])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 660586497F;
	Wed,  9 Oct 2024 10:12:43 +0800 (AWST)
Message-ID: <66e619a9085a2ecb62e3945cd024822de5317f92.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 7/7] gpio: aspeed: Support G7 Aspeed gpio controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Wed, 09 Oct 2024 12:42:42 +1030
In-Reply-To: <20241008081450.1490955-8-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
	 <20241008081450.1490955-8-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-10-08 at 16:14 +0800, Billy Tsai wrote:
> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin's
> value, direction, interrupt type, and other settings. The permission for
> coprocessor access is supported by the hardware but hasn't been
> implemented in the current patch.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 147 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 5d583cc9cbc7..208f95fb585e 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -30,6 +30,27 @@
>  #include <linux/gpio/consumer.h>
>  #include "gpiolib.h"
> =20
> +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> +#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> +
> +#define GPIO_G7_IRQ_STS_BASE 0x100
> +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
> +#define GPIO_G7_CTRL_REG_BASE 0x180
> +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)
> +#define GPIO_G7_CTRL_OUT_DATA BIT(0)
> +#define GPIO_G7_CTRL_DIR BIT(1)
> +#define GPIO_G7_CTRL_IRQ_EN BIT(2)
> +#define GPIO_G7_CTRL_IRQ_TYPE0 BIT(3)
> +#define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
> +#define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
> +#define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(7)
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(8)
> +#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
> +#define GPIO_G7_CTRL_IRQ_STS BIT(12)
> +#define GPIO_G7_CTRL_IN_DATA BIT(13)
> +
>  struct aspeed_bank_props {
>  	unsigned int bank;
>  	u32 input;
> @@ -95,6 +116,22 @@ struct aspeed_gpio_bank {
>   */
> =20
>  static const int debounce_timers[4] =3D { 0x00, 0x50, 0x54, 0x58 };
> +static const int g7_debounce_timers[4] =3D { 0x00, 0x00, 0x04, 0x08 };
> +
> +/*
> + * The debounce timers array is used to configure the debounce timer set=
tings.Here=E2=80=99s how it works:
> + * Array Value: Indicates the offset for configuring the debounce timer.
> + * Array Index: Corresponds to the debounce setting register.
> + * The debounce timers array follows this pattern for configuring the de=
bounce setting registers:
> + * Array Index 0: No debounce timer is set;
> + *		  Array Value is irrelevant (don=E2=80=99t care).
> + * Array Index 1: Debounce setting #2 is set to 1, and debounce setting =
#1 is set to 0.
> + *		  Array Value: offset for configuring debounce timer 0 (g4: 0x50, g7=
: 0x00)
> + * Array Index 2: Debounce setting #2 is set to 0, and debounce setting =
#1 is set to 1.
> + *		  Array Value: offset for configuring debounce timer 1 (g4: 0x54, g7=
: 0x04)
> + * Array Index 3: Debounce setting #2 is set to 1, and debounce setting =
#1 is set to 1.
> + *		  Array Value: offset for configuring debounce timer 2 (g4: 0x58, g7=
: 0x8)
> + */
> =20
>  static const struct aspeed_gpio_copro_ops *copro_ops;
>  static void *copro_data;
> @@ -250,6 +287,39 @@ static void __iomem *aspeed_gpio_g4_bank_reg(struct =
aspeed_gpio *gpio,
>  	BUG();
>  }
> =20
> +static u32 aspeed_gpio_g7_reg_mask(const enum aspeed_gpio_reg reg)
> +{
> +	switch (reg) {
> +	case reg_val:
> +		return GPIO_G7_CTRL_OUT_DATA;

I think a problem is that we want this to be GPIO_G7_CTRL_IN_DATA for
reads, but GPIO_G7_CTRL_OUT_DATA for writes?

> +	case reg_dir:
> +		return GPIO_G7_CTRL_DIR;
> +	case reg_irq_enable:
> +		return GPIO_G7_CTRL_IRQ_EN;
> +	case reg_irq_type0:
> +		return GPIO_G7_CTRL_IRQ_TYPE0;
> +	case reg_irq_type1:
> +		return GPIO_G7_CTRL_IRQ_TYPE1;
> +	case reg_irq_type2:
> +		return GPIO_G7_CTRL_IRQ_TYPE2;
> +	case reg_tolerance:
> +		return GPIO_G7_CTRL_RST_TOLERANCE;
> +	case reg_debounce_sel1:
> +		return GPIO_G7_CTRL_DEBOUNCE_SEL1;
> +	case reg_debounce_sel2:
> +		return GPIO_G7_CTRL_DEBOUNCE_SEL2;
> +	case reg_rdata:
> +		return GPIO_G7_CTRL_OUT_DATA;

I think this is correct regardless of the access type though.

If we can resolve the query above, the rest looks alright to me.

Andrew
