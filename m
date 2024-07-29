Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F459400F2
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 00:12:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=FU7ooVkD;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EDM/bfA4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXszs2lfKz3cl9
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 08:12:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=FU7ooVkD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EDM/bfA4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.155; helo=fhigh4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXszn13hYz3c58
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2024 08:12:37 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 359AE1140181;
	Mon, 29 Jul 2024 18:12:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 29 Jul 2024 18:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1722291154; x=1722377554; bh=E5F+gREmpO
	3rfAm2W13DEU5cr4oXc+JQE+AADW55Xew=; b=FU7ooVkDhnAAHk6+aQ+UnODqVc
	MQOZoDdWuvEjFP6FJSXRWerLYqXJXdMPaIQ2+04mvq4igEYqvdNNsBuM0EIih0GW
	bGhwIbKq+5513ES6b9C7cMiCMwcSBsXoZwhyLFcpjiW2gJeMGu0HS7URqSfMYj+o
	Qt2LShPUEIm3VHgpnGZKoZzfQniAU3R/SnqZu2BlacM9jztXaFGXrz2FLfphZwmX
	li3EmkF1dw87dQsOUIuRYcoxXzdrc5pYVDaDvcdfb3ZEE04iboOLGSQC5YDhDPMg
	/LKz1eTpV4IfGeKVz2d8km93W4vwZeyJTiRRBK70t7/DeGJ4LZBi9h7VnRFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722291154; x=1722377554; bh=E5F+gREmpO3rfAm2W13DEU5cr4oX
	c+JQE+AADW55Xew=; b=EDM/bfA4CH1FxweSeLWSi4smUOOBfdklY9YFCIISfMNa
	bNSPhdeR0WosLuUS7TsejXditj/EtBnOjrwZ3y/y8aF7m0j8KjIeTILb/ANioy2S
	kU/DijvcX0J2CXuGrE1BeEZgutZXbt9BJ1RHXNGmwiCgLUc54SkVts1w8Nk7aFch
	paRAB1b+ycFysfV5DtVvxoMw/i0DI8j7pl0Vnh9UKERcjyLboFqiFOrfDI8gawS2
	ABeJdo0v/yIOX/lofG4lhYf/V72aENIv9fda1MAxF+dYM1X4C6H4xENItXEKN4Wl
	ouxVrNg35KXMJdPssTOcS5fxxthGtg3L3S0DVbzTNg==
X-ME-Sender: <xms:0hOoZv7MFQsUALLTs8FueGpmN7qA7s2_D7wgyXBKmS-_DxL4vpVHfA>
    <xme:0hOoZk6YktRzeq9fi3ZZi5wMyuGRUQn9hvP64dfolLxPKzpzMf8SthC4V0p0scob1
    DQiu7HZ4XRgbi3td_Y>
X-ME-Received: <xmr:0hOoZmdFiTpDfXV4veBqqo32hlP9MatAKFjCII3ZxKZxoZ4602ufxgRD-_gsWJS_LuAmAiCrhuTRGtI7dvf3zAZVwz-MAKG88Xk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeefgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddujedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjefgtdelledvfedtgeegffefueef
    veegjeekleegueejveevueefiefgiedvjeejnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:0hOoZgKDpNLRH1A_r4gMtk3908yiF647j9hYTzyhxVE0O6UXnZrTcg>
    <xmx:0hOoZjJY2zvJ2rBgwTVfMzmNFG50kKNtr8THiTaj5fl0fXNeXYFeow>
    <xmx:0hOoZpwVoLh78DRBtTe4MHzZve3OpfBEwMxQyOqSJDYbKyRd-rhc9A>
    <xmx:0hOoZvLsABapgAvRmTh5j6HRDbLwq5op42zngMcm-8ygXIA2xtU-nw>
    <xmx:0hOoZgBbcDCJASf9TI8G8XK0JtJO9-XjdPZ1DMcuGIcL_ppGrDDioSp4>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jul 2024 18:12:33 -0400 (EDT)
Date: Mon, 29 Jul 2024 17:12:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v11 20/27] ARM: dts: aspeed: yosemite4: support medusa
 board adc sensors
Message-ID: <ZqgTz9DVPcqtTfUC@heinlein.vulture-banana.ts.net>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
 <20240723092310.3565410-21-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eSsDpaX8ks55v2Tl"
Content-Disposition: inline
In-Reply-To: <20240723092310.3565410-21-Delphine_CC_Chiu@wiwynn.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--eSsDpaX8ks55v2Tl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 05:23:01PM +0800, Delphine CC Chiu wrote:
> Add ina233/ina28 support for medusa board adc sensors
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 98eeee49b082..49500db53a13 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -915,6 +915,19 @@ power-sensor@40 {
>  		reg =3D <0x40>;
>  	};
> =20
> +	power-sensor@41 {
> +			compatible =3D "ti,ina233";
> +			resistor-calibration =3D /bits/ 16 <0x0a00>;
> +			current-lsb=3D /bits/ 16 <0x0001>;
> +			reg =3D <0x41>;
> +	};

This depends on this unmerged patchset, right?

https://lore.kernel.org/lkml/4a1cb223-448c-3e93-eb38-d86f543659e3@roeck-us.=
net/

Please resolve the issues Guenter raised.

> +
> +	power-sensor@44 {
> +			compatible =3D "ti,ina238";
> +			shunt-resistor =3D <1000>;
> +			reg =3D <0x44>;
> +	};
> +
>  	temperature-sensor@48 {
>  		compatible =3D "ti,tmp75";
>  		reg =3D <0x48>;
> --=20
> 2.25.1
>=20

--=20
Patrick Williams

--eSsDpaX8ks55v2Tl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmaoE88ACgkQqwNHzC0A
wRnlOQ//aSDDwetaxVuBFIXvnhb6qUZljuoBopqlxpXwzllq1kf49dytSuzQ2QNF
USKmp2hnM7LZEBKJWvp0GSnt5Lw7y4jcTmPcvVwB99kV3295Tz5tv8QteCG5vzaH
3DoXI3fNuM8NOa3gR6iOjPm9SP6IBkkN8i4pgVzoa20McRjCGhJotCXUUO1GD9Sq
zIf+abvejMNN8EY+sdoVtR2PdvGLe2F3vheb7glV+NSXjnWZGK/NF4/NIEi95L4y
FP1TG6aW6xgxoX+MnPwuHySobvw7qaXb2n7DTIzXsFpLb3mcOkaz6Qx1/BlDvmXP
ymiPtPhFrWyjCWB3ozKtssWxfB0OU/KVMfxYabqzzMIWZ5A/dFf4IgS4qfGp/9Tl
sI052J6/6En/l4MgsiAEfxPxknhsbmKk92/kMLoBrBvgImx+lL07Ce2RR+j25iNN
LZiqay9b+PecdW6AKcelHV8MGTAgQ61ZsjDYm+eRomCR9fKrEvUmagAXGEF0UxWt
eBR9DnMu8enst+Q4Lmej9+K2xAgm4l4wMiVYCUjTfe/7UOh0RoM2zwn2kpue73sD
EtxgX1njoNP0y3+S5/WK7337Pd2UvbvuqOwJ49w6PgvBwwQPqMwEq2jFUA+nOmv0
pLJCuQv18lf6UhiVisdV6hJe6xZ3R8VnChGPpyO+yoD4oavcA7k=
=AbXz
-----END PGP SIGNATURE-----

--eSsDpaX8ks55v2Tl--
