Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17AA1352F9
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 07:02:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tb9w6dLKzDqX6
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 17:02:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=rLpUWQAM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZWULgXyt; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tb9n36MJzDqWg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2020 17:02:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E326721B2C;
 Thu,  9 Jan 2020 01:02:18 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 Jan 2020 01:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=UdhEr+iyYXu1wWyUc29O8TnTBKmF7NO
 gM7/OFTNWI8g=; b=rLpUWQAMg9zjllbFbX0l6+mEXKvU22ZzreE0ZBYGm18gMes
 XwZ1n6ZNqHZAKpOFj282xyfOdS3hMuuNsQn6lfFFojiw+JAjPiMr9z628Osvcf5V
 GCqSYHPlB5Sl5y08Dy7AEL4F1EiuYa+s0rW6x0GqHi3scCYXRFVjUPbT0qn2U4Uz
 G+JzFKLP8j1CuU/OskDKD8Vz1jNc2r4rfMQ/myPWjfhNctVzknczuUgLsqeuW0m0
 2gTlYgPoj2TL6ZM/t6ETl8Eh1adVJJsyhCyqjzih/DFEw79Ug3pMx+q4Q+sez7iF
 XVGaQan8V66IiZutbGJZfkhMTiyLXMd2K+bP6qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UdhEr+
 iyYXu1wWyUc29O8TnTBKmF7NOgM7/OFTNWI8g=; b=ZWULgXyte3UDblGEVjFP83
 H7pmqVzxZ5Bjj3BYaiwHr+Ocp93CnJnhV+f3Hnno44amS28k+ofMS1Cx+B5kPIGZ
 xp05MgyJ+I7XUFTizStJjwgRmgky8rKDQWWtVDWIDbtD53VPwBDiv6NOBytTbbUH
 vQvFbT07gWvV9LA+dEPoPjK04IRiwtzzC6UhcTzf4eQjCATi2mnrLwe/bTw8KxB3
 7Bp6Rc3PF8c2ZyrocnFNa89zxa8M9rlkybrad9MWdCdJsmiKK1SG+Bh9mzDPrkeA
 RVnufIFWZyVtwcUUlT2OukIc7wU5HW2rRm+4/w84YsdZAZll83/Zk+CIEf5QXVtQ
 ==
X-ME-Sender: <xms:6sEWXkYnFMnb33JNiq_p5QOLzvKXqGsJ3YMmVBWtJaw_gc02k4hLPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:6sEWXvQbSMIOyc6STMnCnNkXJm3drNIFz8yrduvuk5OPMfSzjNTyxQ>
 <xmx:6sEWXsQlmTVlq5-4Dt9JKUfhhOUHQNq2pBSmMQwfYsrX3Hg3z1LR4A>
 <xmx:6sEWXq3jgxqim-eSCFAWa2Lx75yxsolvOE-mSYxW66IEy7hipbQ7kA>
 <xmx:6sEWXjoD3DzI_1heMWWewmrPWDwOnZ2kcWH6PXqXWb3xt4uwDrJpGQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E69FEE00A1; Thu,  9 Jan 2020 01:02:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <406ac609-129e-4e11-8654-e4a48d8f72f8@www.fastmail.com>
In-Reply-To: <1577993276-2184-12-git-send-email-eajames@linux.ibm.com>
References: <1577993276-2184-1-git-send-email-eajames@linux.ibm.com>
 <1577993276-2184-12-git-send-email-eajames@linux.ibm.com>
Date: Thu, 09 Jan 2020 16:34:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v4_11/12]_ARM:_dts:_aspeed:_witherspoon:_Enable_XDM?=
 =?UTF-8?Q?A_Engine?=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 3 Jan 2020, at 05:57, Eddie James wrote:
> Enable the XDMA engine node.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 569dad93e162..1a28b86f00ea 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -658,4 +658,9 @@ &video {
>  	memory-region = <&video_engine_memory>;
>  };
>  
> +&xdma {
> +	status = "okay";
> +	memory = <0x9f000000 0x01000000>;

Can you please add a comment about how the memory range was
derived?
