Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF561121E
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 06:15:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vhl62gGNzDqR1
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 14:15:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VN+0vS1R"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nn6gaBuA"; dkim-atps=neutral
X-Greylist: delayed 584 seconds by postgrey-1.36 at bilbo;
 Thu, 02 May 2019 14:15:35 AEST
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vhkv6J65zDqPG
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 14:15:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4C30966C;
 Thu,  2 May 2019 00:05:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 02 May 2019 00:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=2hYgo8k4pDiewUZp5w3MFzocN3XoRgy
 dlOphL5du7YI=; b=VN+0vS1R/PUb/3TpNObPdp7RCQAvd9CesiSWRON7U04qj6o
 Gb2R68fKKLFg9dhISJD/pdQelAWI8Q+ftX1aHpEs+vHJUCZpHDFsB79Atq5ZeqTI
 djrX8l3uU06A7OONboOImiMvCVREBqfvhHOqLV1zA/S7XUYSPMFk7xxd+r3b8fTm
 5bLvhqbExZsX+BReDFsgxsIaLQqIWvvWeq1rLLMklBfdki0/l5btVSV9gOQGCMZR
 u4gvllTOaS6MagMjkpXQ7+ZPVUUo2mFVTJboHJ9jHhZ+TO+YL9EuPlqiC5lp0lXF
 p7vaaEjvgZznPEzvbbb0+lk31uZ9R1PmUHOAf/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2hYgo8
 k4pDiewUZp5w3MFzocN3XoRgydlOphL5du7YI=; b=nn6gaBuAnIzc5KUgCqP3Ih
 TD7SzNVpM5RnQx4ruD/2nge2+j+uvJ7CYCQbsvJLLstKlww1eoe+AljQ1KqjvdSi
 v7CEd5vvhEm0CEz93rHqE0hIZlr1cnG+zS254wF7sncT1EVjV35uCB+d6EuB9jGl
 Nz8hY40BbBf4MrEykILchhDwzbdAFxjkSWVXnxukKwOtUiaJ10QDPwNHxlNGaa2W
 WhUawgmfIomupp8ACENC5AXTQAspMVES8/4Kr3ONPtClXPNRO20ca/bgP2dZrLzz
 hM21UOcSCkuu2L4/L2vaFZKwpqLnxq5wVH3nNc875W0qeZFtG+oN1ySzic3WfXoQ
 ==
X-ME-Sender: <xms:mGzKXAkrwnG4IHZoQpxfLgoclVPmhQwLhvWe4ksAZ0RjDKDvSxvMxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:mGzKXBfIsaAM_fB6_fMuX-vH_20NgkyyEIZbLQsNVhZI65IWItb7Eg>
 <xmx:mGzKXNWFnDC0jrtmPx-3rIupsExJMtGJU6OZvYc8DLxYuXANdiQVMA>
 <xmx:mGzKXFGxNSGH_Zdy1-WMnr5_aSSUdtA9srQwWopyZPD_V8Lbpy2jig>
 <xmx:mWzKXHqCLgIuZ8Bmn7Y182FcIMFHGByfy3qt4LW2U-JZ1PPGW6gKNQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8AE5B7C6D9; Thu,  2 May 2019 00:05:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <46d7b027-0f88-47e3-a132-e59b7640c867@www.fastmail.com>
In-Reply-To: <921172cf50484d839bd30fa27ecf525e@TWMBX02.aspeed.com>
References: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
 <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
 <d5a0e5a855144fd6bb65c569b37dedfa@TWMBX02.aspeed.com>
 <313461427.3426138.1556768056285.JavaMail.zimbra@raptorengineeringinc.com>
 <921172cf50484d839bd30fa27ecf525e@TWMBX02.aspeed.com>
Date: Thu, 02 May 2019 00:05:44 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Timothy Pearson" <tpearson@raptorengineering.com>
Subject: =?UTF-8?Q?Re:_[PATCH_2/3]_aspeed/pinctrl:_Fix_simultaneous_RS-232_/_PWM_?=
 =?UTF-8?Q?and_DVO_outputs_on_AST2500_devices?=
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 2 May 2019, at 13:17, Ryan Chen wrote:
> ----- Original Message -----
> > From: "Ryan Chen" <ryan_chen@aspeedtech.com>
> > To: "Andrew Jeffery" <andrew@aj.id.au>, "Timothy Pearson" <tpearson@raptorengineering.com>, "linux-aspeed"
> > <linux-aspeed@lists.ozlabs.org>
> > Cc: "Morris Mao" <morris_mao@aspeedtech.com>
> > Sent: Wednesday, May 1, 2019 10:06:25 PM
> > Subject: RE: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM 
> > and DVO outputs on AST2500 devices
> 
> >>On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> >> There appears to be a small error in the pinmux table on pages 130 
> >>and
> >> 131 of the AST2500 datasheet v1.6.  Specifically, the COND2  
> >>requirement used to mux the surrounding pins to DVI was inadvertently  
> >>replicated to pins V1, W1, V2, and W2 in the table, which do not  
> >>incorporate DVI functionality.
> >> 
> >> As a result of this error, both serial TX lines and the PWM 0/1 
> >> outputs were overriding the VPO pinmux settings when VPO was enabled 
> >> in the pinmux hogs.
> >> 
> >> This patch has been verified to function on Blackbird hardware.  Both 
> >> serial TXD pins and PWM0/PWM1 were functionally tested with 
> >> SCU94[1:0] set to 0x1.
> > 
> > Hello Tim.
> > 
> > The AST2500 pwm0/1 configure need following condition, the SCU94[1:0] 
> > is 0x1, it should not work.
> > Could you help confirm it?
> > 
> > v2 : pwm 0 : scu88[0] = 1 & scu 94[1:0] = 0 & scu90[5] = 0
> > w2 : pwm 1 : scu88[1] = 1 & scu 94[1:0] = 0 & scu90[5] = 0
> 
> >>I can confirm that with SCU94[1:0] == 0x1 the PWM0 and PWM1 outputs work correctly -- this was tested on our Blackbird >>hardware.  If you are reading from the datasheet, I suspect there are a few errors in it relating to the relatively rarely used DVO >>mux settings.
> 
> Yes it can work after check with designer, if you don't enable the CRT 
> driver, it will work.
> But for safety.

What do you mean by "for safety"?

> You need also and with COND2 for pwm driver loaded.

I'm confused here because it sounds like from Tim's experiment PWM0
/ PWM1 work without the dependency on COND2 despite VPO being
enabled, and the designer confirms as much, but we shouldn't do it?

Regardless, in summary you're saying that for TXD1 and RXD1 the
change to remove the dependence on COND2 is appropriate, but
not for PWM0 and PWM1?

Andrew

> 
> 
>
