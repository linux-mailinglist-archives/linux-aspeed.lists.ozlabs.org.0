Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F855FECF
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 13:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXzyj3w2wz3cgB
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 21:39:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=CnfkjBSo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=CnfkjBSo;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXzyY4CLlz2ypH
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 21:39:33 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.47.106.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 740FA20CDF40;
	Wed, 29 Jun 2022 04:39:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 740FA20CDF40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1656502741;
	bh=nMMncbj7PcZxuOTOGA9EBSFftECnVGmkQTDJvUjK8Ao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CnfkjBSoe3VldwsxCa2rq1Jsqah/UaFoJnxR/eoaDuoljMrz6XIsBxzffBHx2LRBt
	 XbrRVRxkOlcRfKCLcL2Ngr1c0z9lARuha1sRI0C/ZOJ7SeCOdjDvRHqYaSPkISxdGG
	 c0XNzOpralATM0laJNwInmCQPg89bNR4IXsEXTxQ=
Message-ID: <74981148-70ab-059b-6e77-b88ea908e703@linux.microsoft.com>
Date: Wed, 29 Jun 2022 04:39:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/5] dt-bindings: clock: Add AST2500/AST2600 HACE reset
 definition
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220629032008.1579899-1-neal_liu@aspeedtech.com>
 <20220629032008.1579899-3-neal_liu@aspeedtech.com>
 <b70e06e7-81fc-dfc1-f9c5-f83cb4a18293@linaro.org>
 <HK0PR06MB32025ACEE605D1016DD3B99D80BB9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <409af908-5e03-8df7-fcd5-7fab75cdfb34@linaro.org>
 <HK0PR06MB32021F63833C4C482CC616D580BB9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <HK0PR06MB32021F63833C4C482CC616D580BB9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/29/2022 1:49 AM, Neal Liu wrote:
[...]
>>>>> diff --git a/include/dt-bindings/clock/aspeed-clock.h
>>>>> b/include/dt-bindings/clock/aspeed-clock.h
>>>>> index 9ff4f6e4558c..6e040f7c3426 100644
>>>>> --- a/include/dt-bindings/clock/aspeed-clock.h
>>>>> +++ b/include/dt-bindings/clock/aspeed-clock.h
>>>>> @@ -46,11 +46,12 @@
>>>>>   #define ASPEED_RESET_MCTP		1
>>>>>   #define ASPEED_RESET_ADC		2
>>>>>   #define ASPEED_RESET_JTAG_MASTER	3
>>>>> -#define ASPEED_RESET_MIC		4
>>>>> +#define ASPEED_RESET_HACE		4
>>>>
>>>> I did not ack such change. This is a significant change from previous
>>>> version, invalidating my previous ack.
>>>>
>>>> This breaks the ABI, so NAK without proper explanation why ABI break
>>>> is accepted.
>>>
>>> I changed the original define (MIC) into different value (see below diff), and
>> add a new define for HACE.
>>> How does that break the ABI? I'll be appreciated if you can explain it more
>> details.
>>> And sorry for not remove ack with new change.
>>
>> Yes, this breaks ABI. Previously the ASPEED_RESET_MIC define had value of 4,
>> now it has value of something else.
> 
> Got your point. I'll re-define HACE without modifying ABI.
> Thanks for your suggestion.
> 

As per HW manuals, new def is correct for AST2500, but not for AST2400.

AST2500:
SCU04[4] = HACE
SCU04[18] = MIC

AST2400:
SCU04[4] = MIC
SCU04[18] = HACE

The header file is shared between AST2400 and AST2500 (aspeed-g4.dtsi
and aspeed-g5.dtsi), which needs to be split into separate header files
given the collision.

Also, It will be better to split AST2500 and AST2600 changes in separate
patches.

Regards,
Dhananjay

