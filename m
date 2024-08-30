Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309C96639D
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 16:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwKdT5sKZz30ML
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 00:04:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725026652;
	cv=none; b=AKaRHchk6XpE6M8HIUryR+zU2deKblTIcL773IososvLvFSNF5SphJnwVl9OfI3Drpyhfp2yY+9HKYYQ/t26erOkH6nraIV8PFgJVKNLZFzslFSuvPHOY3drN5M31DMiLf+TuiRklt1uNKoHYe2FYmJy5Jy9Lh/m4+pvkpJyF8fgWSmAkmDDipUwe8r/fM4suuRdp4bjHLFQuTN8yK0y0iJ0Z6DHeDacnyNEzp5PVTQuAdI05tNXMpHwLwYWEkV/Yl7yhP262JPRnJJhKbxRq56NMXpnuUesgrylSFWIB1+i22o62MIn6maQdDgmPuFgUn9OvelI615q4xSCpOLFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725026652; c=relaxed/relaxed;
	bh=m5/zpJrYsVD/HODcZt4itNwcD8Vn10Bg80heSIvUWuA=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EEJKK/+aZtiBBn6pHVB9qARJ1UgdXJhe3HdQVXKXsfipUMqTySocK1ZPrhQ0BoK925xCrH5sqapXxECapKHHzpse8S3muzQmj6m6DnaBVG/QaSXk/9phvI2mpD6A79uPSWlKkC0NAso4lK6Nr55m4945+8bHBjCyN1GrlrbQjWyh62NUxGY3LCCiQnTy708PANSSLZP/THuwx07WT3FBO2JAWPp/SskBGhVM+5WDRL+CkADE8+ox4og6LTSBzTWDyGFJCSnDqYrl1gYe23UqDtaOlvlTaxKBRdyYJcq9EHgAcuSnRqRfnoDYp8pTRpzQpow6tYP+cSNGDnVsoT5ENw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dwVr6Fhb; dkim-atps=neutral; spf=pass (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dwVr6Fhb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwKdS042Yz3094
	for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2024 00:04:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5D20CE1E53;
	Fri, 30 Aug 2024 14:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDD6C4CEC7;
	Fri, 30 Aug 2024 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725026648;
	bh=cUtegsdQGft/33fvng7kM3QvVXPpZ8tTkRiGBNE+zUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwVr6Fhbu0HJyBQUEE/PYUHtHEHAjHlzPqeEJWv3PgtxGBbXmxsEmJ7CtWrUw32af
	 T8X4E9xmQpZKVaPU3/FqHPn8BcXq6DsLqISWOun0l/O6Tn0TQISkWDOsla3pC4MnBj
	 9nOtPFr3/vCtszYttV5ejjUY7Rni77fXf/3URqlpCcZ+RyLq08NUR+kDipQjpkpHtL
	 55vHfDNPhOuCrB9aADukxJWh43pLgB0+RsQ3Qz/Gs9Oc79X3NYaYlzbLPYo5Al2Nji
	 D79RoCmeElWQFw9D7KPiVWQOjiRINESDCm0xoX+qpBESDVErOfIwq2jsvuOp1jTSUZ
	 eBX+RRhdMbkJw==
Date: Fri, 30 Aug 2024 15:04:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Message-ID: <20240830-untangled-charting-48503e510ea7@spud>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
 <20240830034047.2251482-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gPClO003GyM59AhI"
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-2-billy_tsai@aspeedtech.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com, krzk+dt@kernel.org, brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--gPClO003GyM59AhI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 11:40:44AM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
> controllers: one with 12 GPIO pins and another with 216 GPIO pins.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.y=
aml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> index cf11aa7ec8c7..4d439972c14b 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> @@ -15,6 +15,7 @@ properties:
>        - aspeed,ast2400-gpio
>        - aspeed,ast2500-gpio
>        - aspeed,ast2600-gpio
> +      - aspeed,ast2700-gpio
> =20
>    reg:
>      maxItems: 1
> @@ -42,7 +43,7 @@ properties:
>      const: 2
> =20
>    ngpios:
> -    minimum: 36
> +    minimum: 12
>      maximum: 232

Aren't you missing a corresponding update to gpio-line-names, which has
a minimum of 36?

--gPClO003GyM59AhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtHRUwAKCRB4tDGHoIJi
0qUNAPkB52NMtklicYstcjTeGcpQkkGuzLTEMofpB2ZohjYAaQD/TjytJlaCvEJi
pT2l9A8yH2bXdPPSVl+JQxnmZmrnJAc=
=Q1AY
-----END PGP SIGNATURE-----

--gPClO003GyM59AhI--
