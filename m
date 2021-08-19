Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5F3F13EC
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 08:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqwbw4lBPz3bYX
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Aug 2021 16:59:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=EpEuFInQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cU8njNO4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=EpEuFInQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=cU8njNO4; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gqwbk3RFzz2yZc
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Aug 2021 16:58:57 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id BC5433200A08;
 Thu, 19 Aug 2021 02:58:53 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 19 Aug 2021 02:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=w3JOhwQjntF2rVL1+XLvNImuUCXHTfJ
 7kCvG5x0t6hI=; b=EpEuFInQCoyZZbbv83qE4hFgNUkED0gnnVAVgSg13+Z0xn5
 GnQCHAqP1WCsn2p5FlwsphiWq97mkoNEiKifZuezvBEPfxY00muzcP+GVo7jHBmZ
 inFHZ2AyhKfcjnKHQ2PVaYX8kPkUpqlcTTJe2VyhCFCR7MDMuX0m4CZmPqaXCyt9
 mwAxirrXKRqak9xTQ63BZC+f8nE91zLfD5oHVUX0nDgalivWqJKHYLC8MmTGh1YI
 MLAKkain3OgoxaqkuCNguMqFAVqyg74qMeInPwCfZLDW6q5LIJ18dLJwPm4qDUzH
 XwcKOBwIvKt+pfidrX/TZwUlQiM233EBy7ABqhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=w3JOhw
 QjntF2rVL1+XLvNImuUCXHTfJ7kCvG5x0t6hI=; b=cU8njNO4ckd0S6gDy1UhDR
 pIKSsMBgx1eVj3U1QoXtMbV8TjhgpYW9MFyAwliv4vOOTmFIJP2Dk2/5ho9Uuoam
 efhUohTv9KeHCrA0KzhwCf08RDcYuS99o/rKFjmqkiEvrMs1wnIZoah61EdH4j9f
 3vE036bltP6R668uqgVMLwpE2CshGcBy/gbZ8B03cQpXmxM9s5s6EL8t5WqKND7b
 sK7KYzkopHVRQnAUZ3cDasPYxsqJY3Xs6glU/uGbMMUDgxB/9ynGqzIpgpy8ERrS
 f9hyweDFvw+NXbKcxA6DF6fll3mHdTiylg8lDC9RNmp9XoWXLOMAwAqG8kqSotaQ
 ==
X-ME-Sender: <xms:LAEeYW4YTu17ERSlDMmlr3FJB3Qt7ANd9tW0oHCaVPKYom-x5eCIvQ>
 <xme:LAEeYf5WkWX6b4AEgoTzm9PbcO47tvsQHFC02_6qUnHryqXN03HyfFoG0MVmSuj4A
 bMC3agV3tklSzDn4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeigdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:LAEeYVeWkkC5A2mttXyR1NskC_2nbmyrTzwY_lxrOv6KlFzTirxOAA>
 <xmx:LAEeYTKZk4B18kGzjp0bKdSxFk_qM1VrsDFfPqb18pgXeLC7unqDSg>
 <xmx:LAEeYaLq1iyyZL--Qo7mG6xKchP38SCdLoFEgSO9R60VPKQKfdnvTA>
 <xmx:LQEeYUyHJUope1bKi3sPzHij-f2BNlVxm0izWd1d57xME6aG_TEYJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5526CAC0DD0; Thu, 19 Aug 2021 02:58:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <fb7380ff-55ed-41aa-a446-28f7235b4d9f@www.fastmail.com>
In-Reply-To: <20210819065203.2620911-1-joel@jms.id.au>
References: <20210819065203.2620911-1-joel@jms.id.au>
Date: Thu, 19 Aug 2021 16:28:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 0/4] ARM: config: aspeed: Defconfig updates
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



On Thu, 19 Aug 2021, at 16:21, Joel Stanley wrote:
> Here are some defconfig updates that we've been using in the openbmc
> distro kernel tree for a while now.
> 
> Joel Stanley (4):
>   ARM: config: aspeed: Enable hardened allocator feature
>   ARM: config: aspeed: Enable KCS adapter for raw SerIO
>   ARM: config: aspeed_g4: Enable EDAC and SPGIO
>   ARM: config: aspeed: Regenerate defconfigs
> 
>  arch/arm/configs/aspeed_g4_defconfig | 16 +++++-----------
>  arch/arm/configs/aspeed_g5_defconfig | 25 +++++++++----------------
>  2 files changed, 14 insertions(+), 27 deletions(-)

For the series:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
