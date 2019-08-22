Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57532988FB
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 03:29:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DRlY0tHmzDqND
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 11:29:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="po1bSAxS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Tucw0xXy"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DRhx40xlzDr2q
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 11:27:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DC9B021AF1;
 Wed, 21 Aug 2019 21:27:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 21 Aug 2019 21:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=P6YpUynkrjoqomQxrt5nvLSMmxiMUP5
 C3MbwFz57nIQ=; b=po1bSAxSE0b82sdIWJwchyERgu4XtUIj/I6ox3dd0jkWZmJ
 Hb70Xt27qKswndCfNSbMggxyW4AGy5cPcwk3d6pLvCO2e6RmcY4tn0qbfAue8mUf
 By5HKRe+GLYpqdBuYIMj/TSLMSUzBLim8cetsqYd19B35s0973ajgPF9mVBXlrrW
 OLsEZOUGWPoQIe0ZwGPjIu7rKN6pHXR2n2+pjBacuYfKMHiU1xrmAMvoia1UOD+6
 hjtAaTJ5Cqu8IyX5e2h3J3B+DCG639BtU23hGngsxs4ezG4X+PtFJcTSvHy1Y0lm
 PUp5TKqQsx8G0dCgytjNz3qfYaG47RBGxjJbNrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=P6YpUy
 nkrjoqomQxrt5nvLSMmxiMUP5C3MbwFz57nIQ=; b=Tucw0xXyRP7T4g/oHMyyRq
 noLw5CMf+TsvwPixt4TAgOeiyUD/6zVrlJWf+eH7QOpnmsHoIk7NYH/w4kgYzunR
 uDo+1+B/kyvGvP5xbAqF+daskCoUZFegQH/cdQ4BN/tdc8vsIOu6zg6VmTHeUGA5
 rjXpBUVvg9imVdkRy/gNEwknI9lguU3xEMVJ2rNV67Cg04FCWRE6C+C5z9ThMg8v
 wdnImsM4Gyu3eps1I4BRzrLtn9oWGyZk7irVcnkN8SyEN2lKELwnhH91W46wRujE
 Ks2BvAyYXmyXFxLLBzh0xi9V+0JPt+SQoNmzi+PPqARO2kuoYnkHwj4wC1QT6Qog
 ==
X-ME-Sender: <xms:bO9dXRyhlMHkPIyvSyTMCpGjgAKnFwTL1VUyViUdjtfApivW59iycQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeggedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:bO9dXT4AzVZ6gxCBZw6KGjfUsezo-hO6vLRqE8ikv5yL0TVj5b5GDg>
 <xmx:bO9dXa18wnpibyM5my2EIwfTaUc6LehUuy7R_D_-dl2tw4CPxKEwyA>
 <xmx:bO9dXU131KUAv9eIHrFR-Q3-zsL96Kb6KqKKNeYS6jgQlKvzTaj7gA>
 <xmx:be9dXf3KDKs3dNnP04ffsk-pquiV3ZkOcC74fBLYiQKY3CkyB92BNA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5E11AE00A3; Wed, 21 Aug 2019 21:27:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <0e9c483f-4f12-45a4-8d2c-1aa3ae34fa7a@www.fastmail.com>
In-Reply-To: <20190821055530.8720-3-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
 <20190821055530.8720-3-joel@jms.id.au>
Date: Thu, 22 Aug 2019 10:57:22 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Olof Johansson" <olof@lixom.net>
Subject: Re: [PATCH 2/7] ARM: aspeed: Select timer in each SoC
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
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 21 Aug 2019, at 15:26, Joel Stanley wrote:
> In preparation for adding the ast2600 which does not use this timer.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/mach-aspeed/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index a15c3a291386..2979aa4daeea 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -5,7 +5,6 @@ menuconfig ARCH_ASPEED
>  	select SRAM
>  	select WATCHDOG
>  	select ASPEED_WATCHDOG
> -	select FTTMR010_TIMER
>  	select MFD_SYSCON
>  	select PINCTRL
>  	help
> @@ -18,6 +17,7 @@ config MACH_ASPEED_G4
>  	depends on ARCH_MULTI_V5
>  	select CPU_ARM926T
>  	select PINCTRL_ASPEED_G4
> +	select FTTMR010_TIMER
>  	help
>  	 Say yes if you intend to run on an Aspeed ast2400 or similar
>  	 fourth generation BMCs, such as those used by OpenPower Power8
> @@ -28,6 +28,7 @@ config MACH_ASPEED_G5
>  	depends on ARCH_MULTI_V6
>  	select CPU_V6
>  	select PINCTRL_ASPEED_G5
> +	select FTTMR010_TIMER
>  	help
>  	 Say yes if you intend to run on an Aspeed ast2500 or similar
>  	 fifth generation Aspeed BMCs.
> -- 
> 2.23.0.rc1
> 
>
