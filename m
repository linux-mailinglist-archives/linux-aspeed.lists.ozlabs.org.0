Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B3983AFF
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 03:48:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCN6k0s9xz2yWK
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 11:48:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727142492;
	cv=none; b=C60NXcTuJbQpYRZ81A4+qJIOjMmUur3Gf6ueaW4rAzzK1eo6LA8fiE0+6nn2m4nCUO6hohYvVIwRz3iG5Lj4XFZ/yEGspADxBiTZ0C+C6x8RdtnCx3jPpoHjdmlKrPNHRg0GaN64MTpfJ0pmGtvAqgUNiTyYMRb2fIGqxxMAFosLpoFWOGp0n4pFCdTZeedGv9yLDMss6VUl6/Klq0VU/HcYl6L7pANStdxizTWjJV75UVPQvMXDgDaInlHJ6LTyT4qCbvSiCayu68GSjXEi4Hs6oGNi0gdch0c7TuFonzS9gtSCAxUwwWc884T67ZV+qDmzpe3aRIwW4N7kd6/VKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727142492; c=relaxed/relaxed;
	bh=GCefvpkLAdF/COhltMUzJr2wnq0riZTXfytdaX3aWA0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oDBLr7POuYuopclr6qz96+9v5OQQhckt0mzoc1elseWaaERgplglJgHzdrOzRL+4Y/9+TlsdKuu0uUnbaApWoN5OO8Q8Cfdb0uxmZMN3u6XQhUMYrt8XnfjS0Ocv3i3Jii6MANzlQTiGB7aZfZmyGlPw757AEgzhb3pnZBI/dkgEc/8/Z5YLCGtIwpHVEb4RsEl5Bg/eawEQN0Yynqvjmb4RiZkywLEeLm4h7bV9PL3hQOzA/1PXpmLRWmC7vKVzM1ZqKAB4P/V1/lmeLiuC3tRRcEUpPhBAXHv4ybqZgFg44LbGNzTENq87K+BJUhHOnvwJdCUOEfbulypXpnx1Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NOXalGUX; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NOXalGUX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCN6h5z1yz2xMQ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 11:48:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727142492;
	bh=GCefvpkLAdF/COhltMUzJr2wnq0riZTXfytdaX3aWA0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=NOXalGUXVBW/7tJhLWIPxi4cDFvCD59mXvbWbMjer2AyUGx4KPf9J0QB+NWD9thPZ
	 y+qOMrKmWIZ4VVniJA4Et0wtqBWunOK4DLhGHADgomMtVyl/fsEPwPZ608hbH10DHY
	 THjixeU0aEchjpsx/DgVVZ0j/Qv5l3CsYWw4SrtoFQAC94YyPd2zedfK0kWDcgk9Xm
	 rYbGwhTKQ3WPnBUfCcqr/G2LDyyMwXZbAAEWlvx2JatQGOARTs6VO0ZsLtew4X0rqC
	 /B9A3ONI6DmFH0qVeyf+4xYRwWIDgtR1lbvRVIz9fpJuGrFZK2Zk6xkt+AOexwUbjQ
	 qhF0mh+7q8ybA==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 453B16502A;
	Tue, 24 Sep 2024 09:48:11 +0800 (AWST)
Message-ID: <95d87d38cabccb04b82e66123d78137e9cb38958.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/6] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Tue, 24 Sep 2024 11:18:10 +0930
In-Reply-To: <20240923100611.1597113-4-billy_tsai@aspeedtech.com>
References: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
	 <20240923100611.1597113-4-billy_tsai@aspeedtech.com>
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

On Mon, 2024-09-23 at 18:06 +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for GPIO
> registers and the coprocessor request/release. With this abstraction
> layer, the driver can separate the hardware and software logic, making it
> easier to extend the driver to support different hardware register
> layouts.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 443 +++++++++++++++++++------------------
>  1 file changed, 233 insertions(+), 210 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d20e15b2079d..d3994d833684 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -39,6 +39,10 @@ struct aspeed_bank_props {
>  struct aspeed_gpio_config {
>  	unsigned int nr_gpios;
>  	const struct aspeed_bank_props *props;
> +	const struct aspeed_gpio_llops *llops;
> +	const int *debounce_timers_array;
> +	int debounce_timers_num;
> +	bool require_dcache;
>  };
> =20
>  /*
> @@ -178,6 +182,19 @@ enum aspeed_gpio_reg {
>  	reg_cmdsrc1,
>  };
> =20
> +struct aspeed_gpio_llops {
> +	bool (*copro_request)(struct aspeed_gpio *gpio, unsigned int offset);
> +	void (*copro_release)(struct aspeed_gpio *gpio, unsigned int offset);
> +	void (*reg_bit_set)(struct aspeed_gpio *gpio, unsigned int offset,
> +			    const enum aspeed_gpio_reg reg, bool val);
> +	bool (*reg_bit_get)(struct aspeed_gpio *gpio, unsigned int offset,
> +			    const enum aspeed_gpio_reg reg);
> +	int (*reg_bank_get)(struct aspeed_gpio *gpio, unsigned int offset,
> +			    const enum aspeed_gpio_reg reg);
> +	void (*privilege_ctrl)(struct aspeed_gpio *gpio, unsigned int offset, i=
nt owner);
> +	void (*privilege_init)(struct aspeed_gpio *gpio);

I made a request down below, so given that, do you mind re-arranging
the member ordering in this struct? It'd be nice to have some flow to
it. Probably just move the copro_* members down the bottom? So:

struct aspeed_gpio_llops {
	void (*reg_bit_set)(struct aspeed_gpio *gpio, unsigned int offset,
			    const enum aspeed_gpio_reg reg, bool val);
	bool (*reg_bit_get)(struct aspeed_gpio *gpio, unsigned int offset,
			    const enum aspeed_gpio_reg reg);
	int (*reg_bank_get)(struct aspeed_gpio *gpio, unsigned int offset,
			    const enum aspeed_gpio_reg reg);
	void (*privilege_ctrl)(struct aspeed_gpio *gpio, unsigned int offset, int =
owner);
	void (*privilege_init)(struct aspeed_gpio *gpio);
	bool (*copro_request)(struct aspeed_gpio *gpio, unsigned int offset);
	void (*copro_release)(struct aspeed_gpio *gpio, unsigned int offset);
};

*snip*


> @@ -1182,7 +1205,7 @@ static int __init aspeed_gpio_probe(struct platform=
_device *pdev)
>  	if (!gpio_id)
>  		return -EINVAL;
> =20
> -	gpio->clk =3D of_clk_get(pdev->dev.of_node, 0);
> +	gpio->clk =3D devm_clk_get_enabled(&pdev->dev, 0);

Nice - however, can you please make this its own patch and add a Fixes:
tag?

Otherwise I think the patch is looking okay. I'll try to get some
testing done.

Andrew
