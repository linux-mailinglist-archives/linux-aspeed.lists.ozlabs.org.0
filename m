Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B6961B56
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 03:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtmkn6GpDz2yZN
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2024 11:18:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724807899;
	cv=none; b=dBaPJR+yFIUqe12PCDm0WTY9HhLdB4tT2ZrFKvPFrAtAlCUKhFSLY3eyv+UxRbcOe0WFMCpsqmpBU7wXh3iguU3B8D5BCCSX7sq2vnF0TmdjNV+BBs0GhZ9tQ3i+ruwTWyq41g5dxUERcV9DdnBA5uWsuf3w/y5Ss2LdHPaQ4M5kx3vMiF9F34nj44N4nrbihnltQ9knWLOip6+cI7XbD+w0oW3Dt4veeCEONs/ku87MD6tFI9eVpT1UFNqA7K+gjw6N63qbKXh41FPw2c4bXwP3WZcZfcAoCAkkDwjwWtWDR7cSkI8bkJa9XW6tJPvgzTLKFies/gIRgVE8JMAQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724807899; c=relaxed/relaxed;
	bh=bSE2OAY6iKksQlsyS8uTUxZkQGdxPR2/GAYLJ2SIUjY=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=PZf/mJKqvbTlTr0WjVL0kUX+XybDY80IgGVe4dKQ2snrkT+zNnoKZPG/FtASgBMx9BSQqkcO69zMJ/vu6BYQ0eSbCgTzoefx9YSGPXa2EbqcY5xSnAacDMceUaOZGlgBXyJacrF9DhuG3KL6H/WWWjO3ECzSMbZx4+fQyLOWzGwawRNTWNLN5AysfuMbBXQgAYAyECPbqEDV/JcePSSARLpr4s89+MlbEENJlHcaYz4CnEHjv3cdcqJAsR0L4NQW4RVht8V7G0GwuihrhehWQH08I11VikTUYU/YwIofTF15CaDkQpToI034RqQEuXBCo1obdVGJuRcIcLRfZ7v+bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kzJ4Lns4; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kzJ4Lns4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtmkf3vxBz2xxt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2024 11:18:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724807895;
	bh=bSE2OAY6iKksQlsyS8uTUxZkQGdxPR2/GAYLJ2SIUjY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=kzJ4Lns4D9k57LouPc/ML5CJP0WhGPBVqYuF+dpxMKLT5NJWLFIWCbArZVWkUv7Dr
	 rhU/ZjoYbN0bOG7EImSeetjmM/eaOn0ymvzkub9Y4CMkLJ6I/EkeCzZ26P5/zfUrH0
	 Pt8qEn+5i8uRsFe87NACLcOEXh+nGUCmEdpMr+wK9PxnyT2Dl154GimlC0p9NSflTw
	 9b6T65PqWDACMy0vdxF49OENa6kLD7c3u22M8AEHLL1hgCDAbBLBOrkKF224YIdHTV
	 va0gKzZ/sfuZpwaMDRH2SKLgACJw/LIb7LZ+RcvHJwV9wtne0Uf+oKRQaXfLi/Zwz7
	 /aO25LvIqFCwQ==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4A16A6506F;
	Wed, 28 Aug 2024 09:18:12 +0800 (AWST)
Message-ID: <e629752d8c97a2d14641a7fbc0cbdb1cd01a8ac5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
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
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 28 Aug 2024 10:48:10 +0930
In-Reply-To: <OSQPR06MB7252CBAEBF1DBE2C613F24748B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
	 <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
	 <cf92b3ab4b171e7c7c07cada066dad6323c5dace.camel@codeconstruct.com.au>
	 <OSQPR06MB7252CBAEBF1DBE2C613F24748B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
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

On Tue, 2024-08-27 at 02:45 +0000, Billy Tsai wrote:
> Hi Andrew,
>=20
> Thanks for your suggestion. As I understand it, you=E2=80=99re suggesting=
 that this driver should share the
> common parts with aspeed-gpio.c, correct?
> However, I don=E2=80=99t think that=E2=80=99s necessary. You can treat it=
 as a new GPIO controller because the
> register layout is quite different from aspeed-gpio.c.

Well, we could, but both share a lot of the same capabilities. aspeed-
gpio.c already has to abstract over the register layout because it's so
haphazard. What I was suggesting was to formalise this a bit more by
converting some of the inline functions and macros to callbacks that
can be implemented for each controller.

I haven't tried it myself, but it feels feasible?

> If I try to make it common, the driver could become too complex, potentia=
lly requiring a separate
> gpio-aspeed-common.c and necessitating changes to the existing aspeed-gpi=
o.c

I felt the trade-off between the volume of copy/paste and the
complexity of adding a few callbacks weighed in favour of the latter.

Also, given the volume of copy/paste, I think it would be best to
retain the copyright information from aspeed-gpio.c if the outcome is
these must be separate drivers.

Many of the changes seemed to be dealing with the difference between
`struct aspeed_gpio` and `struct aspeed_gpio_g7`, which might be
addressed by some careful struct design and use of container_of().

> Maybe the discussion of merging aspeed-gpio.c and this driver can be post=
poned until after this one
> is accepted?

Yeah, but I suspect the discussion just won't happen if this is merged.
Now's the time to get consensus on a way forward, while the driver is
yet to be merged.

> > > +
> > > +static const int debounce_timers[4] =3D { 0x00, 0x04, 0x00, 0x08 };
>=20
> > This is all largely copy/pasted from gpio-aspeed.c. Can we split it out
> > and share the definitions?
>=20
> Do you mean moving them into the common header file?=20
> The structure is fine, but I=E2=80=99m unsure about the debounce_timers.=
=20
> It=E2=80=99s a static array, so I don=E2=80=99t think it needs to be shar=
ed with gpio-aspeed.c.

That can be changed though? An appropriate pointer can be point into
the driver struct.

> > > +static int aspeed_gpio_g7_get(struct gpio_chip *gc, unsigned int off=
set)
> > > +{
> > > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> > > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(off=
set);
> > > +
> > > +     return !!(field_get(GPIO_G7_IN_DATA, ioread32(addr)));
> > > +}
> > > +
> > > +static void __aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int =
offset, int val)
> > > +{
> > > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> > > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(off=
set);
>=20
> > The rest of the implementation of this function is broadly the same as
> > in gpio-aspeed.c. The main difference is accounting for the address to
> > access and the bit to whack. If we define some callbacks that replace
> > GPIO_BANK()/to_bank() and GPIO_BIT() that can account for the
> > differences in register layout, perhaps this could be common?
>=20
> > The trade-off is some complexity vs copy-paste, but there does seem to
> > be an awful lot of the latter with only minor changes so far.
>=20
> Do you mean I need to create a gpio-aspeed-common.c, define the necessary=
 common APIs,
> and have gpio-aspeed.c and this driver hook into those APIs?

Well, you may not have to do that if we can put it all in gpio-
aspeed.c?

My suspicion is the g7 support could largely become some well-chosen
callbacks.

Andrew
