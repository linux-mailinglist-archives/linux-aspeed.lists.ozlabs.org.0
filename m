Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A5C5F5D31
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 01:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjVtZ0C4Zz3bxp
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 10:20:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=bCggjZMY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=0UfdeaWo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=bCggjZMY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=0UfdeaWo;
	dkim-atps=neutral
X-Greylist: delayed 442 seconds by postgrey-1.36 at boromir; Thu, 06 Oct 2022 10:20:49 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjVtT0KBNz2xKN
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Oct 2022 10:20:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 56B2D5C0195;
	Wed,  5 Oct 2022 19:13:23 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 05 Oct 2022 19:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1665011603; x=1665098003; bh=iU/nKCqTxa
	Cxk56ycxXhitLF9EE+iE5NgRpUWDX3ze8=; b=bCggjZMY4n18oQN/rXT+r9kqhr
	KI9lv6wGkTxIklY6JysdNLB1R7dofO6g24hG5YJt7LsR3D4E585mVcmdcmIoRMk5
	JTTfhQm7u9p43z3b3D9nu8ho+hoOIFMagSU2cPhRmY2Bpv6p/Y22cMvv6MkDetJP
	3LbwvHkNBUuIBb5D6oKpSDwzW5Yrwkop/o3FVphVtC3cRNKry1YK7O9N4PCc4Due
	HDmLGwV7Rvs+ftF3OZDv+rOE1pJPb7iF1jJrKUGvrJ5c7YjPW2u6a2vZ/9v0+7XG
	mF1hAIG2mVsZpBeuWM8zHD8zqRNxogsH6NPwsL/nak+rV/XJ0222Q+JkqQ2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1665011603; x=1665098003; bh=iU/nKCqTxaCxk56ycxXhitLF9EE+
	iE5NgRpUWDX3ze8=; b=0UfdeaWo7/DuxF2KFzWo9tzRulA4MusdpGQRZkZp49K4
	PjVHBBHr3JIVrH0sBnTMPxADQ9VJDzJHOuGV2e69qD+hNUULdl/g5lDpHiqmoaVk
	5JVbWyBJNeq3D+brpVekeu2W3c0IsKdtX7WW562u8R24bS+MRbiNbiBCLt5QcSJt
	e6jr/jvcBsDAl8FpZnV6xghuj5/V78b9TJDR3rg9C1oZ9ue61y3ehjCSNUBHopoM
	ff/Vs36v+xowT2rE1r8crLvx24K7ybHcXneWupSBwdf/gODhuV7n5Bad8iS4lu7x
	an12oDXuz64INAzo9+Z7ukUaEYw/HTXxlkpWtbshjw==
X-ME-Sender: <xms:kg8-Y0HWzac0cE_D5IsOTBgZ-1NKfZ4y9g01UZ-SiJ4KtAPbiIXP5w>
    <xme:kg8-Y9W7BIv0dBaUXwFce_lK-7GFXmanvR92Ai7N08FtFAi385bG2lFST3T_CdQdv
    yTozsQpYcAq4GQ1_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:kg8-Y-KvgUd1Et8MnOgIcjMQ4rz9mMBqcI9svm9xGaAclhQswwmFUw>
    <xmx:kg8-Y2FbeFuLq20oJftCsJOET4_-_d97lSUW7jTqitXlDZdHRZeirQ>
    <xmx:kg8-Y6XSB6zRsDa3th82xCUOD9ZQoNcw1N5vQNW_AenzEYCzLic29Q>
    <xmx:kw8-Y5SPgRnbzTHZbOJU-0NPHmZG3YJVnoGoF3vkjggV5lt4Yv3tFw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D1F2E1700083; Wed,  5 Oct 2022 19:13:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <08c20621-e75d-4a72-82e6-b1980304e20a@app.fastmail.com>
In-Reply-To: <20220812144741.240315-1-andrew@aj.id.au>
References: <20220812144741.240315-1-andrew@aj.id.au>
Date: Thu, 06 Oct 2022 09:42:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net,
 "Corey Minyard" <minyard@acm.org>
Subject: Re: [PATCH] ipmi: kcs: Poll OBF briefly to reduce OBE latency
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
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Corey,

On Sat, 13 Aug 2022, at 00:17, Andrew Jeffery wrote:
> The ASPEED KCS devices don't provide a BMC-side interrupt for the host
> reading the output data register (ODR). The act of the host reading ODR
> clears the output buffer full (OBF) flag in the status register (STR),
> informing the BMC it can transmit a subsequent byte.
>
> On the BMC side the KCS client must enable the OBE event *and* perform a
> subsequent read of STR anyway to avoid races - the polling provides a
> window for the host to read ODR if data was freshly written while
> minimising BMC-side latency.

Just wondering whether you're happy to pick this one up? I haven't seen 
it hit the IPMI tree yet.

Cheers,

Andrew
