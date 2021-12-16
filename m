Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB1477EC0
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Dec 2021 22:27:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFQF8666Nz3c72
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Dec 2021 08:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jJhz9YYq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jJhz9YYq; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQF10hjXz2ygC
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Dec 2021 08:27:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17ED9B82642;
 Thu, 16 Dec 2021 21:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11140C36AE7;
 Thu, 16 Dec 2021 21:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639690046;
 bh=roRCn3qaIgAz+qMRsuMNOiqFNGEvXnVYLSokoxQ0AAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJhz9YYqm0zDPPFME9I93sEDkAD8vpQv7PoWy1g+t09T1vQ8NOoqjvDqqFtadwD5A
 WyRAckaINmtpFtDm1Ul7vR+nZAwDSHAFUPSkBu3AIHLtY4jiQNoG3HHL+Q1W7Dbc4m
 rwfw9QFCzm1/UOvynaCebw+f2P9pUHesiF6vmGtbo7vX6DjGQNVBzbuPLsPTW3wgWL
 FYA731+jBimLdWQ5abV8DgFhzW5PGCttyCmjSUroYljuLgiQS2wNY6JPDhypVWz0px
 LEtCmTdPP0YaFGrKmD/vY9xWPlFbAAsMi60fVztNe87sgswVANfhlmEI7BvZRXWk6E
 wyTDIwr8VnlJQ==
Date: Thu, 16 Dec 2021 22:27:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Remove unused includes
Message-ID: <YbuvOyAfPyhHqBnJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
References: <20211207141722.440213-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X+pgzo/Zrp64cXoc"
Content-Disposition: inline
In-Reply-To: <20211207141722.440213-1-thierry.reding@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--X+pgzo/Zrp64cXoc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 03:17:22PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> No symbols from the linux/irqchip/chained_irq.h and linux/irqdomain.h
> headers are used in the driver, so they can be removed.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--X+pgzo/Zrp64cXoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rzsACgkQFA3kzBSg
KbYwJg//ZjFswbFex8btrmcpOWfau6EiGUnfnrvp4edbVB8Gk2HmWuaNmzRqao+3
B5XvKJVjHek/xmw0MNpXP4PyznPSNY+rvo8uVp0JTjw8fhkfZiOs+bLlZoIuPvZh
lEKNFiyeVAsMDoEyrIDXBjQMz4xbqufnA//3V97OI47wmM2b+ewjlc+7TEFybtze
Y5IQH+gfeGuVOMLH5Akv9Ith1U8/O9WUwskrmMQO+jJFrsgYOYTypikp1J87PIGE
cmuq/T/3EvF1JmnknqbuXUxeTnkW/2f7zyIu+50kxpEiyqE532mp2DhVMMnkcwY8
xt7HNt8pUdq5nliJknwRbhyamjb2X7a+wJkuX/seHWYcdbyr2mbbUWGrhIiXezqJ
YViVbahg70r5OLhWqnBs274hCVmwWbeoWJAYkyqkFoZlb4EHUmrOmC0eEfU9p0Ev
EsCdaZ5Uug04AQqmRUEdaK1urGlmb3zeKFpTIlquRgzfg/rd/Sk5sRSEGAf3dG9d
MOpo6h9fVA8wm7meL0e7i5gIR3UD6iyXNKQ3+EGO2MsemCx6ir+EUcDgoqHfXxDT
CGODIPmpZFEnf0IuMjZFJT+EwQIS7IVFIuEx/cNj+gH4ek/StWyr47CAedJy9KJS
g9iIxQxy3qz2xtC9o+8ouS8n7XdWLauiFD4v8qfMyVLVcafcwb8=
=Vzk6
-----END PGP SIGNATURE-----

--X+pgzo/Zrp64cXoc--
