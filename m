Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F19481DB1
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Dec 2021 16:30:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPsf45PCcz303Z
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Dec 2021 02:30:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=goitL7zo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dxwZ263E;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=goitL7zo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dxwZ263E; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPsdt5MHTz2yHP
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Dec 2021 02:29:53 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C2A3F580390;
 Thu, 30 Dec 2021 10:29:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 30 Dec 2021 10:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PeK1SwXweHmcMIKsN9xO7bPrTKl
 nfkcB/zGp4yM0vHQ=; b=goitL7zogb3Vw5mO8T4AogbyHlIDbWk2FLpsCFlokbZ
 wUiyMvqyN3bUU4seHo3s/1NQecupaSATdoowyCZiQ5AyyYUs7Zh/vFEnkbNt6fGX
 wIpQGT5Cte1/1z5TYGviRQYUyq1y+KYZqBJdUW7gfvBddO7vTI9WOSCuhcAYYcyH
 Bu4QB0Y5fdxG3tB3ZGvWrAgX4Wp4RcRWcsMjHofciX9Io4S6JMIT9klzX9h1mIJK
 PxILJsHrZmTm/+R+L/GuVkiha3Yezmwavh+b+FiyB+HxNhEMnh7wjEP6rs3pjR3Q
 gu25R0YZBzKfHiW5M5/rta05RV8VqRsXIWuaY94lSWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PeK1Sw
 XweHmcMIKsN9xO7bPrTKlnfkcB/zGp4yM0vHQ=; b=dxwZ263E5RRHIp1OW0yVNi
 twOowHLYXvXYaRj+tsu+q2AhVWTDsPNPSTwAJl9Xekq9a+6/4/E+gajpcczQY8ay
 VOzEaqQk9vTPuw9BaMB4v+/eb6Pb9050tt9MdM8jJWMwq6K6P+Rkvr7v/yIG0CIv
 7BlnHGA2c9h+1G5unRLiJWnW98+DDM/MxchnYbXkS+FU3EysKMMCs0cKOHjMSjyJ
 7BfRkmqXA9Gnm/5JJzBIhEfnQf4VVR2xnsJlmvV6Spi0+H6F5FXaJP443x3c3O1n
 txOO6w3/mf9R4DUe7Ko9Cb1Nd352XF7eaXLDk8RZBUb/WMWBIvW9apBmTCMR7hew
 ==
X-ME-Sender: <xms:bNDNYWghxJSEidgXtm6XlZXBKucEJ5pm1UQzI0yffMtaVAinEfDGoA>
 <xme:bNDNYXDFW9GT3OMKXCaD-KBb8YsoPXi08_dvDXnIM1VBf5AtHUabY3HqtgVzJgylB
 -1ECb9qUwQ-MqzUP5Y>
X-ME-Received: <xmr:bNDNYeEIFrIIPZxYV8PEqPRTfksppzRylPcR8WU8bR6ZbI7nzUMKCuxWHHdsCfVOaSaMMinQzV9N227i5ju888x8BknM3BKdKs0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:bNDNYfRZqzHvxv4sHDpM1995lKHO4q2UjDa0zRx6LsGylUe3_uWv7Q>
 <xmx:bNDNYTxJ-tkgjSJf4jhD-nptE-FtqfgAX99S-VyTP31UASbBa3FVDg>
 <xmx:bNDNYd6yk7mHJ-FtnDGXAaQQVWqBVnk6lpWCA7Stq8Y-fPGTRMJ1yA>
 <xmx:bdDNYWrJX8UKRkPIjArH9zi1I8Qz9C53cJhMwdSwQne_LuRwBT7pRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Dec 2021 10:29:48 -0500 (EST)
Date: Thu, 30 Dec 2021 09:29:46 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Pratyush Yadav <p.yadav@ti.com>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <Yc3Qav+ULNdF5zRT@heinlein>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HEhOyDGNPr5K1QDH"
Content-Disposition: inline
In-Reply-To: <20211229173411.l2bipmi4x3arqjoo@ti.com>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Potin Lai <potin.lai@quantatw.com>,
 linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--HEhOyDGNPr5K1QDH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2021 at 11:04:13PM +0530, Pratyush Yadav wrote:
> Hi,
>=20
> On 29/12/21 08:33AM, Patrick Williams wrote:
=20
> The patch itself looks fine to me but we no longer want to maintain=20
> drivers under drivers/mtd/spi-nor/controllers/. They should be moved to=
=20
> implement the SPI MEM API (under drivers/spi/).

Is the linux-aspeed community aware of this?  Are you saying you don't want=
 to
take fixes for their driver into the MTD tree?  Can it be pulled into the A=
speed
tree?

> Could you please volunteer to do the conversion for this driver?

I'm not personally going to be able to get to it for at least the next 3 mo=
nths.

It looks like we don't have a dedicated maintainer for this driver other th=
an
Joel by nature of him being listed as the maintainer of "ARM/ASPEED MACHINE
SUPPORT".  I'm not sure if Aspeed themselves are planning on doing the nece=
ssary
refactoring here.


Joel, are you aware of this driver using a deprecated implementation?  Were
there anyone planning to do the reworks that you are aware of?  I'd like to=
 get
this fix at least into the OpenBMC kernel tree because I'm seeing this fail=
 in
the real world.

--=20
Patrick Williams

--HEhOyDGNPr5K1QDH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHN0GkACgkQqwNHzC0A
wRm3mw//YWhGsoq3nvfbqICOBABeacq8/jETQMaKxf8gyrjUq3wiv4dRedTgkLUz
p5qJkV7CRz1rjKYs/DDokUVdOS3xUvW3N8D1pkNA+OyZ2u+XDSAByGdXU++8uBdC
3aueTRa8W0Cha744JYGvipggXqtW1g9OHug+AfRrTDtUkv/YXVF9PHw2hIf4oqk5
wPypiUYKdCrjzTR9BM3s9gEGJIxSqDcBmHbycoqECB60AAoNk148B6UcKD48rKlf
UZdhvt9eV5YlHdCM0XIM9TcrMvpVuRxxaO5exV0ND1fzWXlEgwlBBwvqaI+xTFQ9
ojyLi8D0IbDDN+e5JYDFZqAPqkzW8939tdfOFw1PgoJIVqF+7gbIoFNMqn3mMbYO
JFBOcJSRC8NsK64WHr582OX+I1b9cGWEVgtqnH5/0QbKxIqPzpyFn0X+Pf43YeX/
U7czaxM+yc2UhptT006hhe4X+E5KpadMGspxpLaKo7u/UEJMw+24rAaXyvQoU13B
WBlms+AQC0TzbqpYbC60cQpTUkLiDhTXoEFMDOy9up49OrgHp4W0uT+wZOv5iboe
H37VdpZeQCjkcldIti5iG0FaPpGCjHQcexCdIP357U19qPUK/w0czq5jZRv1wekn
VJ5IdlTrh6H+FTkdk+vKeXkhgiBlaGo30r2VzMNG9dP2qpVhuw8=
=xdO4
-----END PGP SIGNATURE-----

--HEhOyDGNPr5K1QDH--
