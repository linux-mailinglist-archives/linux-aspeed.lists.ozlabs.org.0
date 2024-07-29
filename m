Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 489559400E4
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 00:09:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=pZmJYnAr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Zi0Iu2Cf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXswP0HyXz3cgd
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2024 08:09:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=pZmJYnAr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Zi0Iu2Cf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.150; helo=fout7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 362 seconds by postgrey-1.37 at boromir; Tue, 30 Jul 2024 08:09:32 AEST
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXswD0BLTz30Wg
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2024 08:09:31 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id ED91C1380161;
	Mon, 29 Jul 2024 18:09:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 29 Jul 2024 18:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1722290969; x=1722377369; bh=OD+/qBJDKb
	S3ABPU0JbMD+Hs/uz67NSCTS1YeEEaLZ8=; b=pZmJYnArafsAJRF8DOerpedrkh
	GL/AfYXbcBMqGmIenj0xQfZAPa+AIq4dS07F20FL4QX1eBpHQfrMzPIeAcvvRMb0
	+TVnLfOEBa4O2tTBKBFPp2T9urbpL7FKbn9Z7lzK+/zSNsABIhR+HAgHyfsYaEQF
	JFW95lSLxG6x96bo+hO3V3CceDxpDtXEeuNCfmXJuqnWdsSUbOm2ad4f7T0lSi33
	yAicsIBozrbRFnF+hRJIHHvLCzSrOaIO2jcR+JW77Sf2YtRv/0ugK5sDsIV/MoaQ
	u2zreUVHGFbFguyOha/2gnXxWmaNymiDExlPGJDTPJ2XHa7z7doyXJA8cYWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722290969; x=1722377369; bh=OD+/qBJDKbS3ABPU0JbMD+Hs/uz6
	7NSCTS1YeEEaLZ8=; b=Zi0Iu2CfwtJnnRIJ3cMu9/ABgpjJkIfa13w61dgQGdNF
	SHF855rqpZL8HoMM7Lf7f3ndD82RVCVfWX7T8eAaant0igJgHstlYfuyh1FJ/d/u
	GWM7cu+cNex+sjzHdowKB74IIMEfkJ2S/0+XqaE54eXRX3/2jA84Eot9yYqawYmY
	6xyX8lrWOl87WB74mkF74z83WF2vq5i4QAw3YpcMbH++XuWGLjMw0XFLhRZQFVDc
	xOAkHdG/yqJK7CxzeAfi1R5vieXlDRDbpPjhEK9BFCQJlBLtxMAZlQOpRc6gaMGG
	N7BR0sd+PbM9AvFwv4uhTy6zlCSHreQgj0GDwhlvVw==
X-ME-Sender: <xms:GROoZhmUmsH0TEP3UQa2a2sFl95hyBKCJFVOhN4qNuzEPEZpBvjzAw>
    <xme:GROoZs2g4cxKnByNgQ11Y5Yau1l_Ov8ufZMfcI24Xrgl-Gr9maKX9nEvNk6BaLkiI
    Yru3EALUy7yLLzXMTE>
X-ME-Received: <xmr:GROoZnr95eyLQSfMYPx_ofHSYbNqz7ymZzqPf_hhAQAV5TsJ4E6dgoeEMTbsEth_f-4AV4puHkXqy30pLB5S9vHJNAsJ9Yfrw2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeefgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddujedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjefgtdelledvfedtgeegffefueef
    veegjeekleegueejveevueefiefgiedvjeejnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:GROoZhn1Az1DItK_TsU7PvJq-sjLyjxQLuzRDq0U4B-mIETPDHNsLQ>
    <xmx:GROoZv2VM2Zp9T5y4cHyJeNJOm9Z1JoYdABdveoZGuQ29idNrRsTdg>
    <xmx:GROoZgvH2gi-6ox4PszCJEOhLXAmIwwEj7c4249n--1MCP9LApGQRg>
    <xmx:GROoZjUzvM7kWHXsTQ0Uas5AEnfZL6Pbky3PtqcxK0rHsoTF9d5Jsg>
    <xmx:GROoZouhT8GjqblB3mIihgQJY3gqGrOqnW0X4lnZXNilAF0818hd7ZbZ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jul 2024 18:09:29 -0400 (EDT)
Date: Mon, 29 Jul 2024 17:09:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v11 22/27] ARM: dts: aspeed: yosemite4: Revise i2c
 duty-cycle
Message-ID: <ZqgTGJ40wuaCJVe3@heinlein.vulture-banana.ts.net>
References: <20240723092310.3565410-1-Delphine_CC_Chiu@wiwynn.com>
 <20240723092310.3565410-23-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yea2wkXUphGPWaXv"
Content-Disposition: inline
In-Reply-To: <20240723092310.3565410-23-Delphine_CC_Chiu@wiwynn.com>
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


--Yea2wkXUphGPWaXv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 05:23:03PM +0800, Delphine CC Chiu wrote:
> Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
> to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index c2994651e747..c940d23c8a4b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -761,6 +761,7 @@ eeprom@54 {
>  &i2c10 {
>  	status =3D "okay";
>  	bus-frequency =3D <400000>;
> +	i2c-clk-high-min-percent =3D <40>;

I don't see upstream code referencing this property.

It looks like this problem has been reported by Rob's bot multiple times
before when you've submitted this:

https://lore.kernel.org/lkml/171198916336.1093653.5612835610479588096.robh@=
kernel.org/

Is there a reason we aren't fixing this?

Maybe we are depending on this commit?  I think we need to reference it
somehow here.

https://lore.kernel.org/lkml/47e7eb15-e38d-ead3-de84-b7454e2c6eb8@gmail.com/


>  	i2c-mux@74 {
>  		compatible =3D "nxp,pca9544";
>  		i2c-mux-idle-disconnect;
> @@ -1314,6 +1315,7 @@ &i2c15 {
>  	mctp-controller;
>  	multi-master;
>  	bus-frequency =3D <400000>;
> +	i2c-clk-high-min-percent =3D <40>;
> =20
>  	mctp@10 {
>  		compatible =3D "mctp-i2c-controller";
> --=20
> 2.25.1
>=20

--=20
Patrick Williams

--Yea2wkXUphGPWaXv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmaoExgACgkQqwNHzC0A
wRnEEA//YKsI3SqDkEHLvlXgFnmbBJieaBhRlT0uVK6neAVOqhZ+Ny3CtXwzHOt+
XG/9erO/lquF7PV4KBYdoVRYPeJbWrpp3tCScUEpq7y81NuBEy6BGMGw0nmAD6TA
DOmsI4DiG5iTbxvrez4fsplAU9Oe32cYL9kq3jAhFA6NDNCe7bY+2BnONSUyNsVu
eU1FRIbOIouW1BZVRt/3H2HqSAOwd3XMHFpqxLrqtzcvAPBLr43lh2R4dCfRtXZ7
mdySsQmMYem0XZN1uZpqvu3WFEQmofuPAoYTvntfFMH12n5YmQGdZJdgUz+XxdpR
zVf0ZXt5NkwyfbpTDBZfTgD55Tva8gYNKIA1mIje3sTFoLT5/FqHbIOSMBAHfRXG
PzDAE3EI2W0qZhbc6MD5cgFhhfC498i8ye12WkJa8v2MFWQfiyAXysZ+PskR+mHj
uBNRwc2i+k9q3UPrcmxm2scEHUOVSxa3OobJOVKm7KDZPfeQx74iWf9dNEBAZ7lK
jMlF46Uj/QIj+Yuc0hGwX0qaR6q7FQQdSIpil2vwApw1W7gW1W0nW2F4uzvlqcek
l5O+8UACVwyFXXhrNEwF1lZ2Bqj9FmeSdkE0ECPW3hFtzgdk1nG5MwYxvwhmgXb6
NixyGkwLzJxYiWjR/P+lGS+y2hc5x3z7Jfv8AEKzlQ6z/LxmWK0=
=jpXX
-----END PGP SIGNATURE-----

--Yea2wkXUphGPWaXv--
