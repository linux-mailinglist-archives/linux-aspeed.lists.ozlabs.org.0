Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE9D443857
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 23:21:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkPWj5TGcz2yHS
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 09:21:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=kEIw4cxa;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GXI7PPtJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=kEIw4cxa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=GXI7PPtJ; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkPWd10HGz2xDH
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 09:21:33 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id E3B335806BB;
 Tue,  2 Nov 2021 18:21:30 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 02 Nov 2021 18:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=O/uNGateqwnUHNw/oTutTGFHOf+wMqk
 2two4w9jS0nI=; b=kEIw4cxaj55nlrO4EyllwTEH7+pWDfHUPwnaCSZgK9lgWMD
 elo/NY/lNFaLubffsSvwec/nd/v2s3b6BeIQMLSecYyJjBUWaCOt3pPHCYdkNJrk
 SG+gxKpoVjbzzUJO+a9tL8zJ6/E8Oj3WyV07XHZ9VmGSCM5yIBhfLmnfk5DNXtI+
 AhTLZo/6sG2tHcQ0/Zej2vf58oeFAfqM93RJcjev7Q/2dZi/TIjku0BQPBaYBDQ+
 paJTp9gdauvJRUkKruHh8RBbe+VqrJzScL+LX/yDvmJCDlcMrM/Jxh/evA6iYdYl
 Ahks5wBiOhoGdAa5Y6jIbehhalyofG0jnn2660g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=O/uNGa
 teqwnUHNw/oTutTGFHOf+wMqk2two4w9jS0nI=; b=GXI7PPtJ2qmy0juxfdCh02
 BSjFhgoHJ21i8FDwtraqv1RgnY8rf83+z34zd1gzTFIX3FzTuISFZxfvo3gFeIMJ
 8BIexJZ2sTZt0bY3CBVefW0QXhj6/mjALigzAgEyBkvjuuFmPrkkNpwuOklZ8j30
 CNqrStZeJaylGUMJEyz8Mol3C/MN+Ad6KARhhCo3RAFfN7ypeDazluNxtqXqfQce
 /y1Jv+jrEKHfzDAw1BpcE/uZOu8z5oi//124fSHq9SW+yAJOS4HI9e+1DnMHZhFT
 N2QHVEKftiiZTy9SoXhrCZQihTi5igXdWXEpqNivmMQLsoI7nC5hCVeBDMS47MXQ
 ==
X-ME-Sender: <xms:6rmBYW9Eym1KGxRyAPLpozosfZb06EGWa7lfRkTO6Ebv1uaWcZKvVA>
 <xme:6rmBYWv55BjdLsWk8Y4dK9S1g0VMSQ2s5648_UkbUej0-lNaEOy4YYqGNS4P66YMW
 s0VKdobH6IpVqxGkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6rmBYcCsmAFrqjgR3PpdflD2_JOG_h7oCGNfKdCq5BO-rMPwmmvN8Q>
 <xmx:6rmBYed5Gd-LP6FbPaEtIJ0vPgbtfBSCC6mpYtYitGMHv7O67TYQDg>
 <xmx:6rmBYbM1ltDraGURSjMD2bDoQUaepRQyCav-K7NMZhWpVdAchZoCPg>
 <xmx:6rmBYUhFzBf7PLGZmCgYQs79m46y2p_fs4YaM7H9useK8EygGtm42g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5372CAC0DD1; Tue,  2 Nov 2021 18:21:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <8c5d69a9-66e7-4fb3-9aaa-63d5c28e4698@www.fastmail.com>
In-Reply-To: <20211101233751.49222-2-jae.hyun.yoo@intel.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-2-jae.hyun.yoo@intel.com>
Date: Wed, 03 Nov 2021 08:51:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@intel.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Corey Minyard" <minyard@acm.org>,
 "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Haiyue Wang" <haiyue.wang@linux.intel.com>,
 "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH -next 1/4] ARM: dts: aspeed: add LCLK setting into LPC IBT
 node
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
> Add LCLK clock setting into LPC IBT node to enable the LCLK by
> individual LPC sub drivers.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
