Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 835233823F1
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 May 2021 08:06:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk7tm3w3Pz2ymb
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 May 2021 16:06:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk7tf6D2Nz2xZg
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 May 2021 16:06:33 +1000 (AEST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1liWOV-0003CW-Qv; Mon, 17 May 2021 08:06:23 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1liWOS-0007UL-CQ; Mon, 17 May 2021 08:06:20 +0200
Date: Mon, 17 May 2021 08:06:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v5 2/2] pwm: Add Aspeed ast2600 PWM support
Message-ID: <20210517060615.3hyifoebyrddsrta@pengutronix.de>
References: <20210514024845.10531-1-billy_tsai@aspeedtech.com>
 <20210514024845.10531-3-billy_tsai@aspeedtech.com>
 <20210515151827.amiqh6j6brv44jif@pengutronix.de>
 <7A439233-C5FF-4BCA-8A5C-945EB847F487@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jitc6yys25vbjviz"
Content-Disposition: inline
In-Reply-To: <7A439233-C5FF-4BCA-8A5C-945EB847F487@aspeedtech.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 BMC-SW <BMC-SW@aspeedtech.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--jitc6yys25vbjviz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Billy,

On Mon, May 17, 2021 at 02:53:44AM +0000, Billy Tsai wrote:
> =EF=BB=BFOn 2021/5/15, 11:57 PM,Uwe Kleine-K=C3=B6nigwrote:
>=20
> 	>	> +	div_h =3D DIV_ROUND_DOWN_ULL(div_h,
> 	>	> +				   (FIELD_MAX(PWM_ASPEED_CTRL_CLK_DIV_L) + 1));
> 	>	> +	div_h =3D DIV_ROUND_DOWN_ULL(div_h, NSEC_PER_SEC);
>=20
> 	> As a division is an expensive operation you can better first multiply
> 	> NSEC_PER_SEC and FIELD_MAX(PWM_ASPEED_CTRL_CLK_DIV_L) + 1 and divide by
> 	> the result.
>=20
> When I multiply NSEC_PER_SEC and FIELD_MAX(PWM_ASPEED_CTRL_CLK_DIV_L) + 1=
 the result will overflow
> for 32-bits and the divisor type of do_div is 32-bits so I need to do div=
 twice to avoid the issue.
> Can you give me some suggests?

Hmm, you're right. There doesn't seem to be a div64_64, I thought there
was one. Anyhow, while looking at the various divide functions I saw
that dividing by a constant shouldn't be that expensive, so I think the
sane way is to keep the two divisions and add a comment describing the
problem.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jitc6yys25vbjviz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCiB9UACgkQwfwUeK3K
7AkFCggAhYDJgJhK9vMuvxKsmyBpdGvk7Cxj1jfumQXEFfVFWnhAqzh6sTS0AaOO
1gCpneq8ySB1xnuFkOcwZtpc8i2n2Lc6jy6N+OVpWKHFepLkcmg3G3zXcFTTaxiG
mEYL7jm4TNEDGTmIG/6h2hLk/QVvB/PGTfUJLhaoINZctO0jWGZkTKy0iUxWOq5u
Zklk3UmeDm8TVp+/y5xQl4gz3LaY4PKugHY1CHSVt7aZR1eaVYEYyZDjEWCsI7Ri
PRx3BBp92Zt35aq9eQ6izuT6Bxaq+Mh2ole8uaiC1aeyVCN8xi5eZTFs4RuGDwSL
s9Xfz8SqBeNWtheP8Ft0bBVQPuj/Lg==
=kyG1
-----END PGP SIGNATURE-----

--jitc6yys25vbjviz--
