Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECDE8243D0
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 15:29:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Tqh6216P;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MS+FNCu9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5TVZ6F9fz3cDT
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 01:29:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Tqh6216P;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MS+FNCu9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5TVM4Md1z30YS
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 01:28:58 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 89CAC5C00D2;
	Thu,  4 Jan 2024 09:28:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 04 Jan 2024 09:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1704378533; x=1704464933; bh=DipVrQhrjW
	IAtEKqD45J/bUSQRWUjrpsRHzMOm1b6FI=; b=Tqh6216PYWjOZGszyXs+YuYur2
	GEnYGy75X1hPI/EWurqYWL+a6bKnXfXsJ4swCPD0BHYaBOPMmF82EaA4sqEi37Vv
	hp9X5UgPoxTLQuuzGhdzysVSjBt4v3paMmeISV/HCGKHfHzyH8KWRwM9iTMMY7XH
	jZsjE7NtHYlP+zhgc9CWhdxpeQ+Ku9OK4qF4OU56EFMB514lo+066Ar0hmrxWZ/g
	HL4qohmXRtmDZeG2WSAbeRYQ4Obx+4wvuMSOTXi+JR97lOjVcPfV1weZ0uccxpfg
	X0o9lrXWWTw2E+9rIF9RoH4YiWC84Wh/FOBNeuM0ZRDPV8du8DwcWHfJgnoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704378533; x=1704464933; bh=DipVrQhrjWIAtEKqD45J/bUSQRWU
	jrpsRHzMOm1b6FI=; b=MS+FNCu9SK0W/U8W8PKFHqpkVXomqqsE3pPNMWJUvg29
	8al0XTXEAEub3Zev7V7RZq6SmGJcPuaASjz9EoYSk8YFbsQp1rbFVd+6SXSXHo64
	HNh1A/QjG/9GZ01TcgT1/lp+qOOBUXRH8G53h/oQIon4TM80ltnY9a8hXE6oa1lR
	pkWD8e8CeSa3XK/FNv6EQJVooBN6V1QabY14ut8qk4dkl1ugWSJaXzvSZCnroW2D
	iJs2pjnUHNcKJ7gQSgVWxuwxDXXldT2qxxVGfmlzkcB9NnCp6uDhyrMUAZhqnuFU
	izAyqQmp8d6SIdEb/LG81t61Lod57s8tNZCrbZdd8A==
X-ME-Sender: <xms:pcCWZdwXqpE4ri9YrKfxZoz2T2__PRqECdraozDhBGdzLPhh6mOLYQ>
    <xme:pcCWZdTsoeXQlbV5UuxVdlunf9J03KtVTrbwc6Rzavf-VM0hwfvuesWW60gr8YJCf
    uOLCpxE70sJ0dg1Ads>
X-ME-Received: <xmr:pcCWZXWmiGNwvvglMD5TlFMlziCKMdDOurwL0ePq0Nt7VsivmJAQhzjnsVvVeSBI1q1I0kGE_Kdw9QcrUExqdSMtdXgG8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejgfdtleelvdeftdeggefffeeu
    feevgeejkeelgeeujeevveeufeeigfeivdejjeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:pcCWZfhpe1Wr7ZEAJBUXIlfTV3k0gPVZgLHbvwE0q9KMcu9rn6MCBw>
    <xmx:pcCWZfCypEM4Y-vmgaap2mwZeEQVNgoMgbs4ybeeX7E4PTzQPu3blQ>
    <xmx:pcCWZYJsClyvl2Kz3e8m0weXZ7LzS_EQiVcJsgKdbOsEF1Qo6dynEQ>
    <xmx:pcCWZT0WstvisP_jeKJGZnVDWd--zUPJ_sF49fc4qfogK3E4PiVB4Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 09:28:52 -0500 (EST)
Date: Thu, 4 Jan 2024 08:28:51 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v2 0/6] Revise Meta(Facebook) Harma BMC(AST2600)
Message-ID: <ZZbAoxDm39qeBtCy@heinlein.vulture-banana.ts.net>
References: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+82ChjIsQHnggrIX"
Content-Disposition: inline
In-Reply-To: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--+82ChjIsQHnggrIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 09:45:26PM +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
>=20
> Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmLvP=
8Qbepm1AVjuCbaKw@mail.gmail.com/
>=20
> Change log:
>=20
> v1 -> v2
>   - Add infineon,slb9670 information for tpm.
>   - Patch 0006 - Add PDB temperature.
>=20
> v1
>   - Patch 0001 - Revise SGPIO line name.
>   - Patch 0002 - Mapping ttyS2 to UART4.
>   - Patch 0003 - Remove Vuart.
>   - Patch 0004 - Add cpu power good line name.
>   - Patch 0005 - Add spi-gpio.
>=20
> Peter Yin (6):
>   ARM: dts: aspeed: Harma: Revise SGPIO line name.
>   ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
>   ARM: dts: aspeed: Harma: Remove Vuart
>   ARM: dts: aspeed: Harma: Add cpu power good line name
>   ARM: dts: aspeed: Harma: Add spi-gpio
>   ARM: dts: aspeed: Harma: Add PDB temperature
>=20
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 +++++++++++++++----
>  1 file changed, 30 insertions(+), 8 deletions(-)
>=20
> --=20
> 2.25.1
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--+82ChjIsQHnggrIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWWwKEACgkQqwNHzC0A
wRmpqA/7BL+RG9Bd7wpYt0zewQCiZlzcRSnSo5oTw4W9jyLABk27jgQ/Pp2UyHpk
pWU6GAcVtsKhJgvvocEHneMhaV5mrTMeKAXtVcva18CbmfrF2rDPj4FX0kPKCGD9
iWNLMCDZib8vRoRv9C2YxoR1jd3t+JFFG7CrUP4ORT5iqq0TzCXRoEm+y+PqFc2U
rbOdXgwgmp1vx5yAJAu7KFZOGn63U8sMX2y5u2xcnuNmW25iYZmQVL/cH50L7zld
XkrCELp7lmlLbd9/+4eKzFbfCkVgWMPblIYBBBo8DP9OoFZCi7Keh1ZFqATzjnI9
7g03Y49uZZsvFrxbe+sNIWw1eFnZp/HG1ePrDNqEFj3KxDNyN9QJNOQqLCKOIBbi
6XmG19UJ3pV+px9Zzt7KtvrxaA4pLah3yTZvMmrqyEAZ1P9m9QDeV1iRvJKwIR0U
9wO5MbB1vS0S3KdrIgmgenT2SFQorkDVfZzvTsU9eQrDsiFQej4fWGI5fdSGqlSc
wdEQqriKFuqvLfZI1oyDymn4DcPCwU32ySh9vjpfibxnBAkh/i1ZbRwN1knrTrZ2
omgOkkJwjOov4chib1B/KWGSOzREhdwLwmDv7vIEtXyTkVeiZgsEx2Jy1Ge9GzrN
QuFp3ujJ7Zf4w9lwDfu1CI6zKs7rpmChAgRfGmFH4zNsuXt3Cds=
=tNZc
-----END PGP SIGNATURE-----

--+82ChjIsQHnggrIX--
