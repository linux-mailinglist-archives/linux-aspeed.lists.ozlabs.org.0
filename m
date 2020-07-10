Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1D21B1DA
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 11:00:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B36TK6yf9zDrNZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 19:00:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Ii45a4UN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=oEi3k9/M; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B36T42KgpzDrN8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 19:00:39 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 17415C9B;
 Fri, 10 Jul 2020 05:00:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 10 Jul 2020 05:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=qBWL4AtRVUCS4PrimpvMkvUA7sHeyrt
 hOzfKLQeVpsM=; b=Ii45a4UNgE5tukdKSH0mdZvUmPJEQ7A5PMen8jtuQhM0mBI
 G8MVxT+q/KDJb1+JI9shtQYlHrXGxcHg9Q0dJy0xc2tzeZWS1Rkyiz6cYQ7HvqgA
 DPXoyIr4sdHdMC4cuV6hrC1Kk6W1o/6ndUOE637JVSntNjV7uVOyg9brZ534065B
 Zg0R4knO9pnL0zjatEaNvSKKZ1OOxJScjJzsxatqxs0ccvlgtBAndImHyZmCQpVH
 vJ/Fp4BCDSVjtm37u0b6fREX6cEYno4zjcw8GWmz6LsmCqPx+o6G/PmM+ocVBw6/
 +Ep0qUayer1mjFcZNUEfiQChF7sHVlELyVXVamg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qBWL4A
 tRVUCS4PrimpvMkvUA7sHeyrthOzfKLQeVpsM=; b=oEi3k9/MoUzI9/O6aQgtpz
 XWFUssCB/FnfwlKvndubAxirCZHgy6JiY2NWyi9Ico9F9828yWWcm5NjqssO94jb
 RSSNsu4n5T9jx4E/eE8dD0dhx2jqTUqDlPSjsnVqh00lbfUX7icqcOkPFfnI82vv
 4FZfYnbXk/4UaQv7hAKb0NtItfMQqmdDznKAbyq2XgHjed/j+XDT3A6G382OyY/p
 UfN0ubhcAl7BlB9Vdvhk2hN/gWVmmtQBrcGjJK0G+h+lx+T9xkYZ3zZQbJWvVTOh
 KnMtmExF4dgo5NjIiMFr+45IT4jaPrAVU3UJzqNPrDkk57FbtpQo5A+ol7dfEsjw
 ==
X-ME-Sender: <xms:MC4IXzKqp3mwjM-f0d_YBkfWTIRZGo8zJXTcR_uL4IKBukZGBbCU1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddugdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:MC4IX3J_WvnrIBPOAzmlNWLqLNEQFOn-ZICmEj5sn6ICkyyzzU_F8Q>
 <xmx:MC4IX7sHgcpI5keTTOGkDRcqKVMn-XX7WU46h1m9okIAvEWdsIJ5eA>
 <xmx:MC4IX8a4KbWqIBFyVgG2WSiSqU8Cwy3RMU7vvcNx4pg9oDZQnMGKWw>
 <xmx:MS4IX_P_-7ynhe4l5ScED52Q_ANPih8Wf8vTUU1uSUuju_JhfZN2UA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1CA19E00C9; Fri, 10 Jul 2020 05:00:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <d8b93dcd-37d8-49c0-9cad-2879e8cb9cc5@beta.fastmail.com>
In-Reply-To: <CAPDyKFozpWKt=L_hMh4ymhJ1X+TSK0vUQ5E0vy7j9EowTRywxQ@mail.gmail.com>
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-3-eajames@linux.ibm.com>
 <CAPDyKFozpWKt=L_hMh4ymhJ1X+TSK0vUQ5E0vy7j9EowTRywxQ@mail.gmail.com>
Date: Fri, 10 Jul 2020 18:30:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Eddie James" <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Fix clock divider calculation
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 10 Jul 2020, at 17:09, Ulf Hansson wrote:
> On Thu, 9 Jul 2020 at 21:57, Eddie James <eajames@linux.ibm.com> wrote:
> >
> > When calculating the clock divider, start dividing at 2 instead of 1.
> > The divider is divided by two at the end of the calculation, so starting
> > at 1 may result in a divider of 0, which shouldn't happen.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> 
> Looks like I can pick this for fixes, as a standalone fix without patch1? No?

Yes, please do.

Thanks,

Andrew
