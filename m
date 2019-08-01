Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D87D503
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2019 07:45:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zfQp4bl3zDqfv
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2019 15:45:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="c3dr1lWk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JsKzzgmp"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zfQb6pyczDqVd
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2019 15:45:27 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A69C0207E1;
 Thu,  1 Aug 2019 01:45:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 01 Aug 2019 01:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ikk9XWI/PaloHpfzYfJtJOTFwmWnC+0
 JCdYs26D7ubs=; b=c3dr1lWkMo5FSBT8lrLsCneT0ER9KaOWAen1lPJ/wlWkYD+
 F3Kmfml5a07j1yCb4s8Viy1CUWnpejg8CDu0KA5iTw0nSF3qC7NQqTV657E5hVap
 pSQR1Pf8Wgou7XoLYuZ4qudaorYvMy2xrptaEvXmVTht1kW1w+Mlojv60ywB12bb
 fG3Ty3Chl/dMWLtjwoB60usxxKlck9JuHYL/HAknm5ol2jNCRQ5QTYFofGMDSADH
 Ac94iEGVdzLwoG2YqlB6AaaGfl2OrzOspnvLtYBwBnn6hLF/M4ka+HvB4iDZ747J
 zM/CB4CEMMtecKqqIkfgoBojRQWHoJpIvIbgVzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ikk9XW
 I/PaloHpfzYfJtJOTFwmWnC+0JCdYs26D7ubs=; b=JsKzzgmpM0pAwDfOFWmIwy
 e/gkpP11y8xh4J5E+5Un3MJJvj6+kBcaPZP6NDENM20ed/dJYPGZFeLMRjC9jV9X
 Dqrzgn1S25oXgX+lx3hf9cO9axVEH4ivwRWfGifTyqdwomgpZaCAnnG4eYzh6scC
 WIpjXLemDL50BI5V42NeIsfdrFSHHHPKA0FMw9/q9JMWSnVRRIJDTq/vTUWsrFkc
 YV0dqm+NLi3r7DQRmDFYyBAl9XobaJM7ZdBMhEBMGsy7REetXwiVStDKkEooTKHq
 ChEcckQ+d2OGXGZEJoz//Q4vQqVL5ncl0+2LNP122XoQgPiLUHWgzSIMRn873jkw
 ==
X-ME-Sender: <xms:cnxCXZVcGZ-455p_bs-LgSCuUcxEUsQjAFwH5XFLyD8cPPPD-UFwCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleeigdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:cnxCXVQZ-SI3cyKIbEqkpWS00qvrgEQGxGZ91gMOKDy0EMzP2EVh8Q>
 <xmx:cnxCXQGaiX7f4V_3p0_o7VOwBTVPNBIzU41xNJjUBySxz-berHYqVQ>
 <xmx:cnxCXdS_CSb-UN8ZrY2Xcmzsmy8hJzu_ASfyRT9L9fSYSMOPNs8M3A>
 <xmx:c3xCXYeXDra6wsCCxx5QzKiSgLq2LCV_21ukNLHu4uHAyrtgDo0zLA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 67318E00A1; Thu,  1 Aug 2019 01:45:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <3691f6cb-2451-43f7-9f00-d5693071ba59@www.fastmail.com>
In-Reply-To: <9d0f2b20-e6f6-419c-a866-c4a0dd92aa63@www.fastmail.com>
References: <20190724081313.12934-1-andrew@aj.id.au>
 <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
 <9d0f2b20-e6f6-419c-a866-c4a0dd92aa63@www.fastmail.com>
Date: Thu, 01 Aug 2019 15:15:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 30 Jul 2019, at 10:27, Andrew Jeffery wrote:
> 
> 
> On Tue, 30 Jul 2019, at 07:23, Linus Walleij wrote:
> > On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > 
> > > It's probably best if we push the three patches all through one tree rather
> > > than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?
> > 
> > If you are sure it will not collide with parallell work in the
> > pinctrl tree, yes.
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > (If it does collide I'd prefer to take the pinctrl patches and fix the
> > conflicts in my tree.)
> 
> Fair enough, I don't know the answer so I'll poke around. I don't 
> really mind
> where the series goes in, I just want to avoid landing only part of it 
> if I split it up.

Okay, it currently conflicts with my cleanup-devicetree-warnings series.

Joel, do you mind if Linus takes this series through the pinctrl tree, given
the fix to the devicetrees is patch 1/3?

Andrew
