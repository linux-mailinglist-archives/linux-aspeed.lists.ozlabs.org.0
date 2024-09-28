Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0233D988D9E
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Sep 2024 04:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFs6851gVz3cRs
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Sep 2024 12:41:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727491277;
	cv=none; b=TQxduhSTdaALRDPj7X+l7Y8BUUWQ/rOAlEU5x+cDDw1TmZnegohZN4S3pNeLnEIFQKrEcJFtC0GALMyEDYKK0iRFNDalJr6NyMRRHUU6JuOysziF/w1DuV/3FQjj+DY5QITgYfFmJ/fc5UH+94MeyJR2AxAD0OsMWm1TK0zzkOrj/UZJaTLR8+cR/kLFqGjf6QpCItSbRyuL7+q35pc09p8MzCz053mts99Vxl1Hxvv45x/0AurCvOGUPNzh9WTDSApzoCr/R/vUw0jwXkKWSmQ7/UBnqupcCWJ1xj5eOnKzxE+oDCxyxWASEi7nnxhwnfDPkqwo144aRiCJSzy0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727491277; c=relaxed/relaxed;
	bh=U16jMjEN3o91EK9M5P3qO8Yu0T8PNqWRntnLHRz8uow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEsVh0wzX7sAFRRvtEKoCb08ovNl7LVsxs6EfIHiyJ4h7i0yjigGvHhdNlMZXpFfId93VO/H1VkzWBROY/EzmI3pDoGTwELMU304ifMB/GE94t3ktkQynNTg29OGOUfJYL+eNlehgwlgDsHbt3Ju7k7q5VQAwdnk+RfUUhyFbbbYEPLucDhkVdotZdvyykzwq5u6ADvI7iBsD59c0oaP9rKdN+kV6/eYKo+eYBGtsnjPKQgZcG/6P1EZW+SuOMZgR4p9Rw/TqUCoqPI9mxJTiIdYO38dBc7ST56BPj1aIfB6QX6exzg5vgYX/hZbBdjQFh4ZuwfIFcsTbwc7RgakKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=W9q2j/+D; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JwLn3Sml; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=W9q2j/+D;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JwLn3Sml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 469 seconds by postgrey-1.37 at boromir; Sat, 28 Sep 2024 12:41:14 AEST
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFs625jlNz30KY
	for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Sep 2024 12:41:14 +1000 (AEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 190D9138013E;
	Fri, 27 Sep 2024 22:33:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Sep 2024 22:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1727490801; x=1727577201; bh=U16jMjEN3o
	91EK9M5P3qO8Yu0T8PNqWRntnLHRz8uow=; b=W9q2j/+Dh0mRTa/gSw9482qMMM
	BBCrUk71jKJntWKW75705styTSjgNzIv/ybwIk/NbCMirc6TpMeOA/Uli5RK4kCF
	keKa7eBVLT4tU5wbLFN3Dc/41uNqb74sauhjTX2dsLg3Vn6XXYTZakpv78yPsmxM
	r0afIGUS5f6LJ8ujLooE21PqEfavjfSJeyZxc4Jdnw/vs9SOQ6WPxFmupGh36O3W
	3OO/XAluhA7PYjP3r8rfcrBGbykHJfPFK50cEuFisu//EAbDWc331NZcAh5wOAPy
	UgrecwgiZq9BxdlUN5Z8pZlDKgtUoPjh1qfNs7Cm7hL04wZiKQ9s0UOqjR7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727490801; x=1727577201; bh=U16jMjEN3o91EK9M5P3qO8Yu0T8P
	NqWRntnLHRz8uow=; b=JwLn3SmlNNNbZ30EP0RBJXv0SGZQk9oIF6/seslJjbof
	SF8HIlZjoSYDnHazZXyV+vzvMQNhbnV/HgZMYrj44lJIn0XLMdLZZscvkFhMV5GO
	wsdrWvaPfWYNRJz2N3HGcWw2shnjNPvdNCcEQtgVbKI1hIT64KZqinBgxWAol0Td
	KUF/WJ9/xcU81DX949N+nRuhVtYb4tVD9Loa29OKc8nEFSGNKJheYeIi8ZESjyIv
	fE40x9OL3u1bES2BeFt6mm+GoZP1XS6SwG8pASa/0VDuDIFQMQxftaNcFjSOR7YZ
	iDtBmZTLFkcHr1RkyhXRV8wM9St+/uuLDMk8DpTVmg==
X-ME-Sender: <xms:72r3Zm877f7aa0EdZbuxnxp0Ke11_k9TEv1HLX9_CuHBlhPSveXVgw>
    <xme:72r3ZmsksgLTPPMNtIO7yS68JAAKWDAga-xt-ziT6jhrPzRO3jIKg-3pJx6dLeveB
    wZl5ieyDD2jz91eRkc>
X-ME-Received: <xmr:72r3ZsD7lYYAeI3_dzW7wXaLMoQrWH3has_sOldd9lsfg3tZIn4-aFIa0ks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddutddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeej
    heeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehs
    thiftgigrdighiiipdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepuggvlhhphhhinhgvpggttggptghhihhuseifihifhihnnhdrtghomhdp
    rhgtphhtthhopegrnhgurhgvfiestghouggvtghonhhsthhruhgtthdrtghomhdrrghupd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtohep
    rhhitghkhidrtgigrdifuhdrfihifiihnhhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hg
X-ME-Proxy: <xmx:72r3Zucc7ue6hk_tsxZJr7OiFQGM5fVzr7LKnkGklEwyUlLYiMOj9A>
    <xmx:72r3ZrOckeE2FJcElDzjWjnJp3td2mC3BTTKZQQH3nG8aAw-5jsi4Q>
    <xmx:72r3Zokmsw12VYSwom7oOKcJYKdylb9_HZmQFHwUvG5f7FAViZJQfQ>
    <xmx:72r3ZtsP0JAlRA7ja9K_el2a3Fh7RV-Wpi8iCPPJpFWYrdy0PRDEoA>
    <xmx:8Wr3Zontc_WIk1SWfGEE10s0jaEHGS-rDs7m_KWF6qcY0EYzamFw0F9q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Sep 2024 22:33:19 -0400 (EDT)
Date: Fri, 27 Sep 2024 22:33:18 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD IOE
 on Spider Board
Message-ID: <Zvdq7o6NFXRVCJqX@heinlein.vulture-banana.ts.net>
References: <20240926024133.3786712-1-Delphine_CC_Chiu@wiwynn.com>
 <fbdc9efe87a1bed9fea7d0abaf955aa1a3dc24ac.camel@codeconstruct.com.au>
 <TYZPR04MB5853B51141F3D0610D970265D66B2@TYZPR04MB5853.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hSfDXba+Ub+nJ+df"
Content-Disposition: inline
In-Reply-To: <TYZPR04MB5853B51141F3D0610D970265D66B2@TYZPR04MB5853.apcprd04.prod.outlook.com>
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--hSfDXba+Ub+nJ+df
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 09:24:11AM +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrot=
e:

> Would like to ask should I base on the openbmc/linux repo to create the
> remaining patches that have context dependencies and add the lore link
> of the those patches that I've sent in the cover letter?

I believe you're trying to get the patches applied onto the upstream
tree, so no you should not base on the openbmc/linux repo.  That repo is
a 6.6 branch.  You need to base the commits on torvalds/linux.

--=20
Patrick Williams

--hSfDXba+Ub+nJ+df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmb3au0ACgkQqwNHzC0A
wRnAhQ//XxrZHbFUlNyP/xRc1TLUJNby9aMAX2znwLHml4QgPpbR47qu7vsMneOx
HGnIXsiWVugP0x4Q93ozxrfAXO1wTyM0GRBg3Iew00Fgmekp/kkfNKrbI4xjXpmy
xK/LbmYEY+a+/Rki3ekWsLmJ+ExZvsPFMdai+WBxaUQaEbnNyHhWk7xE2W5juFfS
aSkhkLs97Ef+fMtBQjEFjZ1esEvlXGBpMLMDq+Hi+u+J0/jYu/Ip8lW+fzGD7kUm
xWDD+fE0TmUQO/8G4qhox9r3/yzLAsbu+pn8GPJE7qIy8nJW61y3VAv12m+xmROM
bHOiTTYJlGopmBbwbLG2KkeDeRKGG6KiDnPP5HfhPIVsOHgpiBtPxwnWpbGGwmM2
atL8kkz7FYXT8QOhyWgPR4+dmaDGlm/INcS7JCeJZMDLBbmDdxaR4d//7XkLBU3s
9hxIuNnSw1V4l8lYgwTG+YSKhnLfmZYxb2G529f5XBOCun+IxIJlqV1FWLrHwnpO
XgpqTW5c1AYvP01C/eySBlN5/e2Ksn2mXYmkZJ8E9Qi2JIZ38XDpStdRRlV8aRWZ
Y6PtyzuZC8m0tnNHPekbYCCZsBTAJeo2dItP28pSfHA20657kM/47mfYpZ+pwuoZ
G87JMVQ8mVvswlniL052id82uejdOhilWLxYVjwOV3A44yecCUo=
=cWYx
-----END PGP SIGNATURE-----

--hSfDXba+Ub+nJ+df--
