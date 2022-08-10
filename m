Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC858EBD5
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 14:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2pnV17mBz3bPX
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 22:16:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=SXj98chv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=C4MvPgfF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=SXj98chv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=C4MvPgfF;
	dkim-atps=neutral
X-Greylist: delayed 570 seconds by postgrey-1.36 at boromir; Wed, 10 Aug 2022 22:16:02 AEST
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2pnG5LNKz2xXS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 22:16:02 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 9E6DD320016F;
	Wed, 10 Aug 2022 08:06:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 10 Aug 2022 08:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660133186; x=1660219586; bh=3XbRmvT48M
	pdRH2ywGW3ehrhy3CjGTqx3lHdeyY6c4c=; b=SXj98chvzemW2+D+giV//Vm4lf
	r0EJ0mMccOw9xMl0/NXENd7eVaYfQ1DK1HRkBEM8KjHAlXil4CEmBiGCrwPNC+Kh
	hdahInc6BNxj3+bgqo+qiQy3a2MuRbkMaVbxVTTfDDjaHhca/P4swZ80ycTQgIP0
	604VoWI9WvUmBiGdjB80uacucJML0c4713e0o9R4bdQi+56kcU9DYg0uRw4eglis
	qbIXoi+9w7g/9+gT5L4L2sgjwhOahqygyo/49KVLLkeFfHhp8A6o7Qoyir2X+5Mq
	6W8dxW2k7Lvd2qMAtmeEvB2tHGjRBgChap1El0CZI2m45ugdRZyf9ZnTNU6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660133186; x=1660219586; bh=3XbRmvT48MpdRH2ywGW3ehrhy3Cj
	GTqx3lHdeyY6c4c=; b=C4MvPgfFs+BmCzMgV9dR95NpWJBJABmCxPG4pWCiPbl8
	69YgY7X/ywibwO4u3aUcngLbqOzs8bw21VZCUnAL0Cygb1IhJYA1Icdmur/WTwY9
	ZUaVmJft7S26teaKS62PW3J3/L8qPLjkznmRb4g/7odmOU+016c0KvtzVpEX/zS6
	WN7g2aQTWccy0801bi6LM8XMO000IvULM4v5i5APIsjylQiBS3H8CJFnB9bV2vws
	guhzECP9VxdGWjhW2ZkXygBD2cXmpaGmZBfOIfUo8r07ouAKJPaF2z4GA15x/+8M
	n+YsI8Wx6HrhkiiKF7gyhHuDQquoswTwSrBhaOlrKg==
X-ME-Sender: <xms:QZ_zYkgQaZkPKw8JtSWIBwz6vNWku9vl9MqjBGGpTZmDOxuBH9IGmA>
    <xme:QZ_zYtC6snDGOa6mrvRLMdy-93orr09baR-9wBpGI7lADlAMHGcJ-60FPfcW7xTMv
    e7T6SKMXLtuWmKksvA>
X-ME-Received: <xmr:QZ_zYsHCEB9z1_b6YnGWuGDlnFmEV7roc5fGggXpgEBZ9ATbMG-C-ywEv6jOscqBEtAsdma45N1f4GAoa7mds781xm0gNAbM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:QZ_zYlS-63UCptcj1fEp1ZNjvHjt0bce7xWTP4hogKk2rjd36sJxEQ>
    <xmx:QZ_zYhxGE4xrlLKojS2ICOQ-aNFMEGNK5xqvKbKHU2bBXS0lywT51A>
    <xmx:QZ_zYj6e6F-ell4eS8bcMiK6iLM9_30ZCoMFOga4emjmHKycLwVd9g>
    <xmx:Qp_zYokX29Hu51nRVBWwF7ZxD-zykgNnZehGy0mL6zPu1dJ67UE65Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 08:06:25 -0400 (EDT)
Date: Wed, 10 Aug 2022 07:06:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH 0/2] Update Facebook Bletchley BMC devicetree
Message-ID: <YvOfQEqj+XsYkuUH@heinlein.stwcx.org.github.beta.tailscale.net>
References: <20220810004338.329832-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DZeXxxwZnmqG9svL"
Content-Disposition: inline
In-Reply-To: <20220810004338.329832-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--DZeXxxwZnmqG9svL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2022 at 12:43:36AM +0000, Potin Lai wrote:
> This patch series add modifications as below
> 1. add a IPMB node for USB debug card communication.
> 2. remove hdc1080 node due to incompatible 2nd source (si7021).=20
>=20
> Potin Lai (2):
>   ARM: dts: aspeed: bletchley: add USB debug card IPMB node
>   ARM: dts: aspeed: bletchley: remove hdc1080 node
>=20
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--DZeXxxwZnmqG9svL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLznz4ACgkQqwNHzC0A
wRnPuQ/+PcGTpWhfDtWXamXrYywWWaX0ZK9HYuuwLnUyBv9SR9TL/MNpX6i8mKQ4
YyY5eiCc9Y9WDlO5sqc6rNluye39Yvo9C87QPRWNj0tjAm7sGwKMl0MuKLx0G0sQ
9l5Bi2I3MX6XRKnn1F0O/XlAoaG8vwSwK+9q+RYc5tqeZ/lZ5Creh54Egrh234gz
v3nbGIoN1dIkJFwOScUTzz9SPv/i2jLIzIFJ8yrZ+uDa0gOYLkQVLyRXSNKnFzHD
taWGhCHxEokkap+iIPjeWtzUgSli7Z/FsBwqZjNLPXGTbH1KxILuuB+ehrAqwXe2
yBgKVum4GdFLG2/7AEJgd+atBHQ9RadrrY3ufELtM8J5Bi29qs1jG1yRklqp9r3N
8c8zhU52qQXgMYXEQg6XIzXxZYR/qxb6DfebUJXBvJCGmr6fa3JrXmoEveqcWGpH
KTCPN8SeziJ7yoFR5nu8NTCg/mLQ5aXi8OefTMQI8hxi3MpdNV+TUf3JUsRhuDbn
lSQJu8MW7MFtafta+Xw2ljVQd8Wfwe2V9P3r9cDfXJZtxawVs2RJUjmjcLhutk/v
lcUY75KCnpUhTsdxtOOjWVfO8XMQVZ+JzqugkbkxrlbamFh8D6cjtvZu+PQEq0tW
f5uhyZhUjOYoGRN0borG4VItlm69bpUeUKOgbYbbfmDfk1CB0HU=
=egzp
-----END PGP SIGNATURE-----

--DZeXxxwZnmqG9svL--
