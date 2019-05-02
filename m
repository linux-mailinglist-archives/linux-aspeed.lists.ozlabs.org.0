Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952E112A3
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 07:37:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vkXw469rzDqRJ
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 15:37:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KkmtCpp5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ItC1yIb4"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vkXk4ns6zDqBH
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 15:36:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BA00C447;
 Thu,  2 May 2019 01:36:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 02 May 2019 01:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=VVPLNvJqLTRIxlA9WfUjwDFR5mx5/VC
 Npyk17hOq70s=; b=KkmtCpp5pX7kKXJnFP+rBkIPYbkb+HdNkYVeBXd4PfCuOlY
 XaXI0w8jT/gbYMWld1+KoG8OSX0+A5dac5SRpTaxCxa91cH/Io7bm7SEnNxSyvT6
 wUpBg4CgXXFQgipO9cz7XJazfXu34WziE6qxfem55DiIdFuyJkm1B/h51fOkcXj8
 NxP64g2hl+qipYxc4hvbpP42oonKg7GPMwuBn19dXglBrqAKn+eNZWnUl5+xrgbi
 ofFk1rqbiFkdjKh5ZVcdYhOFwUBb5D6f+BZdwCZV2SNPdfHgPWGNRk3xkuJQA040
 byObJbc6xHpy4BWhUlUnaLti6zZMV5DfdtmUfqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VVPLNv
 JqLTRIxlA9WfUjwDFR5mx5/VCNpyk17hOq70s=; b=ItC1yIb4aL6oEdTOUaHEoW
 VmWW/Zx7deM7jyRaiRNoLHGxAHJjdhrujqJu+qwsaXnxZ1frM1AV+Wr8JJrFDe4r
 YQtKN8T/804ZWi9MJM1GsZmk6nitDdRnXriVinHaROZdu15cQc9uz9d4WuT35CBd
 +FYdbzxF+f91c7cjGk5PfMvF4JRCUlJjUoTxgv/JnvXbODKNns48Z1rcywZX7xxd
 pCmnR8KcQYL89hyCBJmdMWMNIa1o27XQyfuFSeP6asGdXTHzpFWperbWQSSdeDag
 ohMjBU/PHlOgyHkmPMRdF6jLkJX8G5XOm3jmlKPsdM3p0SUhpkfN3rke7v52GqYw
 ==
X-ME-Sender: <xms:8oHKXAV8ZuivDfOjTWhwdalrdj8dJ6xkhu93fRBYjzXsZa9cqiATKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:8oHKXGNTdMdX-16sG5MwL68QWOEyx_mAfPXiClpW3XoY3Tl1jK-Fbg>
 <xmx:8oHKXIdYeI8FDDzijIQJAmFGBjSlWkqUUAujCgJgiqp080FDRFXfdA>
 <xmx:8oHKXFyiTKoKlyETEd8okMyxg5XXDMNZMuuM5RZ0su25-R2UUhRetQ>
 <xmx:84HKXE86Rb3uHd9Y-VJnBv4WAqjvTzkTUpAiXznsSjx4DXSfGmn3eQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 131F87C6D9; Thu,  2 May 2019 01:36:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <29919040-1dbd-4950-9bcf-29fe9f1407d2@www.fastmail.com>
In-Reply-To: <08e21a55c7e746cda83694845c2b3429@TWMBX02.aspeed.com>
References: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
 <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
 <d5a0e5a855144fd6bb65c569b37dedfa@TWMBX02.aspeed.com>
 <313461427.3426138.1556768056285.JavaMail.zimbra@raptorengineeringinc.com>
 <921172cf50484d839bd30fa27ecf525e@TWMBX02.aspeed.com>
 <46d7b027-0f88-47e3-a132-e59b7640c867@www.fastmail.com>
 <08e21a55c7e746cda83694845c2b3429@TWMBX02.aspeed.com>
Date: Thu, 02 May 2019 01:36:49 -0400
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



On Thu, 2 May 2019, at 14:29, Ryan Chen wrote:
> > ----- Original Message -----
> > > From: "Ryan Chen" <ryan_chen@aspeedtech.com>
> > > To: "Andrew Jeffery" <andrew@aj.id.au>, "Timothy Pearson" <tpearson@raptorengineering.com>, "linux-aspeed"
> > > <linux-aspeed@lists.ozlabs.org>
> > > Cc: "Morris Mao" <morris_mao@aspeedtech.com>
> > > Sent: Wednesday, May 1, 2019 10:06:25 PM
> > > Subject: RE: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / 
> > > PWM and DVO outputs on AST2500 devices
> > 
> > >>On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> > >> There appears to be a small error in the pinmux table on pages 130 
> > >>and
> > >> 131 of the AST2500 datasheet v1.6.  Specifically, the COND2 
> > >>requirement used to mux the surrounding pins to DVI was 
> > >>inadvertently replicated to pins V1, W1, V2, and W2 in the table, 
> > >>which do not incorporate DVI functionality.
> > >> 
> > >> As a result of this error, both serial TX lines and the PWM 0/1 
> > >> outputs were overriding the VPO pinmux settings when VPO was 
> > >> enabled in the pinmux hogs.
> > >> 
> > >> This patch has been verified to function on Blackbird hardware.  
> > >> Both serial TXD pins and PWM0/PWM1 were functionally tested with 
> > >> SCU94[1:0] set to 0x1.
> > > 
> > > Hello Tim.
> > > 
> > > The AST2500 pwm0/1 configure need following condition, the 
> > > SCU94[1:0] is 0x1, it should not work.
> > > Could you help confirm it?
> > > 
> > > v2 : pwm 0 : scu88[0] = 1 & scu 94[1:0] = 0 & scu90[5] = 0
> > > w2 : pwm 1 : scu88[1] = 1 & scu 94[1:0] = 0 & scu90[5] = 0
> > 
> > >>I can confirm that with SCU94[1:0] == 0x1 the PWM0 and PWM1 outputs work correctly -- this was tested on our Blackbird >>hardware.  If you are reading from the datasheet, I suspect there are a few errors in it relating to the relatively rarely used DVO >>mux settings.
> > 
> > Yes it can work after check with designer, if you don't enable the CRT 
> > driver, it will work.
> > But for safety.
> 
> >>What do you mean by "for safety"?
> 
> Sorry, my point is if gfx driver also loaded, it will impact.
> But, It is ok for this modification. 

Okay, that's enough confirmation for the moment.

> Due to pinctrl gfx pwm is separate 
> driver setting. 
> 
> 
> > You need also and with COND2 for pwm driver loaded.
> 
> >>I'm confused here because it sounds like from Tim's experiment PWM0 / PWM1 work without the dependency on COND2 >>despite VPO being enabled, and the designer confirms as much, but we shouldn't do it?
> 
> >>Regardless, in summary you're saying that for TXD1 and RXD1 the change to remove the dependence on COND2 is appropriate, but not for PWM0 and PWM1?
> 
> > 
> > 
> >
>
