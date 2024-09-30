Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E199899A9
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 06:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH6mj44PPz2yQL
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 14:00:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727668835;
	cv=none; b=LNs0a6/dROaywTsQqbuxiWJBbZUtzYumGbCNIsJ7aUMYBsubfS289RB3cvjx8CywCP3HeVizCvtblYAMCJvXS6+uu1rlxucJXmA+Zintr2RTzLgJMjdDRoHIzPJjAp3y/mlyccp/GWr9V4jcIETwPaCok4vAEG1abvuT2cmBDOYJaLJYzifcYSJhs4SNtzTK7TeqteEM3GPRJIVfgUfo9iDgmFqAXTymN2g1iO/Ad2bK+yVIWZhfIUcT31pfEs9gHo6mhoB+QHD9++9CDUvGkDO1V2gok1YKsly6ZpC7HBhlSgZMtQpsvM+Sja16VlyNUNO/Gttu4EEN3d49ImWc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727668835; c=relaxed/relaxed;
	bh=x1MVByC9IZmGZ5pP4eLbpu0Q6zUMxyr6LSy+i01ws1M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GcZYpSecNA92/eLD0KcB0HC9NJm6WepUQpgOdcWq7i4In7RKKsjzNIK9D6BeO1IedKBKjoezl86soIOkXXeAlo2m7l9rCMnx0BrmVSTdZN2uZrQ7gzzRmYI72l5P6O/6gdaQsInTHu/Pn3o1ruk8LXEW2yYK36Jms72UuZYQk0bxiHiBHA5l5TQBxSsIInrfPns3FGrN46oc1DenRbD02eX0SEt1CEqLeDlSQNLees/TXNEq1C25uU8Q+MM3v+LagMo0StoEhZaWpJuqn2zqYjFTmeG23so2JSDP7kLbsvEOvmInHkQvFFS+HsXAu6UfJOUxBJ8sfdGWxtu04o3N3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LJATheIe; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LJATheIe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH6mf4G5Pz2xYw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 14:00:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727668830;
	bh=x1MVByC9IZmGZ5pP4eLbpu0Q6zUMxyr6LSy+i01ws1M=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LJATheIezZWFVcv0H7jqy6XdHb6EQP8mqcS6854GkA7Uqr3uzBDzna/qPZZq/PRsp
	 h0CjV4Gu1Zc0RXlnm9NbKz1zBkeL+9qbZONBZxfFx/GANzRP3/VapsBo3YQ85FIxZG
	 ZuXXlpvE6NLPKsSPGiYJLZ28a+RM/QDu3tBjGgclGO7Qv4tn7Rx7mSrm1y496+PctR
	 NFJIq7LjbZQfthFeFiRiq4tEWG6MR/TTwFbJ9mUDOed1mosFMhMHktDSnmu+ynudOn
	 WCLF2t7X0YC4m+K+KAclzPwrC37wbt2IBepfwQUcqfWcwCFF5wfFYMGshxzLth9VIM
	 9dnSzP0SGKIqw==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BD0FB6511E;
	Mon, 30 Sep 2024 12:00:26 +0800 (AWST)
Message-ID: <ff05349166eac044a05d74d969749c5d144cd5b0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 3/7] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 13:30:25 +0930
In-Reply-To: <20240927111744.3511373-4-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
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

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
>=20
> +
> +static const struct aspeed_gpio_llops aspeed_g4_llops =3D {
> +	.copro_request =3D aspeed_g4_copro_request,
> +	.copro_release =3D aspeed_g4_copro_release,
> +	.reg_bit_set =3D aspeed_g4_reg_bit_set,
> +	.reg_bit_get =3D aspeed_g4_reg_bit_get,
> +	.reg_bank_get =3D aspeed_g4_reg_bank_get,
> +	.privilege_ctrl =3D aspeed_g4_privilege_ctrl,
> +	.privilege_init =3D aspeed_g4_privilege_init,
> +};

A brief nitpick as I have another comment below - can you order these
assignments in the same order as the member declarations in the struct
(you re-ordered that in v6)?

> @@ -1191,6 +1214,10 @@ static int __init aspeed_gpio_probe(struct platfor=
m_device *pdev)
> =20
>  	gpio->config =3D gpio_id->data;
> =20
> +	if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_=
get ||
> +	    !gpio->config->llops->reg_bank_get)
> +		return -EINVAL;
> +

I think the patch is largely in good shape. I've given it some light
testing. The only concern I have is this is introducing another
resource cleanup bug right now, but that's only because you've ordered
the devm_clk_get_enabled() patch as the last in the series. If you
order it before this patch then the direct return above should no-
longer be a concern.

Andrew
