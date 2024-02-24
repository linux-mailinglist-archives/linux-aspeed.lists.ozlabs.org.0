Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA48626F1
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Feb 2024 20:17:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ESsg6LDM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThxT94qHDz3cPk
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Feb 2024 06:17:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ESsg6LDM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThxT119Cjz3bnt
	for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Feb 2024 06:16:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF3BCCE0E2B;
	Sat, 24 Feb 2024 19:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D8BC433F1;
	Sat, 24 Feb 2024 19:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708802207;
	bh=FHvMajZrXNMcFDw0hz/Scz0oxDv/UTNTfoJGwHFWbwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESsg6LDMVKC2tA8a0clcvREfQRdmbPV6OZb5iIa8QvaBXM9CEBlF9u1CrqfvaNjjc
	 iOfllxughaoxfVeUtCirmtMZVMPQ4pbsiEBXfa4bsFdS5GNRsllLBkGgNypIbx1Hmt
	 fqxsMNlgquV9RDwdax9mPiVEkW8Ctxa4vMGdBbqivC14el/kvdIO7oMNQRh5X5Nt8l
	 Uk9yYFRkSW52TpeSl2sU2NzqhIgoQKKKsphP0bnFe0IJ2/0Oq2Bfiz55yYkx7r7vjB
	 i6kqn5DO7ZNiDzpMNchhlIGdUdcm1yHdCKi58t/CK7lYCiJ3n+S54F6EfYjjMDvsXL
	 14HWjnYy1Fa9A==
Date: Sat, 24 Feb 2024 19:16:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] ARM: dts: aspeed: Add vendor prefixes to lm25066 compat
 strings
Message-ID: <20240224-coyness-civic-d583b863c614@spud>
References: <20240224103712.20864-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uJA6p5mfN/szSZK4"
Content-Disposition: inline
In-Reply-To: <20240224103712.20864-2-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--uJA6p5mfN/szSZK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 02:37:07AM -0800, Zev Weiss wrote:
> Due to the way i2c driver matching works (falling back to the driver's
> id_table if of_match_table fails) this didn't actually cause any
> misbehavior, but let's add the vendor prefixes so things actually work
> the way they were intended to.
>=20
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Oh sweet, I was just about to go off and write this patch - thanks!

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts | 4 ++--
>  arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
> index 4554abf0c7cd..9aa2de3723b5 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
> @@ -98,14 +98,14 @@ w83773g@4c {
> =20
>  	/* IPB PMIC */
>  	lm25066@40 {
> -		compatible =3D "lm25066";
> +		compatible =3D "ti,lm25066";
>  		reg =3D <0x40>;
>  		shunt-resistor-micro-ohms =3D <1000>;
>  	};
> =20
>  	/* 12VSB PMIC */
>  	lm25066@41 {
> -		compatible =3D "lm25066";
> +		compatible =3D "ti,lm25066";
>  		reg =3D <0x41>;
>  		shunt-resistor-micro-ohms =3D <10000>;
>  	};
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts b/arch=
/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
> index 6600f7e9bf5e..e830fec0570f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
> @@ -14,7 +14,7 @@ efuse##n {					\
> =20
>  #define EFUSE(hexaddr, num)							\
>  	efuse@##hexaddr {							\
> -		compatible =3D "lm25066";						\
> +		compatible =3D "ti,lm25066";					\
>  		reg =3D <0x##hexaddr>;						\
>  		shunt-resistor-micro-ohms =3D <675>;				\
>  		regulators {							\
> --=20
> 2.43.2
>=20

--uJA6p5mfN/szSZK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdpAmwAKCRB4tDGHoIJi
0jbhAQC7tzouPoNHtO1cCyXVSSpZ/vASOJWjOSJwRAbbKh4SBwEAnrxhOohokD5+
Pe/1QIdCSRpY6Zoi8eqpqGy4XCcI5gw=
=yxIC
-----END PGP SIGNATURE-----

--uJA6p5mfN/szSZK4--
