Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A397E461
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 02:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBkX02H1Qz2yT0
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 10:34:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727051662;
	cv=none; b=Y2sWdH6HfpjH4OLxNlz6nwt7Vp1XnUm+dmuUh4NdsO5cCBPFXG1yeERQ0v1yKJKDdg5KTfCst8Br20RxMICtUQwq2wesrPGVb4nIH0sFRViCzZUonXm6Yoa+bUgxHOhQH0Eb2KGEb5V045UsaYuHt88x49Ro4YMRbMDfBsRfnobv+1JOMkGH/+5+VE+uxjIjMkSDLm8L0tvgb0punsK8S77J4fj6erpdT3Euvqi/wd/FMBOKzTcbJkLb1MqEspJyev07sQyo7LI3X7GXwlXUgayuayqynGI/R6hROVGJql8Raehfqi8mN0Ok9vceo57ZL0T6P14r716VIFu878sHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727051662; c=relaxed/relaxed;
	bh=J8lZa+H3G/xwr0+dUXS/TBLSPBCwgo0bJD6759puYZY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bbF9c6KjhxXEj+aUTX2hf1ileTGc/blVHw7KXf3UbCOvVIEAU3FZdKs8nxB6YVIyLqHhsKJt4Xlv3JIU5jShAKvWwpMUXW8rhmiJYRM5466oxPVsQkyErOIPDNStmUiBYqhOOtGzhIaGIkH9JocyJt0qrc1X7osGUl0rdtMV9jcmjFsbzrvHepIr64XcLL6isXP4zSpCbBLJ6PPwXL9znqQe5wXlYgqQzqOIxJhZljnoxISa+RD+/h+EsQcP3O6GEQZzSdLczX8pPyBAE9szkhw+PGUXbl2xTmJ+zrEE0QxYEv6c1n6xH6gh1reAwQ/gaUIkjhN9T9Wvu13wBOEleA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hv7PivUj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hv7PivUj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBkWy24mpz2xgv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 10:34:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727051661;
	bh=J8lZa+H3G/xwr0+dUXS/TBLSPBCwgo0bJD6759puYZY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=hv7PivUjzA5mCleEYQ2yPhpRbIv3vJQAqKQWGqTezKx7WLAF2Ou1FzkcuLyIuW5z7
	 elFpwFaXYpXtxbzAuqQ7nkXVLKQYTUjGNmtWEwCB+ltgV/Azw4kxIC50z4y7pGLREn
	 44U1efdDyJtxuIOxzUnxjNoTUovGNESkU8QhNn/L73JjMIyIQ3CuI8yfDIijb5GyBU
	 /BMlp1rT+pbw8qQmwXsLuPc9gnCaDwgolo2E3m4DMfd8LvSNg98DEXe5ha6LknJr7s
	 u3/CHD+NChCHSe+sAgqFIeQAW9kcHaa8YAfky/Dp4YtKU0OSgBPhItYOQr6pK1/sDI
	 CYGv6HTS/OALA==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B13FB640E8;
	Mon, 23 Sep 2024 08:34:17 +0800 (AWST)
Message-ID: <1333d8dd77c80825cb20bc5a9885a6ced774183b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/6] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,  "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, 
 "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Jay_Zhang@wiwynn.com"
 <Jay_Zhang@wiwynn.com>
Date: Mon, 23 Sep 2024 10:04:17 +0930
In-Reply-To: <OSQPR06MB7252FDD739DCE7D4A44F63248B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
	 <20240919094339.2407641-4-billy_tsai@aspeedtech.com>
	 <7aaed8cf171b67300aa5b7e861628278de948a27.camel@codeconstruct.com.au>
	 <OSQPR06MB7252FDD739DCE7D4A44F63248B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
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

On Fri, 2024-09-20 at 09:19 +0000, Billy Tsai wrote:
> >=20
> > > @@ -1191,6 +1203,9 @@ static int __init aspeed_gpio_probe(struct
> > > platform_device *pdev)
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpio->config =3D gpio_id->data;
> > >=20
> > > +     if (!gpio->config->llops->reg_bit_set || !gpio->config-
> > > >llops->reg_bits_get)
> > > +             return -EINVAL;
> > > +
>=20
> > This will need to clean up gpio->clk. Perhaps you could move it
> > above
> > the of_clk_get() call instead?
>=20
> How about change the `of_clk_get` to `devm_clk_get(&pdev->dev, 0);`?

Yep.

>=20
> > However, looking through the rest it seems we have a few issues
> > with
> > this leak :/
>=20
> This gpio driver doesn't have the reset, is it?

No, just leaking the resource.

However, I can't see that we prepare/enable (and disable/unprepare) the
clock either :( [1]. Do you mind fixing that as well? It would be best
if debounce didn't work by accident.

Andrew

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/linux/clk.h?h=3Dv6.11#n527



