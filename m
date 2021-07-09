Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 108833C1F22
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jul 2021 07:54:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLj5m05lQz3bfx
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Jul 2021 15:54:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLj5f3C4Vz3bW8
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Jul 2021 15:53:57 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m1jSI-0007lA-QR; Fri, 09 Jul 2021 07:53:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m1jSE-0003cR-5b; Fri, 09 Jul 2021 07:53:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m1jSE-0000zp-38; Fri, 09 Jul 2021 07:53:38 +0200
Date: Fri, 9 Jul 2021 07:53:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v8 2/2] pwm: Add Aspeed ast2600 PWM support
Message-ID: <20210709055325.4y4ufjvoiwo2pcvi@pengutronix.de>
References: <20210608064658.14262-1-billy_tsai@aspeedtech.com>
 <20210608064658.14262-3-billy_tsai@aspeedtech.com>
 <20210702143147.6a7psfup4tlidq2x@pengutronix.de>
 <FC122EAB-46A9-4B6F-B75C-271B4E17F057@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qqbiwvrhqx7yu7h3"
Content-Disposition: inline
In-Reply-To: <FC122EAB-46A9-4B6F-B75C-271B4E17F057@aspeedtech.com>
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


--qqbiwvrhqx7yu7h3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Billy,

On Fri, Jul 09, 2021 at 05:40:45AM +0000, Billy Tsai wrote:
> On 2021/7/2, 10:32 PM, "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutronix.=
de> wrote:
>     > The multiplication can be up to:
>=20
>     >	100000000 * (1 << 31) * (31 + 1) * (255 + 1)
>=20
>     > right? This needs 71 bits and so might overflow a u64.
>=20
> No, the multiplication can be up to:
>=20
> Max(div_h) =3D 15
> Max(div_l) =3D 255
> Max(clk_period) =3D 255
> 1000000000 * (1 << 15) * (255 + 1) * (255 + 1) < 2^64 - 1
> it doesn't overflow a u64.

Ah, you're right. Please note this in a comment (not that you were
right, but that it doesn't overflow :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qqbiwvrhqx7yu7h3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDn5FAACgkQwfwUeK3K
7AkCLgf/Wqw5mfuphqGF4+uRZjb+BVpbgi6TY8lgmZQS9hR+16ML35aNawrAo0J/
c/2e0I8SQtbevb552QGX2eSStU0i/jPIWBpXRzYBxYNy4+tYOdpL59GEA5qZJeH7
R83lXsYsQEOGoSufHH3MsHWZfPXNms1rxZAmQ1Zlp6AqRVwVNE+cLdC3ByC9qxxl
Um2TbbOwVHvQfhXgfGLwlC1rmBeDU0I0rrdWNBnw3ifWKCCHuwytg/mJ0c/MXKzo
44gxD+YqV0J1gy9vKLtNWEOFY8RBXV5UjPQLgH2bk5vD9xLOATF11c5wc2e58s6P
aCwg6rvWFB+hrS+UP6aXQlO4CKM5uQ==
=i2jo
-----END PGP SIGNATURE-----

--qqbiwvrhqx7yu7h3--
