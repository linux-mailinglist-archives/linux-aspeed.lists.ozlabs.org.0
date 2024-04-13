Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349208A3BA9
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Apr 2024 10:34:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGmvC6pYjz3vX3
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Apr 2024 18:34:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGmv55v1bz3cDd
	for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Apr 2024 18:34:23 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvYpf-0002JO-Vo; Sat, 13 Apr 2024 10:33:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvYpd-00C1wL-GC; Sat, 13 Apr 2024 10:33:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvYpd-000fpA-1K;
	Sat, 13 Apr 2024 10:33:53 +0200
Date: Sat, 13 Apr 2024 10:33:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/2] hwmon: (aspeed-g6-pwm-tacho): Prepare for further
 pwm core changes
Message-ID: <f43gbxbyjik76dzlwmjkcvfwdijzotctyngoidh7zb3xgog3ox@krm3avhdolhf>
References: <cover.1710777536.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxg3gmqzxdbzcys4"
Content-Disposition: inline
In-Reply-To: <cover.1710777536.git.u.kleine-koenig@pengutronix.de>
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--kxg3gmqzxdbzcys4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Mar 18, 2024 at 05:09:48PM +0100, Uwe Kleine-K=F6nig wrote:
> there is a pending rework for the pwm framework[1] that requires a
> preparatory change for all pwm drivers. When creating them I wasn't
> aware of the aspeed-g6-pwm-tacho driver, just found this now while doing
> build tests with my series.
>=20
> To not delay application of my series, I'd like to take the two patches
> from this series via my pwm tree.
>=20
> To state the (maybe) obvious: This series depends on the following commit=
s:
>=20
> 	7e1449cd15d1 "hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fa=
n tach"
> 	024913dbf99f pwm: Provide pwmchip_alloc() function and a devm variant of=
 it
> 	4e59267c7a20 pwm: Provide an inline function to get the parent device of=
 a given chip
>=20
> The earliest commit containing all those is:
>=20
> 	15223fdbdf4f "Merge tag 'hwmon-for-v6.9' of git://git.kernel.org/pub/scm=
/linux/kernel/git/groeck/linux-staging"

I applied this series with Guenter's ack to my branch at
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E (Honestly I already did that a while ago, only noticed now that I
didn't explicitly tell about that.)

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kxg3gmqzxdbzcys4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYaQ3AACgkQj4D7WH0S
/k6p1gf/bC+XXzwCLWvjQc2AJM9nGY0a/ogPm9gQDU92NRnSV62zrm3R+3a0I1ID
VFB01y3omfw/G/XnSAoln+OuzfgI9LqUP/e+k1RMH5a/kiSp5elCrb86frHgqcuv
7LhSfgUgPmodytUclM3U7yLO0p8O0w2d9XwThdhEeiT96uCGrdbInaHkaDokp89v
7AriwfntCP5jCny5UPlIT4+TNfAWSHzKUj1y+PZNVLu6bhOsMvuLaHcDlwkLjrQ9
91jIusgrkGas/sdeHtiwucZDdfdbrB8eixUOJNNupYZwOil+Ipyyl8rITkBHMACt
1dL7CG2q5uOVEc7W7ex1aeQrOeofQw==
=Q+r3
-----END PGP SIGNATURE-----

--kxg3gmqzxdbzcys4--
