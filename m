Return-Path: <linux-aspeed+bounces-1194-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C5FAB3CEB
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 May 2025 18:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx4BQ0mnZz2yWK;
	Tue, 13 May 2025 02:02:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747065758;
	cv=none; b=AN2DDIr2RpYJawoNMoIko8t5RB5Qkm1MFYVYRn6Vxxbu/LXTjB1tqduZDKr/juezzGW2eIQtynpOMnQQQmt2FzPFo0flJ3AEjhcVgb5Zs6h6Fvob5ix8ssVqT0ddo+/nI2gN9yyyN4XVNBdgukieRdrf2Uh+FVS1IUgB54UhtMH2C2nXa4Jw2fIScKneRDBbT4c4B/iTdL7edPVrOK0m7KQ1uuefyS+s0t5fjIpIa6+pcDn2ziWxpaQ5SmkGbdVAMFh2uK3OhHv694U4mWBJJSk0m2wA3pfqTAqXVnIsUnRS7hjfsdQrP15wxxoE4CWrLiZ6E4Q92iY5mp+TUJd9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747065758; c=relaxed/relaxed;
	bh=04VoAZX1Pkj/3n7T0vHI9PPCpvGqL4ubX0zX6JWFyfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXmCEx4d2GVMjlZZJfTSid+E0JmwjiHcWOi+zqfClMjwqQwC97RtG3g6rfp31OcWg1os+Um/JCuXcWQ7daI2o7JTwa4lQMy/M9ECqFuLW+6TJjn8bP2oXq2W/ghXHpqFg+lvmErPIP0gtvkA7vY0tyZu6IFdrBdGLqTuYq0vw5SxCbQHBMtTZUG5TVm2qdt4wkpIDUdar2Z8WmUNwDjuuQOPIelBaVcRnJJgdOMXe3QyJ+pvXwyU772GVSrmOKEdEPd1tRxu3ZXMX3F8baEwdFL43b+34drj84pZHc1LQ7Dco7AZUYbl+bZq8PSL8BGhUz3OVyuJcPBHAzdFeeVqSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q2fAoPc3; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q2fAoPc3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx4BP04vHz2yGf
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 May 2025 02:02:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E12A4A212;
	Mon, 12 May 2025 16:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78F8C4CEE7;
	Mon, 12 May 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747065754;
	bh=TCE6Uw7LiVPLM8NbyISS0pYOwHNQf36YyFcNYjE50+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2fAoPc3oOidpqW2oxA1Nde74ERkCSXCK24/ljWYm+Eo+1nRNRqalv9bNLoxASorO
	 hfGrJOfu78egh50rDYD5YArzBmCDAzs8O0R5lSnJKfUidw2OHNrRVrhbTHWcKgCooY
	 V1pwpvywTIJuEEPraQRqeXLTcc89FpM8trEfhReW4pJUUwNA23cx7ASD3wF4DoTzAc
	 Xr7fHguA5SL6YyPl9vRpEunmR9KGkIdhpdWEIUyzmFpiNxLBpM5WCHSQ3wNQzc8v8Y
	 TPU3SRRPw7+F3XsTT/ebKZ0yvaDYxwcCs/ArxU6IAHcXpea3+9ZlNe6dtB0B5A4JxS
	 X8oJGBnWh75qQ==
Date: Mon, 12 May 2025 17:02:29 +0100
From: Conor Dooley <conor@kernel.org>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings:
 arm: aspeed: add Meta Clemente board
Message-ID: <20250512-activism-dispute-e2549ab2b210@spud>
References: <20250512113026.264785-1-LeoWang>
 <6821dbfb.170a0220.3b15e.aba8@mx.google.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EEzvPtStEzaz9LSn"
Content-Disposition: inline
In-Reply-To: <6821dbfb.170a0220.3b15e.aba8@mx.google.com>
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--EEzvPtStEzaz9LSn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 07:30:26PM +0800, leo.jt.wang@gmail.com wrote:
> From: Leo Wang <leo.jt.wang@fii-foxconn.com>
>=20
> Document the new compatibles used on Meta Clemente.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Please fix your subject lines for future submissions.
[dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings: arm: aspee=
d: add Meta Clemente board
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
None of this looks like standard output from git.
Take a look at what other patches and the kernel docs do.

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index a3736f134130..4416a40dcd86 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -81,6 +81,7 @@ properties:
>                - asus,x4tf-bmc
>                - facebook,bletchley-bmc
>                - facebook,catalina-bmc
> +              - facebook,clemente-bmc
>                - facebook,cloudripper-bmc
>                - facebook,elbert-bmc
>                - facebook,fuji-bmc
> --=20
> 2.43.0
>=20

--EEzvPtStEzaz9LSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIblQAKCRB4tDGHoIJi
0naYAP0YicZzkSoOLCHibdodAKfacK/bNJ38DYRNkT10N/l7XwD7B0kGA/gb7PRD
fZiB0rMbZNOPNyKk+FZszA5zj5HCpw4=
=t6md
-----END PGP SIGNATURE-----

--EEzvPtStEzaz9LSn--

