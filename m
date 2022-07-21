Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5257C252
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 04:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpGr106s7z3c5D
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 12:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=PfdfHkvj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1fYwVf2i;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=PfdfHkvj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1fYwVf2i;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpGqx6w0sz2yxF
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 12:34:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 112615C00A8;
	Wed, 20 Jul 2022 22:34:52 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 20 Jul 2022 22:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658370892; x=1658457292; bh=tvo8SkIpWm
	/MJl1+Nc10z41BWFP5+H61IqrS8LHpPrk=; b=PfdfHkvjY2P/RctekW5T0uGbMB
	uDIeIbUtd7CknB+kLubU+d+whYViAsT49zFfMm15PraDcRQMZGufjFqO+17V3Oef
	KvaVhtNxyFVr6rKR3oTY1RaretXM0yQCG8Dqm8b/by1HJM10GI4tkMf+MkWQYP1F
	h+5g5MapmCrPOqDU8bsE1r5JDI7/Pmg0udBRyxKK4vhFTfJJkk53ULCwXqKS2k/5
	8rHgFqtqfoqMJmfnP9b3dtEg3f3DFtKDL8vEJLmmBEAptGuEE6Lgr4/uUNnUmGz9
	JGEIB60lonLefK7aqgt+7o3g16nQGAxMZi4ouiUaFAK9weFuLGJ2lC2mLF6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658370892; x=1658457292; bh=tvo8SkIpWm/MJl1+Nc10z41BWFP5
	+H61IqrS8LHpPrk=; b=1fYwVf2iq/s9vIW1t0yAsquw2ualTEO5CHXPjQolAx6I
	cipxra9ea6jYRwKWVL6JjYUUm+YfsQU6euGbG5jG3x8y/fAH5XxzUiXmmBLkafkj
	un57tHbOm0YnjDShqOSoVaABrQkqo4nt6d2MeOsVBt1W7X0wl8WiiC/C5jLpo5Fm
	HmD9lwsb21gTRPh4v5GmJVckIDli8xjrNGcuSGDKbhpIYKuNHzmHiu8faKUXXe/Z
	D7mxd8lhEhhgwEt1HN++0srgWFnZfQ2Q20+t7rT9dG9RVtqAHIpFLQFmHXNeGJzT
	VgX53I/TrAE/i6K9chiXcqF1ztPjUe41etX6bsEjZw==
X-ME-Sender: <xms:S7vYYvKVwg81f79XBoGWcsdsH7XqTulRku7qparGO6puBHmRta2-Jw>
    <xme:S7vYYjJgn-emxYKoumfE4ekJE5CoxprGT0lLY0VqNFnv1BkzhLFw7SstEEh9p7BaB
    -oZCYfUnCqQA_aB9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:S7vYYns5wdDGpJvRFCI3O-lpy2k7Ap7qS8MEuGwSvpY2T-hINT7dBQ>
    <xmx:S7vYYoZnMWjkBcJqu3wbSnBwlUsChCrAzs1zXPYs-tf12tGfM6WI5g>
    <xmx:S7vYYmY815_Cfs7OTANZK1gNXPa6ci9UO49hfZrT3IE2AaypwCM1dQ>
    <xmx:TLvYYsl1Jx1vtZ1J8q4C7LkPHHkVXQGib5QGsaeBWpaC9xGOYSyBzA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 079CB170007E; Wed, 20 Jul 2022 22:34:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <42fb4884-e2c3-4d7f-9049-f14c19701b20@www.fastmail.com>
In-Reply-To: <c86be8e0-8350-5d73-8055-e04a4e88f3b6@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <c86be8e0-8350-5d73-8055-e04a4e88f3b6@linaro.org>
Date: Thu, 21 Jul 2022 12:04:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Arnd Bergmann" <arnd@arndb.de>,
 "Steven Lee" <steven_lee@aspeedtech.com>,
 "Ken Chen" <chen.kenyy@inventec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: document several vendors for
 Aspeed BMC boards
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
Cc: David Wang <David_Wang6097@jabil.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 9 Jun 2022, at 18:20, Krzysztof Kozlowski wrote:
> On 29/05/2022 12:49, Krzysztof Kozlowski wrote:
>> Add vendor prefixes for manufacturers of Aspeed SoC based BMC boards:
>> ASrock, ByteDance, Ingrasys, Inventec and Quanta.  Move also bticino to
>> proper alphabetical place.
>> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>
> Joel, Andrew,
>
> Any comments on this patchset? Are you going to pick it up? If you
> prefer me taking it, I can, but new boards depend on the bindings, so
> this should rather go via your tree.

Apologies for not getting to this earlier, but I see Rob's applied it.

Andrew
