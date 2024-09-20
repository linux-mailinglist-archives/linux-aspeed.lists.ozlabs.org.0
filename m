Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FEC97CFFE
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 04:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8xqj0Q9Lz2yV8
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2024 12:56:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726801006;
	cv=none; b=iI7iHyH18pJD9/V8Exp22G7mT9ZtDODepb94KLHcEaCg6IjkacGa3SwQFEP8E493nH+yB11xK+DBNIxk2lMPRQvnIG5wGJYz/BX+Dq7Ln7gtu9qmLlWC5A6YoAmtj93hBBLufPXNjInWJUrbBop32P49kcPlzV5QdWGfpxlo3JB2MeZpwmjoCTTgAo3AL/Z7c4FS3D/efT2IhAodECri/cWAO+WZEZ/yC1s9wqgGz7TD6k0nbpOjvJ6dds1pWCbV+571x2Aery5tYW+Jo7k6ODjwGwChQjYFMgDdADkbhBmxDAaMT0/Q8rE3n0a7K+Ij8ro8voTIyrQICfzqvTY96g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726801006; c=relaxed/relaxed;
	bh=9zq+alk87NveKNSZoqa4mGW5binU0Cse8JboP4bIcE8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gmQW+yZ80dx6di1EghmYIeTnx3jFMYbpfXy1M3C+BPyzZ+qs2xZJIEjf4JNbZxmSUt6mKA1+uWFK97iVjIWDdLFmnAk4D5vV+x0rnVWc8963C6Gj66uYXnE32nyRvWPv1kxvnyMjKX5c03n/VR1pB32boSrDWkQO7/BNwz72sbgzxECCCcsHSyvm3CmnU1APLoy7K8uMovFkXgMnWCnB1YuhAVr4STgNpj4l3/417Sl+uKl0F6tseIm5eM8qnaIFFBfUg4e0hg3TDo/TAHMjIYrRtNjGEyVDyioq5vvulcDwGzP13pDPesExlt0/3fHHIRLHsJPN3Bq6fLmQe5Hcjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ww3Xnubk; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ww3Xnubk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8xqf1zkqz2xjH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2024 12:56:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726801003;
	bh=9zq+alk87NveKNSZoqa4mGW5binU0Cse8JboP4bIcE8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Ww3Xnubkc9IWScpaCo4g4eMR1oJIS7aCihQreu4ojNIepiOKrPh57FXKGiHwjWfJ4
	 eCg0764Rez6KOA9XHv+1LMLYo1iZLxhPgcBsIa2hrO2BIu++IP03kxZ5KcrNy2eWAD
	 vfN0Jehhg78Dk/Nkdb/P65eRng885zvxSftZRJogwqSzxjj3BjZvvqCdq2raidAxZr
	 8U75fK39G+QpwKYqEY1GvEVyNZWI7xaagWB9lJpe8UoCUj9kd14iDGmcoCqqrgG6v7
	 FVipWBEIp5fWDOdgIeRPBuBBrmWPOdS4NhKybiIz5xbHfALOeugvQv1I6wBHutphZY
	 XQ2Wtl1bJejGQ==
Received: from [192.168.68.112] (ppp118-210-188-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.188.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A795165027;
	Fri, 20 Sep 2024 10:56:40 +0800 (AWST)
Message-ID: <7aaed8cf171b67300aa5b7e861628278de948a27.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/6] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Fri, 20 Sep 2024 12:26:38 +0930
In-Reply-To: <20240919094339.2407641-4-billy_tsai@aspeedtech.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
	 <20240919094339.2407641-4-billy_tsai@aspeedtech.com>
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

Hi Billy

On Thu, 2024-09-19 at 17:43 +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for GPIO
> registers and the coprocessor request/release. With this abstraction
> layer, the driver can separate the hardware and software logic, making it
> easier to extend the driver to support different hardware register
> layouts.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 429 +++++++++++++++++++------------------
>  1 file changed, 220 insertions(+), 209 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d20e15b2079d..8b334ce7b60a 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -39,6 +39,10 @@ struct aspeed_bank_props {
>  struct aspeed_gpio_config {
>  	unsigned int nr_gpios;
>  	const struct aspeed_bank_props *props;
> +	const struct aspeed_gpio_llops *llops;
> +	const int *debounce_timers_array;
> +	int debounce_timers_num;
> +	bool dcache_require;

Bit of a nitpick, but if we must have it I'd prefer we call this
`require_dcache`.

> =20
> +static void aspeed_g4_reg_bit_set(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg, bool val)
> +{
> +	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> +	void __iomem *addr =3D bank_reg(gpio, bank, reg);
> +	u32 temp;
> +
> +	if (reg =3D=3D reg_val && gpio->config->dcache_require)

We know gpio->config->dcache_require will be true, because this is the
g4 handler, right?

> +		temp =3D gpio->dcache[GPIO_BANK(offset)];
> +	else
> +		temp =3D ioread32(addr);
> +
> +	if (val)
> +		temp |=3D GPIO_BIT(offset);
> +	else
> +		temp &=3D ~GPIO_BIT(offset);
> +
> +	if (reg =3D=3D reg_val && gpio->config->dcache_require)
> +		gpio->dcache[GPIO_BANK(offset)] =3D temp;
> +	iowrite32(temp, addr);
> +}
> +
> +static u32 aspeed_g4_reg_bits_get(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg)
> +{
> +	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> +	void __iomem *addr =3D bank_reg(gpio, bank, reg);
> +
> +	if (reg =3D=3D reg_rdata || reg =3D=3D reg_irq_status)
> +		return ioread32(addr);
> +	return !!(ioread32(addr) & GPIO_BIT(offset));

Okay, the semantics here feel a bit concerning. I think we need one
behaviour or the other, not both.

Perhaps we have two callbacks:

1. get_bit()
2. get_bank()

where get_bank() is only defined for reg_rdata and reg_irq_status, and
get_bit() for all registers.

> +}
> +
> +static bool aspeed_g4_copro_request(struct aspeed_gpio *gpio, unsigned i=
nt offset)
> +{
> +	if (!copro_ops || !gpio->cf_copro_bankmap)
> +		return false;
> +	if (!gpio->cf_copro_bankmap[offset >> 3])
> +		return false;
> +	if (!copro_ops->request_access)
> +		return false;
> +
> +	/* Pause the coprocessor */
> +	copro_ops->request_access(copro_data);
> +
> +	/* Change command source back to ARM */
> +	aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_ARM);

I don't think we need the indirection here, this is already a g4-
specific callback implementation, we can directly call
aspeed_g4_privilege_ctrl().

> +
> +	if (gpio->config->dcache_require)
> +		/* Update cache */
> +		gpio->dcache[GPIO_BANK(offset)] =3D
> +			gpio->config->llops->reg_bits_get(gpio, offset, reg_rdata);
> +
> +	return true;
> +}
> +
> +static void aspeed_g4_copro_release(struct aspeed_gpio *gpio, unsigned i=
nt offset)
> +{
> +	if (!copro_ops || !gpio->cf_copro_bankmap)
> +		return;
> +	if (!gpio->cf_copro_bankmap[offset >> 3])
> +		return;
> +	if (!copro_ops->release_access)
> +		return;
> +
> +	/* Change command source back to ColdFire */
> +	aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_COLDFIRE);

As above for the request implementation, we can call
aspeed_g4_privilege_ctrl() directly here.

> +
> +	/* Restart the coprocessor */
> +	copro_ops->release_access(copro_data);
> +}
> +
> +static void aspeed_g4_privilege_ctrl(struct aspeed_gpio *gpio, unsigned =
int offset, int cmdsrc)
> +{
> +	/*
> +	 * The command source register is only valid in bits 0, 8, 16, and 24, =
so we use
> +	 * (offset & ~(0x7)) to ensure that reg_bits_set always targets a valid=
 bit.
> +	 */
> +	/* Source 1 first to avoid illegal 11 combination */
> +	gpio->config->llops->reg_bit_set(gpio, offset & ~(0x7), reg_cmdsrc1, !!=
(cmdsrc & BIT(1)));
> +	/* Then Source 0 */
> +	gpio->config->llops->reg_bit_set(gpio, offset & ~(0x7), reg_cmdsrc0, !!=
(cmdsrc & BIT(0)));

Both of these can be direct calls to aspeed_g4_reg_bit_set().

> +}
> +
> +static void aspeed_g4_privilege_init(struct aspeed_gpio *gpio)
> +{
> +	u32 i;
> +
> +	/* Switch all command sources to the ARM by default */
> +	for (i =3D 0; i < DIV_ROUND_UP(gpio->chip.ngpio, 32); i++) {
> +		aspeed_gpio_change_cmd_source(gpio, (i << 5) + 0, GPIO_CMDSRC_ARM);
> +		aspeed_gpio_change_cmd_source(gpio, (i << 5) + 8, GPIO_CMDSRC_ARM);
> +		aspeed_gpio_change_cmd_source(gpio, (i << 5) + 16, GPIO_CMDSRC_ARM);
> +		aspeed_gpio_change_cmd_source(gpio, (i << 5) + 24, GPIO_CMDSRC_ARM);

Again as this is a g4-specific callback we can directly call
aspeed_g4_privilege_ctrl().

> +	}
> +}
> +
> +static const struct aspeed_gpio_llops aspeed_g4_llops =3D {
> +	.copro_request =3D aspeed_g4_copro_request,
> +	.copro_release =3D aspeed_g4_copro_release,
> +	.reg_bit_set =3D aspeed_g4_reg_bit_set,
> +	.reg_bits_get =3D aspeed_g4_reg_bits_get,
> +	.privilege_ctrl =3D aspeed_g4_privilege_ctrl,
> +	.privilege_init =3D aspeed_g4_privilege_init,
> +};
>  /*
>   * Any banks not specified in a struct aspeed_bank_props array are assum=
ed to
>   * have the properties:
> @@ -1120,7 +1111,14 @@ static const struct aspeed_bank_props ast2400_bank=
_props[] =3D {
> =20
>  static const struct aspeed_gpio_config ast2400_config =3D
>  	/* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
> -	{ .nr_gpios =3D 220, .props =3D ast2400_bank_props, };
> +	{
> +		.nr_gpios =3D 220,
> +		.props =3D ast2400_bank_props,
> +		.llops =3D &aspeed_g4_llops,
> +		.debounce_timers_array =3D debounce_timers,
> +		.debounce_timers_num =3D ARRAY_SIZE(debounce_timers),
> +		.dcache_require =3D true,
> +	};
> =20
>  static const struct aspeed_bank_props ast2500_bank_props[] =3D {
>  	/*     input	  output   */
> @@ -1132,7 +1130,14 @@ static const struct aspeed_bank_props ast2500_bank=
_props[] =3D {
> =20
>  static const struct aspeed_gpio_config ast2500_config =3D
>  	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
> -	{ .nr_gpios =3D 232, .props =3D ast2500_bank_props, };
> +	{
> +		.nr_gpios =3D 232,
> +		.props =3D ast2500_bank_props,
> +		.llops =3D &aspeed_g4_llops,
> +		.debounce_timers_array =3D debounce_timers,
> +		.debounce_timers_num =3D ARRAY_SIZE(debounce_timers),
> +		.dcache_require =3D true,
> +	};
> =20
>  static const struct aspeed_bank_props ast2600_bank_props[] =3D {
>  	/*     input	  output   */
> @@ -1148,7 +1153,14 @@ static const struct aspeed_gpio_config ast2600_con=
fig =3D
>  	 * We expect ngpio being set in the device tree and this is a fallback
>  	 * option.
>  	 */
> -	{ .nr_gpios =3D 208, .props =3D ast2600_bank_props, };
> +	{
> +		.nr_gpios =3D 208,
> +		.props =3D ast2600_bank_props,
> +		.llops =3D &aspeed_g4_llops,
> +		.debounce_timers_array =3D debounce_timers,
> +		.debounce_timers_num =3D ARRAY_SIZE(debounce_timers),
> +		.dcache_require =3D true,
> +	};
> =20
>  static const struct of_device_id aspeed_gpio_of_table[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-gpio", .data =3D &ast2400_config, },
> @@ -1191,6 +1203,9 @@ static int __init aspeed_gpio_probe(struct platform=
_device *pdev)
> =20
>  	gpio->config =3D gpio_id->data;
> =20
> +	if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bits=
_get)
> +		return -EINVAL;
> +

This will need to clean up gpio->clk. Perhaps you could move it above
the of_clk_get() call instead?

However, looking through the rest it seems we have a few issues with
this leak :/

>  	gpio->chip.parent =3D &pdev->dev;
>  	err =3D of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
>  	gpio->chip.ngpio =3D (u16) ngpio;
> @@ -1207,27 +1222,23 @@ static int __init aspeed_gpio_probe(struct platfo=
rm_device *pdev)
>  	gpio->chip.label =3D dev_name(&pdev->dev);
>  	gpio->chip.base =3D -1;
> =20
> -	/* Allocate a cache of the output registers */
> -	banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);
> -	gpio->dcache =3D devm_kcalloc(&pdev->dev,
> -				    banks, sizeof(u32), GFP_KERNEL);
> -	if (!gpio->dcache)
> -		return -ENOMEM;
> -
> -	/*
> -	 * Populate it with initial values read from the HW and switch
> -	 * all command sources to the ARM by default
> -	 */
> -	for (i =3D 0; i < banks; i++) {
> -		const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[i];
> -		void __iomem *addr =3D bank_reg(gpio, bank, reg_rdata);
> -		gpio->dcache[i] =3D ioread32(addr);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 0, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 1, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 2, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
> +	if (gpio->config->dcache_require) {
> +		/* Allocate a cache of the output registers */
> +		banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);
> +		gpio->dcache =3D devm_kcalloc(&pdev->dev, banks, sizeof(u32), GFP_KERN=
EL);
> +		if (!gpio->dcache)
> +			return -ENOMEM;

This should also clean up gpio->clk. I don't think you can move it to
avoid that.

Andrew

> +		/*
> +		 * Populate it with initial values read from the HW
> +		 */
> +		for (i =3D 0; i < banks; i++)
> +			gpio->dcache[i] =3D
> +				gpio->config->llops->reg_bits_get(gpio, (i << 5), reg_rdata);
>  	}
> =20
> +	if (gpio->config->llops->privilege_init)
> +		gpio->config->llops->privilege_init(gpio);
> +
>  	/* Set up an irqchip */
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)

