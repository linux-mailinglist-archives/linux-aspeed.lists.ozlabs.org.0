Return-Path: <linux-aspeed+bounces-67-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178049B9789
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Nov 2024 19:31:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xg8Zc1sDqz2yG9;
	Sat,  2 Nov 2024 05:31:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730485880;
	cv=none; b=oXvHZkuLaNbkfhrB9WgGNkf0MieeY/IkO8O0bHQAga2/eap+CnF3Zj7bk+nrH149IBhr9C1oeV3MooBD0St2YAjqmgPxHLG0D4DDrfbyxS61A62vrnOWyus22Bfuv09gE3EWyU/SiVcSaSlnwZZDMpUM13jxN2uHNYsDx9kPOLSs1yKN6j++u9F+HPq4xm5XRXONtV0ObnX4Tg0AEWTdI+uBYgmvUpHHpNkeNsg86Af3/u3wnBdCObp2GzT7i5AAt9CKl9Lmkeu4iQNGkkZm0L20y8GHay/EDQzvB7E6alc1OfX5k3t7kSyRt2UeHv2XxUxQjf9FExAcS7JMG9rgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730485880; c=relaxed/relaxed;
	bh=trF5iyL1mDlTJho0oj7yyu6ZEf153IyrywjYMZ102E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXLDgH5jB3QSooyQSayjQjJ90micEzMgW/M6UQA8Yn4tFZhStXYOKGrNo5NOY+guN1QiTcs0P8w7kySC9xaJ5SSc5s+Kltpk5ly5sIsov07Dkn3sj5mivgzAGsHoDLoVxe0aTjvzMtkJF6a/K3LS5iFGLasiydkXA9vQMMos5HCN4rOt+7lPWEMJt/22DRW1Dek4In9CVuOSW8zWwzs1tjBHRRMWeljuNYh6cS/2oOXXiROLOt0mmtjtO0voQ8rmVWKJhsB+V2Lzw+PMXhvd6/zScBnGbzcmobRBGSVkVeB1xDuY0EAQnQTA2rlC+prnI8pS3KOksA8egEGgJypiiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=AzFMUpuB; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Y3HFggzA; dkim-atps=neutral; spf=pass (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=AzFMUpuB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Y3HFggzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 586 seconds by postgrey-1.37 at boromir; Sat, 02 Nov 2024 05:31:15 AEDT
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xg8ZW68Wdz2yDp
	for <linux-aspeed@lists.ozlabs.org>; Sat,  2 Nov 2024 05:31:15 +1100 (AEDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id BB1AF1140092;
	Fri,  1 Nov 2024 14:21:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 01 Nov 2024 14:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730485284; x=1730571684; bh=trF5iyL1mD
	lTJho0oj7yyu6ZEf153IyrywjYMZ102E8=; b=AzFMUpuBaqQSowX6azU+RejWM2
	wyDtPcAffuWlTQvjZTdW5xCbPQdHPRI7oSsB2q5Jub4hcziQYxC+0ni+LsREexF6
	DkVjErjJ6jWIgKliaHh8QIpWLnGPdIjmS6rcen/7SZKsCGe8ZFK43pl4NDeFp6f4
	8EM6F84JBLCJuALm1JIJcAwcInFwfL7hBYKiZgazW+TpidNPNTZi5Lq8h5NmCFzU
	i7nlVi49WjKHDEoJm8bSLcVMQM5LeKw1yFHtgmoLBkbMrUxUKXM/hEi1QcC0DvlQ
	F1+bWohoMAUkqxoVPAsgjRansJfXu5dmgCzU1kGGoGMYdiEMu4q1mRr7Bzkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730485284; x=1730571684; bh=trF5iyL1mDlTJho0oj7yyu6ZEf153Iyrywj
	YMZ102E8=; b=Y3HFggzA8Cf+GnXEc2itQv6bNdzGXV9LXv7LkmtlbalJtShsb45
	Q83Binl5HZuhhRjn52o83Xd2UeWwo80sZIaPMAHELceowEU4S7HQdk5zHQWpFuDA
	wNjLdlbgrlvLwGfow6j7DAZ1b6EAI3QIEZGFD81dAibSV0I5f1FmK3BVBVvXsNXY
	e3YyLzEt2EGep70iLQc54jEjKMS+0eYfonLPpSEdid5t+7FIjod56ICEmCDEh7bw
	5Z/vqQOShDWKECWDnZkuUozSBXAKdmNacQ3uX5zlxG+wy6PkZU5xuCgO+t+WrGF8
	bM8b2DZh4zWimxeszL9irPUKfJWPejpOF7w==
X-ME-Sender: <xms:IhwlZ-E3r9ZQzkkQzLmtGkxUNjVgdmMF1nIoYBzByHe4QkAAO9cMqg>
    <xme:IhwlZ_UMMb410UlAOtHju9p7NKx5ju5-L_FwIAq674dLj4Jt7WlWfcI1N5QSXo4Dv
    i9CKMICeH8AXpfbu7U>
X-ME-Received: <xmr:IhwlZ4L6wmtfVh-7Ekh4j12RujvpFUkYe59fmIlfRpqbF0fR8w-Rpkf8WYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    dvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhep
    rfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihii
    eqnecuggftrfgrthhtvghrnhepueettdeikeeftdevuefhheetvdeijeekgeekgfdufefh
    feeuteevkeeludeihfdvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghmtgdqrh
    gvsghoohhtqdgtrghushgvqdhuphgurghtvgdrmhgunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
    dpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegt
    hhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhope
    hjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrnhgurhgvfiestghouggvtgho
    nhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepfihimheslhhinhhugidqfigrth
    gthhguohhgrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvght
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhs
    rdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IhwlZ4Hh0P-sbjAofzrjUjvhmSJsy2ucVH52IDH7i8aU_MacgvDxrA>
    <xmx:IhwlZ0WuuZN4vDQLb4oL5LY-rnssf2zvfevD-RWUbV11ccmbimXTuQ>
    <xmx:IhwlZ7PNI7dDHD5EhPv2-zntEshkZ-WieccQv6MPxlVsxiqjyxOLqg>
    <xmx:IhwlZ734rnICFGBVWJ1q2ylBez6T6uAulwZY8E_gbtChialkemR6xw>
    <xmx:JBwlZ5XH7jXOPBijjqX88_lYe23wEXZdzuTLVKmVhgweafNvbTxZdjHf>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 14:21:22 -0400 (EDT)
Date: Fri, 1 Nov 2024 14:21:20 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, wim@linux-watchdog.org,
	linux@roeck-us.net, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Peter.Yin@quantatw.com,
	Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com,
	DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com,
	chnguyen@amperecomputing.com
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Message-ID: <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="30YWrylCoTEi3uv9"
Content-Disposition: inline
In-Reply-To: <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--30YWrylCoTEi3uv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 08:11:59PM +0800, Chin-Ting Kuo wrote:
> The boot status mapping rule follows the latest design guide from
> the OpenBMC shown as below.
> https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-upda=
te.md#proposed-design
> - WDIOF_EXTERN1   =3D> system is reset by Software
> - WDIOF_CARDRESET =3D> system is reset by WDT SoC reset
> - Others          =3D> other reset events, e.g., power on reset.

I'm quite surprised that the above is relevant for a kernel driver at
all.  Isn't "EXTERN1" a name of a real watchdog signal from your
hardware (my recollection is that there are 2 external watchdogs).  I
think the point of this referenced design document was that most users
of BMCs have "EXTERN1" used a for software reset conditions.
`CARDRESET` should be representing resets by the watchdog itself.

The purpose of this design proposal was not to require very specific
changes to individual watchdog drivers, but to align the userspace use
with the best practices already from other watchdog drivers.  I don't
think the kernel driver should be bending to match a particular
userspace implementation; you should be exposing the information
available to your hardware.

Having said that, it was known that there would need to be changes to
the driver because some of these conditions were not adequately exposed
at all.  I'm just still surprised that we're needing to reference that
document as part of these changes.

>=20
> On ASPEED platform, the boot status is recorded in the SCU registers.
> - AST2400: Only a bit represents for any WDT reset.
> - AST2500: The reset triggered by different WDT controllers can be
>            distinguished by different SCU bits. But, WDIOF_EXTERN1 or
>            WDIOF_CARDRESET still cannot be identified due to
>            HW limitation.
> - AST2600: Different from AST2500, additional HW bits are added for
>            distinguishing WDIOF_EXTERN1 and WDIOF_CARDRESET.

--=20
Patrick Williams

--30YWrylCoTEi3uv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmclHB8ACgkQqwNHzC0A
wRlSow/+Iye/jg2CYP74XxbljSUQyZeOx8XldLsjToFpmX1M0NWHxbdC4wK+YXdS
t2E0NVWhfQNf6LMJtyNgcbjOtQgkI7RCiLfujmeytJTrReN3DEOSsbZmo8U+wIiD
vUzORLpW1qMP8QDfnuNh0fhxNvOGaiR2usV7ZnfQAh2T4IiS91KT+kv9b3RGcaRn
awzwSu8nZOkB+6sRs7JZKyIASS+gQ8Xxrk/o6Nhqy+kdVBXe0yMWOq6l1UezJ6qa
l7SoSLxqG+G3Y4/7A4O0zM/z178a02KccqZyeAnM/OwjTIskf1s8f2yZDPOodN8O
SsuIWOkKGPiFZtGhyKZqAXfT2XnCU0OIBJl2FGY7QsbZI7oe88Hs/zsVg7q5i7iT
r1LffFB7mfuuAADVMkff1Lzmn2wuXfO7yVuoj1hlgoGJriLhletsoqLiBHhVRQSL
5CMBZU6j8B7xbBpKl7MrYWaftPr87Crm5TZgEuhS73J/Y887PuyYl7SKF8NTbQTa
d+0mJ7/gKsRYBSXzbeniOwR49uC7FgkFaf8ghh1lbJQToawg3A8p/UwBVnYWRB22
/4fi+vTdXVNFTg8KYBtNbL4K7WgfgQac+iqpYYNBYZSa/Mfm0eSU8XVM/x/Sx6O8
kfLSVldxTUgqePexvjWNgvJY+Uet8IjvYWT1CIqDvJ/5dXlvZB8=
=kxlo
-----END PGP SIGNATURE-----

--30YWrylCoTEi3uv9--

