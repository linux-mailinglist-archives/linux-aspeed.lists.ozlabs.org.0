Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB3942616
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2024 08:01:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y+FLFMrB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYhLW2SMgz3d8G
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2024 16:01:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y+FLFMrB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYhLR0T6hz2yhZ;
	Wed, 31 Jul 2024 16:01:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722405694;
	bh=gojGMfkKjsM9J6aga5vnl6TY2q5uJ85vagSCFyyceU0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y+FLFMrB/2bHdm2VqEOmMjhfpLWLytJyLcAfytsqz+42qV7eCWCiD31jvHFVfSzBg
	 oK79Bo7dQNkecMYQfqjTeGSRxabnWt4RedzjaaiqrUaFFMmTay9B1P9F+zvcdvxD+F
	 8hYfcF3dNf9Q5mis2ti049+EYUVUXavbJM2VIUNcfQNVzjywIXyxFBsWlysEkxhspj
	 E6JZ0hLeBkoEUJdb3Ms+EjLCOyaG/3nKPokw/htbi75FdHGaKED7FgR4D80ozoherm
	 zNtvNvDsyXZ/gyeebM0IgloswHa0lzIJUcj2W3NqjYESGMm7MblRyU/NpLW66v6g7K
	 bOy/wpv5s+zmA==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2C48664C85;
	Wed, 31 Jul 2024 14:01:26 +0800 (AWST)
Message-ID: <25b2bc6b5b4aec33396f4d6960654e65bf1c3d6e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: don't use ',' after delimiters
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org
Date: Wed, 31 Jul 2024 15:31:25 +0930
In-Reply-To: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
References: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
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
Cc: imx@lists.linux.dev, Baruch Siach <baruch@tkos.co.il>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Vignesh R <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Brendan Higgins <brendan.higgins@linux.dev>, Elie Morisse <syniurge@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-samsung-soc@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-31 at 00:01 +0200, Wolfram Sang wrote:
> Delimiters are meant to be last, no need for a ',' there. Remove a
> superfluous newline in the ali1535 driver while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> @Andi: These changes are super trivial so I put them into one patch. Let
> me know if you prefer broken out patches. I think it is better if it
> goes through your tree, but I can also take if you prefer.
>=20
>  drivers/i2c/busses/i2c-ali1535.c      | 3 +--
>  drivers/i2c/busses/i2c-amd-mp2-plat.c | 2 +-
>  drivers/i2c/busses/i2c-aspeed.c       | 2 +-

Thanks for the cleanup.

For the Aspeed portion:

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
