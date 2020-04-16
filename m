Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A01AB66B
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2020 05:56:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492llN5Sf1zDrC8
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2020 13:56:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=caX+Ir0i; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ROdAAu0G; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492llG0jgrzDr27
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Apr 2020 13:56:26 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D06EA5C0111;
 Wed, 15 Apr 2020 23:56:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 15 Apr 2020 23:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=YIfc6yIC2BLuseO1/P1Gj+zOdgsgiLg
 pvWs+B1qmSOI=; b=caX+Ir0iipoGQK8AcRu9Yfc1lvZAF1n9JoP6T4MvnqeLaKX
 HR9/HEKpWI8t6cnw7aTA8fqsHTX/IwOiwGaiBkc8YeIsKEJXO9t3CwEfi+Ayr3+g
 eX7JY04CgxPj43j9pZKIlUhohhtpPTuVaDVJhC5gMmJ6F3gfhiNYarcrHiLjyAyF
 bjtScbc4EPxMLNSCABpuJteo7gi3HqVJIh0AP6O4CkNFR/QEkeiH07851JZI3PPQ
 zSdXDJOfl6MrITX3Pm9HtEIMRnBTJVyFnO8meBpWgPZC3OZzKa/dbJihje0ySs2z
 ROLbSPSD1muxdOVqO3UYf7VYPJ+0o0VfL8rOhVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YIfc6y
 IC2BLuseO1/P1Gj+zOdgsgiLgpvWs+B1qmSOI=; b=ROdAAu0G4mF9TsBznYXtRB
 FIItH/jON2fNCy1T1Y6SRk/sPlygCJQfGveqZtmk+iczKgTrdF6toMqGOepTwXS/
 He+ROWpzpJqJK/BFadKVTCcK04hntiWuOX3m6/xA+9uan6jAdM+YKwiZSrzhNo2R
 VPziuou5PvZfceFhFQR565RaypOB3MyyDHJmf9oDpZZ5C9Y8EgT4t66KpecA0GA8
 nxgWSocEjI5TdTG7PJlS312LTeqrUvQRsiNGkiS4JCD0LlnO3nr+4ea4yrjCyxw/
 97aCgCTNOz9oCqRRQGeL7GvD9ptlqsz14n0oUOcupI1wOo+xqVl3EAaDnWJwR+HA
 ==
X-ME-Sender: <xms:Z9eXXsHRcjZJClS8H5854KEKrV5CULc4D7dHTLOM6JAk8W7Z0kvFlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:Z9eXXgNqfcWJoBosiX5Jo_xdrE-MECqk5t05HtRVdDFUyDSiniP_bw>
 <xmx:Z9eXXpDxTDoju9Oh30kRlNO7hASzNt5F9ZdC_0lud1wvnVyVY-fdmw>
 <xmx:Z9eXXnzvK0-E0GCyaxo5I8p2mqHXZdAhhxwcWh7zZwj6DpWQp2KZ6A>
 <xmx:Z9eXXvAxpjhJg0SpMySa-HGbX5O6SNZ-RiNWMCAiyCOTUJ3c9CKpIw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 98BE9E00B9; Wed, 15 Apr 2020 23:56:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <2a546e5b-5a5e-42e8-a201-67cd9063249f@www.fastmail.com>
In-Reply-To: <20200410145904.GA15615@bbwork.lan>
References: <20200406101553.28958-1-a.filippov@yadro.com>
 <ad46ff33-8ce2-4ffa-b12e-204053e4f705@www.fastmail.com>
 <20200410145904.GA15615@bbwork.lan>
Date: Thu, 16 Apr 2020 13:26:50 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: [PATCH] ARM: DTS: Aspeed: Add YADRO Nicole BMC
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 11 Apr 2020, at 00:29, Alexander A. Filippov wrote:
> On Fri, Apr 10, 2020 at 02:29:47PM +0930, Andrew Jeffery wrote:
> > 
> > 
> > > +&i2c11 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&i2c12 {
> > > +	status = "okay";
> > > +};
> > 
> > Are you accessing devices on the busses from userspace? It would
> > be helpful to comment here why you're enabling all of these busses
> > but not describing any devices on them, if it's necessary to enable
> > them at all.
> > 
> 
> Yes, some of them are unused and may be removed.
> For others I'll add comments in the next version.
> 
> > > +
> > > +&adc {
> > > +	status = "okay";
> > 
> > You should specify the pinmux configuration for the channels you're using
> > to ensure exclusive access to those pins (otherwise they could be exported
> > e.g. as GPIOs).
> 
> It was just copied from Romulus and looks like I missed iio-hwmon-battery.
> Is it what you meant?

The Romulus devicetree may need to be fixed too :)

Andrew
