Return-Path: <linux-aspeed+bounces-994-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF743A61872
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Mar 2025 18:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDsHF3MQjz3cB5;
	Sat, 15 Mar 2025 04:46:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741974377;
	cv=none; b=CAafB4pDIYAOHh0mmKIc814l5Daa2HxoIXsI1KXI8RCCtG3bja5/c0dNlL1uzG/9eJ/HmHqQ8FBbkAS8/SQQZMKj+Dzjwy/gVzYJTkPsWsq4DLgwgVTWr35ojlrrUa+52DJCxsnEgJZc+ALIw+EClL3xc3trcYhjv/1cwlVaJFHB/9c8POa5KwFH9SLC3XpoupEm7y76FEgT0hCXXVhlMZTmXB9L0QGG+mjQktNrmyCyJT8AGNMTIr0dYt+qQxJVKHmQ/S3aCMWm0ZA8+WgeFt7x0gcAYgUPJLSqD2w1PeB9SW4u9NXsH8RZyWl71BeLs/ri1zkfLUyc1wKOjBbAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741974377; c=relaxed/relaxed;
	bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=laj1i6CAQ2eMyxK+h5mIFCk2OpeQiSNO0feXRgFEquu7Ww7Tq+9BF/WPJuQR/msVsKa4pam2j3JMMAbl1t3ZfnbvtsSnrOfUOnQssk+lmsStT3a2beNnHrjJpZeW6XbM6tm+Ff0W+UmwI3MI/BXEOxUolx6KHvnFeZMFK1y/dfRuXOfvYKA/LiuW76Bxv+tJAEjK7Chagi41AR8BY5q+qFFGewTDrBLQFMJSa/l9+dEX1u6vM8rzeUqKnsEkEmCEhpUJBF163yjq1vsupQYRl0qDTBmeCugl273NUZvi69QXS3stEy23Wy+V0MIQYuRADOHL0p1yW0YjukED7YXAxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Qr8eTlcI; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Pn6W0vyz; dkim-atps=neutral; spf=pass (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Qr8eTlcI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Pn6W0vyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 382 seconds by postgrey-1.37 at boromir; Sat, 15 Mar 2025 04:46:14 AEDT
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDsHB0H0Fz3bsM
	for <linux-aspeed@lists.ozlabs.org>; Sat, 15 Mar 2025 04:46:13 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C545711401C7;
	Fri, 14 Mar 2025 13:39:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 14 Mar 2025 13:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741973988;
	 x=1742060388; bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=; b=
	Qr8eTlcIyalonhqSe3CMMnShEhk64haYwLN+WFQBNNmIpPTFpm5AvPSeySuFnbu4
	06DjpP1vn00N+a4wSG9pJwAsmsazhEIPnu/azKhy6j30oUhpxBALpwyuHE8B5kPT
	/rnittt3L7j8lTJFQkIGI5vAjcVEIYAnwZ1wSZgPsuQeusW96EkEwgfvm7JpTFwL
	lX5GZiqPj8vSKO87yNCtGhbtSCU9xQ82s8MljLTXlfC2ntkKmXkrsW56Y4Rry8fo
	5KpajimJCD5b+yxQ38BjLSVVllKoq9TyTmxegvF5nHVgd41eHApaCNcloN2mAHAa
	jQ/8iMIVpcEmyyUqs2b4ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741973988; x=
	1742060388; bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=; b=P
	n6W0vyzr7uqXgdLHioKInC9skDEvsGv9sz0cdE9SbSZafPZg1OJOGOOUlo/ROvQr
	Z3R5Qx6N5EoYdl/0VfVuvuWQEVRETtEG+rUH7T4GZq9UMS9aeHWzOniKO1dnfjS5
	ybj4TokSf93pddhbJygqBuM0CI9Y5FQVHbxprBTKTaE9vkAYx0aeXeORHvdf6MUN
	1IsFibD3ZQzI1c5T3xgbx9WrlvniZU7F7Wq/8htMOtXhRt8fQVXiaHlQyG8ad2Mg
	JvSMCiAmSqJxIkwbQvYOmdr1G8LJhc20jIdfYi9GDM74Yy6zmAYr/IrRAUdI55jt
	67hHqX6RXfrOKacg7jcWg==
X-ME-Sender: <xms:4mnUZ2lrmvRoitLLGC7J7zFoy0_UjShHEUECn0srorIY6utafG-1Vg>
    <xme:4mnUZ90tAj0nRHqsU70IO71IUU9EUzVNHtR5rx9oC4i4BrAMSEvTw-4FlHvBGKijC
    qfMZHWTfUBiYffkEdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedugeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhhinhdqthhinhhgpghkuh
    hosegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopegrnhgurhgvfiestghouggv
    tghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepjhhovghlsehjmhhsrdhiug
    drrghupdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeif
    ihhmsehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtg
    hpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4mnUZ0ptPtSAVK1mCgpsk0UTZ9p1VWhNSw27vSVwy-mk6G1v3gYdIg>
    <xmx:4mnUZ6lw4KXvrER1UjC36CTwtAgNfBBxvG7bZIhcGpn6-Hks-m9PBA>
    <xmx:4mnUZ02S1-ucRISkk0NH8BJ30_Ve143dMVMW1FZgPTP74EeqWmXBkg>
    <xmx:4mnUZxsVHT5G6bxA-tZ6iUZoAr5Tm3H1zOONT4JsO6ABbnDW3v_ZDQ>
    <xmx:5GnUZ6wNh2imRHzh5dAn9BBBmxi2uzGZTtr2T3f9wYYhUMbc6zHlQw0Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5145F2220073; Fri, 14 Mar 2025 13:39:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 18:39:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Message-Id: <71b81647-aa39-4c33-b92f-2c9e6d1e606d@app.fastmail.com>
In-Reply-To: <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
References: <20250314160248.502324-1-arnd@kernel.org>
 <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 14, 2025, at 18:37, Guenter Roeck wrote:
> On 3/14/25 09:02, Arnd Bergmann wrote:
>>   
>>   	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
>>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
>> +		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
>>   	}
>>   
>>   	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
> Does that help if the pointers are 64-bit on a 32-bit platform 
> (multi_v7_lpae_defconfig) ?

Yes, that is the problem: resource_size() returns a resource_size_t,
so this is a 32-bit by 64-bit division.

Pointers are always 32-bit, CONFIG_LPAE only changes phys_addr_t
and resource_size_t.

     Arnd

