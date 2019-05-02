Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BFA11374
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 08:41:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vlyl2vYMzDqRM
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 16:41:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="A1bkjrLc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zaU8PAMB"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vlyY2j3JzDq99
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 16:40:52 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4205B68E;
 Thu,  2 May 2019 02:40:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 02 May 2019 02:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=rFoVdfRi7T2YlY3EJxRHi12+NPaLOJa
 1ZdGq1SxY8bo=; b=A1bkjrLcrIwYTk9TWUeSkaIsy2X8vXsbm/5r/gAuYgy7Sth
 U130Lr5wIzCndSMm4tYb9dlZVPlrNABE/v/fLXO2lfraU/ohVrYfYfZBrCRZA0ei
 xRYK+QvsCLsUY2R1aDpww3axxR8PDlTzwUHFskJdqPFe0BB9EAUT3HmWOd0OGIxd
 UXNVpeYoUrZfkKLs+pHAYxYgbhpH/VxhYMBIFYA+WZOHAwlqk85wZyjnfJGRKtDM
 tgBDq/8Q4DZ8y+qjpW5SIOe/b1887Pw00nVzR567iyWYFL7+7eXioSmOV4c7Uf0V
 YzlRAzmLVukoVmjnbkb2+N+47biDU3bTsMHrnEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rFoVdf
 Ri7T2YlY3EJxRHi12+NPaLOJa1ZdGq1SxY8bo=; b=zaU8PAMBPTWslkToNc03Ht
 Fud2LUl/LnLL8+OIweegZ6UqGVhXHETvZPuoHZpk5CaXbQCyyEshxdHufVcjEdSp
 W+cb5b+IsKtJrNk1PRZIPmPxk4iFGAFoHg/wbkHhCUird/xsEalh4NuEaaJxbUrg
 IHFNeRXMZolRjxDE96jLVZ4Qa58uN91lRUvZGM6AFqiKRhRlu5DDp/Qwz4YT7c10
 Tw2dnsEuwMjbrbQYH4x2ZVlUrjLsTip83BbjM2LK8uCYoknJPYSqMZrsbAHqGKcF
 dL44+N0x5Hn0+juLtZNXtII3x7VCMslR2GRT2cg2FAxVgBV4oiyRm+lRawAUaudw
 ==
X-ME-Sender: <xms:8ZDKXLAEuxbMVc2EgNgjUqclH0QADKdJtXnGcwNPe_LLVTLJeM3aVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:8ZDKXKjkjf2SLwdIV46I3_CcQg3ucaIH8v2oW5hJTz8pS9KtDD8ZeA>
 <xmx:8ZDKXARflqJT6v504WcQ5hjtA3WSvJHh8D6U46_e1ECVgkELYZKj7g>
 <xmx:8ZDKXEtcYIdQz9Fhry7UfH9wpjdXdPRgohYuM_ZT4vIXL_0yI0M_lw>
 <xmx:8ZDKXKNMeYbLrfuSQ9zdTdntcc86703ro-ZK0JbOrDhmIZmmVIcrbg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E50B87C6D9; Thu,  2 May 2019 02:40:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <e2388fbc-e664-4338-a0f5-d34a3621c3fb@www.fastmail.com>
In-Reply-To: <1991472336.3446950.1556778801333.JavaMail.zimbra@raptorengineeringinc.com>
References: <236762130.3394112.1556751009128.JavaMail.zimbra@raptorengineeringinc.com>
 <128da9c8-d138-47b9-b323-b845bd93ca2f@www.fastmail.com>
 <1991472336.3446950.1556778801333.JavaMail.zimbra@raptorengineeringinc.com>
Date: Thu, 02 May 2019 02:40:39 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Timothy Pearson" <tpearson@raptorengineering.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 2 May 2019, at 16:03, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
> > From: "Andrew Jeffery" <andrew@aj.id.au>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linux-aspeed" <linux-aspeed@lists.ozlabs.org>, "Ryan Chen"
> > <ryan_chen@aspeedtech.com>
> > Sent: Thursday, May 2, 2019 12:51:00 AM
> > Subject: Re: [PATCH 3/3] aspeed/pinctrl: Fix simultaneous DVO and serial outputs on AST2500 devices
> 
> > On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> >> There appears to be a significant error in the pinmux table starting on
> >> page 127 of the AST2500 datasheet v1.6.  Specifically, the COND2 (DVO)
> >> requirement is incorrectly applied to multiple digital video input (DVI)
> >> muxed pins, and no DVI-specific condition is provided.  This results in
> >> the serial devices incorrectly overriding the DVO pinmuxes and disabling
> >> the DVO pins.
> >> 
> >> Create a new condition code (COND6) for DVI enable, and update the most
> >> seriously affected pins to use the new condition code.
> >> 
> >> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> >> ---
> >>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++++--------
> >>  1 file changed, 9 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> index 6f357a11e89a..676f90d3c5f3 100644
> >> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> @@ -29,6 +29,7 @@
> >>  
> >>  #define COND1		{ ASPEED_IP_SCU, SCU90, BIT(6), 0, 0 }
> >>  #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
> >> +#define COND6		{ ASPEED_IP_SCU, SCU90, GENMASK(5, 4), 0, 0 }
> >>  
> >>  /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
> >>  #define LHCR0		0x20
> >> @@ -660,8 +661,8 @@ SSSF_PIN_DECL(T2, GPIOL0, NCTS1, SIG_DESC_SET(SCU84, 16));
> >>  
> >>  #define T1 89
> >>  #define T1_DESC		SIG_DESC_SET(SCU84, 17)
> >> -SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND2);
> >> -SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND2);
> >> +SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND6);
> >> +SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND6);
> > 
> > I feel like you didn't test this patch, because VPI_24_RSVD_DESC (the DVI
> > condition)
> > requires SCU90[5]=0b1, but your introduction of COND6 requires SCU90[5:4]=0b00
> > for
> > the mux configuration to succeed. This can't work - bit 5 of SCU90 can not
> > simultaneously take the values 1 and 0.
> 
> That's correct -- I don't have hardware that supports DVI available to 
> test with.

Okay. In that case I'm not prepared to ACK changes here, much less changes with
that fail in this way. The current implementation at least follows what is dictated by
the programming guide and is at least correct in theory.

As Ryan is not confident there are no negative side-effects to not following the
configuration dictated by the programming guide, changes like this have a real
up-hill battle on their hands.

Cheers,

Andrew

> 
> > Ryan: Can we just drop the COND2 requirement for function 2 of balls T1, U2, P4
> > and P3?
> > I think that gets us where we need to be?
> > 
> > Cheers,
> > 
> > Andrew
> > 
> >>  MS_PIN_DECL(T1, GPIOL1, VPIDE, NDCD1);
> >>  FUNC_GROUP_DECL(NDCD1, T1);
> >>  
> >> @@ -674,22 +675,22 @@ FUNC_GROUP_DECL(NDSR1, U1);
> >>  
> >>  #define U2 91
> >>  #define U2_DESC		SIG_DESC_SET(SCU84, 19)
> >> -SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC, COND2);
> >> -SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND2);
> >> +SIG_EXPR_LIST_DECL_SINGLE(VPIHS, VPI24, VPI_24_RSVD_DESC, U2_DESC, COND6);
> >> +SIG_EXPR_LIST_DECL_SINGLE(NRI1, NRI1, U2_DESC, COND6);
> >>  MS_PIN_DECL(U2, GPIOL3, VPIHS, NRI1);
> >>  FUNC_GROUP_DECL(NRI1, U2);
> >>  
> >>  #define P4 92
> >>  #define P4_DESC		SIG_DESC_SET(SCU84, 20)
> >> -SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC, COND2);
> >> -SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND2);
> >> +SIG_EXPR_LIST_DECL_SINGLE(VPIVS, VPI24, VPI_24_RSVD_DESC, P4_DESC, COND6);
> >> +SIG_EXPR_LIST_DECL_SINGLE(NDTR1, NDTR1, P4_DESC, COND6);
> >>  MS_PIN_DECL(P4, GPIOL4, VPIVS, NDTR1);
> >>  FUNC_GROUP_DECL(NDTR1, P4);
> >>  
> >>  #define P3 93
> >>  #define P3_DESC		SIG_DESC_SET(SCU84, 21)
> >> -SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC, COND2);
> >> -SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND2);
> >> +SIG_EXPR_LIST_DECL_SINGLE(VPICLK, VPI24, VPI_24_RSVD_DESC, P3_DESC, COND6);
> >> +SIG_EXPR_LIST_DECL_SINGLE(NRTS1, NRTS1, P3_DESC, COND6);
> >>  MS_PIN_DECL(P3, GPIOL5, VPICLK, NRTS1);
> >>  FUNC_GROUP_DECL(NRTS1, P3);
> >>  
> >> --
> >> 2.11.0
>
