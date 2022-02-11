Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6394B3045
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Feb 2022 23:19:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwSj243gjz3bcW
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Feb 2022 09:19:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=i7AsSyZj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dy2oHKAS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=i7AsSyZj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=dy2oHKAS; 
 dkim-atps=neutral
X-Greylist: delayed 191 seconds by postgrey-1.36 at boromir;
 Sat, 12 Feb 2022 09:19:41 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwShs4TPKz305B
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Feb 2022 09:19:41 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6208D3202152;
 Fri, 11 Feb 2022 17:19:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 11 Feb 2022 17:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=RTc40DrDIwSBEwSKbaE6X7bElwvJ01jh9SfVla
 ee3V0=; b=i7AsSyZjLcSEF+5Hu0j8R6hc3REOMN+3DwOB6Jc5BH6hv7g9/leVPD
 NCtf7UC4CjEvQQBxXD9TIxq/CQDnkHCwaQl/6438gvnVewTqedvtsnnKKJarxCid
 8W93S/5qKAgEjXEguQ81eiw8Z29eqEUymuB4W4WYHmYbcLHPmhohz5Y9bt/ZSnm0
 A0TWi41d2UNBLYjlRdNAwairhdKVPCBLRCmbA4PovJwKo/bE9eCo7UGcju/FfPoS
 MhTeX5434sM+hGpPXSSOGata2dWA7lc/lJ594gDgV4l6oy2YA8v1njhz+4mDZQKb
 RErBKfmO9x2RVZfY9y064QU8W9rtg/tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RTc40DrDIwSBEwSKb
 aE6X7bElwvJ01jh9SfVlaee3V0=; b=dy2oHKAS3X3UyXDWTFApsolPkUO11Ipi9
 KEg0dotznhG0QKAhz8x9PO3q2cJhR2i3KFg7mV06VwJGADElDDXyHTRjzx+RbS8W
 cMxOV5a8Mwl2Gk1DZBJFFPBuFw5IS1ldxGlAGWNpCZPIvc1N4SYhEy/cuiLOCMjW
 INafyvl9hWGNqPQjqmXnbMVl8ybq4nKd/FW1DHEiVXQv7Qcij51BHvyAXxF2Lh/7
 LurwVhdM7tIUcLOZHywLg7ruV21MYsn9WPKBHwiORS7//XvBxfsUiLEcT6zebKIY
 qdC8PpohXK139gbh4eUAenDXSBbGUVib+WBvzu/Qq+8BDkCJvvQGw==
X-ME-Sender: <xms:-uAGYnDKvdaCwFEgT89xro4hCiriuh172938UC2LkCXnD6x8bYcMgQ>
 <xme:-uAGYtjt5fla02LsKAZ0opi3pklL239h55HOH0jcraXka7Csc4upFKalsCJLRmG-P
 zX7fngyuWTDuQEUqeY>
X-ME-Received: <xmr:-uAGYimtFoUmV1p-bf9pfEbevvDeBAxD_rB1AC1GPWDaqSOSS2HSRj9pT_NtHKf7EyIGQU1EHRrrdw1aNG-vml7kw_7eIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:-uAGYpz86X5lMT_KrnV0qcOp0lIJQWacait7yMz7w7kTcLuJcxzaag>
 <xmx:-uAGYsR6qKZ3UU1sPyLTDj1hhfJ_r8V-3N-tYdS2ZrylCU6yLhm-4A>
 <xmx:-uAGYsb5nvnHysL_dj2K3O9OtJvTRj1AJY9dzvlhu2nrKhvP1tk3-Q>
 <xmx:-uAGYrGr8mclckFYz2PPdcq-CQakm8OjmO4grOnwUQoXa_FcK_BG-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 17:19:37 -0500 (EST)
Date: Fri, 11 Feb 2022 16:19:36 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH 10/10] arch: arm: dts: bletchley: cleanup redundant node
Message-ID: <Ygbg+KYK9qT90O2N@heinlein>
References: <20220211014347.24841-1-potin.lai@quantatw.com>
 <20220211014347.24841-11-potin.lai@quantatw.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JisbnzQp48fIKCGa"
Content-Disposition: inline
In-Reply-To: <20220211014347.24841-11-potin.lai@quantatw.com>
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


--JisbnzQp48fIKCGa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 09:43:47AM +0800, Potin Lai wrote:
> Remove redundant i2c1 node.
> Disable in-chip rtc, use external rtc (pcf85263) instead.

A bit of "why" on the RTC change might be useful.  I suspect it has to do
with where battery-backing is for the RTC in hardware.

>=20
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/a=
rm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> index 946107bd8bc7..fb62a67cfeed 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> @@ -205,10 +205,6 @@
>  	};
>  };
> =20
> -&rtc {
> -	status =3D "okay";
> -};
> -
>  &fmc {
>  	status =3D "okay";
>  	flash@0 {
> @@ -387,10 +383,6 @@
>  	};
>  };
> =20
> -&i2c1 {
> -	status =3D "okay";
> -};
> -
>  &i2c2 {
>  	status =3D "okay";
>  	ina230@45 {
> @@ -680,6 +672,7 @@
>  	};
> =20
>  	rtc@51 {
> +		/* in-chip rtc disabled, use this external rtc instead */
>  		compatible =3D "nxp,pcf85263";
>  		reg =3D <0x51>;
>  	};
> --=20
> 2.17.1
>=20

--=20
Patrick Williams

--JisbnzQp48fIKCGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIG4PgACgkQqwNHzC0A
wRkWMBAAqRxDw0dBdIcOs4dccrmlv1gPYZ2wzaS8rizHSpKm2gz1IIt7ConmzmSv
zYlkH4kioV4aBgP59r3CnyKObFARg7pTm4jelLYUoedzAidK6YgmpWDHslS835KG
OHza3ZFZpjROw+Yxc+Uj4d5SJ2eCva5znFvp1FukcmahTMXJDUT+OT1KeKoq3BoV
NVNlb1SXuXmJyCmooCiKQSO73xgW5KDUH3pVOzC9OsGc3xHq70uKIBmWd+1DD8ya
CgLf/s3mk2OKlFfz0tn8nq1oLdXxzjygm+ymXNtmr0NwdGVHoDLA6Irld9xfAjt/
mggDNLoYBcHw08eAydFYTRDkshEkxYiREWIK1Eb+b0Y7p0SWI8CYFE+eofdscwWt
RA6889EWvdWffOYJKKfBGHbYFGBbytSuwwyCYYc/wxJ3zgPgzcR/QtOUvVxLi17N
OpBnlyDZrPbpsVBGYoCL+ml+27UZAfVRtzkXTL05lMdZFVmg8lawiMcTtP7cb1FI
0JlT4xWFOPRhkr13eOUfHFVa3H9+TuSNAaUroHu0oAd7f77HNt06O85eSo8KndXd
nXsJkpnybmu29THPv2EHcvP1DUCbEpKL8I7ORwqigkLRnL21G+JwFJg7Y/sCDmpa
ZiHJoWWpEEnBkPrela3DH/bjBx6cNh8bkmleWg5mSm60K92A3tQ=
=CihP
-----END PGP SIGNATURE-----

--JisbnzQp48fIKCGa--
