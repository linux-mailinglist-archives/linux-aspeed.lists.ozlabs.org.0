Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB59112C3
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 07:51:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vksC4dLdzDqQB
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 15:51:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IuSFGQ01"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JcetNQVy"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vks75D92zDqNX
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 15:51:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C89CE480;
 Thu,  2 May 2019 01:51:02 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 02 May 2019 01:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=y/nqmfkFMDIlQD44MclMNSze29WFNWS
 xtIL8mUypNcQ=; b=IuSFGQ01a1ZEl5KNNfEs8ClBy51Xn5fjIcf7E6dzyB1LthQ
 eq+TgLnbyFHoRIn3Dx9VDRRmTcYqn6sa9D4KfsX5CB25BUQUxgtZ214TXA5JZkVW
 JpzioAPnVuw/mEO4JNo0VMSa64J+QN4ngWCf9Js/UJwsqdyGlZgdKAWXNkPeoanw
 vUDiChX9/cugkEJuhznZdrPS9uOzUGwGzoDE/rVU/zzUTeMnH29jOr0BIwJ2YR74
 X1UbWWxt8jrCCnigLNfFKvsUdzHvp3RGJZ527FsksSrz6WEbq/rrChhVockUQTfq
 1NZ6bJMdsR3U80buw0Ar8fBq4dBgevDrS9TiZug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y/nqmf
 kFMDIlQD44MclMNSze29WFNWSxtIL8mUypNcQ=; b=JcetNQVy66vuG3uEQaiz6J
 0sNKuUH/B7mPDcfR611nY/tO4ODUkqiz85RS9klL3AynpXWMaMwJfmgLnkYE5Eex
 EnlKVsFOq5LMcBXKdXTB4Nw7spBuuaWwSizWAMXPWUcyRZ1QmjW+l6HlDJWnf1lg
 Ryfa/ibcmehebqD5912HObWFsx7tK9OYxC5jrR8og691rqP/Ek63yD/ROvJeIOZB
 Vc21bNBFxdCCjhBzhBH28jgfBVTdjwyzw0QPbZLQtaFE6Q+Y9hMERxvVSOM9MnKm
 joV/oxycQXzIQbHiXFP5BhikwZIftWpadPu3pPvtuJU6iL2TKWwFRRx9LqqbCwWg
 ==
X-ME-Sender: <xms:RYXKXB2o0JeVqxzxZChAWzwZkeJkzSAbMdi8Ry7SR85BJciJmWVIUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:RYXKXPcYpkllySZfUEQARv_qaXu11C5QhSh0rQAy4WSaHc32S8rF4w>
 <xmx:RYXKXHePqMrQwXCblqwNcDba-iPJM7g72oPjZI1Uep7H27ty3oUTuw>
 <xmx:RYXKXKzboRl62pPvc-VoOMDOwj0ZI61LUxtCpg3Xbwy3Vr62NWkqCA>
 <xmx:RoXKXFOasveRMVryvmJlL6YZx90oeJn4VnG7ozBRVFykD7YtZnRU_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 694BA7C6D9; Thu,  2 May 2019 01:51:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <128da9c8-d138-47b9-b323-b845bd93ca2f@www.fastmail.com>
In-Reply-To: <236762130.3394112.1556751009128.JavaMail.zimbra@raptorengineeringinc.com>
References: <236762130.3394112.1556751009128.JavaMail.zimbra@raptorengineeringinc.com>
Date: Thu, 02 May 2019 01:51:00 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Timothy Pearson" <tpearson@raptorengineering.com>,
 linux-aspeed@lists.ozlabs.org, "Ryan Chen" <ryan_chen@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_3/3]_aspeed/pinctrl:_Fix_simultaneous_DVO_and_seria?=
 =?UTF-8?Q?l_outputs_on_AST2500_devices?=
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> There appears to be a significant error in the pinmux table starting on
> page 127 of the AST2500 datasheet v1.6.  Specifically, the COND2 (DVO)
> requirement is incorrectly applied to multiple digital video input (DVI)
> muxed pins, and no DVI-specific condition is provided.  This results in
> the serial devices incorrectly overriding the DVO pinmuxes and disabling
> the DVO pins.
> 
> Create a new condition code (COND6) for DVI enable, and update the most
> seriously affected pins to use the new condition code.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 6f357a11e89a..676f90d3c5f3 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -29,6 +29,7 @@
>  
>  #define COND1		{ ASPEED_IP_SCU, SCU90, BIT(6), 0, 0 }
>  #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
> +#define COND6		{ ASPEED_IP_SCU, SCU90, GENMASK(5, 4), 0, 0 }
>  
>  /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
>  #define LHCR0		0x20
> @@ -660,8 +661,8 @@ SSSF_PIN_DECL(T2, GPIOL0, NCTS1, SIG_DESC_SET(SCU84, 16));
>  
>  #define T1 89
>  #define T1_DESC		SIG_DESC_SET(SCU84, 17)
> -SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND2);
> -SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND6);
> +SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND6);

I feel like you didn't test this patch, because VPI_24_RSVD_DESC (the DVI condition)
requires SCU90[5]=0b1, but your introduction of COND6 requires SCU90[5:4]=0b00 for
the mux configuration to succeed. This can't work - bit 5 of SCU90 can not
simultaneously take the values 1 and 0.

Ryan: Can we just drop the COND2 requirement for function 2 of balls T1, U2, P4 and P3?
I think that gets us where we need to be?

Cheers,

Andrew

>  MS_PIN_DECL(T1, GPIOL1, VPIDE, NDCD1);
>  FUNC_GROUP_DECL(NDCD1, T1);
>  
> @@ -674,22 +675,22 @@ FUNC_GROUP_DECL(NDSR1, U1);
>  
>  #define U2 91
>  #define U2_DESC		SIG_DESC_SET(SCU84, 19)
> -SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC, COND2);
> -SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC, COND6);
> +SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND6);
>  MS_PIN_DECL(U2, GPIOL3, VPIHS, NRI1);
>  FUNC_GROUP_DECL(NRI1, U2);
>  
>  #define P4 92
>  #define P4_DESC		SIG_DESC_SET(SCU84, 20)
> -SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC, COND2);
> -SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC, COND6);
> +SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND6);
>  MS_PIN_DECL(P4, GPIOL4, VPIVS, NDTR1);
>  FUNC_GROUP_DECL(NDTR1, P4);
>  
>  #define P3 93
>  #define P3_DESC		SIG_DESC_SET(SCU84, 21)
> -SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC, COND2);
> -SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC, COND6);
> +SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND6);
>  MS_PIN_DECL(P3, GPIOL5, VPICLK, NRTS1);
>  FUNC_GROUP_DECL(NRTS1, P3);
>  
> -- 
> 2.11.0
>
