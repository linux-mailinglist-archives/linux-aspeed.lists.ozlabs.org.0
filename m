Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC5A52A131
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 14:11:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Zhj4fW0z3c7G
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 22:11:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EyiFZXZh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EyiFZXZh; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2ZhZ4jJWz3bcY
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 22:10:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 831A0611D3;
 Tue, 17 May 2022 12:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A33C34113;
 Tue, 17 May 2022 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652789450;
 bh=nHhA4pOzu1gO66uH8rmEjqJYKMiCKmWA2iGxWxEzAh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EyiFZXZh5Fclcw0wS4f8o+KP7G3ckIgp7jcPSon1mtuibV9m7BrlBTwDkv+km2aSt
 9tHr2WK16Y1cPB+5H57IIMq7tvXs10aXLbZEAiDmPE4GiL1FPQkcPraUjownHlN2ad
 3XuRu/T0La94a1aJNOybBi7hY++FC+t8WzJQAVJCSG3HyvwSMIwzpnhjxPQNHi6YUr
 v/p6YPFq2SHcDdSi1Xq9L5s4W04s1GSQ32eorwaqyJifiFhXp8ce4ZOqcwnV2UZ8o+
 bJVgqW84rfpJg67bEHAOQ3B8CTHbTAdWJbw36LbHgwAePOazYKfmzzdYwn8pONmiWE
 MQE3pDTaeBVuA==
Date: Tue, 17 May 2022 13:10:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC
 driver to spi-mem
Message-ID: <YoOQxJV2xNfkkwQS@sirena.org.uk>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
 <20220517110509.2e6xbwot63yl6a3c@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U/J4X9YllbQQEq3h"
Content-Disposition: inline
In-Reply-To: <20220517110509.2e6xbwot63yl6a3c@ti.com>
X-Cookie: Fats Loves Madelyn.
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org,
 tudor.ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 clg@kaod.org, miquel.raynal@bootlin.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--U/J4X9YllbQQEq3h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 04:35:09PM +0530, Pratyush Yadav wrote:
> On 16/05/22 07:39PM, Mark Brown wrote:
> > On Mon, 9 May 2022 19:56:05 +0200, C=E9dric Le Goater wrote:

> > [08/11] spi: aspeed: Calibrate read timings
> >         commit: eeaec1ea05c0e0f08e04c6844f20cc24a2fcc0f4

> I have repeatedly objected to this patch [0][1][2] and you have=20
> repeatedly decided to not address my objections. I won't spend any more=
=20
> time fighting it. But I will say that you should not expect any=20
> guarantees that SPI NOR or SPI NAND will not break your calibration in=20
> the future if they decide to move the dirmap_create() call around.

You =3D=3D Cedric here.  Sorry, I thought that had been addressed as there
hadn't been anything I'd noticed on the thread for a few versions.  It
does look like there was agreement that there was a problem too :/

--U/J4X9YllbQQEq3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKDkMMACgkQJNaLcl1U
h9AxJgf/RyBtLJoz2CPMw4giFkUWm4H5/IpwJMiB3RCFF9m6e6W5o3GrJzltpG0W
CjYHYKXfSdTnouEbqcVLyvW8MaHISL+CiC0ZIqqp1iNzqs1iE0Ej+oSPQwHA8OcO
DfvyWTyRfmB7+z9YFGRbS+uaGmwwtbJ3t7WtD2o4l28D6Nz1KM2GRaYKAbSrG8UX
hiv41q0rc2uKIMD8wUZJoqvhmGk7Rguo64aYS++ZVxOvE1hwmPq0xqceRYo8nnY8
cGI1QFxoX4kszDYF8ykJ9B5FlsjVpLDvnRxIcTYgh8JdnmUtBlDFphXL825TEkV/
HUGO7UKZIjbQ2mbgXOhFXMSFN520mg==
=Cg54
-----END PGP SIGNATURE-----

--U/J4X9YllbQQEq3h--
