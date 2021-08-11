Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5213E8733
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Aug 2021 02:20:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gkr791rMvz30Fp
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Aug 2021 10:20:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=otc4PnNA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZSUuRYKC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=otc4PnNA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZSUuRYKC; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gkr6y43QXz3069
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Aug 2021 10:19:53 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4019058041A;
 Tue, 10 Aug 2021 20:19:50 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 10 Aug 2021 20:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=TJnR3Y1jRHyuvNKz98aoSVU7LBqrfX9
 Q1XFcqdbpwL0=; b=otc4PnNARgoLm1XBiDUZWQ8vgpp/dj0SeUE3PcX17toYGay
 SLVTUGVuw9SgBR623QsWDhaHx594itB5W6LGMjYcb3mRnBdj/lj4PosvJfI/lYwd
 cmAE+ZP7K9QckxMGAwQ/S/zSXaKpy0nCEooyyK0jIsErAs0fwu1WKxqvQkaR9fvX
 g98qBCk3+1W/H9N+9Vm0cTf7chZ4eqf7pXRulyxZ3907MoYBBPAhdb2tq0+3K5m+
 WWcNrQgnJf+wt+QcCAn9IEeqbpYGKvMSK6/A93kBe9ICmS5yWoO4rBEP+V07SJkC
 p0Osqu9r2ZTc4dUcME63iniXInzHVX2kM57MvCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TJnR3Y
 1jRHyuvNKz98aoSVU7LBqrfX9Q1XFcqdbpwL0=; b=ZSUuRYKCUqHRZBsFFklFyz
 IoHgNcnsC9GQLtyhUERApUoK46BH/NzfAV4S6U525WMZqiEOXYetQEXYnPnIAp85
 ZyxufUwGuO8RRnqOJ7ZY7Wk9EqYWIrJXx+xo/Bz9iR8PyRSue9rVt328dF6TNNPw
 0svbooiiaPdEDDVJXD37f2g9bRtNOGSd9/7K/BYEL16o/vxkZiQFNRQmqvM1E/mv
 xyg7jEup2VIfpm2odPeJK+/O2vFaYfknt/JRevmlQLqDz9K1r8yoiFNSCnMPjVjE
 yAbxejAhkjFF72bxuJBXVwZyXEYZv2Hy/BH4bW7iUjOk0lLvEeSG/xfMvobNpWUA
 ==
X-ME-Sender: <xms:oxcTYQMs9hRztGtED_kTlD9Hcik9VxQ8he7kjxErnKtRbIsIAAgxHA>
 <xme:oxcTYW-LFY09y7PMvujnBEg2srKUu_Pk66ylPyC-B5P6FIOeXFp9R2AlI-wgbVN-R
 YF4RRCeT-aFYmlPEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedtgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:oxcTYXRwJjHMLOmgVtRkmOHdavu-M1RbiUfLeo8UZQr3hZfrUd_8og>
 <xmx:oxcTYYuFOf7V3nLo1y0AdEiAKOREhvWOTQxNrL4tYYuZxSY34_nDSw>
 <xmx:oxcTYYeC4M5cveV0Zodk6hgp-e9hgtHBg80uctI2a5BcWp44JMLw8g>
 <xmx:phcTYfxd4nMtKVK_Jn7ebZTvlJPezURA6FbGPOMUA_o_pbQoLrB3Yw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 91878AC0DD0; Tue, 10 Aug 2021 20:19:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-554-g53a5f93b7d-fm-20210809.002-g53a5f93b
Mime-Version: 1.0
Message-Id: <96e52916-f113-4a91-b83f-e0de144611ca@www.fastmail.com>
In-Reply-To: <CACRpkdZm9C23aHTWs8DNX1RChSB4A-X0PoyW5wnH2XyQQeviag@mail.gmail.com>
References: <20210723075858.376378-1-andrew@aj.id.au>
 <20210723075858.376378-5-andrew@aj.id.au>
 <CACRpkdZm9C23aHTWs8DNX1RChSB4A-X0PoyW5wnH2XyQQeviag@mail.gmail.com>
Date: Wed, 11 Aug 2021 09:49:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 4/6] leds: pca955x: Use pinctrl to map GPIOs to pins
Content-Type: text/plain
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 10 Aug 2021, at 23:24, Linus Walleij wrote:
> On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > The leds-pca955x driver currently assumes that the GPIO numberspace and
> > the pin numberspace are the same. This quickly falls apart with a
> > devicetree binding such as the following:
> (...)
> 
> Honestly I do not understand this patch. It seems to implement a pin
> controller and using it in nonstandard ways.

Yeah, it's a bit abusive, hence RFC :)

> 
> If something implements the pin controller driver API it should be
> used as such IMO, externally. This seems to be using it do relay
> calls to itself which seems complicated, just invent something
> locally in the driver in that case? No need to use pin control?

Right. After discussions with Andy I'm going to rework the approach to 
GPIOs which will remove a lot of complexity.

The thought was to try to maintain the intent of the devicetree binding 
and use existing APIs, but all-in-all it's ended up twisting things up 
in knots a fair bit. We discard a lot of it by making the gpiochip 
always cover all pins and track use directly in the driver.

> 
> Can you explain why this LED driver needs to implement a pin
> controller?

The short answer is it doesn't as it has none of the associated 
hardware.

I'll cook up something simpler with the aim to avoid non-standard (or 
any) pinctrl.

Andrew
