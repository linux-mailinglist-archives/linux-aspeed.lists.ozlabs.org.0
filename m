Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF68A37119B
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 May 2021 08:23:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYXwx6CYFz2yxR
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 May 2021 16:23:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYXwt4QLwz2xb8
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 May 2021 16:23:41 +1000 (AEST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ldRzX-0007IU-4G; Mon, 03 May 2021 08:23:39 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ldRzW-0004dp-9h; Mon, 03 May 2021 08:23:38 +0200
Date: Mon, 3 May 2021 08:23:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 2/2] pwm: Add Aspeed ast2600 PWM support
Message-ID: <20210503062338.meohvoth7cyfppvu@pengutronix.de>
References: <20210414104939.1093-1-billy_tsai@aspeedtech.com>
 <20210414104939.1093-3-billy_tsai@aspeedtech.com>
 <20210426204333.gzqke6td33dtugnh@pengutronix.de>
 <A89B45FD-FD3D-43F2-A850-8A7FBB1AF165@aspeedtech.com>
 <C95A3A13-996E-4F52-BEFE-16BC1E74EB22@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5y5vjbuhxw63o4ix"
Content-Disposition: inline
In-Reply-To: <C95A3A13-996E-4F52-BEFE-16BC1E74EB22@aspeedtech.com>
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


--5y5vjbuhxw63o4ix
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

your second reply is nearly identical to the first. It would be helpful
to only write new stuff in new mail. I think there is only a single new
paragraph that I will reply to here.

On Mon, May 03, 2021 at 05:57:23AM +0000, Billy Tsai wrote:
> On 2021/4/27, 4:44 AM,Uwe Kleine-K=C3=B6nigwrote:
>     > Also please round down in the division to never provide a duty_cycle
>     > bigger than the requested vaule. Also you have to use the actually =
used
>     > period as divider, not state->period.
>=20
> I don=E2=80=99t think that I should use the actually used period as divid=
er.=20
> The state->duty_cycle is relative with state->period, not the actual peri=
od
> if I use the actual period the precision of the duty cycle may lose.

The strategy you should implement in .apply() is: Pick the biggest
period that is not bigger than the requested period. With that period
pick the biggest duty_cycle that is not bigger than the requested
duty_cycle.

As the actual period might be smaller than state->period, dividing by
the latter yields a result that might be too small.

See commit 8035e6c66a5e98f098edf7441667de74affb4e78 (currently in next)
for a similar example.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5y5vjbuhxw63o4ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCPluYACgkQwfwUeK3K
7AmNUQf/RU+MvNyHvcNs7PNM65vJmNt/GqO+QIvkMt2Jt09HQxMESc4nGb/eyxiO
GgV+XttkbD8Y1pxQH9zC2JrqvHyZYBRsQGQ+rUK7zpa2/Svh4QZtXlD1RXC6xUPu
idFpx1NMNVAKqhZcmoVAoA4RibtH6hOeCoup0CHz92MnBI+n6hCffNH6mTYlP9jQ
rHj+NzkQWF2Le0lAfxV/GG52BDl9GyB9vuvgYFoLs8L+sLooYFtxYIT7a6fiXcA/
KqZwcHutRaQTt/HDItgVukV9+nMEbQuNKxix1Jqa7gxbF+2bA4Sqm5JXLhD0J+LD
J+dG3SrAbDKUgrzurGN30sY+rZKrBA==
=/bfj
-----END PGP SIGNATURE-----

--5y5vjbuhxw63o4ix--
