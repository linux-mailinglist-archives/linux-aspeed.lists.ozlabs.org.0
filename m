Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC73D0F02
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Jul 2021 14:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVFlc4X83z309k
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Jul 2021 22:49:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVFlX6H3Nz2yMm
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Jul 2021 22:49:27 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m6Bez-0005Rz-3Z; Wed, 21 Jul 2021 14:49:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m6Bel-00009I-8O; Wed, 21 Jul 2021 14:48:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m6Bel-0000Yf-7G; Wed, 21 Jul 2021 14:48:59 +0200
Date: Wed, 21 Jul 2021 14:48:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v9 2/2] pwm: Add Aspeed ast2600 PWM support
Message-ID: <20210721124859.clv6qlitbyomdz6s@pengutronix.de>
References: <20210709065217.6153-1-billy_tsai@aspeedtech.com>
 <20210709065217.6153-3-billy_tsai@aspeedtech.com>
 <20210715150533.vppkw5oiomkxmfrn@pengutronix.de>
 <BD5B012C-B377-45E2-B04E-61D12B086670@aspeedtech.com>
 <20210716070943.ayxkz2irkwhgincz@pengutronix.de>
 <DD5590B4-11BC-411B-95BF-03AC26C078E4@aspeedtech.com>
 <20210716101301.l563tdwt5xuq5iq6@pengutronix.de>
 <3F12A498-DF5C-4954-8BCE-8C0C66BC9734@aspeedtech.com>
 <4BC9AEF6-31EA-4EDA-BCB2-7E4D44B6D5D2@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sh6jjxfikryciybj"
Content-Disposition: inline
In-Reply-To: <4BC9AEF6-31EA-4EDA-BCB2-7E4D44B6D5D2@aspeedtech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 BMC-SW <BMC-SW@aspeedtech.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--sh6jjxfikryciybj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 10:52:21AM +0000, Billy Tsai wrote:
> Hi Uwe,
>=20
>     On 2021/7/16, 6:13 PM, "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutro=
nix.de> wrote:
>=20
>         On Fri, Jul 16, 2021 at 09:22:22AM +0000, Billy Tsai wrote:
>         >> On 2021/7/16, 3:10 PM, "Uwe Kleine-K=F6nig" <u.kleine-koenig@p=
engutronix.de> wrote:
>         >>=20
>         >>     On Fri, Jul 16, 2021 at 01:48:20AM +0000, Billy Tsai wrote:
>         >>     >> On 2021/7/15, 11:06 PM, "Uwe Kleine-K=F6nig" <u.kleine-=
koenig@pengutronix.de>> wrote:
>         >>     >>     > Another is: The PWM doesn't support duty_cycle 0,=
 on such a request the
>         >>     >>     > PWM is disabled which results in a constant inact=
ive level.
>         >>     >>=20
>         >>     >>     > (This is correct, is it? Or does it yield a const=
ant 0 level?)
>         >>     >>=20
>         >>     >> Our pwm can support duty_cycle 0 by unset CLK_ENABLE.
>         >>=20
>         >>     > This has a slightly different semantic though. Some cons=
umer might
>         >>     > expect that the following sequence:
>         >>=20
>         >>     >	pwm_apply(mypwm, { .period =3D 10000, .duty_cycle =3D 10=
000, .enabled =3D true })
>         >>     >	pwm_apply(mypwm, { .period =3D 10000, .duty_cycle =3D 0,=
 .enabled =3D true })
>         >>     >	pwm_apply(mypwm, { .period =3D 10000, .duty_cycle =3D 10=
000, .enabled =3D true })
>         >>=20
>         >>     > results in the output being low for an integer multiple =
of 10 =B5s. This
>         >>     > isn't given with setting CLK_ENABLE to zero, is it? (I d=
idn't recheck,
>         >>     > if the PWM doesn't complete periods on reconfiguration t=
his doesn't
>         >>     > matter much though.)
>         >> Thanks for the explanation.
>         >> Our hardware actually can only support duty from 1/256 to 256/=
256.
>         >> For this situation I can do possible solution:
>         >> We can though change polarity to meet this requirement. Invers=
e the pin and use
>         >> duty_cycle 100.=20
>         >> But I think this is not a good solution for this problem right?
>=20
>         > If this doesn't result in more glitches that would be fine for =
me.
>         > (Assuming it is documented good enough in the code to be
>         > understandable.)
>=20
>     > The polarity of our pwm controller will affect the duty cycle range:
>     > PWM_POLARITY_INVERSED : Support duty_cycle from 0% to 99%
>     > PWM_POLARITY_NORMAL: Support duty_cycle from 1% to 100%
>     > Dynamic change polarity will result in more glitches. Thus, this wi=
ll become
>     > a trade-off between 100% and 0% duty_cycle support for user to use =
our pwm device.
>     > I will document it and send next patch.
>=20
> For handling the situation that the user want to set the duty cycle to 0%=
, the driver can:
> 1. Just return the error.
> 2. Use the minimum duty cycle value.
> I don't know which solution will be the better way or others.
> I would be grateful if you can give me some suggestion about this problem.

I thought if you disable the PWM it emits the inactive level? Then this
is the best you can do if duty_cycle =3D 0 is requested.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sh6jjxfikryciybj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmD4F7gACgkQwfwUeK3K
7AkJmQgAnqDb+O4do8MRPO90e+3qhwE2WBmoUv3JcNTC4u/KvdJlWCq1JvKmGjAs
L5nbyWsMVXT9A6Ry1xVvDH5jIVd9kpLns5ApiyURH94FUZR/wG9BfpaLdSDwzLzM
W8WOr3c5Dcq9D/2j0cZ5xcjcg4kC31NkCkEL9U4dBYY+8XQ3f5zkKQgLzvJiEgSV
P43lIjEFxmkZLZ2p+EWTMDK+fxYq6GXTcjLY+zVbmLh3S7kcTrf9ccSGS4tb8Xha
oytit4cw0uUZ8tGk1dLSMysNexb/6p/QKfC5XSe7vshfobkDryGZUa9UQT4GmqTU
h4V6Sk4tjTVpfnBEWUL5fadiMoc/nQ==
=bCmv
-----END PGP SIGNATURE-----

--sh6jjxfikryciybj--
