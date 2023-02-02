Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B102B6874FA
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 06:19:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6nCH0hcwz3f39
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 16:19:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Dkrt63Ht;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Brz+nTBf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Dkrt63Ht;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Brz+nTBf;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6nC44F55z3cNY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 16:19:11 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 14D823200907;
	Thu,  2 Feb 2023 00:19:03 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 02 Feb 2023 00:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1675315142; x=1675401542; bh=qlB8J5fcQ9
	pWFGZPh4fvEz5uOnYTgBjr7dz+WP8j5yc=; b=Dkrt63HtIe6vqployzDjAFGg6L
	YWsfnUolSV9YToK6J0XcZpBbyRMwKffcs6c6PspuyKxA5FDVZmhNC2zBMyZ19tqQ
	uazskdwpzP7acDAdBylGVWotvR+xame+DNvgfuxdPWtKW9iG9xgFMNIvPD0gKMpR
	fko2tgLTCHv4SFzLW2yH1j4HY4lXQVILhYGFaKF7Gf7Ia9tY1GYYygJJq5jHJ4zJ
	eDsbHKRKRaHPRFTjWHp7o7eKDOAV+ThsTX4FTc92LnvCtG1G0uiGNjqgqDphaLDj
	GfjlCuQtpqb9VScZ/fmse+7Yp9t6atvCYqGf/1OpOKgktIpRZOtnO/BD2T3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675315142; x=1675401542; bh=qlB8J5fcQ9pWFGZPh4fvEz5uOnYT
	gBjr7dz+WP8j5yc=; b=Brz+nTBfPhT7mfU2URl1sQT+Gn+skyv9wCEli/6Rgu+6
	EVU+zWfliZW6k4izI6Hl26mlHhCVnivLV+ld+4PdePm1D97vISJwK97lXhtm5h/J
	UCCSQJT+MpZezEylekW2/7qbrEkbDiXbLbL6Y6HHB/QJZ+AJZQfV2m2OYDrSrdTt
	ZELV3Nwd5h9ldz6t/7wmo0sr/3TAEM32x0ts3uYHppxdLeAnyOn4AF/42B2ObMRh
	RFBIreOxwdAv8MnrCVONw2iZYwt6UPZPgc+meIu4tWHWtVqO39jzlcfDxHyS4vsc
	yJAs9i7HGv/jgY27K0Fx4xBcdJJrXd8jHdNP4wxnng==
X-ME-Sender: <xms:xkfbY3GLvG03Yvc7lDMoY4m0yFTOUpnLTq4PeyavsBv49HJYZ20eSA>
    <xme:xkfbY0UBsfDzpqQACwkLaAGnxZsw3tAGOVfopqDnA6jXhm87o69vG3P3luH-qyrxo
    -JuMHpc9-cUH8bC8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefjedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeeujedvleduveetfffhlefhtdfgfedvteffhefhtedtheeffefggeei
    fedvheehhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhoiihlrggsshdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
    rhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:xkfbY5LgfXvw1p-Z0x93AFPz6dQvAP8X_Mg835dKllBOCGvaYO0WQw>
    <xmx:xkfbY1E215NRPYIJpqDp6dXQF6PmZZIBKleovQk9FN5piRGEm3v2LA>
    <xmx:xkfbY9WqXtrtEDIk8nPnHLUzZf_JjSCOfvCOp8DrJj4iYtUWashmbg>
    <xmx:xkfbY2OcSQi637wFrBWuNAma7rjwfzhtm43HxYrfBxju2yj6GU2CkA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 413C81700089; Thu,  2 Feb 2023 00:19:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <8f165a30-4adc-4a39-a467-4cd3d466e850@app.fastmail.com>
In-Reply-To:  <TY2PR06MB321334CFD4ED1BD4AF97965380D69@TY2PR06MB3213.apcprd06.prod.outlook.com>
References: <63da97b5.3V1HSQEat507LFIr%lkp@intel.com>
 <76f4dea0-9a39-4238-a213-0167477f5d54@app.fastmail.com>
 <TY2PR06MB321334CFD4ED1BD4AF97965380D69@TY2PR06MB3213.apcprd06.prod.outlook.com>
Date: Thu, 02 Feb 2023 15:48:35 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Neal Liu" <neal_liu@aspeedtech.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 66eee64b235411d512bed4d672c2d00683239daf
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kbuild test robot <lkp@intel.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Linux Memory Management List <linux-mm@kvack.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, Andrew Morton <akpm@linux-foundation.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 2 Feb 2023, at 13:29, Neal Liu wrote:
>> Hi Neal,
>> 
>> On Thu, 2 Feb 2023, at 03:17, kernel test robot wrote:
>> > tree/branch:
>> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> > master
>> > branch HEAD: 66eee64b235411d512bed4d672c2d00683239daf  Add
>> linux-next
>> > specific files for 20230201
>> >
>> >
>> > Unverified Error/Warning (likely false positive, please contact us if
>> > interested):
>> >
>> > drivers/crypto/aspeed/aspeed-acry.c:295:37: sparse: sparse: incorrect
>> > type in assignment (different base types)
>> > drivers/crypto/aspeed/aspeed-acry.c:305:28: sparse: sparse: cast
>> > removes address space '__iomem' of expression
>> > drivers/crypto/aspeed/aspeed-acry.c:606:24: sparse: sparse: symbol
>> > 'aspeed_acry_akcipher_algs' was not declared. Should it be static?
>> 
>> Can you please look into these issues with the ACRY driver?
>> 
>> Cheers,
>> 
>> Andrew
>
> I just send patch to fix the first 2 warnings,

Thanks.

> and the last one warning 
> is already fixed by another patch.
> [PATCH-next] crypto: aspeed: fix type warnings
> https://patchwork.ozlabs.org/project/linux-aspeed/patch/20230119014859.1900136-1-yangyingliang@huawei.com/
> Thanks
>

Great!

Andrew
