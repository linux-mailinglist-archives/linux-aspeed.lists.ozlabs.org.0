Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B4E8076ED
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Dec 2023 18:49:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SllJc5Rf2z3cTP
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Dec 2023 04:49:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SllJX5nprz3bws
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Dec 2023 04:48:58 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAw0Z-0003ZN-Ul; Wed, 06 Dec 2023 18:48:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAw0V-00E0n0-Jx; Wed, 06 Dec 2023 18:48:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAw0V-00Fdvj-A8; Wed, 06 Dec 2023 18:48:23 +0100
Date: Wed, 6 Dec 2023 18:48:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RESEND v10 0/3] Support pwm/tach driver for aspeed ast26xx
Message-ID: <20231206174823.ok6rrufhez33rte5@pengutronix.de>
References: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
 <3ea9ef0c-27c0-4304-8bf7-26710224c3b1@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xahfw2iectdfzaf3"
Content-Disposition: inline
In-Reply-To: <3ea9ef0c-27c0-4304-8bf7-26710224c3b1@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, robh+dt@kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, BMC-SW@aspeedtech.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--xahfw2iectdfzaf3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:02:43AM -0800, Guenter Roeck wrote:
> On 11/7/23 02:50, Billy Tsai wrote:
> > Unlike the old design that the register setting of the TACH should based
> > on the configure of the PWM. In ast26xx, the dependency between pwm and
> > tach controller is eliminated and becomes a separate hardware block. One
> > is used to provide pwm output and another is used to monitor the freque=
ncy
> > of the input. This driver implements them by exposing two kernel
> > subsystems: PWM and HWMON. The PWM subsystem can be utilized alongside
> > existing drivers for controlling elements such as fans (pwm-fan.c),
> > beepers (pwm-beeper.c) and so on. Through the HWMON subsystem, the driv=
er
> > provides sysfs interfaces for fan.
> >=20
> > Changes since v9:
> > Change the type of fan-driving-mode to string
> > Fix some typos and formatting issues.
> >=20
>=20
> What is the resend about ?

And to the original v10 there is a reply by Krzysztof;
see https://lore.kernel.org/linux-pwm/3d9e50db-19f0-43b3-8042-2f80a1e7b79e@=
linaro.org/ .

I'll mark the original and this resend as "changes-requested" in our
patchwork. Probably the most cooperative way to object is to send a v11
and point out the changes compared to v10.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xahfw2iectdfzaf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVws+YACgkQj4D7WH0S
/k6h9gf/WbDCCPB8gEoBy04/59kS+pKvmePtsjuxxGtkiYQdKXw4e8Q7ceGH7jHL
HcjE2lXZJ+PbjcK9zRbglyTKkbJT0cl4pYDYxaSbb3b87GCmImjsNGPb0pkOb3id
e6JgbB8kWpXtpoDWTSrCUYUiTwmwTpcaLEA8/ybJpnbV4G/+ZquEc+hYl/f4LViz
HhuTGL/AAd3aa6F8g6+3u0NCp9fdJwwYBJw3nyg5UWwF/YzauUoNNHpa/u7Wm5qg
3BIwHt2JcOIrs187TPDHTRsTRoCRNyZv1gifyXDZhIsi48EyYKUuXMdr/IHq8Fuy
GX73E7Tr65j6LyKnQ9p2YwEggAzSVQ==
=3LdD
-----END PGP SIGNATURE-----

--xahfw2iectdfzaf3--
