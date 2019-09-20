Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F625B8AA7
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 07:53:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZNF15V25zF0WC
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 15:53:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F5uLX2no"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="X5MFIhya"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZNDp591dzDsTG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2019 15:53:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B096155D;
 Fri, 20 Sep 2019 01:53:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 01:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=sYqoSELWDB8JtRDLGnIHP2w4CWUd69D
 2d/NJIApm9X4=; b=F5uLX2noa80V2YgZkxsR/Ju/5z1IDtVut1FBoQ3K/K2q3mD
 FE6eXLmDmKqMneAD0c04mrhmY4lp00+nxzO6fDYkLKzKgUfKeryBcERc+HbIFQsz
 T+DyyH66+F0qBBALece+nVYTr6G8kwe4v9LpXRca9QQ+guy5hDULbhoz1EqYfAMk
 Lp0IO+LgtNJ74k8ttvSXpu31yYRKy00qqakUSgjvoaI8sDd5K0akorMRsXz4PVGS
 WChHRRqFcroepQWNK/1Bc2IBkvilH3aUBmLiaI2kuyzmUyRJ2UlYevcoOQSAaDi9
 rebW2epsehsCl4/f4wR6hQyj5v5cpvTUWAPb8yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sYqoSE
 LWDB8JtRDLGnIHP2w4CWUd69D2d/NJIApm9X4=; b=X5MFIhyam3OwRQGxeEFfqN
 vbZqP7dsUy3wq0Y2PwKLDdy5Yva5q5pHE5lZOWAUTLh+QnJ+kUk/xDOcjLhdW5gj
 +u67i2DkQ/kP0zmMvE/8GOO0uD4r9hBaITdSLSBAT7obvobxl99ZMwNkfnS8Rbyq
 RkF7Nlt9xw7L6EM709+FUgHeyIoYog/VrwVGjd/1AxRA22JIrxXsbmAdfrd67i/o
 L+tIex7vBBfGGdDq52mkqguAm1sCAjCz6urP72b4vq0QvPdttyuJcazsDjwvune3
 P42qiZK68dFQwy7WS80Nv8qleKFNQw6LWOEoY9r104qIsVgxMI65KbOoPC3oLNvA
 ==
X-ME-Sender: <xms:VWmEXQnLmTqB_ZYGyZLv6wMBigE-jyluAPiu9gh8CJSwdmVLHyeUAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:VWmEXddD0WcvobIQxoECsJpegeP3Mx3I0K1CUx3Bd_9afJ_Ghprpgg>
 <xmx:VWmEXWCeeQLUHUt88jH6xISWu-YyomLDowuhLtkmvtZtUDHpzMEy_w>
 <xmx:VWmEXUx7umQBGJFWRPFYV9eZAcgRofrJwONCOvswIf4lAfz_7jd1gw>
 <xmx:VmmEXedHSKeRbg6evgvXPcH7JKpCfkj_PGivqKOqAJFNlJBEDFygZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1AF35E00A9; Fri, 20 Sep 2019 01:53:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <a26c90b8-8f85-4fe5-9dab-d7213f181efd@www.fastmail.com>
In-Reply-To: <20190919142654.1578823-1-arnd@arndb.de>
References: <20190919142654.1578823-1-arnd@arndb.de>
Date: Fri, 20 Sep 2019 15:24:01 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Arnd Bergmann" <arnd@arndb.de>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ARM: aspeed: ast2500 is ARMv6K
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 19 Sep 2019, at 23:56, Arnd Bergmann wrote:
> Linux supports both the original ARMv6 level (early ARM1136) and ARMv6K
> (later ARM1136, ARM1176 and ARM11mpcore).
> 
> ast2500 falls into the second categoy, being based on arm1176jzf-s.
> This is enabled by default when using ARCH_MULTI_V6, so we should
> not 'select CPU_V6'.
> 
> Removing this will lead to more efficient use of atomic instructions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-aspeed/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index a293137f5814..163931a03136 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -26,7 +26,6 @@ config MACH_ASPEED_G4
>  config MACH_ASPEED_G5
>  	bool "Aspeed SoC 5th Generation"
>  	depends on ARCH_MULTI_V6
> -	select CPU_V6
>  	select PINCTRL_ASPEED_G5 if !CC_IS_CLANG

Unrelated, but I'm intrigued by this. Looks like I should try compile it with clang
and fix the fallout.

Andrew
