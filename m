Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13BD5E7084
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Sep 2022 02:11:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYXcM5Srjz3c34
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Sep 2022 10:10:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=S8QYp+FS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=orfYQBJ1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=S8QYp+FS;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=orfYQBJ1;
	dkim-atps=neutral
X-Greylist: delayed 530 seconds by postgrey-1.36 at boromir; Fri, 23 Sep 2022 10:10:52 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYXcD0tk3z302k
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Sep 2022 10:10:52 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D6C7A32005BC;
	Thu, 22 Sep 2022 20:01:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 22 Sep 2022 20:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663891316; x=1663977716; bh=pmQnrRO+YK
	fhpWQuVqOuHDw/6wiCkHQT8p9p2hxI6qE=; b=S8QYp+FSGIccsiXTDaT9HCp441
	NKzEttVXecalr+5ZS0EFhHvxhhv9IvZR35rX7i4WXQ7zH/8ayLOBBhZzWsw8Cm4k
	bkIJZHdbv7Eg7s6xGy9ZFOZyfJJkFtw1utl0yu7d+XBvhc1nzyStinEOdRGmlS9S
	tAWA83s+LdN7lwEEzvKfoeHFd2HeLKKgTIM9Ds1FT1uT6WhfjKUOYLZKHgiWgPDM
	6ubhfrjudqbbABcme/PSaZ0eGE/69qaKye4JFn1/kOHewQK/HC8uM766zN8VAX2A
	LtMRLbUtaymmon13J046/hRV0jD8zKOQLD8rcoBYJG9S83mxkIYHdBiW4ZXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663891316; x=1663977716; bh=pmQnrRO+YKfhpWQuVqOuHDw/6wiC
	kHQT8p9p2hxI6qE=; b=orfYQBJ1pytAksSkKRLZ3sBoocKIilnia7ne4njSwYB7
	/cqcO0VuW4GbaVoOIA6s80/l6m7dJmvHPSSOV2+2KnO2ZANueyuZC9YNmYf62ayJ
	p/fP4QoYcSnmTKOV7MYgCOxeqisnXDkGRMFdoX8Ws42GWLkcxaCk+fhhiSeLV3/4
	veG0HMQxehLQmeD/zUshe2chC0Em1P8kGtXc75vBdLLIM8RMMyLR5FP/77Tg3lWY
	zpx0eHCmEFLTOukLVmIvl5W0I2SirlGyjYJnehYym47SLpO5RmFECoa/xQLxbs4a
	pbfSuSQ8o5350FkSd/bW7rwPqN4IXvLD8NVLgB84GQ==
X-ME-Sender: <xms:c_csY4DplRPJ651SbyZOH5thr8emuqozyd5WGS3jhqKjvbeVAYpFtw>
    <xme:c_csY6iHk5BrALSqLSzq6DIokAFxFv6ZoAmul9mDHoSTH4RTE3FuwpyaGOvH53spP
    QTSlPCdC4S-Hlfsbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefhedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:c_csY7kK8tDnUwqngQKrhXZzpN9Zmq0ACf5pCNlzJ5QljTcAmr53iA>
    <xmx:c_csY-wyIAJN4vDyPK5aHH37fXPUMT6KYYGxxLJsRcx1tY6f-2CbDg>
    <xmx:c_csY9R6SasczO49or0xuj2iUM_EM08o_w2mhBIkPnavyEeJVpJwLg>
    <xmx:dPcsY-RLDkfflhLixkEOqC19p-VAjDiOb6JLYKpT_dKxNftZC8hRVw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C610E1700083; Thu, 22 Sep 2022 20:01:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <c5acf780-7a9d-442c-a41c-efc69e5d0ed3@app.fastmail.com>
In-Reply-To: <1c33bf6d-b458-b2bb-3116-ed20b9cadc0e@linaro.org>
References: <20220811062953.5976-1-krzysztof.kozlowski@linaro.org>
 <1c33bf6d-b458-b2bb-3116-ed20b9cadc0e@linaro.org>
Date: Fri, 23 Sep 2022 09:31:35 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc compatible
 after rename
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 22 Sep 2022, at 16:19, Krzysztof Kozlowski wrote:
> On 11/08/2022 08:29, Krzysztof Kozlowski wrote:
>> The Nuvia DC-SCM BMC board compatible was renamed in commit
>> 7f058112873e ("ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom"),
>> so adjust the bindings as well.
>> 
>> Fixes: f77024c80147 ("dt-bindings: arm: aspeed: document board compatibles")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> 
>> ---
>> 
>> Changes since v2:
>> 1. Fix typo in commit msg.
>> 2. Add Acks.
>> 
>> Changes since v1:
>> 1. Use proper qcom compatible.
>
> Andrew, Joel,
>
> Do you have any more comments on this patch? Do you plan to pick it up?
> 5 weeks passed..

Sorry, things have been a bit complicated recently. Looks okay to me, 
but Joel needs to pick it up.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
