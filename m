Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D7160762
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Feb 2020 00:54:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LP972W5RzDqb1
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Feb 2020 10:54:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=NnB7dbbx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=zQoj4jGG; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LP9160nmzDqRq
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Feb 2020 10:54:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3F727461;
 Sun, 16 Feb 2020 18:54:11 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 16 Feb 2020 18:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=5jo981HWR/vHL9RhXlYEzz7DlTldAj/
 mpq+HV26LbAU=; b=NnB7dbbxE5kF/iQhc4qNwAB9rMcUenu45OBbD7WGy8wBXGI
 a/jKJyy/JdpzrRqujpBveKA731NjaeNG1Jz4vQVl6cRjS5XdAaPNLHDSAu4octvC
 mko8Hed5oGKkTR79quZ9kZ5xKEd0M+5dCHsa3K7eZ49sEAFe+u2BmjVkzA2eyoFG
 OV67Un65nU9kGXss5Br1I22WLlXSKGIE4OT5JGSf7p1XfrJb21cQpYFrSaEuS960
 JF6H6xJZmt6z57+3mKUZYXd7zfFZvBlLpUhq2cug0Kga8CEb5m7Kf6Jksz8P04cp
 9zrd+P4pvOY7PXZ0LtJHxdbBk2vxyKGh+eAIgOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5jo981
 HWR/vHL9RhXlYEzz7DlTldAj/mpq+HV26LbAU=; b=zQoj4jGGwbaJpz1C/UxdE8
 90XRyh8y6gTjT/1t51FqCeyLHN+8/N6LXSDGuoQt0VMYCeLC18S52A/GrHfPZrDn
 lOc4tikNl+2/y/USYZZe8q9Fg+vf0oCu9BMj0q0PqlYFOemHiICI2lCrYoRI8Gc0
 0sKnDIPmqJ+/G62UdeA9+/0WrymVefQnZ5nLmPzY+TgapYzJV11AHnL6n0ic05YP
 47wYHRvURvdksM2KMW2nlTgi6A2svR8GSoL2JdVMS3IAuFQhuFX+CrJpD77Z7SyN
 ETGkJX5I/wLum0s+eeoVd09/YnR37KZPfqS1kvepaj3QUvMxx26Oc6KJX0Bsy8SA
 ==
X-ME-Sender: <xms:ItZJXjR7PPsQcrSo31ndDTPt-9FmQsIWG8EUQ32KGvQOgRe8TNtNzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:ItZJXnnYIYc63__jHnvpZChvf2853Jf2No2MzzU1TNdGCc7ApnHChA>
 <xmx:ItZJXrnq5LCrJ4JlaeEDpVw_oNOXIcVqCWNGItX4HBMUArAWKdI4LA>
 <xmx:ItZJXmhWq_px8l07_bvrmyRlez9CmetSfZ2ydwr9qvD9siZhbHkAIA>
 <xmx:ItZJXtD8yZSJB4pjdjwjMRc3cdvZk9jxHPuWWNAqnb3FkgJkA0v7Eg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B4E41E00A2; Sun, 16 Feb 2020 18:54:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <549d68fc-22ea-43d7-80ea-52143fe79321@www.fastmail.com>
In-Reply-To: <1581363147-19310-3-git-send-email-eajames@linux.ibm.com>
References: <1581363147-19310-1-git-send-email-eajames@linux.ibm.com>
 <1581363147-19310-3-git-send-email-eajames@linux.ibm.com>
Date: Mon, 17 Feb 2020 10:24:03 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_2/2]_ARM:_dts:_aspeed:_ast2600:_Fix_SCU_IRQ_cont?=
 =?UTF-8?Q?roller_nodes?=
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
Cc: linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 11 Feb 2020, at 06:02, Eddie James wrote:
> The nodes were defined with a unit address but had no reg property,
> resulting in a warning. Add the reg properties for consistency to fix
> the warning.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 82a3cd1..301fdb4 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -269,16 +269,18 @@
>  					reg = <0x180 0x40>;
>  				};
>  
> -				scu_ic0: interrupt-controller@0 {
> +				scu_ic0: interrupt-controller@560 {
>  					#interrupt-cells = <1>;
>  					compatible = "aspeed,ast2600-scu-ic0";
> +					reg = <0x560 0x4>;
>  					interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>  					interrupt-controller;
>  				};
>  
> -				scu_ic1: interrupt-controller@1 {
> +				scu_ic1: interrupt-controller@570 {
>  					#interrupt-cells = <1>;
>  					compatible = "aspeed,ast2600-scu-ic1";
> +					reg = <0x570 0x4>;
>  					interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>  					interrupt-controller;
>  				};
> -- 
> 1.8.3.1
> 
>
