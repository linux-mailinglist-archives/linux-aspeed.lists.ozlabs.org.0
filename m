Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1635C6CB
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Apr 2021 14:55:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJpd63pCwz30FX
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Apr 2021 22:55:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJpd36s26z30Bh
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Apr 2021 22:55:51 +1000 (AEST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lVw6S-0000K5-Ld; Mon, 12 Apr 2021 14:55:44 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lVw6R-0002Vu-MH; Mon, 12 Apr 2021 14:55:43 +0200
Date: Mon, 12 Apr 2021 14:55:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add bindings for aspeed pwm-tach.
Message-ID: <20210412125543.xhnitijeumddqdmn@pengutronix.de>
References: <20210412095457.15095-1-billy_tsai@aspeedtech.com>
 <20210412095457.15095-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="72zyimz3jwqrdzfk"
Content-Disposition: inline
In-Reply-To: <20210412095457.15095-2-billy_tsai@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, billy_tasi@aspeedtech.com, p.zabel@pengutronix.de,
 BMC-SW@aspeedtech.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--72zyimz3jwqrdzfk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Apr 12, 2021 at 05:54:54PM +0800, Billy Tsai wrote:
> +  - Billy Tsai <billy_tasi@aspeedtech.com>

I object because the MTA at aspeedtech.com doesn't know this email
address.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--72zyimz3jwqrdzfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmB0Q0wACgkQwfwUeK3K
7AlClggAkJzxzLk6CyBb65jTrLt6GHUVsNktatzSSRR+W6qXEyPzt1Snay/1HEex
EDQicnfgTL16yXBjHLHwWEqg7ek82wnO3I8weSNFcM9xs3J49dcGUnMII6gBCDFK
/UAD5sugnnHfDaaWDvj/OGT9uGQlPBtaA1LJBb6EGb4qeaSINwc77ySfzIqZyMeQ
R+I6nNRvID/fJYg6cbpe4AUgr+jBnZ9YFxkkMdKjl3Wz0Zy2p0nIoqBFl3H8/NFs
Xwk3HkIWwZ/M0YbVcBcHj4YVKC+TW47Pno+QGfmbTTxwBaTABKPkD2uTQOtg5Z5U
0KRgU0CZnI/F2/IhLd0Qiz+V57VnMg==
=x1yQ
-----END PGP SIGNATURE-----

--72zyimz3jwqrdzfk--
