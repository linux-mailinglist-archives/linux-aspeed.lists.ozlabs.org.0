Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B54484B1F
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jan 2022 00:18:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT7pS3LF0z2ywm
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jan 2022 10:18:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=PgJtxgwe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=L5I45CSF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=PgJtxgwe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=L5I45CSF; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT7pF1pB3z2xBf
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jan 2022 10:18:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A3B05C017C;
 Tue,  4 Jan 2022 18:18:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 04 Jan 2022 18:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=axVMBjIr/XhRKABCeCcLgnPbHr1
 sgLS8A+upCHYVmH4=; b=PgJtxgwefwSS2LS81uYLAi3umYX0eSm8Abwh+YZjpKF
 qkgUwUA4DERRhJt769aENe+T+weEJOXAu2fbWtkH08yMP0s1t6AbXpKaWDqoWZmE
 Vaj+7NOLf/PTvVYlY5xOVE7IbPVinQywDpKYRWselp8aapQaq+PYRoIfQuaQsmdt
 +v7vZzVYhjc6jqtCtGOilm4UcCETgtF/ZS/hLQanHNuBAUenH023kq9rYBBfC5vy
 6UG4N/MSStSXHyB+dMNsJ2CS2p2WcPdaWF5G4oStII8eqJnrfoeTzGxZs3Dp5z1p
 ITonEkbY6yvgSkpcHDcRihlib7loY9cQrc1uhxPcOHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=axVMBj
 Ir/XhRKABCeCcLgnPbHr1sgLS8A+upCHYVmH4=; b=L5I45CSFBGPgr5QAhuILtg
 LEwRi5QDca723+K4k7bMw7do09yWruW7Hg5X46Bzj7SyGQVEmbBVxSwWesVosM4n
 NhzQirCAbUmWNHnhcXVxHWUCJDk2o8J4aicyVc78Ffa03YxXQNtiTMjKGiY5jZJF
 GhETTH8YKOuS2oR5RV6UICUa0gOJup9rXggnGfcVp0Frg4lAdrYQbNvw31YUlV8h
 a4vRfRbB+MpA7Ch875PNqwMrgghcorAMY9On8nGAh4clHUCrGMZPG7RCEIOIdalr
 P3jvQJJ52AvArGidf5UqRnTtt7vDxhH4/Ih2/0/VFDooCjXv0FpV7J+Sd3vV5vGg
 ==
X-ME-Sender: <xms:v9XUYddgPdlzTw0HMUfWJGw0458UwpV_3TG6zIYtg7eZ72vlVHsGXg>
 <xme:v9XUYbOBTaQMF-Z4qGa8jYPz7r5IC0JpsaQJIJma6MYXWUgLO67R_kdJJ7Ro3y7G5
 F6PRc5wddcrcc2KQ1c>
X-ME-Received: <xmr:v9XUYWhj61njxHztSrTMaTNPjIM5KRRnEVq9udrCUHB4UKI84rTAKdozIC_FoIsePPIoxl0G54ICdRaaTBLm8pb93-H64WnhVyTnww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefgedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:v9XUYW8vTN2cISxaV-rUqwLf6MP2xfIAaDI1-azT7y9b6-nkLijuBQ>
 <xmx:v9XUYZuwpeR019OdUwAoU-ADZw1JUe1bR3jABq7TSdq-L_Ee96AU8Q>
 <xmx:v9XUYVEQAvFKCSPvD264Mpt6n-GgnMgV7VW2HBibMVrsWCuiRoH92w>
 <xmx:wNXUYdipMNB9uLf8truu575ADZ5RkeVaO-hcIGM8jmDbNx27jfsWOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 18:18:23 -0500 (EST)
Date: Tue, 4 Jan 2022 17:18:22 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH] ARM: dts: aspeed: update dts of Bletchley platform
Message-ID: <YdTVvuXiPPRaMw99@heinlein>
References: <20220104093008.624-1-potin.lai@quantatw.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W1cbhE6m1lnx5SC8"
Content-Disposition: inline
In-Reply-To: <20220104093008.624-1-potin.lai@quantatw.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--W1cbhE6m1lnx5SC8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Potin,

A few minor comments.  You might want to leave more information in the devi=
ce
tree for a few of these since they seem like non-obvious settings.

On Tue, Jan 04, 2022 at 05:30:08PM +0800, Potin Lai wrote:
> updates:
> * seperate leds into multiple groups
> * switch sled numbering to 1-based
> * disable inchip rtc
> * add flash1 in fmc
> * switch spi2 pnor using spi-gpio
> * update gpio-line-names
>=20
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 277 +++++++++++-------
>  1 file changed, 163 insertions(+), 114 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/a=
rm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> index f973ea883b97..d617cfebcb18 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
=2E..
> =20
>  &rtc {
> -	status =3D "okay";
> +	status =3D "disabled";
>  };

Since it is more atypical to disable the in-chip RTC would you mind leaving=
 a
comment in the DTS as to why?  I see we have the nxp,pcf85263 later on.

>  &spi2 {
>  	status =3D "okay";
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_spi2_default>;
> +
> +	compatible =3D "spi-gpio";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	gpio-sck =3D <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
> +	gpio-mosi =3D <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
> +	gpio-miso =3D <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
> +	num-chipselects =3D <1>;
> +	cs-gpios =3D <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> =20
>  	flash@0 {
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "pnor";
> -		spi-max-frequency =3D <100000000>;
> +		spi-max-frequency =3D <12000000>;
>  	};
>  };

Why is this one being changed to spi-gpio?  That is significantly worse
performance.  Is there another (non-NOR) SPI device on this bus that is mis=
sing
=66rom the device tree?

--=20
Patrick Williams

--W1cbhE6m1lnx5SC8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHU1bwACgkQqwNHzC0A
wRm1Vg//bMJ6Nm1kWD23OZ+wx3jg/9vRCWRaq+BJPYvMqgPSsoIaUw9l17lb5Z9s
f7+TS0B02/BtDf6e+LmC2vpAhphEREOglK/KWQAwLwniKhdvybmrjycJFvMF7PGB
RdejodtBRLg6ZilwBgZtrUTwqm4qEqUZvXMjVLEgmlE1igyU5N02Ak2fILSSQMLi
l6QmeTcS0OlRwp5Y3RGumCqZ6usRl/NPNmH7RJmAbWvTnbORUiSCHLp8Jvmn4Lzh
h/C37zb9wqIbC4346AeV7ds44ms4kC+iwuifKAfAizMXwWDjaz/Vi1nfOHePj9Kx
AhxrhwBRQYOD0XPXLFQpHpJvC6fpUbB7fSpxJqbSVByM+r/e6BkP5OcfacY9EOvC
4VnMsiAW3atzr6/JdUkqu7KhhleT3N8/y6X2xSzwbrrivqGSIOcPFpRXbTkJCHWb
qh1ZfCpE4O26T8c+2Nf4EY0ZAzHz0PQxrIIiA9A+McaBhDSE9ZAlrCXDuR8+1I5Q
HsU8FE7nmlqTrZ/2rw8jzTFiom1jzzQ7KJl2oNsMXUJyCGaS3ZgnjLmcZL43snza
zrgpPyIt5Q/aFL0bJjHA9EitroG1AneUWEuxUbzz47h/8HNVaL9O10NWzWmZjQxB
OFADq6a+vd7veiUygTG4cfMt1mBTWyXK32bOgNTWVOqgHpGz9KE=
=asHv
-----END PGP SIGNATURE-----

--W1cbhE6m1lnx5SC8--
