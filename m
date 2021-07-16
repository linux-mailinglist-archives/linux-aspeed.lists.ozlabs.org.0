Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E143CB2F9
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Jul 2021 09:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR2SN3fkNz301t
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Jul 2021 17:10:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GR2SF2JDKz2ydK
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Jul 2021 17:10:03 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m4Hyp-0005Ie-Qt; Fri, 16 Jul 2021 09:09:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m4Hyj-0000Av-Nv; Fri, 16 Jul 2021 09:09:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m4Hyj-0000CV-Mi; Fri, 16 Jul 2021 09:09:45 +0200
Date: Fri, 16 Jul 2021 09:09:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v9 2/2] pwm: Add Aspeed ast2600 PWM support
Message-ID: <20210716070943.ayxkz2irkwhgincz@pengutronix.de>
References: <20210709065217.6153-1-billy_tsai@aspeedtech.com>
 <20210709065217.6153-3-billy_tsai@aspeedtech.com>
 <20210715150533.vppkw5oiomkxmfrn@pengutronix.de>
 <BD5B012C-B377-45E2-B04E-61D12B086670@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2f4lehdpjydeehv6"
Content-Disposition: inline
In-Reply-To: <BD5B012C-B377-45E2-B04E-61D12B086670@aspeedtech.com>
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


--2f4lehdpjydeehv6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Billy,

On Fri, Jul 16, 2021 at 01:48:20AM +0000, Billy Tsai wrote:
> On 2021/7/15, 11:06 PM, "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutronix=
=2Ede>> wrote:
>     > Another is: The PWM doesn't support duty_cycle 0, on such a request=
 the
>     > PWM is disabled which results in a constant inactive level.
>=20
>     > (This is correct, is it? Or does it yield a constant 0 level?)
>=20
> Our pwm can support duty_cycle 0 by unset CLK_ENABLE.

This has a slightly different semantic though. Some consumer might
expect that the following sequence:

	pwm_apply(mypwm, { .period =3D 10000, .duty_cycle =3D 10000, .enabled =3D =
true })
	pwm_apply(mypwm, { .period =3D 10000, .duty_cycle =3D 0, .enabled =3D true=
 })
	pwm_apply(mypwm, { .period =3D 10000, .duty_cycle =3D 10000, .enabled =3D =
true })

results in the output being low for an integer multiple of 10 =B5s. This
isn't given with setting CLK_ENABLE to zero, is it? (I didn't recheck,
if the PWM doesn't complete periods on reconfiguration this doesn't
matter much though.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2f4lehdpjydeehv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDxMLQACgkQwfwUeK3K
7AmSUgf+KelGjfPXAW5sfbfcgNm/W3eNleFAUKPGThM4qsl47Gw8QytStuxO8Gsu
POxq+PE8GfmzMNBWUqlIQnuadgbmLFQhOa2AY2E8xEeENDtZfAsiH8S18TvupZlF
S/kxrlhoZ5zjpq+TkjVO0YIzK82a43quBj+WDAginCyqSKI/IE0HQdqScIdJFz6x
3bk23sSfI3EB91+dyFESGUVQ+5X9LVkeV+R8Wk1ytLh3hnUSN5X3nzSYECcH5qGr
AMpjrqivGCGuIE6BBxPP2ZRP5b4iVFGTKm26cJ4uxIlEas2ZQndr3XKbRREjATuG
C1vvl77dngONECSQqM5M6NyjVwzMGQ==
=w9wF
-----END PGP SIGNATURE-----

--2f4lehdpjydeehv6--
