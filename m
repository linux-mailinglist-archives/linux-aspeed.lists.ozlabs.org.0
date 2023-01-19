Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA2673091
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 05:50:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny9Dw5nTDz3fCZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 15:50:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=wtktud6v;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B7iVNBkl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=wtktud6v;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B7iVNBkl;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny9Dq6zfFz3bbc
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 15:50:51 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 6248F3200934;
	Wed, 18 Jan 2023 23:39:04 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 18 Jan 2023 23:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674103143; x=1674189543; bh=G/hJoNUFWj
	tKbalV91EsTE4kaSD2XXRJqsp9xGH9tiw=; b=wtktud6v0QuSAM++KqtlJ9JymT
	urABw/YuHkM2OhkzRthap85AiAieCN54YO4ZtQsZCxfSmI2o/AF2MAkBePGO2+de
	pwC9ioWzW1H98M+gbRDrVeLuwzSI3fcNpAhtlLWjbcWTQ5/BdMiENx9nArF2rsBm
	Ijmm8KYhTrBEFmGoT29s/qgbjRIT4SZy2+pFk+M8Q2dt/L2rJ21QLqrMPm288IPz
	d8eRT9ApF31BGh4q+EjPKJstxMBCSBTobxHzxgGN/pQd5y202e6MUe3WxEbsxsvF
	+Gn6bbhTx2mgBJ1nCSebTM1m0DUiDrRQjE4AwHmf9yZfQ2Q2bvqaEBvzObiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674103143; x=1674189543; bh=G/hJoNUFWjtKbalV91EsTE4kaSD2
	XXRJqsp9xGH9tiw=; b=B7iVNBklJB13VVobFHkHlDLx1pqF+CQFpIgiNTJxnekV
	bCCITs7+Q+QuTUrfIYxrQyhSY7uuj7BS0/mWQdimNfijRjPbXUCg35hab6qsta7Z
	4raBCnnYZVirIEZpAYDV1qGaTfY7zUHWUDE3SDaDgY1UiNTWxwa2SSyRCBzD8zj8
	1SYAQxqsav/FlQNy49DX5xzpuA30Rn2YSFNOrns7HvYC1pSF4AGdJFFZTEA08qd/
	M/dKMzb+0/btvCc3xe5JxqWZnuY6O+lXMcQIda2oo6E/RDnsyoQc/Cmpnyzzlu1g
	2PxlzbOkHfb0+Jh7Di5FrD7Xx8epIzNwaQZRdUE9LQ==
X-ME-Sender: <xms:ZsnIY6Td5QBJTyIjLl35IK4HLl7nZIJbXDfwns4EAz9VAarYaIYUjQ>
    <xme:ZsnIY_zSJrpf_Xu3v6QlGJRgwFepOUrDThb0ELSAXKS1NYkwutUjr4oHwo8bXTJ5D
    TOwXaSIpdhlMF2URg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ZsnIY32VxiOVv7Z9qwJZwy5AfFAnF0_kTfLJtinqJSCYGEG4Q39rlA>
    <xmx:ZsnIY2Bg-x94GPXSajk-r9GO2IEBPOaStSeoHSQbsNFRXCZAuhFg7w>
    <xmx:ZsnIYzgNYsvzR2WJWh532vdSoXEZBm1H1QIxkWlHIICjgS5ipycuEQ>
    <xmx:Z8nIY2uJvIvhRZy6F3nSJJkzebeJ4rjJU5YTELdMq4AhBOYzJxXMbA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 742831700089; Wed, 18 Jan 2023 23:39:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <e4832133-962b-4825-83ac-d99e26a8bdd5@app.fastmail.com>
In-Reply-To: <20230119014859.1900136-1-yangyingliang@huawei.com>
References: <20230119014859.1900136-1-yangyingliang@huawei.com>
Date: Thu, 19 Jan 2023 15:08:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Yang Yingliang" <yangyingliang@huawei.com>,
 "Linux Crypto Mailing List" <linux-crypto@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH -next] crypto: aspeed: change aspeed_acry_akcipher_algs to static
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
Cc: neal_liu@aspeedtech.com, Herbert Xu <herbert@gondor.apana.org.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 19 Jan 2023, at 12:18, Yang Yingliang wrote:
> aspeed_acry_akcipher_algs is only used in aspeed-acry.c now,
> change it to static.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
