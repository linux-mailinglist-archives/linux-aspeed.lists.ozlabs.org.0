Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAD65C895
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Jan 2023 22:03:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmlZz421Gz2yfq
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Jan 2023 08:03:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=aykPBW0n;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S9VDejLz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=aykPBW0n;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S9VDejLz;
	dkim-atps=neutral
X-Greylist: delayed 73 seconds by postgrey-1.36 at boromir; Wed, 04 Jan 2023 08:03:44 AEDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmlZm4m7Mz2xH6
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Jan 2023 08:03:44 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A92775C0151;
	Tue,  3 Jan 2023 16:03:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 03 Jan 2023 16:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672779822; x=1672866222; bh=528YXDdsl7
	NZ7UfgaIl6QcPY4zhgJgXWRE3Q5Dk3PGs=; b=aykPBW0n6yZrzD4AJKfoeyv+q1
	OVyOHSWKHdntSKu1eZ1VwonmDz8CN1rP38caXu9P/YbEi8fyxmqoVI5vJbgQb9UP
	rlHoqXDlvQ/nO5pcAqySnkcc74JAEK0/N+TV3/CGcXxUFF1uSzru2JwpsOPXjce/
	Wsh7y1aD6R/sFjteifW0pGdL12shM1O1F/Z/TqW/2GAa/JusocuxmmUPa1JmMYGw
	t4RDJ0+M5WzU87CalxkG+VIZMl3TZ7YLABHX2OZHSjRp5kNjq7sQHr5+uyusl6ll
	D4X90JMWWQFJK2fdpz6r0JoOrzebOpEpNOMKYdazeYd24BKdSGAW8BJxUQRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672779822; x=1672866222; bh=528YXDdsl7NZ7UfgaIl6QcPY4zhg
	JgXWRE3Q5Dk3PGs=; b=S9VDejLzy2D8wUw+ggg2PfFUKDXx1MJEG6ctxnoCmeX0
	hqZzaGjRtVoPuoa/Mtmw87I5jVUMRBnmRK9GArdNQ99XqKwP4y9naAoU2mFl3ssa
	Sr+IhqwGbqKORaC52Snwx3iYIgye+0X9Ukwo+OcjtrefTneyI6OsHMXow0xIPpkm
	8mw+SALqmpsK3CRhNdcaCA4PprDiLUqZ4wLaS668aC8QBs4/nV6ni1SU1SzOUm6o
	s6CDLJMA24vHDT1gHLIT4sSXfpw+AhA1psaErQbThJORkBcfi+Mhw1Xt+TOpblyW
	21sOqLLwXvEvIE2043zbI1gNc0u/qt3Wpc97tNtYNw==
X-ME-Sender: <xms:Lpi0Y7Lw4QL7UysjF9j1-A4TqRXLDXgqEd3Oma76JKZ1GCitsa-WvQ>
    <xme:Lpi0Y_KDgcBJF6ExvoPpvOBA1lu42vCOLjI_PHXGzLhhJGJ4_oqCy88qQOE5giOtK
    T7X1RKZSQ1teZvXWj4>
X-ME-Received: <xmr:Lpi0YzvyKMqh1vF5V6izNyblpkl8XDjOTd_3sqT3lgpTqLcv33w9e2XQKbGvX4UJSKk7-H7hp_T-VfphFZ6SUgjZA5WhzB6xOsU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejgfdtleelvdeftdeggefffeeu
    feevgeejkeelgeeujeevveeufeeigfeivdejjeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Lpi0Y0aRV5o7RB-E88k897HiQXuNPpKJunVw_vbnX83knTsYRntGjg>
    <xmx:Lpi0YyaDmUDMv72sedQL1RWfumOKuMGrPLV6EtSwQisBSH3cUElneQ>
    <xmx:Lpi0Y4CXH8k6516WdJ3hYawmfcPAlpXeBWV9_rou2p7WVFFpTfeTaw>
    <xmx:Lpi0Y4PftMCWnVnyVofchBbC6uWGoCPloW1JcD6EKZlGJ7wMbVJe1w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 16:03:42 -0500 (EST)
Date: Tue, 3 Jan 2023 15:03:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: aspeed-g6: add aliases for mdio nodes
Message-ID: <Y7SYLbPU30VilpKh@heinlein.taila677.ts.net>
References: <20221025055046.1704920-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bDUDvm3APD4C9LyJ"
Content-Disposition: inline
In-Reply-To: <20221025055046.1704920-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--bDUDvm3APD4C9LyJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 01:50:46PM +0800, Potin Lai wrote:
> Add aliases for mdio nodes so that we can use name to lookup the
> bus address of Aspeed SOC.
>=20
> For example:
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio0
> /ahb/mdio@1e650000
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio1
> /ahb/mdio@1e650008
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio2
> /ahb/mdio@1e650010
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio3
> /ahb/mdio@1e650018
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> LINK: [v1] https://lore.kernel.org/all/20221025024145.1561047-1-potin.lai=
=2Ept@gmail.com/
>=20
> change v1 --> v2:
> * move mdio aliases to aspeed-g6.dtsi
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-=
g6.dtsi
> index 0cc92874caa8..6f159ef1efbc 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -36,6 +36,10 @@ aliases {
>  		serial4 =3D &uart5;
>  		serial5 =3D &vuart1;
>  		serial6 =3D &vuart2;
> +		mdio0 =3D &mdio0;
> +		mdio1 =3D &mdio1;
> +		mdio2 =3D &mdio2;
> +		mdio3 =3D &mdio3;
>  	};
> =20
> =20
> --=20
> 2.31.1
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--bDUDvm3APD4C9LyJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmO0mC0ACgkQqwNHzC0A
wRmACQ/+OWp4xu78R/2tOIEt6EBFGpgE/1RramsFEzpJEsoF02yHFBVycZc1r3ti
TmosqteJqgrDVXdFbcJVLUfH2W+D85I1bkYi/jTpexmzRdZGaiqxo+JIVCcEXw9x
zGI7ASDiTbpQuwpDPjadpajXspYef5GEhzfiVB9eWAETbhwVLVQmYfM7QvJqhIiq
sT1txK6AsZ1iL9B0Ue1zbsZkpHDRuBrRIpWtJHZoHRVF1SBQGP9mwPWI3yBR+Ujn
TiWv5tgsXx18dlKvGkiK/yckAiyKJ6uY6cPbu69edqUHhCaVkiunZ7/CfP/IW9mC
ilQBRBWm3715/TGx7c2viAn0UeYWyypQ6VWYyadAx/Pt7oyY8wv+4fzBbvQS+MZh
RfdtuYlHh+0Hs4r2H0g6GNrICpnMJ4d+bNR36xsv5C1N2YWk689bGJvrcKUEBY6n
xaOLlo9y/8IV3TwYR9BXXoyKEADe2HCbQEmqM5DYZoqndlfMegmaiVji7pJwaMiv
3nqoXrw/24gJqs5R+f7s5Gm2kFkPkYrZEqerlRVvL5QRJfMSFKJt8EeUTF04iJ6Q
PadX2jcPMj+DekMLleVgpFAbcyrlZTmpYf6g4Wottxms6k/g+0ZnaM/r91OitI2c
3cNzKYQr92mOhfHZ4CNd6TgK3MuT00CpfnkNT8Wk6duSxhCYS0A=
=Xy1d
-----END PGP SIGNATURE-----

--bDUDvm3APD4C9LyJ--
