Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1999600C
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 08:47:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNk3D3VQLz3bbC
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 17:47:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728456453;
	cv=none; b=X47I5XaIrgzhdrasupBQulIZETeAKuakGfFBCkUN9PDpI4+pacIDSmcYSF4Zg6Po4Xut1D3B2fgZp5vwiZe6SRWaReuWGakj0sp3t85sfTwriR5taPTd5qgtujAG+XJQAL63uljVvWf5P5vD7vYJAorq3LJjE7RCfhQgYQdGgnj75clJ06foHoA/3HcICywFjufJMcvq37pHe9g5XxjkGUZBvtvAbU3KuCq5uNa5O/tYRMEjiFdpRSch7BV6/c2iCILS5ztMn4zhu+W6rzLrtkZgrdEKdXlFjg9vY5V7mGBvXaw9tf9zuZn+TUwwEgoMus8Ly96k9eDfU+F6ZLWS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728456453; c=relaxed/relaxed;
	bh=vP4ICph0zWuiJj2g+RQhmi046O+uRxzp9Xv2oj6XryM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fvPU1fp+/hkqS1D2xRi+h/zs6HEHqh8/8J8puYUzWW5CEHfA7b+2FoWj9TcD6wZEuyYGyZMiS6BQnfwADvj6yuX19admCxVTWtdgu2Gcskpa8V5vmypQ+PNsuqGO7VR1ZYJlJMBWzAqPmdANSTmbHYK56iw0I5iM3d6DVFqDrMM0wVzM3TVgkQQk5/qoUUSHP/izT5gKtsXWr+LQ+URmHCAoQeommp6ToyuuBezT8LaLuZ29MtzrFD8X+UeRXregs61r76MIhxdM+9UTrYUvWAsnJ0Sk3QqqpChj7fBDghlI+SU7r6p1xQ7kcayrSQIPB+j8+/kax1tWODB1rd5Lqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OB3OKNYZ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OB3OKNYZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNk376c7Tz2yF0
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 17:47:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728456450;
	bh=vP4ICph0zWuiJj2g+RQhmi046O+uRxzp9Xv2oj6XryM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=OB3OKNYZwAdiVAe9fJP8EP/vxUmxJRXcUKIhvqnEApal2XtML10N87gC4e2kp3VvL
	 e2p6IYY1Sm+F0Nxi/QdgqFAz9rP7pMB40xtjKvjCebdFtrpDm+JxStwPCtAYIhqopQ
	 qrPrxQYluFhT8+Dr/+1A38SDUg+VOTG9AdF5yQceLS3jc+OAMR7K+adlEbxnIjFLBQ
	 ii2w2fTXvcL8xTN9+9dnSfY3pcqtw5pR3eDGtbEMuQuXmx0zkOBXeFGKH1KUAD9ZCZ
	 OuhXyEO0N+mMISyVH0MNsDdL3jbKA1PW/J1ckFRCPiKOGrU31Igk++h8sRKGFrE/94
	 9Pawir4ANCzQQ==
Received: from [192.168.68.112] (unknown [118.211.89.65])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EB8FF64A86;
	Wed,  9 Oct 2024 14:47:27 +0800 (AWST)
Message-ID: <a0a372bcfd4255cbc5c6c68c3cca428d13c112ef.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 7/7] gpio: aspeed: Support G7 Aspeed gpio controller
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
Date: Wed, 09 Oct 2024 17:17:26 +1030
In-Reply-To: <OSQPR06MB72526C8FE71BF336D8AF50758B7F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
	 <20241008081450.1490955-8-billy_tsai@aspeedtech.com>
	 <66e619a9085a2ecb62e3945cd024822de5317f92.camel@codeconstruct.com.au>
	 <OSQPR06MB72526C8FE71BF336D8AF50758B7F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
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

On Wed, 2024-10-09 at 02:28 +0000, Billy Tsai wrote:
> > > In the 7th generation of the SoC from Aspeed, the control logic
> > > of the
> > > GPIO controller has been updated to support per-pin control. Each
> > > pin now
> > > has its own 32-bit register, allowing for individual control of
> > > the pin's
> > > value, direction, interrupt type, and other settings. The
> > > permission for
> > > coprocessor access is supported by the hardware but hasn't been
> > > implemented in the current patch.
> > >=20
> > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > > ---
> > > =C2=A0drivers/gpio/gpio-aspeed.c | 147
> > > +++++++++++++++++++++++++++++++++++++
> > > =C2=A01 file changed, 147 insertions(+)
> > >=20
> > > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-
> > > aspeed.c
> > > index 5d583cc9cbc7..208f95fb585e 100644
> > > --- a/drivers/gpio/gpio-aspeed.c
> > > +++ b/drivers/gpio/gpio-aspeed.c
> > > @@ -30,6 +30,27 @@
> > > =C2=A0#include <linux/gpio/consumer.h>
> > > =C2=A0#include "gpiolib.h"
> > >=20
> > > +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > > +#define field_get(_mask, _reg)       (((_reg) & (_mask)) >>
> > > (ffs(_mask) - 1))
> > > +#define field_prep(_mask, _val)      (((_val) << (ffs(_mask) -
> > > 1)) & (_mask))
> > > +
> > > +#define GPIO_G7_IRQ_STS_BASE 0x100
> > > +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) *
> > > 0x4)
> > > +#define GPIO_G7_CTRL_REG_BASE 0x180
> > > +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x)
> > > * 0x4)
> > > +#define GPIO_G7_CTRL_OUT_DATA BIT(0)
> > > +#define GPIO_G7_CTRL_DIR BIT(1)
> > > +#define GPIO_G7_CTRL_IRQ_EN BIT(2)
> > > +#define GPIO_G7_CTRL_IRQ_TYPE0 BIT(3)
> > > +#define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
> > > +#define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
> > > +#define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
> > > +#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(7)
> > > +#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(8)
> > > +#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
> > > +#define GPIO_G7_CTRL_IRQ_STS BIT(12)
> > > +#define GPIO_G7_CTRL_IN_DATA BIT(13)
> > > +
> > > =C2=A0struct aspeed_bank_props {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int bank;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 input;
> > > @@ -95,6 +116,22 @@ struct aspeed_gpio_bank {
> > > =C2=A0=C2=A0*/
> > >=20
> > > =C2=A0static const int debounce_timers[4] =3D { 0x00, 0x50, 0x54, 0x5=
8
> > > };
> > > +static const int g7_debounce_timers[4] =3D { 0x00, 0x00, 0x04,
> > > 0x08 };
> > > +
> > > +/*
> > > + * The debounce timers array is used to configure the debounce
> > > timer settings.Here=E2=80=99s how it works:
> > > + * Array Value: Indicates the offset for configuring the
> > > debounce timer.
> > > + * Array Index: Corresponds to the debounce setting register.
> > > + * The debounce timers array follows this pattern for
> > > configuring the debounce setting registers:
> > > + * Array Index 0: No debounce timer is set;
> > > + *             Array Value is irrelevant (don=E2=80=99t care).
> > > + * Array Index 1: Debounce setting #2 is set to 1, and debounce
> > > setting #1 is set to 0.
> > > + *             Array Value: offset for configuring debounce
> > > timer 0 (g4: 0x50, g7: 0x00)
> > > + * Array Index 2: Debounce setting #2 is set to 0, and debounce
> > > setting #1 is set to 1.
> > > + *             Array Value: offset for configuring debounce
> > > timer 1 (g4: 0x54, g7: 0x04)
> > > + * Array Index 3: Debounce setting #2 is set to 1, and debounce
> > > setting #1 is set to 1.
> > > + *             Array Value: offset for configuring debounce
> > > timer 2 (g4: 0x58, g7: 0x8)
> > > + */
> > >=20
> > > =C2=A0static const struct aspeed_gpio_copro_ops *copro_ops;
> > > =C2=A0static void *copro_data;
> > > @@ -250,6 +287,39 @@ static void __iomem
> > > *aspeed_gpio_g4_bank_reg(struct aspeed_gpio *gpio,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BUG();
> > > =C2=A0}
> > >=20
> > > +static u32 aspeed_gpio_g7_reg_mask(const enum aspeed_gpio_reg
> > > reg)
> > > +{
> > > +     switch (reg) {
> > > +     case reg_val:
> > > +             return GPIO_G7_CTRL_OUT_DATA;
>=20
> > I think a problem is that we want this to be GPIO_G7_CTRL_IN_DATA
> > for
> > reads, but GPIO_G7_CTRL_OUT_DATA for writes?
>=20
> Yes. So in my aspeed_g7_bit_get, I will change the mask to
> GPIO_G7_CTRL_IN_DATA.
>=20
> +static bool aspeed_g7_reg_bit_get(struct aspeed_gpio *gpio, unsigned
> int offset,
> +                                 const enum aspeed_gpio_reg reg)
> +{
> +       u32 mask =3D aspeed_gpio_g7_reg_mask(reg);
> +       void __iomem *addr;
> +
> +       addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +       if (reg =3D=3D reg_val)
> +               mask =3D GPIO_G7_CTRL_IN_DATA;
> +
> +       if (mask)
> +               return field_get(mask, ioread32(addr));
> +       else
> +               return 0;
> +}
> +

Ah, I see that's already what you have. Thanks.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

