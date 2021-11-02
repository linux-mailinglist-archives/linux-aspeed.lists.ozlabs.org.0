Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EADE44385D
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 23:22:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkPXs13lVz2yHN
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 09:22:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=CMtujqSt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=l7LlPY5P;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=CMtujqSt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=l7LlPY5P; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkPXm5mLlz2xWl
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 09:22:32 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id D54335806BD;
 Tue,  2 Nov 2021 18:22:30 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 02 Nov 2021 18:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=lRYFonQHxyKVIQHctF2xCVzNJ0wZ1uh
 wvW06HHv7F9o=; b=CMtujqStofT8yzZYkSLzcXea6xGWqqwaRrGTT536quPGG6U
 zTcFYzyIyMly6hdfglNBm/BT8tFH3IzA9ICFc7aMuiIKl64mLH8g1iLJadhgYssH
 DeWm04Z03gE09FYhjfR5NcxKYWYG7WeAPepu4vJFFQ17IhWByHjAHDwEJdso7xj1
 x6jHZ75iU+S9Zrlod92+daqBTcjFLcj/but1bf98wrBsOfP6i016AT4pKah7QP1u
 hxW2cHuFxFvh3nW3i+H2WOhTN2McX4ytxajWvlwRxFTfbP94vn8kAQ5zdSbJJmTO
 Grgmf+TaboyPouBEcwrOvaVlO4m9rTb+veKUtrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lRYFon
 QHxyKVIQHctF2xCVzNJ0wZ1uhwvW06HHv7F9o=; b=l7LlPY5PPOIIKIiaO0HlPZ
 mN+oR/Vy0wjG0wCwSjVTjk9vDy75B4+RaimsZSDEJDh7ZFUFGsaVTyVh2RjPluLP
 Nhjit6hxJGlSd1zQmHnVW52Hdo/r3/ibr11B4k5+wlZLG1w32BQOD3drwH2K69Jb
 qTL9FT+cLVWNWmR0fR6AkkEQuE9rSZdLBpIodYXsWZiBRbW4XVbYhCCV6G8rzPrA
 UJim3YIwUoNFu4dn0Ku1JiZpqZqbROFkPBTcwVSF+m/7RDxbkk5yDB0f8nLNEQmW
 SCn+xdpXNtPW7WH6jLmXBt12jINgPXPZISyNQWaFAeVBrkIRD6LtkRXZbIhuZNSg
 ==
X-ME-Sender: <xms:JrqBYSc_4h5KbvAuRlSJNmz3v1OsrUmx20lxQmOHwsSctNwjXXHPCQ>
 <xme:JrqBYcMJ_LxXzXMv_lCe1kRzto4EEvGq_2-8KH0jgw6Z9DsW07jwPro9iDd7zH-v-
 cbJGLXMLK7M9v5ivA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgddufeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JrqBYTiyOfmyq4degtKjfItPb4ybqDE1RkaszL38mecfffucshWZdQ>
 <xmx:JrqBYf-dMhQgYkSmPWS06i3G2T8Lo-2cTopm-sAQ-HbJFClrdKPw-w>
 <xmx:JrqBYesj2BjsreMtFIWomjSi4LsEE5vYxK2eRQuqLiKRsEGIqqqpwA>
 <xmx:JrqBYcCYGbR4XWdmzGlpS7uWASmY_8pz_rmYYtMmBCutfii4uYw6ZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 82860AC0E8C; Tue,  2 Nov 2021 18:22:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <372dc598-4ee0-482d-8d1a-ff34eb8cde7d@www.fastmail.com>
In-Reply-To: <20211101233751.49222-4-jae.hyun.yoo@intel.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-4-jae.hyun.yoo@intel.com>
Date: Wed, 03 Nov 2021 08:52:09 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@intel.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Corey Minyard" <minyard@acm.org>,
 "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Haiyue Wang" <haiyue.wang@linux.intel.com>,
 "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH -next 3/4] ARM: dts: aspeed: add LCLK setting into LPC KCS
 nodes
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
Cc: devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 2 Nov 2021, at 10:07, jae.hyun.yoo@intel.com wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
> Add LCLK clock setting into LPC KCS nodes to enable the LCLK by
> individual LPC sub drivers.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
