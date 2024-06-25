Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E9916DD0
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 18:13:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FwfKPqOs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7qcj5Q6Sz3dWc
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 02:13:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FwfKPqOs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7qcb50sbz3d9H
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 02:13:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719331942; x=1719936742; i=markus.elfring@web.de;
	bh=a6i52JC6Jz9SMj7x18Xrbev5HZKfpMpu1ptSSS7AvsE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FwfKPqOskwVJaj6zll4hhIt4YIMMutlU1MUPKdiNNiljKFefTx7HPc4XuI/CRpKi
	 rg+Eq07A2W3x4VfgdXmMah0p/AerzLhJFWfXKkaASmmtyUf2chAcLnOX8G/ycKv/+
	 uTaXyGALct2IiAKqyyWrrsq6wPySIS4dFaQt/gdrnXfmaQavUuQ+kEfNEWNVpksC1
	 +smyND++jtPrNrR7MH3oy/SHRLxAIWU7x4BmmNjN4gs7Mff9wefIxkGdSHyxf6SVs
	 AxviH8GiXOmwLINk1s8btfhrek9zyJfgs6hqIsZUARzsD2Su2F6Tmnn1cKYtjxoit
	 LBxnVALaM1BBn7WknQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRk0W-1rssmK3NH8-00Mo7u; Tue, 25
 Jun 2024 18:12:22 +0200
Message-ID: <fcb2c59a-b0e2-4a07-853d-8dda94db628e@web.de>
Date: Tue, 25 Jun 2024 18:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] usb: gadget: aspeed_udc: validate endpoint index for ast udc
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240625022306.2568122-1-make24@iscas.ac.cn>
 <edeaa699-7cfe-44ed-abde-7cf3d3efe3bf@web.de>
 <2024062556-ladder-canister-1ab1@gregkh>
 <ff2aaf0d-5456-43d1-af52-78986b3401f9@web.de>
 <2024062532-strep-president-44d7@gregkh>
 <5fa430f5-3e18-4c20-93d4-6733afd6bdcf@web.de>
 <2024062553-koala-granddad-50f1@gregkh>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2024062553-koala-granddad-50f1@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:67NMm2dfE8kCd5D9WldFr8mlygFuTOO43QrxnGpmnD+xIJUF6H3
 D4ScmAVARb/Inj6uEZFHub9SHzZbRIxBi7PX1Cpqr+Lz1umOzzPY5AhlyhzbQsEpprvY1Iw
 WmkgQPp0okATcu1/GtKcBehtJXaBF4G0c3T/Po8cfPQgOf69Hnds5YEezTVMnW00ooPRxfG
 iP8/D8RbmGEOfD1Nnnzlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aFOZ6XKuxOA=;TuMWGKgmPIC6zCZ7YGB3r/khXrd
 LqhyjFJ01jYlt6SFluDqvDwA6R6yfGaku98gjKZ1HhxcS8ZpKYCBWUBL4qfIJh8KEe3v6GlgD
 fcpK0W4rx7rLF7lQZ6EpgEZOsP50baKpAHx0geyH4C+bVzfH4H722BVSEv7pMmTmwB4U0qEq2
 nJ9dxanHYSG6TCNW69PDgm2yKSupRI2C4JMlmgbK9nd/3Oett9/4dXRkeNfe5vLg1AHur9kiq
 CoIoGBQbHog/FqjdSjk80GroADrYcrZTQsRa1LiPPZV1OflwhBq3YmcJpVU1pnErKsJIVphVB
 UxEV0AURoYssYb8rP2t9iEyg3vZ8FYNL8nuTHfSyC/7R3TVsxqt9WA5hxs/M0zT9YgT7e5Tl/
 DVJSg+oL/HsbTOYuGhnvcLbatHREMkiqNHJiZLUWll2laDHlnL8kc7EbxbV73SgN6jeY02DEX
 hpBhfIF0knKL7U3bVBP589PdiUsf6b+mU6cPII6/8FV4oNbqphlg58IMTyjwfWtEm7/URh4Qh
 YSslPUAoyViwKGdpZibfuSMXuc0vBRFf4PTmTa/GsmSKfM/VLBSjv+r2tmd0ls1pOEpfvNQme
 ha5jJ0vaZB6vHpRiLSr1YS4qkHvSvFnerGW2erfveaiFFVncqiSS32uRWyr9qGZopCGiMJHR5
 CmJta59i4maay9WtcofxR9LC8MGXaVyTjKBgoWP/kPyldCS24lkqn1QLceojmBWEQEPa3QnRY
 uNPHMdlTwpe55O/ngotKA3xSrXGaZFjVLBkO96HOjhKipadjO7BWSh2NkIpfz451Eb51/n4TF
 arTjQnrCXyMUw3+L6B/C6PjnVUdYwLKNR/ZM+s73qJzL0=
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
Cc: Ma Ke <make24@iscas.ac.cn>, Neal Liu <neal_liu@aspeedtech.com>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>> You indicated concerns according to patch review processes,
>> didn't you?
>>
>> See also:
>> * Patch submission notes
>>   https://elixir.bootlin.com/linux/v6.10-rc5/source/Documentation/proce=
ss/maintainer-tip.rst#L100
>
> This is not the tip tree.

I know.

But I got the impression that some information sources
(also from the Linux development reference documentation)
can provide advices and further guidance for recurring patch review concer=
ns.


>> I might be going to influence evolution of this software area in other =
ways
>> under other circumstances.
>
> Please take some time and find other projects to help out.

I found several opportunities already to improve something through the yea=
rs.

Concrete example for a selected data representation:
https://patchwork.kernel.org/project/linux-usb/list/?submitter=3D170303&ar=
chive=3Dboth

Regards,
Markus
