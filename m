Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120B1C37D0
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 May 2020 13:16:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0g96ssTzDqRx
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 May 2020 21:16:53 +1000 (AEST)
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
 header.s=fm2 header.b=AbYWfCIh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FOvR6siG; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0Nq3519zDqWd
 for <linux-aspeed@lists.ozlabs.org>; Mon,  4 May 2020 21:04:27 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7F7C62D8;
 Mon,  4 May 2020 07:04:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 04 May 2020 07:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=49dwVzlg4yout0mlI0duNcm7pu2D5zR
 VEWyuXFEPhGU=; b=AbYWfCIh+Tz/F50g7Tweaswku+okSFIb8Wo4E8U6foqtSM8
 ZYq90QcAXG/rYSrgWAxUunR/NIKo8L0jrJiDMR2TrbJ6gResjk9t1BjFPHRVJJPG
 zOISYVxOXjy3U1q2PvSBFOPtOcVx8FteX8dYqEqJE6zGN2+G3o9BUMv/PzUyGWqe
 qvKqFuKzgQvTRVGFp4XQOBLhT/o0Q3sQ21ehzLKs6bGESJaymgCz3oAw934IdQuP
 b+J6Xb+AI+IwpOv9F8gYKDJvXOLEAg0zOpXMMfgAl41eAaiZe47EbyZ/KIUOZ4D7
 Nu0jYnNxdQTBWV8TLYPdWZHk93V+jW4tJzr4eFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=49dwVz
 lg4yout0mlI0duNcm7pu2D5zRVEWyuXFEPhGU=; b=FOvR6siGanOLWuUXtSMMl0
 o5uHqKxG3w5na9zs2jG7xeazFlHVCiqcrLv7AZRInMl063YJSocYi811HiR39MBu
 YWfJMWtccdjbc96RmKAPg36M4W3FBMl/zu/GcSsJ0q8IWf1qjn9YR9QfQ3hoITct
 CgcFs+k+yY5pvXJnEvEgb/i/7vi8oubVbOYhzaF3oz0GloUpx/hHghflEIzkFZVj
 fZDQOyKeC5H6HRGP5WCzpjM6wVKXI8Tmy0fIcbov2c3MOr+CJ1i4A5stkTOl3mEz
 u3g3BxM7TpJ+IF+J3F0CUnWAzVvY1HKlDx9/N4qrIZDm3WSHAZEshyTDqbqg8Mtg
 ==
X-ME-Sender: <xms:t_avXrXmlbQpGG5_yRbhLXtv1WgwUOVvBIS58b2naUbAdf_yleCQ4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:t_avXs5I4xlwGIpDS-tB7qxaOzAluwOdfezFC9QOmv-LpJU505O-CQ>
 <xmx:t_avXurijGF2Ua1hkypHCzPPMfpKzIoNwqGkXHIEyzlbT3mmpCYiwA>
 <xmx:t_avXnn4wsesB9ILvaXG-OB5KPmuh9NWy5RYqW1PiBM13v7U8UYQjQ>
 <xmx:uPavXltuK2j6jja0egnmx5b-v3iTrYs6VXZHLR2NwnSSBT7RQ1vzVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0543AE0131; Mon,  4 May 2020 07:04:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <c1de0c90-d486-4855-bb26-0f3cc416b05d@www.fastmail.com>
In-Reply-To: <CACPK8XcP3V=8fAUfNvRFqPU9G38dGR43Kpp=Uxm=P_AjrMnzBQ@mail.gmail.com>
References: <20200424135303.20952-1-a.filippov@yadro.com>
 <CACPK8XcP3V=8fAUfNvRFqPU9G38dGR43Kpp=Uxm=P_AjrMnzBQ@mail.gmail.com>
Date: Mon, 04 May 2020 20:34:02 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: [PATCH v5] ARM: DTS: Aspeed: Add YADRO Nicole BMC
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 27 Apr 2020, at 20:41, Joel Stanley wrote:
> On Fri, 24 Apr 2020 at 13:53, Alexander Filippov <a.filippov@yadro.com> wrote:
> >
> > Nicole is an OpenPower machine with an Aspeed 2500 BMC SoC manufactured
> > by YADRO.
> >
> > Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> 
> This looks good to me.
> 
> Andrew, do you have any comments before I merge?

Not other than muxing all the ADC lines to enable just one seems a bit strange,
but Alexander mentioned previously that the rest were simply grounded so it's
not going to cause any problems in practice.

Andrew
