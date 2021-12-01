Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A99464A62
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 10:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3tdY3Hkmz30Hv
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 20:12:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3tdS73MLz303F
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Dec 2021 20:12:11 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1msLeW-0003Y6-1e; Wed, 01 Dec 2021 10:11:48 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1msLeQ-0003CH-IM; Wed, 01 Dec 2021 10:11:42 +0100
Message-ID: <3b80b2a52362cbadb26052685566e2c1f75a0b68.camel@pengutronix.de>
Subject: Re: [v13 2/2] pwm: Add Aspeed ast2600 PWM support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>, "jdelvare@suse.com"
 <jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>, 
 "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "lee.jones@linaro.org" <lee.jones@linaro.org>, 
 "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "u.kleine-koenig@pengutronix.de"
 <u.kleine-koenig@pengutronix.de>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
 <linux-pwm@vger.kernel.org>
Date: Wed, 01 Dec 2021 10:11:42 +0100
In-Reply-To: <CDB0374F-3835-4501-964E-DB771588114D@aspeedtech.com>
References: <20211129064329.27006-1-billy_tsai@aspeedtech.com>
 <20211129064329.27006-3-billy_tsai@aspeedtech.com>
 <e28a5d5de9b940717e6444f019eab63ab1bb0b75.camel@pengutronix.de>
 <CDB0374F-3835-4501-964E-DB771588114D@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Wed, 2021-12-01 at 03:30 +0000, Billy Tsai wrote:
> Hi Philipp,
>=20
> On 2021/11/30, 5:52 PM, "Philipp Zabel" <p.zabel@pengutronix.de> wrote:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0On Mon, 2021-11-29 at 14:43 +0800, Billy Tsai wro=
te:
> =C2=A0=C2=A0=C2=A0=C2=A0[...]
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +	ret =3D clk_prepare_enable(priv->clk);
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +	if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +		return dev_err_probe(dev, ret, "Couldn't=
 enable clock\n");
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +	ret =3D reset_control_deassert(priv->rese=
t);
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +	if (ret) {
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +		dev_err_probe(dev, ret, "Couldn't deasse=
rt reset control\n");
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +		goto err_disable_clk;
> =C2=A0=C2=A0=C2=A0=C2=A0>   > +	}
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0>   Is there any reason to keep the clocks runnin=
g and the controller out of
> =C2=A0=C2=A0=C2=A0=C2=A0>   reset while the PWM outputs are disabled?
>=20
> Can you tell me about your concerns with this process?

No particular concerns, just curiosity.

> In my opinion, they are used to provide the clock and de-assert the reset=
 of the PWM engine. If we didn't release
> them in probe stage the CPU can't and shouldn't read the register of the =
PWM engine when call the get_state.
> Assume that we want to adjust them dynamically, the driver needs to add m=
ore conditions to check and keep the status
> of each PWM channel, which is not a good deal for the server platform.

Thanks. I don't know the hardware, so I have no idea whether disabling
the clocks would even save a measurable (let alone appreciable) amount
of power.

I've just seen other PWM drivers use runtime PM or enable/disable clocks
dynamically, and wondered why this one doesn't.

regards
Philipp
