Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EBA113B11
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Dec 2019 06:13:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T3m02FBlzDqYL
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Dec 2019 16:13:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XkSFWnrs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mFtuhQSU"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T3lt5clVzDqXS
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Dec 2019 16:13:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 171566DFB;
 Thu,  5 Dec 2019 00:13:44 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 05 Dec 2019 00:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=HmY629d09ljX49+gWihMYnlLvvddw8y
 blf8rUOR5/wE=; b=XkSFWnrsqIZKGLVdudWqOUsdB5YtNlYfu/WzJNmOnyi7Za9
 38ORxDINALsurrmH9koTMeFOuAMZbEdt3jb4NKuSHz1kx+lTQ8xaqEa4ARhDGT4D
 KGfLIlPrgABX0jjuH+qOBWgYSBYhf6XN2TcuNhLmzc4lnObgmWWgUqILS/RSwONj
 0dok7lVopN++sUQMDj6CcDhMfaGf0RO0rzOcHeFJbECCjlfWyZ7zpQLUflU2t4m3
 O7cOUNTC2iCsFkjBQw5iJqeVUyG/bvlRsBcI+ziZDSYuCJO8AJnT2xLVipUkEmKk
 5GsqpC7va97/ZkAtZQnZUb+3UJAwaK2HhNrJftA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HmY629
 d09ljX49+gWihMYnlLvvddw8yblf8rUOR5/wE=; b=mFtuhQSUTGXR6RwrC/ZSqy
 DHtQ5sfJ72Gp+Fl14rqpI8A7opsv9ESRgx9plv2EalC4IRNebJZFDPAbVXGAep4o
 JgsZPzXUfI67INU1Q5h0MO2IeaIdp6pYZXaSdxxkzCukfnYYRgBMl9Kp3NEkQDy3
 +yrfq21UcepbK7ueIDsO974jcDYOwBURh8RF6li/Ko2371GVJkEpfgnv1Y5Bpt6U
 CyfG3o8gCDE3M6qGOD9nLeUR4TIAqzun6+KU/Vaonbonc6Z35lZTYQnrWIFEeK0p
 ukSchr2VVYPg9URotj309OcD4EQh8jjd10uwGTVxU9jR+ABqlVslmU+WCOHbl8aw
 ==
X-ME-Sender: <xms:BpLoXT9uaXVa-DTA9FwW7wiy_GJt_465bqEkFIhziNC9gaP8vGHyUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudektddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:BpLoXZ_D9ZZbPr1lny9cZzaTeUS9m8tXYUZA2MppI0yZIXZnp_X2Xg>
 <xmx:BpLoXf_QPUo2GeX0u2WvSXm8b7gNwGJfzBKKQ1G_f6wAJAtDi7mWuw>
 <xmx:BpLoXXE1ahEGOo08cwQHVS1JRmlO5DhCD36h38YcnnRuHi-6wckWRg>
 <xmx:CJLoXbQbKnADxn_5wl7Byr_5lJFU-G_lsmG9VHhHT4bPdTbtQ1IPNg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AE0DEE00A2; Thu,  5 Dec 2019 00:13:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-612-g13027cc-fmstable-20191203v1
Mime-Version: 1.0
Message-Id: <cd76d709-683b-44c0-b29f-d31c9dddc75e@www.fastmail.com>
In-Reply-To: <20191203134026.GI18165@minyard.net>
References: <cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au>
 <84315a29b453068373c096c03433e3a326731988.1575376664.git-series.andrew@aj.id.au>
 <20191203134026.GI18165@minyard.net>
Date: Thu, 05 Dec 2019 15:45:17 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: =?UTF-8?Q?Re:_[PATCH_2/3]_ipmi:_kcs:_Finish_configuring_ASPEED_KCS_devic?=
 =?UTF-8?Q?e_before_enable?=
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
 Haiyue Wang <haiyue.wang@linux.intel.com>, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 4 Dec 2019, at 00:10, Corey Minyard wrote:
> On Tue, Dec 03, 2019 at 11:08:24PM +1030, Andrew Jeffery wrote:
> > The currently interrupts are configured after the channel was enabled.
> 
> How about:
> 
> The interrupts were configured after the channel was enabled, configure
> them before so they will work.

Hah, yes, that commit message did get a bit mangled. I'll update it.

Thanks,

Andrew
