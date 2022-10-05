Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE55F59D7
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Oct 2022 20:26:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjNLS62Rlz3bnM
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 05:26:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=mkUvKxPI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qhE4RDWj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=mkUvKxPI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qhE4RDWj;
	dkim-atps=neutral
X-Greylist: delayed 304 seconds by postgrey-1.36 at boromir; Thu, 06 Oct 2022 05:25:55 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjNLC5R4dz2ypV
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Oct 2022 05:25:55 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 10CB732000CC;
	Wed,  5 Oct 2022 14:20:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 05 Oct 2022 14:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1664994044; x=1665080444; bh=WAwiYj605H
	lgTSthgCJj1Q+rcJTLIwJfhihqfZ5YC4g=; b=mkUvKxPIeHG4i8RqtSxfuiMGvh
	AD0imCgM6Fv4ZysippaiKWBfQvh/oUJtXmNqqeZ6Qu08PFKRIAc0s5Se+SDzM5zv
	cGHsQ90MRq8asJgeggkb7VpNwbSrKTnWr2hw8VkLQsQTJE+jEbg4Etzn55OTrTWw
	oXQrVGvUOWGaqwRgbnAs0kXX0gUfenhTj8VSbkQplPrBoRAPwty4zGVCCeu3y1FQ
	Rp3ZOccrrI26cEMHLIyTw+P47++d1M8CIZYXdHJXy8THCkrtzvIK1B8SxIFCUuzE
	4Rfv47+UK0UgNyFcBxSebZFLh6Yp4gbw3by9fBHwvN9g/ZJbXH8gIbO1eXTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664994044; x=1665080444; bh=WAwiYj605HlgTSthgCJj1Q+rcJTL
	IwJfhihqfZ5YC4g=; b=qhE4RDWjRWN7vsXFa1on8tHhvLyfZ9I9lSzNqI4NpdaD
	ggnF8cl+SGj0G9+D9Le6ZINpxSWcwUfO9JGl1qXNau6ASZ+GfWIRDd5kyhgXorif
	WPpDFfyYpXbVm342A0NKjx1ZFcGpiFQQXycq59qxA97+yL+3zjAcbJ1/bIgpgQzn
	QrFQRs5maxANlfmj71QjJammvenDdiJkjYH8sADbbfbAzExeJY9wvSoAC3mF3WaK
	xJGxiSiS6tiHowG1tEl6MYngEjQV8WW9+dVYqcs1RpugIcDPGvaG/LeHhJXvRIOr
	ZiD7q3rB/dYfDKu2hptMd2B+ghe83K5W91C7DSJxmQ==
X-ME-Sender: <xms:-8o9Y92EgClbYnPOquXUe1QFcEVtyfLiRGLyX1OJes0T90B6KRL8gg>
    <xme:-8o9Y0E8yYx9AJWxGAI3aexN5N-R6X2GMyYGKDrRtMDeeW3fWi0WmhzQZDMWUrrJ9
    T8eTZjfbfhdzWDzbgY>
X-ME-Received: <xmr:-8o9Y95lHZ_iyUrVNBCkW84xw-wsKKuPMOYDEFSrDDvx1Pdqxbgr6cGiRfzRKbztxagCzUcDTgQYi4CPrI0VayfvK291UwiV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:-8o9Y60_ldqL5k_l5TD2-PsRBZZida1DWPlz9IhZIwru7sOmWJ3Znw>
    <xmx:-8o9YwFPgR4jkxWh2DIAt3YfpGfSJ5uzrqbNzGjPfBrH7qcIEkX7nA>
    <xmx:-8o9Y78l3F0J4vqZa-4SkOvBtYEW_xOdWK7SkzxyR5egA_lcIMidbA>
    <xmx:_Mo9Y71YbvFJPW-y11946hGkoI5GqRGqgvwtXfsLWxgmqpDWAhlPGw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 14:20:43 -0400 (EDT)
Date: Wed, 5 Oct 2022 13:20:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: bletchley: Update Bletchley BMC
 devicetree
Message-ID: <Yz3K+fyTr6YZfNV6@heinlein>
References: <20220929013130.1916525-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QL+o9jTYRYz5coRp"
Content-Disposition: inline
In-Reply-To: <20220929013130.1916525-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--QL+o9jTYRYz5coRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 09:31:28AM +0800, Potin Lai wrote:
> Update Facebook Bletchley BMC devicetree base on Pre-PVT HW design.
>=20
> Potin Lai (2):
>   ARM: dts: aspeed: bletchley: update and fix gpio-line-names
>   ARM: dts: aspeed: bletchley: enable emmc and ehci1
>=20
>  .../boot/dts/aspeed-bmc-facebook-bletchley.dts   | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--QL+o9jTYRYz5coRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM9yvcACgkQqwNHzC0A
wRlYyA//bXll1taEF4M7taxKGpVc4W3CmG6QvbBUNcseUGbd5LaA3yBm0xQ2nm3Z
U7WTZtuxZaDOhF6pgp2f74NUw1Q69w9hdw2/vMLGQb3UdLRoGF/HOSW/Ea6W8Woz
eJ/rkNXoGxJWhWuMNPExqszjNDYS3gUabxzvCRbjf16iQbDlZMq2Asze2lIb46PU
+vVR/JPJeimewkogjYMM81oyo5wwoFuLcEW//jrjAtiH87JeO41pZEJO6AC08DVS
YUvP3D6aJS6fVC7zf9F2ooWLthhGjawW2akOYlSTpwmADOT41MHluiQOyBwbr+Bv
8/6dikpi4PtNIJg7PZKRVA2hsSlOcP3pYLLdCEjkHG84PtaonwZL7x+QgR1GPu2c
+phkD9J00Fvju2FIZnZdOw21w88+YepHNjZ+RrIpSE25t5vfd19Z8kqtthh2Fr2L
whnZuX7r7xnnbNwS+ITvqj6qVWRw0MReozle96mqLW5m8Ejejp6GT81j5LhvF5Sz
SSqPm3wcC5mynVZpwIwNg6H8LoStghZnAO80nqMkQbZp1t+DvKB8YHnkqmAMOA/H
SLM+SQW3EKSCS1VpnfxjSl7how8RcwFRF6EBQBoYrjsplKnZkfas3W+iCEYM1Iro
0nHNIStpS8pqbEcXEtHNHCdSb5LlwhuTN/DzHLenaoywBHB1Sw4=
=yWyk
-----END PGP SIGNATURE-----

--QL+o9jTYRYz5coRp--
