Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD4663F12
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 04:01:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k2Tq4mF9zDqZ9
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 12:01:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cjGnS0LQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="l8wM/ukD"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k2St18NqzDqZP
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2019 12:00:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C3BE22493;
 Tue,  9 Jul 2019 22:00:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 09 Jul 2019 22:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=lzL/P/6XyszwFm6GR1tak3ZTNCxTfU8
 xFHl3trMlzBo=; b=cjGnS0LQ/zRspsmBRBkhxGxS171JISRFA57HNB5zx6DtsWZ
 1gbg+wBMvXfB/nYBRarwW09O0P3miQBh71wFet2rjgdbUrdwlQ5iHQGr6EQ03B/I
 6bEHtsp8sEkzjhGWmtdXlVvTb2pmJY9IhaosjABz4hUI47C264v3uVwK/SqSCm83
 iVclJXGh768M18FK5vjVDf3OXt3TCHsHG039IsX5R7KYezfEMcx2rTDgDCYN1uIZ
 hjybXhn5DvhoJ0iNgwgkJfkR7/KiSYxB1mhWzGH5kiQGjkvC1x0D3Ng9tU0hhrIg
 uw57Uyvutnk3Aeh4pF8/RoamEfpYtPzwxc6KZEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lzL/P/
 6XyszwFm6GR1tak3ZTNCxTfU8xFHl3trMlzBo=; b=l8wM/ukDu2ovfJId8tYGOL
 4rfZH+YbNLTR94C9XeJYypnkPSF1jEwRaf+ZZ3F+nyYx8HUcKZQDkEJX6qdRL1qe
 WW3GVmmMxvyqzVr4Cu11z805KzDjEFl/ms5MJBE804Y7bRMhK3cevhXEMxftYJuC
 DWn4/aZpZ6c5oCy4Lmg/w5GqJeQVZaozUav7to8N7N/a+cU4WZGRBd1DvDsMRVme
 1hpYSBItxRGMC03yYgIGJ4RwHz9wPPKUvFFkwuOYUTZCX6jqALNE9pB5+s7p9N4B
 zWYYdhiZA4+oj87XYcSxx+sgTVFSWdPf+9+h02tmBh7SUsIg7Zt9wN+mPsYa2x1g
 ==
X-ME-Sender: <xms:qEYlXd1lMHkppkzm8FQurPkOYfEKQC7WnYE9xF4Bh7baDoKnQpaWyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeggdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:qEYlXSvhixOSJI878hkt76xxXtqqHcU-otcrEBLoXfHkwvE816z23Q>
 <xmx:qEYlXdgQOiEwFeu2THopzBZOCC-eBGTDUi8Vj3O8xvuSwonmmmiJsw>
 <xmx:qEYlXRCdhKj-5_bFThl0r4KwWf18GbiE07xIQORcF7PvUAJ63Yewrg>
 <xmx:qkYlXd1hRoVOSyjICp5kBBVXf_E_2Zll_0ZULRUhQ1Rm5-OZJf9nkA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D3530E0193; Tue,  9 Jul 2019 22:00:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <90c0c965-00ae-4f7a-a6f5-258572398bb0@www.fastmail.com>
In-Reply-To: <CAL_Jsq+0z4OZ7qbaiUva1v5xCKXpsaPBZ9tj_M4HbEihsU_MfA@mail.gmail.com>
References: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
 <CAL_Jsq+0z4OZ7qbaiUva1v5xCKXpsaPBZ9tj_M4HbEihsU_MfA@mail.gmail.com>
Date: Wed, 10 Jul 2019 11:30:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh+dt@kernel.org>, "Hongwei Zhang" <hongweiz@ami.com>
Subject: Re: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 10 Jul 2019, at 04:23, Rob Herring wrote:
> On Wed, Jul 3, 2019 at 2:01 PM Hongwei Zhang <hongweiz@ami.com> wrote:
> >
> > Add bindings to support SGPIO on AST2400 or AST2500.
> >
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 36 ++++++++++++++++++++++
> 
> Is this SGPIO as in the blinky lights for HDDs in servers? If so, that
> has nothing to do with Linux GPIO subsystem.
> 

No, this is just literal serialised GPIO, which can be used with e.g. nexperia
74LV595 / 74LV165 parts.

There is a separate chunk of IP in the SoC that acts as an SFF-8485 (blinky
lights) slave monitor.

Andrew
