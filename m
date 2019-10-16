Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D370D8FC4
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 13:42:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tVlq2MqNzDqpp
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 22:42:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="n4kC1/vi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SzVPxq8F"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tVlZ0yLXzDqYC
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 22:42:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1687B5D35;
 Wed, 16 Oct 2019 07:42:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 07:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=IgrN1QKfS6jYUgyH1QxRGDIheSI8XFj
 +2abRpMvasdw=; b=n4kC1/vi1d8rnCHxmhQauRQQ1pH3HhRA/ID8ocwRJrfEoWe
 /52vmluZn3rs/O3sQ9b5HA047NyHraXZ8RPVnjZ7oTKixOzWhbJ223j3B084VqdK
 FF6ltTKDUzG26P99xfWI97MCZ544V0Y5L2x0tTZG+a8vJ0adqymt3VIrbWu+e0Ki
 PRglS8PodtSfcExFjscpaQuHphc4kyA+l71/mhwXfT4ZI6jAiZs2XQ2lsHlJQ8XM
 IWaZQy0OQ87b340/5jJ6u+vDucLg2K5bWsst5O4Jnv0d3myLATb7xFp/ovJj6ycF
 Y6bJBjZ94tH49WppyALypYIaD5kQxjToEEIR4uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IgrN1Q
 KfS6jYUgyH1QxRGDIheSI8XFj+2abRpMvasdw=; b=SzVPxq8Fe+GFeXRBcIhspR
 5RYTxwQE2o4PMPiX2x/CDQ4P+9PpQIOAwRSws2P0BHJnIv6inJ7oZvkJu5t6Sq9E
 jQ+2eUvnvqWCF39AigC1NDKmJ8QXDKDc0ATnb2/6MyATNp7/8wTMld8F0EJe3HUh
 JJuGU2rYbgktRU6DZ4/B4MsybPLotJey5OyBPeHQnpCMTjoFiLDLSvdrMY9zqGIX
 Oxcl2MuKJxwgufAR9buBMPGuRe15JhIN7v7LDtZMO/Weug+p1GgIXdRGnkBj6Dk3
 TZNOaoXAT6pjNv5nOAqPL1HKvQAjptfWqA1jk4RSKUReImW2Xbxpk+ScVTcBqqUQ
 ==
X-ME-Sender: <xms:IgKnXUq-5tRRndAZ4oQfh-Q13sXsUyhXpR2O-M1-dNfMwaC7hSALkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeehgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:IgKnXduC4r3j3pBJ0RmQR5TMT2_JENIQI68cpOCbnM0imIM7hXBKwQ>
 <xmx:IgKnXT1RBENUMFhsx1LMXlZjsd84ggTkoXnOxtzNBGXgEnE_FjdwBw>
 <xmx:IgKnXYHcEQ1W8coqkkFmFcRvPE4aZg4lYaUBiDePQ7R7hiDkulduuw>
 <xmx:JAKnXQsrR0GXkVK_YQ34ki0MxyXIdJ0BqI13Zc7vjk29T8_M2zqWAQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 05F06E00A5; Wed, 16 Oct 2019 07:42:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <2de90789-c374-4821-89f9-5d5f01e7d2d6@www.fastmail.com>
In-Reply-To: <CACRpkda5cWaA7R3XzyiERCCgwUrjnXd+wCBeKvt-wtjex7wNDg@mail.gmail.com>
References: <20191008044153.12734-1-andrew@aj.id.au>
 <CACRpkda5cWaA7R3XzyiERCCgwUrjnXd+wCBeKvt-wtjex7wNDg@mail.gmail.com>
Date: Wed, 16 Oct 2019 22:11:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] pinctrl: Fixes for AST2600 support
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
 <devicetree@vger.kernel.org>, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 16 Oct 2019, at 21:49, Linus Walleij wrote:
> On Tue, Oct 8, 2019 at 6:41 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > This series resolves several issues found in testing by Johnny Huang from
> > ASPEED, who also contributed the patches to fix them. We'll have more patches
> > from him in the near future (which I'm pretty happy about).
> >
> > The major issue resolved is the way I grouped the eMMC pins. What I had was
> > ugly and I want to get rid of it before the binding is solidified with the 5.4
> > release.
> 
> Should some of these go in with fixes? All of them? Or just some?
> I applied them to devel right now (for v5.5).

I was hoping to get them into the 5.4 fixes branch: I consider them all fixes - the rework of the eMMC pin groups and functions is a fix for the binding. The rest are fixes for the driver itself. My preference is that they get into a release sooner rather than later.

It's there something that makes you think they shouldn't be merged as fixes for 5.4?

> 
> > The remaining fixes are minor issues that stem from lack of documentation or
> > understanding on my part, and at least one brain-fart.
> 
> Do they need to go in to v5.4 or not?
> 
> I need a shortlist of anything that should go into v5.4 if anything.

IMO all of them should go into 5.4, as above. It's there something I can do in the future to communicate this better? Explicit shortlist in the cover letter? Fixes tags on the relevant patches? Keen to make things easier/more obvious if I can.

Cheers,

Andrew
