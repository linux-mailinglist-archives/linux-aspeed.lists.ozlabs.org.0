Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71B4EABA6
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 12:50:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSRDD0QSrz2xxn
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 21:50:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j3aeKPgO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j3aeKPgO; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSRD53n0hz2xf9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 21:50:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D4A7B81658;
 Tue, 29 Mar 2022 10:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD4AC340ED;
 Tue, 29 Mar 2022 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648551007;
 bh=7ZLP9DUzWPlUi8XNl+MiJfBY6TO+lDRFlb4OqkVbP+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3aeKPgOMMv9OvqAvV0Tx3Svpt82Xxq7kEcPvCZSQvN1s7c/lQicWX0ulWamF8MDn
 hGmkAdAvKgtMpMFH5K6USnmsvd2tV7Kd/aMSHZd+88jYs34/0qCvzIfLOVg5U/EcSI
 BJHwezlJaJlV4mTAUrbwXsp40opfssrcKg+62P0EgDvTOnwbbXUDHA6LA7I6/4KPwY
 tR0O7OQMMSRJ5m5woe+SN0OC5DVAde2jx1fVbHje9R41yQFuQl7u9INjsOIngIljr2
 tEuklk0aJAio8HtBAGJ+K75SZbLllUV7sw8IrUU+A/Ypvz8Vmfws1Z0k0BqM8+0+8i
 sR/3Ps4ukJ5fQ==
Date: Tue, 29 Mar 2022 11:49:59 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 03/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
Message-ID: <YkLkV2mvHJ/EyVMn@sirena.org.uk>
References: <db2f4ec0-dffb-805b-ec5a-24bf724e8ab5@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1574B9/rboLu0+nG"
Content-Disposition: inline
In-Reply-To: <db2f4ec0-dffb-805b-ec5a-24bf724e8ab5@kaod.org>
X-Cookie: Available while quantities last.
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--1574B9/rboLu0+nG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 10:56:49AM +0200, C=E9dric Le Goater wrote:

> This patchset was sent a bit early and commit 7f852ec58af6 ("mtd: aspeed-=
smc:
> improve probe resilience") was applied after which conflicts with the rem=
oval
> of the aspeed-smc.c file.

> Would you prefer a rebase and resend ? on -rc2 when the tree is stabilize=
d ?

A rebase on -rc1 (assuming the change makes it in there) would be good.

--1574B9/rboLu0+nG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJC5FcACgkQJNaLcl1U
h9Brfwf/YGBbo7xm4jOlh2sAz+nAtFT+tL8ytILbSbuzuigt3u7EYOz51lPBDNM4
fy5qaOoAnw1rZHWxKoqrBRO1thIoQ444umt+kmR6QJXMNBhWFXrTiD6qbGPJY7KX
4eQi0MsHi4WLsXPdI91sHJuuWhgpvFe1adUqPKffqwTyMwCE+eTq7WB1pcbETEyP
OOj2HsPanXwIwW2hHf6IoohKlWRzb/zMCFxX/xxYYGMyHM0iW3Cy4O39xId4v47I
IKoe57VdcZwxv8kZs2Eivxz4JhXgwxBv9rVmECYMWnIPSDd39eVhRpPXnf4dIWRL
qqD5BVycLj+WHh0Cfwo8129wxzde/g==
=zub3
-----END PGP SIGNATURE-----

--1574B9/rboLu0+nG--
