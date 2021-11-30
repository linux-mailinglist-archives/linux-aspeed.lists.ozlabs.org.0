Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623E462D38
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 07:59:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3Ckl3j8jz2ywV
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 17:59:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3Ckg0hgjz2yPT
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 17:59:21 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mrx6X-00082P-G4; Tue, 30 Nov 2021 07:59:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mrx6L-001sGA-Hp; Tue, 30 Nov 2021 07:58:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mrx6K-0002RV-MZ; Tue, 30 Nov 2021 07:58:52 +0100
Date: Tue, 30 Nov 2021 07:58:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v14 2/2] pwm: Add Aspeed ast2600 PWM support
Message-ID: <20211130065852.2o3zez5kdymu2meo@pengutronix.de>
References: <20211130055933.32708-1-billy_tsai@aspeedtech.com>
 <20211130055933.32708-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v25c5nweijfvjqpi"
Content-Disposition: inline
In-Reply-To: <20211130055933.32708-3-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-aspeed@lists.ozlabs.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 p.zabel@pengutronix.de, BMC-SW@aspeedtech.com, lee.jones@linaro.org,
 linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--v25c5nweijfvjqpi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Billy,

On Tue, Nov 30, 2021 at 01:59:33PM +0800, Billy Tsai wrote:
> This patch add the support of PWM controller which can be found at aspeed
> ast2600 soc. The pwm supoorts up to 16 channels and it's part function
> of multi-function device "pwm-tach controller".
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--v25c5nweijfvjqpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGly6kACgkQwfwUeK3K
7AkBAQgAmFiWgiLI1T/jQZ62iVsXCI31JeT0xUXbuppZucPF2DaAoNtJKeDRkOpK
UCDVHW8+ASm0SND1eOdoRjAXJ7HC2mzBSKG2xMnPh2sl1tB44t6iiILDZVg92FYt
qbGoxZAPG1InfS3YyIQScz6IJ2NOXvWIRmkTVDNfdOehEPrlS18bR3G5IF/jkPt3
Icidmy5/nmOD3fA5GxBWYG7AGe6M0QBClkZlWv6FPMJ/U2IaGqe21B2UiIGqmtu2
cH2hjyY7jPEzY9PbzLPKAzqILSGJVfcfi+9UIHYITAu0RqSo6cvCueQtD0qmgBt5
6OFu2EEYpsIBlVlxpGNwcDd5UEUxCg==
=r4Sz
-----END PGP SIGNATURE-----

--v25c5nweijfvjqpi--
