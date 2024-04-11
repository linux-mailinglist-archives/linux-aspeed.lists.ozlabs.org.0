Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B608A0971
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 09:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFWCV5Ljnz3vYG
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 17:14:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFWCN2P6Tz3cPm
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 17:14:06 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruocv-0002Va-NK; Thu, 11 Apr 2024 09:13:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruoct-00Bdrl-0X; Thu, 11 Apr 2024 09:13:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruocs-000PTq-2z;
	Thu, 11 Apr 2024 09:13:38 +0200
Date: Thu, 11 Apr 2024 09:13:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/4] fsi: Convert to platform remove callback returning
 void
Message-ID: <pd2qn2zqhdd4hv2vn6g3p6kzcer343f6xm75tcj2xi5qgk7h5l@uv6uaa7zj7mu>
References: <cover.1709673414.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k3uavas23ei5dxix"
Content-Disposition: inline
In-Reply-To: <cover.1709673414.git.u.kleine-koenig@pengutronix.de>
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
Cc: linux-aspeed@lists.ozlabs.org, Alistar Popple <alistair@popple.id.au>, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--k3uavas23ei5dxix
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Mar 05, 2024 at 10:20:56PM +0100, Uwe Kleine-K=F6nig wrote:
> this series converts all drivers below drivers/fsi to struct
> platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> Provide a remove callback that returns no value") for an extended
> explanation and the eventual goal.
>=20
> All conversations are trivial, because their .remove() callbacks
> returned zero unconditionally.
>=20
> There are no interdependencies between these patches, so they could be
> picked up individually. But I'd hope that they get picked up all
> together.

I didn't get any feedback on this patch set. As the conversion of
platform_driver::remove depends on these, it would be great if they made
it in during the next merge window.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k3uavas23ei5dxix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYXjaEACgkQj4D7WH0S
/k4Olgf6AugGh7hWhtph1m3Lva9/eL2Uc7SdNI9OJhxtAX8zcHjXQieGP5mCzuR/
L8scQcEQazmDtrrEk5qbHXO+fX63Q5ZbhgXY4x4FNSMWPNhPOC8b6PFWKORLOBEV
iepisic5yKK/pwN8Bx+wXiBPirL6hgIjgXnxM84eUKNCfLWXdBIC6FNKJoWJvE0T
mUPV9EKtPGCSJ8f0Tqcll9CiMMCkMCrHRCKGYg+IoEM0x9OVwlUCar2Ni4ymKlhv
hUK0YSo7lApTGYfS/o5Qhjn4PoZEKhqM+OfgmubyKlIk8oPZK1aIm6tuhnmobfv+
L5RYmIcCCflQN/2cNw6VTRfFfyukWw==
=jyQo
-----END PGP SIGNATURE-----

--k3uavas23ei5dxix--
