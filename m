Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E3DA224
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2019 01:26:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpN81WL2zDqX2
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2019 10:26:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fKdKzNRo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="omb7k96+"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpM90h3GzDqC0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Oct 2019 10:25:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E4BBF71D9;
 Wed, 16 Oct 2019 19:25:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=PyvonOcPHFz8rKcmNUUFHGzSVRwDPRH
 8KZMA87K8oiQ=; b=fKdKzNRokgPjUVrX9f1xJPPL5FlrS4plG8on1QguhO/iuAm
 Lo5Bj90672xyJdYbVyUa3VgU+Y+2HxL9CkP0vDPDXqrFPk+HkdlPyJ4zBZOv6xbR
 AC06UzWdsdc6mXOjcwLUnmdpUOsjkr4FOvdCxovZ3hqBTA0w1TGdN2G30G0VO3RL
 y+DaHnPWZIefPFmx6XBoejbEezNpp+qPUdeq4tbizZE0+K4cemSW7YXaAZ1uQ9J6
 8Va/knlMgkD3GnObd56nZ5XAmwW1JTMe+VDA8wFrthzeujiwezQhlsCJ5LH0EZHV
 ajOg3EZJo/sEcpxTujDRiODK+6fjOKw7+beFf4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PyvonO
 cPHFz8rKcmNUUFHGzSVRwDPRH8KZMA87K8oiQ=; b=omb7k96+2VHVf6VjCeeafg
 0siHqz/O6s1Oy7hU2nmQ2wlCw8vd3jsuThXLkkCGtgONeG8jLeNFNxXPzZe7+OKn
 T/7e/jEO//cUsQpRyq8dul+GAUJ3agO093ZnPtkKuf73btmkch0y6Efs/TIK6gtP
 kVQZpB24Tnqbs+4tnsWgzLDWBwGCUPly78dIr64T4MDegNqzj2pE8BaAug0Fm8OK
 bv6VUc/RuGRqXlPU+DPQzz2eLqBkn0NHbCZFSNi670PzweDU9nYRrT+Od8LsXGTL
 dx07/zq5jEtosWNBfLbr8XI27LOg+bN/6TW0mlO2mGuCSkWtAjN9cFveoc2MyShw
 ==
X-ME-Sender: <xms:_aanXUngCArMrXAA7-s9c4Qrm5auYWXdza9M0WOYns1PrME8q-OgOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:_aanXSOwracCb3LzQKBJVZOovmxxNA0-0f4Zw9_sMVL51RQo6XuC5g>
 <xmx:_aanXat8h366CpTcUuN8cE1t1VuiwpVN_HSoPB3fEVwg1In-bqXS2w>
 <xmx:_aanXVw3N8k8rS7lIIEsu9nO1S99HVu_3B09uTkoA1XFM6F3kpdcWQ>
 <xmx:_aanXTz6edeXMD7h5uZtGS_XNOlxgfyiI49h0Dnq5VCKKbB13GyWCg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E351AE00BE; Wed, 16 Oct 2019 19:25:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <5fc76c3b-4727-4c4b-88a1-59c9618ccb30@www.fastmail.com>
In-Reply-To: <CACRpkdbmbyNmW8tL_L0agBajomPybXsjn9ix_F5-B3fZnfuW9A@mail.gmail.com>
References: <20191008044153.12734-1-andrew@aj.id.au>
 <CACRpkda5cWaA7R3XzyiERCCgwUrjnXd+wCBeKvt-wtjex7wNDg@mail.gmail.com>
 <2de90789-c374-4821-89f9-5d5f01e7d2d6@www.fastmail.com>
 <CACRpkdbmbyNmW8tL_L0agBajomPybXsjn9ix_F5-B3fZnfuW9A@mail.gmail.com>
Date: Thu, 17 Oct 2019 09:56:45 +1030
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



On Thu, 17 Oct 2019, at 00:30, Linus Walleij wrote:
> On Wed, Oct 16, 2019 at 1:42 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > I was hoping to get them into the 5.4 fixes branch: I consider them all fixes
> 
> OK I moved them all to fixes.

Thanks.

> 
> > > I need a shortlist of anything that should go into v5.4 if anything.
> >
> > IMO all of them should go into 5.4, as above.
> 
> OK
> 
> >  It's there something I can do in the future to communicate this better?
> 
> Nah it is a complicated process, things need to be done manually
> at times, overly obsessing with process is counterproductive.

No worries, happy to carry on as is.

Andrew
