Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42A1259F
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 02:40:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wCwg3XbZzDqRn
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 May 2019 10:40:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kbFewV/q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BrT9rp+8"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wCs03rngzDqHJ
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 May 2019 10:37:39 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AE3A1729;
 Thu,  2 May 2019 20:37:36 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 02 May 2019 20:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=MoCNAzuXS7otpzRVqNVdqTJcfA2KCAd
 CGw1JbvsxJ+E=; b=kbFewV/qmNlbgvtvoCPnEu3OLNQTzL3l3nymk8LGJcPWUdI
 1UTZqVgrFCySx+wXJ1kDllQkcqwi15ZMp3Xdzramyp3rrdj1FJ45BTaIOIpRg+RO
 yxCgmF9GQ4HWUIEDzxO5xuvUbbU5Stsbx81OHFtwj5bk44khTHFwpxGZbrfncsf9
 8KBYKV1KO1IzYXbX6U1lpQbSS3cliZIIa9ansF3Vp7RPwYYF61b73x/4RplrEJLX
 ZOuZ2Q0GBLvkGVsYKURFmjDWzmtadMwGQ5LyJr9EI6MpOaXeLTcQlMeFAN+CW6IP
 881FsH7qVMczLd0Q/5W7fMF/BToH6nSJ3I6VOXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MoCNAz
 uXS7otpzRVqNVdqTJcfA2KCAdCGw1JbvsxJ+E=; b=BrT9rp+8cWxZI4HCh3FvxY
 8BmOh2U3PCnhg6TyXQqiXz1r3p+XhM8u3L3O4AWTQ9eHDrYd5YPHhEcRXwFUSKyy
 pdewHOad3j8PBs5cN6CFWLdOg1hDBxd2402gdEL4tprBZEpAw+thJ7vIsoaNv6iG
 yH2acXqkGCpxKU2DSvV/pifGkkuv344PGnnxh7oBcPguWGXwTIxYryDFZEKc8Kl4
 OKu74481pQlVdFjXhOHJlToV+Ns2Mj1MN3bm38r+LermHCpE4MFcvTLt/Pjb9Mdb
 3u5B0unyfrVX59U+EgsGYZCS8Zkym52zsKkcHMV3+zeY2+1BwRaYOhI8i06GoEXA
 ==
X-ME-Sender: <xms:To3LXBdDwmvt-7i_wSUWCRN5yGLvv-9RjK37_coU9-D-eRxS-9Ir2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedtgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:To3LXAe8CtEUbBL04mtKbfev8Ot0j6YHlCimeoKOCm-kHSUgSoFz9w>
 <xmx:To3LXP0TlFzRi-GUMbJja8VAd9jZO9ADCNg2NKZO4gDGVXycpBrF0Q>
 <xmx:To3LXI5idhfZ7EgZRgsM4hH7uSavGmixBm6RZR61o_39dBmXfZM6Sg>
 <xmx:UI3LXP7o9kOyrZpICgzMChtFzHVr4JnO2QP-MLKJV60wDPccRmxHeA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 790687C6D9; Thu,  2 May 2019 20:37:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <ce2192a1-a8d8-426a-9687-9eb71aeb2966@www.fastmail.com>
In-Reply-To: <1968156380.3538229.1556825858913.JavaMail.zimbra@raptorengineeringinc.com>
References: <236762130.3394112.1556751009128.JavaMail.zimbra@raptorengineeringinc.com>
 <128da9c8-d138-47b9-b323-b845bd93ca2f@www.fastmail.com>
 <1991472336.3446950.1556778801333.JavaMail.zimbra@raptorengineeringinc.com>
 <e2388fbc-e664-4338-a0f5-d34a3621c3fb@www.fastmail.com>
 <1968156380.3538229.1556825858913.JavaMail.zimbra@raptorengineeringinc.com>
Date: Thu, 02 May 2019 20:36:44 -0400
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



On Fri, 3 May 2019, at 05:07, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
> > From: "Andrew Jeffery" <andrew@aj.id.au>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "linux-aspeed" <linux-aspeed@lists.ozlabs.org>, "Ryan Chen" <ryan_chen@aspeedtech.com>
> > Sent: Thursday, May 2, 2019 1:40:39 AM
> > Subject: Re: [PATCH 3/3] aspeed/pinctrl: Fix simultaneous DVO and serial outputs on AST2500 devices
> 
> > On Thu, 2 May 2019, at 16:03, Timothy Pearson wrote:
> >> 
> >> 
> >> ----- Original Message -----
> >> > From: "Andrew Jeffery" <andrew@aj.id.au>
> >> > To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linux-aspeed"
> >> > <linux-aspeed@lists.ozlabs.org>, "Ryan Chen"
> >> > <ryan_chen@aspeedtech.com>
> >> > Sent: Thursday, May 2, 2019 12:51:00 AM
> >> > Subject: Re: [PATCH 3/3] aspeed/pinctrl: Fix simultaneous DVO and serial outputs
> >> > on AST2500 devices
> >> 
> >> > On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> >> >> There appears to be a significant error in the pinmux table starting on
> >> >> page 127 of the AST2500 datasheet v1.6.  Specifically, the COND2 (DVO)
> >> >> requirement is incorrectly applied to multiple digital video input (DVI)
> >> >> muxed pins, and no DVI-specific condition is provided.  This results in
> >> >> the serial devices incorrectly overriding the DVO pinmuxes and disabling
> >> >> the DVO pins.
> >> >> 
> >> >> Create a new condition code (COND6) for DVI enable, and update the most
> >> >> seriously affected pins to use the new condition code.
> >> >> 
> >> >> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> >> >> ---
> >> >>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++++--------
> >> >>  1 file changed, 9 insertions(+), 8 deletions(-)
> >> >> 
> >> >> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> >> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> >> index 6f357a11e89a..676f90d3c5f3 100644
> >> >> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> >> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> >> >> @@ -29,6 +29,7 @@
> >> >>  
> >> >>  #define COND1		{ ASPEED_IP_SCU, SCU90, BIT(6), 0, 0 }
> >> >>  #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
> >> >> +#define COND6		{ ASPEED_IP_SCU, SCU90, GENMASK(5, 4), 0, 0 }
> >> >>  
> >> >>  /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
> >> >>  #define LHCR0		0x20
> >> >> @@ -660,8 +661,8 @@ SSSF_PIN_DECL(T2, GPIOL0, NCTS1, SIG_DESC_SET(SCU84, 16));
> >> >>  
> >> >>  #define T1 89
> >> >>  #define T1_DESC		SIG_DESC_SET(SCU84, 17)
> >> >> -SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND2);
> >> >> -SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND2);
> >> >> +SIG_EXPR_LIST_DECL_SINGLE(VPIDE, VPI24, VPI_24_RSVD_DESC, T1_DESC, COND6);
> >> >> +SIG_EXPR_LIST_DECL_SINGLE(NDCD1, NDCD1, T1_DESC, COND6);
> >> > 
> >> > I feel like you didn't test this patch, because VPI_24_RSVD_DESC (the DVI
> >> > condition)
> >> > requires SCU90[5]=0b1, but your introduction of COND6 requires SCU90[5:4]=0b00
> >> > for
> >> > the mux configuration to succeed. This can't work - bit 5 of SCU90 can not
> >> > simultaneously take the values 1 and 0.
> >> 
> >> That's correct -- I don't have hardware that supports DVI available to
> >> test with.
> > 
> > Okay. In that case I'm not prepared to ACK changes here, much less changes with
> > that fail in this way. The current implementation at least follows what is
> > dictated by
> > the programming guide and is at least correct in theory.
> > 
> > As Ryan is not confident there are no negative side-effects to not following the
> > configuration dictated by the programming guide, changes like this have a real
> > up-hill battle on their hands.
> > 
> > Cheers,
> > 
> > Andrew
> 
> There is a negative effect right now in that enabling either UART will 
> force disable the DVO pinmuxes.  While I agree the patch needs 
> additional work, as it stands right now DVO will not function 
> simultaneously with the UART without a patched kernel.
> 
> From where I stand I am fairly confident in a documentation error, 
> however I do not have access to the hardware required to prove this.  
> Can someone at ASpeed look at the HDL and verify or correct the 
> documentation?  We have already caught one documentation error relating 
> to COND2 and DVO, and verified that one in hardware.

Right - it's odd that there's a dependency on COND2 when COND2 relates to
VPO, but the pins in question are VPI pins, and you're not interested in VPI.

Ryan and I have spoken about it but he's deferred to the designer's opinion
which is that we should follow what's specified in the datasheet.

Given the complexity of the pinmux I'm going to set the bar for accepting these
patches at "you need to convince Aspeed to correct the programming guide".
I understand that might be annoying, but I need to be conservative to cater to
the stability of everyone's use-cases, and not just accept patches contrary to the
datasheet to enable your "conflicting" design. I appreciate that your experiments
indicate the datasheet is misleading in some circumstances, but let's get Aspeed
on board with that.

Andrew
