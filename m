Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9958637D
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Aug 2022 06:26:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lx4nC1x6Fz2yxF
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Aug 2022 14:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=N/J8PpnH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O2FbwGbA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=N/J8PpnH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O2FbwGbA;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lx4my6w35z2xGm
	for <linux-aspeed@lists.ozlabs.org>; Mon,  1 Aug 2022 14:25:54 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 190C35C004E;
	Mon,  1 Aug 2022 00:25:47 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 01 Aug 2022 00:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1659327947; x=1659414347; bh=RKciRP35yI
	n6t8imsaoMGR1crRpllRfUmQuYjRCYauQ=; b=N/J8PpnHpUxXkO47YcF6hKnUY1
	FfbwtG+Tc4ySe548tEoGVFLjvihJt8J9/G9k6FRx1QnWIH5WaBvq0RlHhmxYQZk1
	pzIKFY2gjatHM+YbPQtwVz3bNIhlj4uWFtt1Bc3Ar8hUMLLBlHRgPPxRkyWjV08C
	8ohUxh4xOge4lXh4V/6RkdEitNe6l2tjiZtV7pmHqLebkjSJfl4OIFjjx3jHLZ+t
	ZDD6TqUNE68pedRER5rXa7J79USVaitpnLQWKiZW17uTGkqaSGMV1QhbYplvt65W
	TLQ+C5WJvfv6pOiuBQmPNmXmu1rnWmTZnSz8cNzNltIZtS40RnAjkFIBCScg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659327947; x=1659414347; bh=RKciRP35yIn6t8imsaoMGR1crRpl
	lRfUmQuYjRCYauQ=; b=O2FbwGbACESzpPcc9+F0syVT3a30H3V/ZldbdRHWHXy3
	2GVdWWr5iJowAcWC62t3S0UrSD8yIYRqO8nYr9MHgiS9bEiyUYcCe9J+Y3w0K+VN
	57BFWt3I5/m/hf8eqDYPYp8do7woqpLcMwPW+II/IESQ3TYa3792qTpysOKDQSI9
	TXXG4NkUJquPIxYDRRZzugiuJal0u5PhZEowAjsVSUhZS2EvVhRwfxjiGc23FzoH
	3sv0OPKX3vr0KhUUWJQ8qe/8pveBCAgNrDHJDcpUV9gTHTLc9N/cj/SNXEs06XNU
	gli6C+glGQelqgJQS9NuNezYAtp7KLe/U4Sz2RKp3Q==
X-ME-Sender: <xms:ylXnYuV6-0EPyMkHupedsj3xIOiv--OzCHQCJHOvVNqktOB68iVfnQ>
    <xme:ylXnYqktjzEMUeX0H-0GHmWyqzRLcsEutBPZiMQtIyl9lwtr_7q9xLm5THA5szEoX
    Y3R8bK5p4LXTR6PKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvvddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
    fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedvueeuheefhefggeejtdeffe
    egvedvieefjefgieffvedufeeftdehveejvdelkeenucffohhmrghinhepuggvvhhitggv
    rdguvghvpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ylXnYiafKFp7sQr_bsox-ElmZccktPtKrRgE2wedKkD3YHvpQlSBFQ>
    <xmx:ylXnYlVTM9JKIBzwm8hY6uwLlDofiRqJzKj1Ai8j_gAkhz7vTPm66A>
    <xmx:ylXnYomdWGEsDr9FrtxJY8A7uXJk7LmiW_gxZ3sgyBpbSPq-XaEPDw>
    <xmx:y1XnYkuU_-rEwznTL6kyUNtyaD5y2_QReVaS1ZtVX60XsCSwkl-IUw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C8CBE170007E; Mon,  1 Aug 2022 00:25:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <e94ec2a3-cb7e-4e8b-bb73-fe6b7a6c618d@www.fastmail.com>
In-Reply-To:  <CABoTLcSj0Py37E9tjC=0snep71Hg2bvTG8oGm_+wmiUHpTZL5w@mail.gmail.com>
References:  <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
 <c29de2ea-0f60-4e7f-8308-11849a7de8e8@www.fastmail.com>
 <CAFPZpNZ1+UDVcEs_gp1zCzxXfP6PqZ8kx+UGhb73BusiScRk+g@mail.gmail.com>
 <a509d7a3-2551-4eea-b965-9499ada39b16@www.fastmail.com>
 <CAFPZpNb4fNF-QgQrWLeSkN9TjYsWZvH1YrbQj66rBW6jn8rCug@mail.gmail.com>
 <CABoTLcSj0Py37E9tjC=0snep71Hg2bvTG8oGm_+wmiUHpTZL5w@mail.gmail.com>
Date: Mon, 01 Aug 2022 13:55:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Oskar Senft" <osk@google.com>, "Ali El-Haj-Mahmoud" <aaelhaj@google.com>,
 linux-aspeed@lists.ozlabs.org, "Zev Weiss" <zev@bewilderbeest.net>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 31 Mar 2022, at 07:40, Oskar Senft wrote:
>> I can
>> switch SPI1 control to master through pinmux-select:
>> [...]
>>
>> However, I cannot access the device. '/dev/mtd6' doesn't exist, and I
>> cannot bind it:
>> $  echo 1e630000.spi >/sys/bus/platform/drivers/aspeed-smc/bind
>> -sh: echo: write error: No such file or directory
>
> Is there an existing interaction (in the code) between the Aspeed SPI
> driver and pinmux? I guess ideally we'd want the SPI driver to talk
> with pinmux to tell it "I'd like to bind the device, can you please
> configure the pins properly" as well as "I just unbound the device.
> pinmux, please release the pins".
>
> With that, I wonder if we somewhat have that already and "pinctrl-0 =
> <&pinctrl_spi1passthru_default>" ends up "confusing" the link between
> the pinmux and the spi driver (since it's actually the opposite of
> what we want)? How is that _supposed_ to work? Maybe there's just a
> bug?

Possibly, getting a driver going for the Aspeed pinmux is hard work :)

>
> Also, I'm wondering: Is it possible to have "&spi1" defined, but not
> bound initially? I guess that's what we want by default?

Zev tried this and got a lot of push-back.

https://lore.kernel.org/all/20211022020032.26980-1-zev@bewilderbeest.net/

Andrew
