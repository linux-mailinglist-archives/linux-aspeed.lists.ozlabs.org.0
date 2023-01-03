Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1265C8A5
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Jan 2023 22:10:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nmll52sy9z3bNs
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Jan 2023 08:10:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=BoSM0PmP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VsQWifXL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=BoSM0PmP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VsQWifXL;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmll11KPfz2xKN
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Jan 2023 08:10:53 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 48E9A5C0095;
	Tue,  3 Jan 2023 16:02:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 03 Jan 2023 16:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672779745; x=1672866145; bh=l3fhFm5wNV
	naqbRR/9HpNGMBygavHOCjj/CdRd0rsOQ=; b=BoSM0PmPkhufXvVBq8cNerqD3b
	79aIgWxnn9tTG3cKldcPlJ9OImJhzMNp1xwoPtBdx3harr+m9N/fQDec0v4H8Ltp
	3n+Gv7bGP2feEmqbzkVPEHQu+B2pJoPe3h5zlPZBFN7INrhtcGctYbjMiIXzNs9d
	W+eYUAXy56BFMjjARc8Y1SYJ38MfCo1ePccqdE47qZL5b6lFs48g1qn9CgYXkBt8
	7HTMs3jLRlIoaAWZIH7yBf0gtls5tZYOC3g/rSBxVLTC/iQ62TnuD9dy9BJmIrtA
	N27ogenRUWjsaMixi2E8N1TA9nKEqD8sqdjCkcfIY0D27SGwO81/EIgQAyAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672779745; x=1672866145; bh=l3fhFm5wNVnaqbRR/9HpNGMBygav
	HOCjj/CdRd0rsOQ=; b=VsQWifXL6kSDZDK7srAE0w1cVIIZ2vEkGMrSiQxvS8ef
	IkeqpW6JPXW0YtEUMT4Z8nMrl6PFLSLaFj5ux5RI+680mUpFZm505DAmGnItGI6s
	ExR3GMpGYlSnie1aX70UU8IXmdBQkAxliVlk5LQE4RBnQX47uNxBFYIfelBvPdes
	COwwQtshEJAKgOpqOprAa4n0MIoetIKEk8+LYEj31mwPPAtfiiFQA7IRW5d4cP9+
	JpG1+yM+8N/lnJgBWBwSO8otjrxZbr3fGs0YOZuMYA0xSYqcR731yWxB1PoMNgIY
	/ta5H7D+xrxpviAT710uHr9zv2chOLH8TWv1taK2qw==
X-ME-Sender: <xms:4Ze0Y9cssxilvmBx7brIVPs4bobhF1YuIev83RLRMmJpVWzS5ovmVw>
    <xme:4Ze0Y7NdvY5yWRzyeLxWliPexq3lkJD3ozIrzTsuJo9uAYVCX3RP7qIdJtbORmFSF
    56njbvkawNCKk8EBXc>
X-ME-Received: <xmr:4Ze0Y2gPNHsWysOTdIQwkhR6ObvMvM0KbRn1lN0OhfxDDubekyUfbtIKZtf0KLESyHTYSO2RJsPTk-dde08qIWVqRL0LdgnEQWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:4Ze0Y29rxeMb9IQfFS9bvTE7uuTQnU2N6hf9wPFvYPuLdNJAqhXXvA>
    <xmx:4Ze0Y5s8LOICB_2jrLlnwZpNmcCunIR3b2IoyUQrYovj1hw9tox8DA>
    <xmx:4Ze0Y1GsE9VkJ83rLhP99Wbargk5qPPGe6MI3tVccxgpgFe11imZvA>
    <xmx:4Ze0Y6-6VUD9ds0ZT_YNvjizHRn2-auXuzcQZWlgIoZsGeFlfEePxA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 16:02:24 -0500 (EST)
Date: Tue, 3 Jan 2023 15:02:21 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: bletchley: enable wdtrst1
Message-ID: <Y7SX3XQdRKcVFwSe@heinlein.taila677.ts.net>
References: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
 <20221226054535.2836110-3-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ITHc4yLppOjAfL7f"
Content-Disposition: inline
In-Reply-To: <20221226054535.2836110-3-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--ITHc4yLppOjAfL7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 26, 2022 at 01:45:35PM +0800, Potin Lai wrote:
> Enable WDTRST1 external signal to send a reset pluse to peripherals while
> BMC reset.

nit: s/pluse/pulse

>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/a=
rm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> index 791f83aaac50..050ed7e810fa 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> @@ -1064,3 +1064,14 @@ pinctrl_gpiov2_unbiased_default: gpiov2 {
>  		bias-disable;
>  	};
>  };
> +
> +&wdt1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_wdtrst1_default>;
> +	aspeed,reset-type =3D "soc";
> +	aspeed,external-signal;
> +	aspeed,ext-push-pull;
> +	aspeed,ext-active-high;
> +	aspeed,ext-pulse-duration =3D <256>;
> +};
> --=20
> 2.31.1
>=20

--=20
Patrick Williams

--ITHc4yLppOjAfL7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmO0l9wACgkQqwNHzC0A
wRkgiA//UrzR+v+5K+T7IFxmx79HdNHqHfgdU4GzaO9vwcKDdzXzEYcKVhXzuLxq
g9GW4vTBXFMu2pKSnRYIV0wtc5/ErCYU35brT3+cAtxUj9r0ZdhzeE/9a53Zxux/
1b24AmsKXdpDDGMVjZy3YX92phB3j554GMnRjEprlmdGRTVQ45/gbJfdsRXY8DC+
nXCeMgFODQ7PCJI4Yf2XkCT4N8ofFzxRBdJ41of3RBpnsYiwMBfVynVXOPWtrqOO
Ustf/xTTSFDKwkWdQnm5/cwsewCMdHHsft0qGJKIyBBYYJxk4p/MmFAi915HHqI6
Jomvuc+g7djUAfBxOVh2PdfK7TGXbai/daee8eafavsBcI0YOuQnqYSWz4vwaEMC
pd/urmf4UznlLsa5NZlrqjyJ+65JIOJKqx7xCJ33JPSiu32LBjXq1rFdGbSKykrr
W/GmnY+vcA6o5g9A9x7DIxLlizQa2DTocfPWcus0cRbUnGe/0/lIutDenU+FfUGj
jq7/BvF5DxfEOfcdoqv1WZfSHnAZD6Xc+pbUmQAEx1rvhdR0Gn7pYfcA3JEVgxMM
6HMWtBZEV5MzKrzlky990o6wNZITEhBNJHK38Av82yloSb+5ntqtwdYdOuEQIirz
XRVuun3b9pfA/cxbbexa8qq+Tkn06VBL/Jxeb4ip6NJZ7AOf8C4=
=0zi4
-----END PGP SIGNATURE-----

--ITHc4yLppOjAfL7f--
