Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5AB4B3046
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Feb 2022 23:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwSkX6rJxz3bcW
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Feb 2022 09:21:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=xeDJtk6z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=P1WnFAFF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=xeDJtk6z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=P1WnFAFF; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwSkP6CNQz30Ld
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Feb 2022 09:21:01 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BE9693200F9C;
 Fri, 11 Feb 2022 17:20:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 17:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=YvSCKSU842KzUhf1LCRE65E1fnv+NK6PdKlIlr
 Basv4=; b=xeDJtk6zHVtUdiFHLhCC/YBEB2g3ZJsr0pN0e/420tNIotNVFwBt2e
 C45b16uOVdnz7RcPh587jto9J3KyZ4VKLO9/v3b8r7g9Y0aiqvPavimtQQsWtAAe
 IRG0911yqXFINWdI9cm4wGSH4lXFVPz9+w5p1QOdSFOQmrR5yFCVI8HmBa+C7w/8
 C1YqfpsYEPolsFufZheIc5I1Maz4Sd1FOYb4gRxzOjURbAxaziVQDviltIX6XHq4
 c7dXV1chNbs09PeFgqSvVJPLI+AeUX4KvDaqiUE8OO3ynJ6kR/Qr3F3iFc5U+40D
 oQwdaSVOrqNzvKHqcSDNMsa+mmpsGjYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YvSCKSU842KzUhf1L
 CRE65E1fnv+NK6PdKlIlrBasv4=; b=P1WnFAFFnm8D2e+2b0zfbIs5NtfVi/Zqv
 eB4pyQhjvsFLoP5Ko1Li/Gee+xIjtMJ37Rln3khH3WHrfgcfIdJ0jaUy3RXx+2Lg
 Su1+26M3dts9PaCQgCP3Xt1XD0YRwOTzqBy4VW9m3XT0Ehf8/vOBymdYjTOjIY7x
 xq1MkyQg4t7tJp22kqk6+nFthrqUPSTtUM/oAzlIFwS+SaoCEKASG7MiftlQmsgX
 HFQqMz2AxyK/brDuC1tTTuoqu31LS+fR6DWj/5buDmQiOdKu1H+eCyK2sNsZi4An
 d2svM5FvLyyVlhKDWA/s+5EpDqzbQi1UiERMD7M32mKNG/Ougl6Ag==
X-ME-Sender: <xms:SuEGYq9Up2Dm3DQXmA26el_nzm_9_wMSISTSaCYm6Qeii1qeDiJwHA>
 <xme:SuEGYqtknph7FQOnM0NVYyt_pJ694Zea4XQdpfgq84UGYB2aIYK2olonq__6JE2z_
 akKgZj1Ptu5Ahyj4IU>
X-ME-Received: <xmr:SuEGYgDX5liqCcPCTD0-uqdZe9Dlv9-beCysXDFu_Ax6wNbF0VGhisF4kX6phjhoRLiGw4QSYumImG8bFXBxAELO7Aq-Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdffgefgfeetiefgtefhieevuedu
 gedvgffgjeefheduteejfeffteektdelhefhnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:SuEGYif3VrhbjzMAesscHcS03PF8XG0vOzDobEPpKmJkhnj2sTRLAQ>
 <xmx:SuEGYvMJTIUDhBnPt14lzV4jHuDPG2htCjfPSVe5mWSb7bDK_ChmFQ>
 <xmx:SuEGYskqO3nohhsN_3OC6EVGHvHYgmOt2obWuf9QQVTRy-xaHhcOXQ>
 <xmx:S-EGYrBD34OycxYFW1mgRMx81So_55a_OvRH8Li6w5TN_TDPThYGHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 17:20:58 -0500 (EST)
Date: Fri, 11 Feb 2022 16:20:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH 00/10] arch: arm: dts: update Facebook Bletchley BMC
Message-ID: <YgbhSCx9qDinSAq/@heinlein>
References: <20220211014347.24841-1-potin.lai@quantatw.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xmU4fn0mtBe9neDo"
Content-Disposition: inline
In-Reply-To: <20220211014347.24841-1-potin.lai@quantatw.com>
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


--xmU4fn0mtBe9neDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 09:43:37AM +0800, Potin Lai wrote:
> Update Facebook Bletchley BMC devicetree base on EVT HW design and=20
> rebase sled numbering to 1-based for OpenBMC multi-host
>=20
> This patch series are modified from
> LINK: https://lore.kernel.org/all/20220209100413.23714-1-potin.lai@quanta=
tw.com/
>=20
> Potin Lai (10):
>   arch: arm: dts: bletchley: switch sled numbering to 1-based
>   arch: arm: dts: bletchley: separate leds into multiple groups
>   arch: arm: dts: bletchley: update gpio-line-names
>   arch: arm: dts: bletchley: update fmc configurations
>   arch: arm: dts: bletchley: switch to spi-gpio for spi2
>   arch: arm: dts: bletchley: add interrupt support for sled io expander
>   arch: arm: dts: bletchley: add shunt-resistor for ADM1278
>   arch: arm: dts: bletchley: add INA230 sensor on each sled
>   arch: arm: dts: bletchley: enable mdio3 bus
>   arch: arm: dts: bletchley: cleanup redundant node
>=20
>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 303 +++++++++++-------
>  1 file changed, 194 insertions(+), 109 deletions(-)
>=20
> --=20
> 2.17.1
>=20

Left a few minor comments on potential improvements to the commit messages,=
 but
otherwise whole series is:

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>=20

--=20
Patrick Williams

--xmU4fn0mtBe9neDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIG4UgACgkQqwNHzC0A
wRm1+Q//QGpQSab1LPXpRmbccPbMhY3kwnMBcOQ2Llp2NrnebTJqjVLaJcmWu62Z
bBCXv5Ag6mDXh4Y0rOT/NfPkZpzqa0F65WkXaXNmCzOwOWDc7GTOhXFSKD6bjbH3
84O4ZaVkczBWGbLun2C83gfVyv1nXuRSeWGJ0T0e9sMWUgV1TJPtSIQjwbv8ABFh
lq38vC51sibgumC542MUetQO/UWCr5YYn34CLBwRwQPgaK15rCjr++sgd+r8sh+S
O8SaeaqsdtMZfp+FpwY7lyeImhFE94r6qZ/bT7B+8AnP9QeC1rC2GnNrEHZKxT2i
Y5XOmIwb9VFh5Y7nl/i3zLDqTaqhw6k9F/HbLZWbwFLRSaE+4SCk+Dv/bfAjb9Jp
BAwlLZsa9S+dcJVeW2FxIxuWtMXvhH7xNFUnEBjaObvLQCal4ek5BDWydsvzFFzN
HpMukmUAOmIe3yhxAi6uNqAj7Xn1B0ZElsc3G7skO+oLpqRraU9Ss2e+APgKy6Jq
iDnXtnPsyW9C33nfOq0m5SVQHfRNlsnbG6Ez1nPZFgWcbLdYPo4+RLBYA/EPr66Y
UBDyxT5UPdSQIuaqyf/a31qAqP8cpV3loeikAq5Zf1lTo0tZ9y9gT8tByctg3PTs
Z2dZLZxnVKsRfwrdhppRk6ncUmN/XFMYo0/kJ/M9YZLS1kN+fgY=
=4x0h
-----END PGP SIGNATURE-----

--xmU4fn0mtBe9neDo--
