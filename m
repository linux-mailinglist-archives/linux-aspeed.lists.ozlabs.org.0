Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E5674952
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Jan 2023 03:24:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nyjxy0XlTz3fH3
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Jan 2023 13:24:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=mE+PMe/S;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=W+gfV6Xi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=mE+PMe/S;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=W+gfV6Xi;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nyjxr2VzDz3fCN
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Jan 2023 13:24:48 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D5075C00E9;
	Thu, 19 Jan 2023 21:24:46 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 19 Jan 2023 21:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674181486; x=1674267886; bh=7Lqzsev9r/
	6wOYnclT8Los42ZvGEO40SvjLaX9Otad4=; b=mE+PMe/S+JnikqS8HIpGCACiiZ
	YHwUIIwa5L7H4Zv6ZIhyOcV+1yIiDExjqsGc4n7ZKfq9x4DxR/W2t60LJBoDaAUh
	0xkYiPX1MkLII83L54gk6TUgr+wG9Vb1cSie0iaUbt2S3l8F13d4Jbyds2Oc+HdO
	igGpeWGiTPtqwQqLAnMVz5R9e4kqhQPfknhFroqPB/R/uCbEadlD4SjUOW0Zpl9G
	Yv5OS0iiHQshmPs2MlQwBPOvUTD0i7UM0K5ckjIebHFvYN73QQSe30pxDNvAE+ki
	gr4dOymrJNpQSnGZjFcRbLjs2ppDfm4I2guzgiFFAGyzoyudUZoqlefGRTOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674181486; x=1674267886; bh=7Lqzsev9r/6wOYnclT8Los42ZvGE
	O40SvjLaX9Otad4=; b=W+gfV6XiixilPQomO+s5UJawO94XgDwojpdSNiz+zJCX
	Ihtr6J4ie7z+fOry/PcPhVSFvSmDbnw6n43wadH9iPSwr9CpkF5B7cTtTtfmVMEp
	iFZEmpr44TtDNk0l7MmQj+mp8K2+9/6AS6Ugp0eBpQBfTJFKWQEOJmz9K8RC2x8K
	B9K7S9V77YcD1nIdlBLXAzzsT79fzpIuw1MQmoBKorj/2qJaPrpDcHw3Ejxzr9ge
	bhQ+w6ftkLIidxkthLKv6ks5raoAAu1SY0pfQeM/I2S72ugJnC0CIbFivb2PRrqb
	Y3XZEpugVWaKXmmfylIAJoVNH0o/3PhnUN5rlYvLwA==
X-ME-Sender: <xms:bvvJY3RTLzL-cW1b5ANwjyn56uRGHTYKMpV4L661Wistt8TSski0Rw>
    <xme:bvvJY4zcBrLBc9quz_BhOelgmHZQ79Kizh-DcfP2tFra7zXU7Zn1MV6ZK2gqu_tnE
    oWAJcaIFY3z3tQJVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:bvvJY80HgqeuHLDMYjftWrYFGal_Rt1GPR3Ix_Noo7vx3rzZCn3KEw>
    <xmx:bvvJY3DsPmHGBywnGQ0LlxtMuCewZegxDB0ryL0fOdXj8uWNGXfjdw>
    <xmx:bvvJYwgQu0PXRfzxA_aLOKntGPqg5EtASGl8NOBU9kTRtgayqxAipQ>
    <xmx:bvvJY8YVfXVcs9zdKGG1hQ32qO6rrJJT9J2nH_lyzAMXClbLJWWAyw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2FA3E1700089; Thu, 19 Jan 2023 21:24:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <0f530b87-5c3e-47e1-b097-fff9bcf39955@app.fastmail.com>
In-Reply-To: <20230119231856.52014-1-joel@jms.id.au>
References: <20230119231856.52014-1-joel@jms.id.au>
Date: Fri, 20 Jan 2023 12:54:24 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: Fix confusing types in return value
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 20 Jan 2023, at 09:48, Joel Stanley wrote:
> The function signature is int, but we return a bool. Instead return a
> negative errno as the kerneldoc suggests.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

:facepalm:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
