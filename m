Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7BF97635F
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 09:51:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X48lW57ssz2yYf
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 17:51:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726127494;
	cv=none; b=D7b+GmnmBAR7bTINKi8zkZ57E+M0PKxmEFmtumfBA36NEH9ByVrAKhyS8WplbEQAFAzuaEZv1Hr4k30a51UJQK0ooS3dkw5V2iH3roBm3YISiTn3g0EeF4lNaMhjvOJMLwIw4CJovMv71DVhjlXf6nmkUe6T1RYYpHjmDxOiUk6CZA8NzyqPlAed3DqI0VSXQnhii4DOIM6Pw28it+TQIMNa43dka9+RUC/S0s4SpowJ4ou01YIiSyrDAwKPC1nBnF3Ahs1ASbzEOC/ScutHj7HW8SV2qZiz0TeIq1lVTbOSIO5fFJMemwrcsGs3s3TF525j/S90BFiZTPBWT0R71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726127494; c=relaxed/relaxed;
	bh=BVckwXlxO0ttpW9EBp9kcUb5ZsRUnWvKF9yggJGH4tw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WFRUqRIdpcrebc7ab1+Kenes2upuozqx71mHESnQgWc+axmwInBug8+SX7X4SlP1I8taJaIhMMKJ84N9KIZaVmX7thZIbQdcYU8sm0CFSk+sSnqaTQlqlp1C57SAhketBtAhgJmu4qAQNFMAa1csm3peY9/BL/RL9AaadUnoafwGLI3XaDnTBtVopQeNc+Lt6vHlhrAIQVmA06/YSL9sNuR4QRAPmCS503BaghJbHQp0L25QU9MlK3+ZefDjfk1HAJhvoAL0kIsghbK8BI1x/DF/1+oqjpFQs12UlfbXkbGuHf4k0q38MO7AAkIRaNkdx2TMoojkPTuObejDTMC2Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ndgOCnRM; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ndgOCnRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X48lT4LMgz2xPL
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 17:51:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726127491;
	bh=BVckwXlxO0ttpW9EBp9kcUb5ZsRUnWvKF9yggJGH4tw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ndgOCnRMm9DP5nqPfb/Q1HJ60NjTaYIavMvMLzuAecoA3g74SwXxDjy/B79v9KZYi
	 hUmE18v8tmFnd86orpVbW0PML4rSpcD2zgCjpKYduraJzUbPON3GDsgUlpojgFY0zy
	 0QUFMT/pZSoYBJOiuU+er/Ydo64H6J68vH31EVyJQSCOzUH8h9th8Cm4TdRqznrwVR
	 NfMypaLoYefNCEpMKDTg1Je24cHR5pgcSkWMto+Qm09yU/MvYshRSDNX0a3vMP4Zhm
	 zI+USeIei1rBQhK/sBI5hXxdrvQRpnuntk9Kw+QEK6L51mepF/Tl4HaIDjXLXZjLRZ
	 fyyYBmQgqoYLw==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1478E64FDD;
	Thu, 12 Sep 2024 15:51:27 +0800 (AWST)
Message-ID: <7e2643f7586a7ed5d3cc90630d78fb3abd813a54.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/4] gpio: aspeed: Remove the name for bank array
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Date: Thu, 12 Sep 2024 17:21:27 +0930
In-Reply-To: <20240830034047.2251482-3-billy_tsai@aspeedtech.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
	 <20240830034047.2251482-3-billy_tsai@aspeedtech.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-08-30 at 11:40 +0800, Billy Tsai wrote:
> The bank array name is only used to determine if the GPIO offset is valid=
,
> and this condition can be replaced by checking if the offset exceeds the
> ngpio property.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 04c03402db6d..24f50a0ea4ab 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -77,7 +77,6 @@ struct aspeed_gpio_bank {
>  	uint16_t	debounce_regs;
>  	uint16_t	tolerance_regs;
>  	uint16_t	cmdsrc_regs;
> -	const char	names[4][3];
>  };
> =20
>  /*
> @@ -104,7 +103,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0040,
>  		.tolerance_regs =3D 0x001c,
>  		.cmdsrc_regs =3D 0x0060,
> -		.names =3D { "A", "B", "C", "D" },
>  	},
>  	{
>  		.val_regs =3D 0x0020,
> @@ -113,7 +111,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0048,
>  		.tolerance_regs =3D 0x003c,
>  		.cmdsrc_regs =3D 0x0068,
> -		.names =3D { "E", "F", "G", "H" },
>  	},
>  	{
>  		.val_regs =3D 0x0070,
> @@ -122,7 +119,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x00b0,
>  		.tolerance_regs =3D 0x00ac,
>  		.cmdsrc_regs =3D 0x0090,
> -		.names =3D { "I", "J", "K", "L" },
>  	},
>  	{
>  		.val_regs =3D 0x0078,
> @@ -131,7 +127,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0100,
>  		.tolerance_regs =3D 0x00fc,
>  		.cmdsrc_regs =3D 0x00e0,
> -		.names =3D { "M", "N", "O", "P" },
>  	},
>  	{
>  		.val_regs =3D 0x0080,
> @@ -140,7 +135,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0130,
>  		.tolerance_regs =3D 0x012c,
>  		.cmdsrc_regs =3D 0x0110,
> -		.names =3D { "Q", "R", "S", "T" },
>  	},
>  	{
>  		.val_regs =3D 0x0088,
> @@ -149,7 +143,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0160,
>  		.tolerance_regs =3D 0x015c,
>  		.cmdsrc_regs =3D 0x0140,
> -		.names =3D { "U", "V", "W", "X" },
>  	},
>  	{
>  		.val_regs =3D 0x01E0,
> @@ -158,7 +151,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0190,
>  		.tolerance_regs =3D 0x018c,
>  		.cmdsrc_regs =3D 0x0170,
> -		.names =3D { "Y", "Z", "AA", "AB" },
>  	},
>  	{
>  		.val_regs =3D 0x01e8,
> @@ -167,7 +159,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x01c0,
>  		.tolerance_regs =3D 0x01bc,
>  		.cmdsrc_regs =3D 0x01a0,
> -		.names =3D { "AC", "", "", "" },
>  	},
>  };
> =20
> @@ -280,11 +271,11 @@ static inline const struct aspeed_bank_props *find_=
bank_props(
>  static inline bool have_gpio(struct aspeed_gpio *gpio, unsigned int offs=
et)
>  {
>  	const struct aspeed_bank_props *props =3D find_bank_props(gpio, offset)=
;
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	unsigned int group =3D GPIO_OFFSET(offset) / 8;
> =20
> -	return bank->names[group][0] !=3D '\0' &&
> -		(!props || ((props->input | props->output) & GPIO_BIT(offset)));
> +	if (offset > gpio->chip.ngpio)

Should this be `>=3D`? ngpio is a count.

Andrew

> +		return false;
> +
> +	return (!props || ((props->input | props->output) & GPIO_BIT(offset)));
>  }
> =20
>  static inline bool have_input(struct aspeed_gpio *gpio, unsigned int off=
set)

