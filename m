Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D308066E8BC
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Jan 2023 22:49:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxMwj5N9Pz3cMr
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 08:49:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxMwZ6PcTz2yg5
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 08:49:00 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pHtog-0004mh-3v; Tue, 17 Jan 2023 22:48:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pHtoa-006lhq-DJ; Tue, 17 Jan 2023 22:48:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pHtoZ-00DhVz-MN; Tue, 17 Jan 2023 22:48:19 +0100
Date: Tue, 17 Jan 2023 22:48:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v4 0/5] Support pwm/tach driver for aspeed ast26xx
Message-ID: <20230117214806.ptnnhgxmlvyzjdzp@pengutronix.de>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5jqbiyht4hvalnt"
Content-Disposition: inline
In-Reply-To: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--y5jqbiyht4hvalnt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Billy,

I wonder if you address the feedback you got for this series. I think
there are no big issues left, are there?

There is only one patch left open in the PWM patchwork (i.e. the patch
implementing the driver that already has my Reviewed-by tag). I'll
discard that one, too, as "changes requested" and hope you will send a
v5.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--y5jqbiyht4hvalnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPHF5MACgkQwfwUeK3K
7Am6Rgf/dyL2yHQajtxCDMIEYXoOPD0fs1U+AFUQZWILgnBky3GTsjqPb+iRF0Zr
w+4QERyKzgxAyfJE3EptEtnxjBOPWZ1JKx1tBpJDsEBem7ew5QmjSZ9vX28jfcaa
NR8HzbJdZKOdM/Brmd3jCKGNj63CYH8rD0CW4mUf07oVvw55j6g1ZULwVvHnOGse
DG9GpBgzzhaIPYapwlkhIdfeESU84fWfQLlOxdcNxR4/8OXDCO2lUbzXULBVbjUe
lzBlQzwJk2bQegMSAIXRIACskEMbmoMY6RBKJCJUEniyIcPyJ8//YGW1pHq8fnRO
xriqAmZs2kKuyqloDKo4g/GVvGVikQ==
=FqEI
-----END PGP SIGNATURE-----

--y5jqbiyht4hvalnt--
