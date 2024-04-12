Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C78A27CE
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 09:16:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG7CB3Hz4z3vbY
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 17:16:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG7C02rgXz3f0P
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 17:15:54 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvB8S-00060T-7W; Fri, 12 Apr 2024 09:15:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvB8P-00BpmQ-Q9; Fri, 12 Apr 2024 09:15:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvB8P-0011vR-2J;
	Fri, 12 Apr 2024 09:15:41 +0200
Date: Fri, 12 Apr 2024 09:15:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tacho): Drop cpp define only used
 once
Message-ID: <i37iuube65656euro5kuxgmfae6hdtlp5a6jsowwfalnmzckkv@bnre5uu6s75r>
References: <20240411160136.247138-2-u.kleine-koenig@pengutronix.de>
 <0787f458-c4ff-4498-820e-15e19796cbe6@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2t6a3mkchjp3ggeu"
Content-Disposition: inline
In-Reply-To: <0787f458-c4ff-4498-820e-15e19796cbe6@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--2t6a3mkchjp3ggeu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 11:15:05AM -0700, Guenter Roeck wrote:
> On Thu, Apr 11, 2024 at 06:01:36PM +0200, Uwe Kleine-K=F6nig wrote:
> > The macro PWM_ASPEED_NR_PWMS is only used once, just use it's value in
> > this single code line.
>=20
> I am not part of the thou-shalt-not-use-defines-if-only-used-once
> crowd, so I won't take this patch, sorry.

My patch wasn't about religion. It's more that I was annoyed that

	git grep pwmchip_alloc next/master drivers/hwmon

doesn't give me the number of PWM channels. That PWM_ASPEED_NR_PWMS is
only used once then only the detail that makes it easy to actually
change that.

So in my eyes there is no advantage in this define and the only effect
is that it hides information.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2t6a3mkchjp3ggeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYY35wACgkQj4D7WH0S
/k5gnwf/XcPjM9NeMEQD7/TRhaUUnDPMkSQ0octrNyPNLrv/Dxdn6l7zDRl7BvmN
eg5ErrXUjBSKG9d/ExxVrMFUH5U3sN8DDtblg7DTogqmjsjJP88QcQXjoLbB6Bvn
/AW+fabi7DAmcEHK3fdbaxdJqNTRGleP/KQNM84svAIymHKcd3rO/Zru7TfQzD2l
P1tciPXMdLV3tA59zw3WlFsflObr91c4gMSbWbp/x9D5skkIEMcr4xBIT/bIc1Q0
MUCZrq0258DNtce24nl4X/3lgMw1krBD2+0/b5ht3En1XFa7eR1c0gkPZCx/ZljO
liXbSjCRfG+BkI27aKiYrlEKlpIQ+g==
=DzfO
-----END PGP SIGNATURE-----

--2t6a3mkchjp3ggeu--
