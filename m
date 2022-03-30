Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EC4EB837
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:08:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSqbN3nqSz2yxL
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 13:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=VhEdegdX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E0qkYBEX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=VhEdegdX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=E0qkYBEX; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSqbH5y3tz2xnc
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 13:08:11 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E8A4E5C01CC;
 Tue, 29 Mar 2022 22:08:09 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 22:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=qCrp4WJ0zSghLM7c3xHwBIoQgXoqi3R6peQQ6z
 gM/uY=; b=VhEdegdX9ZH1VyuPz8zRTEg8zTIOsOiyGPIFuql4idCF3MjXkpi57p
 3kGsqETqhwD0AkZaITYm0uepXKXhsX64v8IfY7Spk421H2pSJgz+71tlBSiODBj+
 97tFGa8uYr/BTsbxM3pfmSC+Vij8T5qweRRfj7QBMsOK9gDh27yLpfBrDxWk1iSn
 R+YUiQRIY/JJPqA2vImzf6Z3Enaf4U6nR1q7TqfOAs+g0mCb5oiIjnd94oSCT8aK
 PKBgC9MfqDmAToXhyN2C9FDRc/L5Z9fG1a6uayAieiecWXk7BqtDpDSxYLUulOM6
 pKeY0HbR/p7b8i2id4u115aQrMj3HdWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qCrp4WJ0zSghLM7c3
 xHwBIoQgXoqi3R6peQQ6zgM/uY=; b=E0qkYBEXeAVhrYmIEcVTn8JLGnypljSdD
 1g0wuS3wbRojthTHkVSNzGfNdpH5IftNl0LEird9BHpe6B9K2MP+ZuK4HlN4d8mU
 HgJNBMDhIP+3SXCJt//1hRWBSey4vofvqL3TQJV0l4hC3w2ZSda2Z9gEKfQIZ7cN
 PGfvkM3Z802x+LPzuvz9SNoinPE83kaLkG6Old+YA8LKsaWSER5Zkg/h1JIcyLnK
 weeDU1QWghp2gfwER+j2jo0Q1oVMTQa/dKKhKKc3Uc1sdriB34WBoVJ0KT+IN3Ri
 Y/kHDStr379drggmFYrDh+5RxJ/kaYAr6B6pjPGKdnygy0hOBONtA==
X-ME-Sender: <xms:ibtDYv1OX-p-EHDFA8bqDkphJOgoaCaNtDgcIsj6SR_NfU7nvepbdw>
 <xme:ibtDYuELvuoV7mhrSwdhwhHJWASZYfLjPNQSJVZQyEo3rSs6qufbYrJJ9gSRNpMCQ
 jdb3syvD5dTFDSk6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeduffdtvdevkeffgfetffffue
 evgeejleeghfffjedthedthfelgfekfefhfeekieenucffohhmrghinhepkhgvrhhnvghl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ibtDYv6MY7p2bU8vPoFG1ZEDmypxptTvfnpQq_qiOgozRidj8diZ1A>
 <xmx:ibtDYk2oGlCkTr20MX2w1kDjl-23Q3yKP9GCBQvTRS2Kjhy0yvxHIw>
 <xmx:ibtDYiGbzjfAGyDcg8SjYbIJZBYd6jROqGZaeYtBJhAKT_bIZ0hgVA>
 <xmx:ibtDYtMLaiZlnk11o2gm7hCVlVvVHhHIX_3rnDZACBxPcPIOHeR8Pg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AB940F6043F; Tue, 29 Mar 2022 22:08:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <a509d7a3-2551-4eea-b965-9499ada39b16@www.fastmail.com>
In-Reply-To: <CAFPZpNZ1+UDVcEs_gp1zCzxXfP6PqZ8kx+UGhb73BusiScRk+g@mail.gmail.com>
References: <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
 <c29de2ea-0f60-4e7f-8308-11849a7de8e8@www.fastmail.com>
 <CAFPZpNZ1+UDVcEs_gp1zCzxXfP6PqZ8kx+UGhb73BusiScRk+g@mail.gmail.com>
Date: Wed, 30 Mar 2022 12:37:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ali El-Haj-Mahmoud" <aaelhaj@google.com>
Subject: Re: aspeed2500 SPI1 control at run-time with OpenBMC
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
Cc: Oskar Senft <osk@google.com>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 30 Mar 2022, at 04:27, Ali El-Haj-Mahmoud wrote:
> Thanks for the reply Andrew.
>
>> Not explicitly as I mentioned. You're also going to run into the
>> constraints here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c?h=v5.17#n2739
>>
>> Fundamentally that needs to be changed. We could do something like have
>> it default to pass-through unless a driver is bound.
>
> Could you please elaborate on this a bit? I'm way out of my depth here
> and would appreciate any additional pointers.
>
> I already ran into the read-only constraints in the pinctrl driver,
> and I have a patch that excludes SCU70[13:12], but that wasn't enough.

What were you doing to test it?
