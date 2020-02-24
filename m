Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE8716B606
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Feb 2020 00:49:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJh44GSvzDqDP
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Feb 2020 10:49:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=vYiAcpOR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RPEZ+3F5; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJTD1NhbzDqNJ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Feb 2020 10:40:15 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DFE366C6;
 Mon, 24 Feb 2020 18:40:10 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 24 Feb 2020 18:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=3+7oIYy75eyNJFA+Gxl240s+7FvhCpt
 LmGW8I9hc6zc=; b=vYiAcpOR0t7KGVWY7hgh9uKy/VGeza1MpdZ2dKeiJpfgOdq
 Sala8CAoleHamfa4bqeWxEHIMixNWXwUiTy5/sFfbGdDmNfUoX+1sciR3devM0wD
 olVPelGp8f+n6AIFaPe8c0cq3mGEocaAwm/EoEKHs4tSEefXOsW8G9T0zf+JCPj7
 GuVN/p7be69hH3IcHwkTvmmSbB1siDfYUkr4cSpgu7jUMrwXKpqy1L6+Ke2KI3db
 t4XuVH8MwO8m1PFMxADOQ0xo1l3qzpK5KgVRESBNrihvrV9z2JjAHi9o1XdAtIS+
 0mnwQqa6htnzxWK/eeiRau9cQ8lJa31OrWpizDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3+7oIY
 y75eyNJFA+Gxl240s+7FvhCptLmGW8I9hc6zc=; b=RPEZ+3F5AfM8pcpim0OtAW
 0j+AlR+6UkaJRCS4Lnq27od9CbsUK6/1/WYwHVT36OBEG9PQIXENYJ6xxCYzEBtR
 nzEZVw03UPzy8JlfKHpxcthF5TC84vnSKRsAhhYAL7vYW9et4Ohg0HMB4sDSgMR4
 6Dphk/Tsr0DHXZQ/nuUj1Ez3xoqq/3dRXEyKfGVcsf9JJxL8HqCD8hpnd3EjT24A
 nEyRm4NapwJSpQAWOhQzDDsqBEbV+o0J7qda+Dk2pf51dGcbYJ/OFF1ZLCBnD6a4
 D/+cCDlTd6KeemJJG4oRX+3NCGAHXKyKjzmGwaWZEj7EgGDEmRUApCsY/iPcT8mw
 ==
X-ME-Sender: <xms:2l5UXndW9NloQ7HJPBXX-BJqaRObODb2-N9Wzs1xMbl19FVpWts-OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledugdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:2l5UXoHWZ7A1vbsnFaiqBisHgfsxXj-3ZGzJQsSCTrfZHiVLimDtzQ>
 <xmx:2l5UXquGQNWqXeRIxlynYkWuE3Ge8JnzgAy6TgTntkJg8GZQ0UhGSw>
 <xmx:2l5UXqo2GgXk0sLo4y7VJSrm6jvM8n90cjxJm1xvM-wdqBRDSJao3A>
 <xmx:2l5UXlGfqHR3pORqV-mPDcjSY1hLgnETHMwBkhzaLG7JdFEeYtedPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1A1F4E00A6; Mon, 24 Feb 2020 18:40:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-947-gbed3ff6-fmstable-20200220v2
Mime-Version: 1.0
Message-Id: <c5d15783-4e4c-426b-9df0-ee8efc57cefc@www.fastmail.com>
In-Reply-To: <CACPK8XeLWZT-VvuErtz6oE1tv1dhwwOnpZbV7PVr2PxgT2fopA@mail.gmail.com>
References: <20200202163939.13326-1-linux@roeck-us.net>
 <CACPK8XeLWZT-VvuErtz6oE1tv1dhwwOnpZbV7PVr2PxgT2fopA@mail.gmail.com>
Date: Tue, 25 Feb 2020 10:10:06 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Guenter Roeck" <linux@roeck-us.net>
Subject: Re: [PATCH] ARM: dts: aspeed: tacoma: Enable eMMC controller
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 4 Feb 2020, at 16:24, Joel Stanley wrote:
> On Sun, 2 Feb 2020 at 16:39, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Enabling emmc without enabling its controller doesn't do any good.
> > Enable its controller as well to make it work.
> >
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks Guenter. The description in aspeed-g6.dtsi changed at some
> point and Tacoma was not updated.
> 
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > index ff49ec76fa7c..47293a5e0c59 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > @@ -132,6 +132,10 @@
> >         use-ncsi;
> >  };
> >
> > +&emmc_controller {
> > +       status = "okay";
> > +};
> > +
> >  &emmc {
> >         status = "okay";
> >  };
> 
> This node is redundant, as it is not disabled in the dtsi.
> 
> Andrew, should we add disabled to the emmc node?

Probably. Also the nodes are badly named, partly because of the structure
of the IP block. 'emmc' in this instance isn't the actual card, it's the SDHCI,
and emmc_controller is a 'parent' that contains some global state which
applies to one or more SDHCIs inside the IP block.

We should probably cook up better names.

> 
> Or remove the label completely, and just have emmc_controller?

Maybe this is a better approach? The eMMC IP block only has one associated
SDHCI, so that would make sense.

Andrew
