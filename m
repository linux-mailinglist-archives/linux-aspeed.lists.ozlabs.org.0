Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D918616E
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2020 02:58:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gfbp4qLJzDqMF
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2020 12:58:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=QAkMPndX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nCjuHw+D; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gfbY69fnzDqBP
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Mar 2020 12:58:32 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 87FD55C020A;
 Sun, 15 Mar 2020 21:58:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 15 Mar 2020 21:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ki6O9+DkT6Sd8aaUr3ULLP91+bpcyb8
 Gpwm/HzzYeUc=; b=QAkMPndX+HToO8pffPPH2qwqgGkPuKrtKn9R1WUAivF+Zv/
 UDwtVMq7mgmykfnUAVuhXTYLMSbDknL71q4j6RvzL2Q3GkZhkn/b7UWaLoR06ff6
 0wgHn83u/Qz4jZzBkJSh8XWt2mmbG6reXTfrcZpH3HkwZCu+7FvyUOK/8ypK52th
 GD1x/PbkhkYyA8bkBNqCjI7sNwbuBNSpgAYHEiWwYyx0Ko9JYT6TMi9TdbGh6G+l
 OXETHAJAtlNNVFZnWQCStHh1d152WRr7jqs7jqb4UucbjKYq24RWyVMxXnkXYr0u
 vllQI5uQLOflgxLFz/DkHa8pFeMLuP8Tks2hQmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ki6O9+
 DkT6Sd8aaUr3ULLP91+bpcyb8Gpwm/HzzYeUc=; b=nCjuHw+D66EXIpqcyGyGux
 u/mj4SY6M5FqZW7Ko03ovkfzCcy/jgMSPpzeDT6e5kapunV28SNhiUzUGFg8aZY/
 Y5mBYpHr4Cjzxjyp9/9XcbjJU1wlT2phdh9NyZHzxAtJKVic5rnwRKwH4+YVOldi
 UxuXE/opyzXBdD4i2XxhuSt4zaAFfSByTf331UnN68MZEZDwZkBWQbK4F9Q3qsou
 tztPHcch4teW0tj/LZ1vuV4EOWYI9lltBiBu0qqPAJ7vYVvajt4TwmVeS2S9eAW4
 uHbzJ4gR493aAfh/SM83SG7O/WAgdXeuiY10JawZdgQt6WjzjCPwamom4ugfoDtg
 ==
X-ME-Sender: <xms:Q91uXqvjLXDc-4WtP9vxCjFbJRVHzGMGsAK8qJu_xbFJzRLwN6raZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefuddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghu
X-ME-Proxy: <xmx:Q91uXuaW5L0ZoFWZmpkAJuuaY9XzpgKpfd2F2XytAMkQaaS6JDy6cQ>
 <xmx:Q91uXh1Xmf1kAWrJpFzP47QHDaNKiIVtwgqhDH1oFM-fNlsdsPRWKA>
 <xmx:Q91uXouVLZTONsqdaWP-xCLS0gI3djg76mwzt7gdn_bo_-SgOO9PhA>
 <xmx:RN1uXl6LsDUvB8eaDXoYLKYZL_WneytxmHEGoTcGcHisH8-ipOPadg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 21182E00BD; Sun, 15 Mar 2020 21:58:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-991-g5a577d3-fmstable-20200305v3
Mime-Version: 1.0
Message-Id: <2f51b12e-3651-48e4-b733-01f41ca44b92@www.fastmail.com>
In-Reply-To: <20200312121413.294384-1-joel@jms.id.au>
References: <20200312121413.294384-1-joel@jms.id.au>
Date: Mon, 16 Mar 2020 12:28:35 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 12 Mar 2020, at 22:44, Joel Stanley wrote:
> The ast2600 disables the mapping of AHB memory regions by default,
> only allowing the LPC window to point to SPI NOR. In order to point the
> window to any AHB address, an ast2600 specific bit must be toggled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c 
> b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> index f4ac14c40518..142cb4cc85e7 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> @@ -22,6 +22,9 @@
>  #define HICR5_ENL2H	BIT(8)
>  #define HICR5_ENFWH	BIT(10)
>  
> +#define HICR6 0x4

Given you introduced this I assume we don't have anything else touching
the register, but if we ever do hopefully whoever it is that adds support is
conscious that they need to be doing an read/modify/write to correctly
clear the W1C registers without frobbing the bridge state.

Looks like Aspeed should have introduced two bits to manage it :/

> +#define SW_FWH2AHB	BIT(17)
> +
>  #define HICR7 0x8
>  #define HICR8 0xc
>  
> @@ -33,6 +36,7 @@ struct aspeed_lpc_ctrl {
>  	resource_size_t		mem_size;
>  	u32		pnor_size;
>  	u32		pnor_base;
> +	bool			fwh2ahb;
>  };
>  
>  static struct aspeed_lpc_ctrl *file_aspeed_lpc_ctrl(struct file *file)
> @@ -177,6 +181,16 @@ static long aspeed_lpc_ctrl_ioctl(struct file 
> *file, unsigned int cmd,
>  		if (rc)
>  			return rc;
>  
> +		/*
> +		 * Switch to FWH2AHB mode, AST2600 only.
> +		 *
> +		 * The other bits in this register are interrupt status bits
> +		 * that are cleared by writing 1. As we don't want to clear
> +		 * them, set only the bit of interest.
> +		 */
> +		if (lpc_ctrl->fwh2ahb)
> +			regmap_write(lpc_ctrl->regmap, HICR6, SW_FWH2AHB);
> +
>  		/*
>  		 * Enable LPC FHW cycles. This is required for the host to
>  		 * access the regions specified.
> @@ -274,6 +288,9 @@ static int aspeed_lpc_ctrl_probe(struct 
> platform_device *pdev)
>  		return rc;
>  	}
>  
> +	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl"))
> +		lpc_ctrl->fwh2ahb = true;
> +

This implies that we don't want the SPI-only behaviour by default, which is
true for our platforms but doesn't really reflect the hardware. What are your
thoughts on adding an explict devicetree property? use-fwh2ahb?

Andrew
