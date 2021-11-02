Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DC443845
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 23:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkPMy1lPKz2yHT
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 09:14:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=e6SHqTYp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WsTiB7Pz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=e6SHqTYp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=WsTiB7Pz; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkPMm25VTz2xCh
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 09:14:43 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D03F580674;
 Tue,  2 Nov 2021 18:14:38 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 02 Nov 2021 18:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=BAdWwQ+q5kjs8EMQZdc7Jq2E0usVeAe
 s1V+1KJfTF4E=; b=e6SHqTYpz0ZsHmASCIJPMH5Ow6rP8GTwo0ZsADeuAzZNGP8
 LVBCER609l7oH6tpTd8sL938N7ZhX7F3699vU8qUkwB+XFynLso0+Kx1F0/1Gpfd
 O8OJE9xYRhXTa0UBQF6bAd4/rSjZhJeBS9R5hh818zecFR2c+IhLiDe2ksfzO77Y
 cHPQm116YwFCEi05YSY+SJNquOt/J0tvETqISbRTvXyuus7WQ53iqbVafT8aIpRQ
 8Cp4FzwGo+iKkpuRPck7HtjGS6wbAsrtBx5D3XemeKTP4OItnLhvZVvQJhc3YTXM
 D4zA9zSOScjjob0Mo79phvlvSBV2yQsq+/OhWcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BAdWwQ
 +q5kjs8EMQZdc7Jq2E0usVeAes1V+1KJfTF4E=; b=WsTiB7PzD7wnHrAhhg4rfU
 ap2Wi7snshGHr7lxKpVCRUXmfxlK+U7SIDjC+7AqtZqlFMF6dt12V5oSk1/bIewU
 +u0qKX9Qk8Ckgvu2Vprhwr8IkCUM3F/y3SmUfNq4cPPmAozkscgaf31bNPCLMow+
 f7Qbf8Xt4csaSHlFXBFH9PLCz3kbygtRZGqbOf76+08ZqI9FflWIbZIa97zgJzH5
 MwQ5Ak21ttSv3w7VGB4oU6qalr3sV8eQ3+RDoCPO6UXvtCXHRY4doILMAWTzZ44W
 gugqhMtC/7NqMkBBt4tRjoZ0PiGcsFNu+PJk+NKaqbpJ+jtDWJ4WDhUVzCnRXjLw
 ==
X-ME-Sender: <xms:TbiBYTHFR5xr9n5opdaFJFfPryVQDWEmWIIoiDjpAiZMy1RijYdTHg>
 <xme:TbiBYQUY25QlvlkvpJKGaPkU_BYEJHKnh7bMTg900oxtw2ii4LsnPlSE2ERFt9kO7
 7YDOQdTVbsCyxYjyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:TbiBYVIQ2qpG5_k5HW9_VW_HSfpHQdIzkViBJTNVy9gDXm1S9_FQrQ>
 <xmx:TbiBYREL_hWBALsZ79hLPKuxPU40qFbDYNorsDHOJCHs0rUL7ZANdw>
 <xmx:TbiBYZXAC8mAYhzejiAQyCPo1EXL-N_lGJKOYR7HkupZ7LAAOyUW0g>
 <xmx:TriBYVqxVXLf1o2HtVb0tEjn4MtXIKWHPUTjLmAozooruavwkW-GiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2AD9DAC0DD1; Tue,  2 Nov 2021 18:14:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <602c4784-9ef2-405f-95ef-d75e56d4505e@www.fastmail.com>
In-Reply-To: <20211101233751.49222-3-jae.hyun.yoo@intel.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-3-jae.hyun.yoo@intel.com>
Date: Wed, 03 Nov 2021 08:44:15 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@intel.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Corey Minyard" <minyard@acm.org>,
 "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Haiyue Wang" <haiyue.wang@linux.intel.com>,
 "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH -next 2/4] ipmi: bt: add clock control logic
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
> If LPC BT driver is registered ahead of lpc-ctrl module, LPC BT
> hardware block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupts in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
>
> To prevent this issue, all LPC sub drivers should enable LCLK
> individually so this patch adds clock control logic into the LPC
> BT driver.
>
> Fixes: 54f9c4d0778b ("ipmi: add an Aspeed BT IPMI BMC driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
