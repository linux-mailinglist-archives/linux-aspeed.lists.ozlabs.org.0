Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42411830948
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 16:12:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MUADrWpV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFTrc6Qxvz3cQs
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 Jan 2024 02:12:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MUADrWpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFTrS17Wwz3c3H
	for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Jan 2024 02:12:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E99B4616AE;
	Wed, 17 Jan 2024 15:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EFAC43394;
	Wed, 17 Jan 2024 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705504339;
	bh=A34tDGOyjAsdjOUsmbUUAZArIqY5t5xrNGVo1R3xsl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUADrWpVR/Uh/G90UDB9uyE8Sv2+CswU6qdMlBPrM1g6LCEUVO2ry3Jo6StjLjmE/
	 QDJnRRprGq5yIHIr7/4y/OerT4PVr/pslwuAosBTeVAOV32QMFVgT/33jAAL9NpisL
	 HAQuNRHCqi4aVTqljfjfDK64KIk654MSDzyZDOJ2Sn0VI9vRevvUfmJc6S7bQIBd22
	 pc3cqWNfMxGXdbZC42cWNiZq5rVWvyY4989o11tH+H76p6R8GmypkAZKzMuccV1xWj
	 DeZmCbnE0CSNAYx+cIvY5jZ7qRuepoCGKe7jevKi0wmKgrtMkX8ihL8De1MC5vE4gx
	 L9L1wzOKO4Udw==
Date: Wed, 17 Jan 2024 15:12:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Message-ID: <20240117-endurance-caliber-e3424450d291@spud>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aLyhfwRZwwPVc64g"
Content-Disposition: inline
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Nicolas Pitre <npitre@baylibre.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Conor Culhane <conor.culhane@silvaco.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--aLyhfwRZwwPVc64g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 08:56:16AM +0100, Krzysztof Kozlowski wrote:
> Drop the requirement of "-master" suffix in node names because:
> 1. "Master" word is discouraged and MIPI Alliance renamed it to
>    "Controller".
> 2. Some devices can operate in Controller (Master) or Target mode, thus
>    the name is not accurate in such cases.
> 3. Other buses, like I2C controllers, use simple "i2c".
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--aLyhfwRZwwPVc64g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZafuTAAKCRB4tDGHoIJi
0qOUAQCiE1lrShOfXW5DHVs22SCv9n0E+X01iWyVhRYwByKe7wD/WsaG8wOfwFiK
a4TeDt3owTN4VnKqNpdfHPpPnU9H+g4=
=PuQ9
-----END PGP SIGNATURE-----

--aLyhfwRZwwPVc64g--
