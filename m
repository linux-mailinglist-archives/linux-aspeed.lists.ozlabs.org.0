Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B83DF916CB9
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 17:21:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=MVECx75F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7pSt23Sqz3fVm
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 01:21:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=MVECx75F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7pSl2PvZz3dD1
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 01:21:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719328812; x=1719933612; i=markus.elfring@web.de;
	bh=YVD/tJNvGbYivDfpDiivk2bEEs6GBmCeIdOyyXsf5u8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MVECx75F0X3d1N8GDmuYHco2iBYYP25lTijAqHV+rQHmWrwwvl+AtuYPc+ao1yKm
	 qT7uHx5CW3svQ5Na82hwZzx/iqTpdoYJ40q0WAUWM5z7b6r4m4GwbsG2aRLIolUdo
	 JLP7CW1HXY6sm7FsL9EHwxDKO9W3Q7YWH7ljWeMYT7VUym/JVZFeeK4TNsJSe7t95
	 bSGcdx++g9gYhkL+t2uS5+Rfv6TYLc0zKtFqJYgLSIcxE4VRIA32K9KHnMBWzoCcv
	 8OgUYlmH4oUwweRhnt7V/iKq7WUx1QCXWfRI6d+r6tsCDQKCdoxhWlZ5pfJjOierE
	 Ci5rnrDu4aYNR6Csaw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mpl0p-1shA252rWv-00eio5; Tue, 25
 Jun 2024 17:20:12 +0200
Message-ID: <5fa430f5-3e18-4c20-93d4-6733afd6bdcf@web.de>
Date: Tue, 25 Jun 2024 17:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240625022306.2568122-1-make24@iscas.ac.cn>
 <edeaa699-7cfe-44ed-abde-7cf3d3efe3bf@web.de>
 <2024062556-ladder-canister-1ab1@gregkh>
 <ff2aaf0d-5456-43d1-af52-78986b3401f9@web.de>
 <2024062532-strep-president-44d7@gregkh>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2024062532-strep-president-44d7@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n7N8SoQuEumAxkKN67/A45ARqVyO0jTW3y4tbOJ0enxIUT/JB4Z
 jwc527Jhth5DLaABBIzU1LevsZcydRwgmMCp2WAH6SLBe/wRgO3S4+pBGx/IXkus3J39PrZ
 lYX4/DkzpmLPK2X5k/RWPu53aTPmDKKrmBqtV++d+fWmJKH+KwfYXEz9G8XH9yQmn1rLAMD
 dLrVgGrfxVyUt7lTcM6Cw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OqfYbzbqvxk=;5Z3b8yRWNTSCO8osebXlPRAScJk
 a6d2G9e3ovbjDa6NlBzZytC5inZUrWz8TFvm8ExHuZOmV9k/Qo9KDt3t/N4C4Y1dLP3WKJTN3
 lQLRoJc4g8GiU/RvhJ9wKqsudHr42nS1H4t02s9ILLfRby0tKZk7n1a9lDIvxx8xUqBM4cSgk
 L9MY4vVxXvy4UOmEOjkAWpetIfj8MA7iIDhzGfzMScq8vW4EZRaKqrzzVvStkY9w+xG43fJMu
 a1TEQcT2JlfLhEsepHPafSB9NRQgttA0lYJ/Yr4ycJo5L/xT23MFGChhZ1jR9MQDQeYT25/NJ
 LJF9A1pJFbw5EwBYV1PMc8si9EUqWe6yu1Jf7F6NcwRfhWaBUq2OlHS1Wra7A/8q+j5R+qugN
 z2yDA7VSEG06fxvrUvxpyxxT2gaYtun6oEzY58o7a1nwoXArSJ8d2KyVN2htOFFnWDtKO9uef
 BE28Z6PXSCqMBZGbXA70O4LPHSTbtzclAmBAKFxAe4IwPveyOoyn+rVsuR+Z6C6i3+7viI4pA
 EYP3HyUHHJlwfImnv4oSYuEMGj0oImE24zXZVJDRvihVTx8GJY6QbMJYQ4LMpItlSQBrRao0C
 UtyYjBVlH2578wHM/jpVq1LWG8IuokpBx8X1ZbpjcIH4n/Y+jTfj3QAfgP+PQSsq+8r1ZS67k
 xW1pKBBZNj9vbIP8B/npY484BIaLzluT01bKzY/uDIsbwk6xaXHPexs/ioLrNvvHIg/03itTZ
 uILgTfV7KnjfSFxqPfJCnwwnb2xz+MH09Bgfjnb9cE6MoAKs8KbL3xkrsa5FMCufDmbKgdGK1
 zoFl7KDoEuK1bo78nDTuK2k3BdP9s0ekGCutzcNk004so=
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

>>>>> We should verify the bound of the array to assure that host
>>>>> may not manipulate the index to point past endpoint array.
>>>>
>>>> Why did you not choose an imperative wording for your change descript=
ion?
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.10-rc5#n94
>>>
>>> Markus, please stop reviewing USB patches.  This is not helpful at all=
,
>>> and causes new developers extra work for no reason at all.
>>
>> How does this feedback fit to the linked information source?
>
> That is not what I wrote.

You indicated concerns according to patch review processes,
didn't you?

See also:
* Patch submission notes
  https://elixir.bootlin.com/linux/v6.10-rc5/source/Documentation/process/=
maintainer-tip.rst#L100

* Contributor Covenant Code of Conduct
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/code-of-conduct.rst?h=3Dv6.10-rc5#n3


> I wrote, "Please stop reviewing USB patches."
>
> Please stop now.

I might be going to influence evolution of this software area in other way=
s
under other circumstances.

Regards,
Markus
