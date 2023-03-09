Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F66B72E5
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsDK20hmz2xHK
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gJ2r1RFL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tudor.ambarus@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gJ2r1RFL;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXYLf5G6mz3cNM
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 02:41:12 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso3908636wmq.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678376469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thHKQQTXmNqo7+agzCDK9DfO3aLKYlwKu3AriL3BjPg=;
        b=gJ2r1RFLFeBfkIT/MugmSb5mkRuueMrpeZW9ljS6WJwcDSNGf609jDWEGhUDaHEezx
         cZ2rzK8O84Ns9L3RtlsXsMJRPxISQd1EIm/PK9KtKi5sy/DnsXChGUZ+rDKG6diE8pR1
         bvqxe64DPNRU+Y3LVE795yrOjPTh/8LMBVj/AFkzsYU6KDhfcV18n1doWjxTyXqEyBrA
         xdb5EG61TWJtW1P5i7IQkl6EAZy5htVaEvuJJZhD92utvd6odYUZwwcIcRg7H2ZYWCkt
         sN8F8s+f/2dKAKUwUrpJ19SobSCbYCghvKAu424U1Jj7fh2YzZxH3g7DP6XiW1U2c1T/
         LT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678376469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thHKQQTXmNqo7+agzCDK9DfO3aLKYlwKu3AriL3BjPg=;
        b=LtHffo6uAFSSizT0GhOQ/Zk6T0ApLd/dY7wclxMVfhg216elOJHVIJes513o+DnzDw
         oJEdP2WvLm/Kqkmf6lypjS/cqwIF4Z9UjB+V4VZtEwfbodep64G2TnUfZCZfKrPGVmsu
         C9msUNMkk4YD5yWqpryen4EIAjPI5eT3ZKo9NpHs/49nthJw4oDWDgbmnD5I1gzNB+2G
         7jTdncdcS1jt5hyvchREdiHcPz4GU01k7TqWP7XzQDju5i+d3wIDegjZ6yGaj2ccrPcj
         dnTusW9ydfVvOG2tlO+W6xaeJPRVxvTTkniBD2VAbmCGchRCzn15JnTNITVH9AQfnELS
         E5Qg==
X-Gm-Message-State: AO0yUKVGWspEi9zqVVTf5XiOwExCPWc2rI0u+DJd/Cx5GZyYoHE8nSqT
	y1Mn0veEtLCOZfVLCJD20fi2cQ==
X-Google-Smtp-Source: AK7set85qnSSVIK+/VfxFa63URER6rmyYNQB/XVwahWExbs8/RUsgm9XOIYiq9V5NrA4EQ+yUhQcHA==
X-Received: by 2002:a05:600c:4ecf:b0:3eb:399d:ab1a with SMTP id g15-20020a05600c4ecf00b003eb399dab1amr19180672wmq.21.1678376469612;
        Thu, 09 Mar 2023 07:41:09 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c229200b003dc4a47605fsm257344wmf.8.2023.03.09.07.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 07:41:09 -0800 (PST)
Message-ID: <99ff644b-7734-44a4-6b3e-493dab843334@linaro.org>
Date: Thu, 9 Mar 2023 17:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 13 Mar 2023 20:42:54 +1100
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com, kdasu.kdev@gmail.com, richard@nod.at, Sergiu.Moga@microchip.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, yogeshgaur.83@gmail.com, linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, venture@google.com, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, avifishman70@gmail.com, mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com, Pratyush Yadav 
 <pratyush@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 09.03.2023 16:01, Michael Walle wrote:
> Am 2023-03-09 14:54, schrieb Tudor Ambarus:
>> On 09.03.2023 15:33, Michael Walle wrote:
>>>>>> The controllers that can talk in dummy ncycles don't need the
>>>>>> dummy.{buswidth, dtr} fields.
>>>>>>
>>>>>> The controllers that can't talk in dummy cycles, but only on a "byte"
>>>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>>>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does 
>>>>>> not have
>>>>>> the buswidth and dtr info, it can't convert the dummy ncycles to 
>>>>>> nbytes.
>>>>>> If he knows only that buswidth is 8, it will convert ncycles to 4 
>>>>>> bytes.
>>>>>> If dtr is also specified it converts ncycles to 2 bytes.
>>>>>
>>>>> No they don't need it. Lets take your semper flash and assume it needs
>>>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of 
>>>>> the mode
>>>>> or dtr setting*. The controller then knows we need 12 clock cycles. 
>>>>> It has
>>>>> then to figure out how that can be achieved. E.g. if it can only do 
>>>>> the
>>>>> "old" byte programming and is in quad mode, good for it. It will 
>>>>> send 6
>>>>> dummy bytes, which will result in 12 dummy clock cycles, because 1 
>>>>> byte
>>>>> takes two clock cycles in quad SDR mode. If its in octal mode, send 12
>>>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
>>>>> single bit mode, because it cannot send 1.5 bytes..
>>>>>
>>>>
>>>> You miss the fact that you can have 1-1-4. What buswidth do you use
>>>> for dummy, the address buswidth or the data buswidth?
>>>
>>> Doesn't matter, does it? The driver is free to chose, 1, 4, or anything
>>> else. You don't sample any data during the dummy phase.
>>> To answer your question: single for instruction, single for address,
>>> whatever you choose for dummy as long as there are ncycles space between
>>> address and data, and quad for data.
>>
>> Huh? How does the controller chose, based on what?
> 
> Based on its own capabilities. It can choose either way. In the end

Okay, I'll go again through all the spi controllers and check if we can
determine the dummy nbytes based on controller caps. Thanks!

> what matters is how many clock cycles there are between the address
> and data phase. And you only need to convey that information to the
> SPI controller - your new ncycles.
> 
> -michael
> 
>>> Depending on the capabilites of the hardware it will likely be 1 or 4.
>>>
>>>> What happens if crazy protocols like 1S-1S-8D appear? What buswidth
>>>> and transfer mode are you going to use for dummy?
>>>
>>> Also doesn't matter. What matters is how many dummy clock cycles you
>>> do. Again, they don't depent on the mode. You just have to count
>>> the clock cycles between the address and the data phase (and that is
>>> what your ncycle parameter will tell the controller).
>>>
>>>> And please don't tell me that "we're going to assume that
>>>> dummy.buswidth = address.buswidth because that's what we currently do
>>>> in SPI NOR", because I'm not convinced that the assumption is correct.
>>>
>>> No, it doesn't matter :)
>>>
>>> -michael
