Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3B6A04C8
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Feb 2023 10:29:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMnlj5T8Hz3cFn
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Feb 2023 20:29:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KN2AKHoO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KN2AKHoO;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMnlX6SdWz2yw0
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Feb 2023 20:28:55 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id bo30so9547307wrb.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Feb 2023 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gb2qxqmKS0rtdO++khKuhDFOUfUplSmtQFJjeC7elRk=;
        b=KN2AKHoO96bfhSZx+IPwU/tbpQPchmaFp81rNz+ltuEuiZU09uMVGjD1JKiKbjRmRa
         OQcqfWt7sTKFnS1LK56f5SAunmpKwGUI93gfW3wxd8rWUrU5SGkAKGfnZUn3R0L8QWHq
         8WyXfLzZdyI5vM6uqx84dNcvxQuRjeUNW81mPEEaZhDcdDiyvSUNPDP65Jt5VrDt/faD
         c1FkM9GWtxEA+juEK/t9LIfKYc3RfzgqZDQ5tJoG5u3j8DTl/xBTMPV2ruhLZnmnc7mY
         1I5tjLKZ8bIFIQM+lVlGnU7OXnmfHfbpU8E6qozvdCp9B/+hr5FdmcRVuR/y8q0yEDIB
         flcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb2qxqmKS0rtdO++khKuhDFOUfUplSmtQFJjeC7elRk=;
        b=BOJpEWub1iN6hpBNd+q3TQ8X8e71he1FQXi/Vh4kLtxi7FlphgH3QYt+Qf26fuO55z
         xJ0kfKeSRoAnzV8pAAiEl+Gb1c64BBfa684oKoBgl9dHYV6GWYI8r1pqeBM2pc4eaNjG
         TtiSRslw1000DgMahYAoEtDg5wX/if35bStpyclOjZjzrO13FYCFkt2gwnaW7kDh1iIn
         H/OYjSKkrBpG6eeGWve1gybVM/ffuoZOxpi4ckoIGx8ceLyvu+F487bxuBO+egKqqyL/
         JzozaNYnZeDS6FqhlI1XETm9MZN2Jgw6yJPe8n8eCn/AXfn+oewcwVx0iyEhv45Cq7Jk
         cXQg==
X-Gm-Message-State: AO0yUKXBvCWf5tafpAaTeBQBRq79jpXccfW3xj5nF/J7jTise0G/1PT0
	NUf0o8OKFV3dPVWKVLXu8aEmFA==
X-Google-Smtp-Source: AK7set+MOmXu33I9nFWggqC/PShcnHbeYlNKSpRLAYvmxxPXpSzF23457FlD7byxWvQBb18MzZRLYA==
X-Received: by 2002:a5d:4b81:0:b0:2c5:4de1:ba23 with SMTP id b1-20020a5d4b81000000b002c54de1ba23mr9910494wrt.19.1677144530866;
        Thu, 23 Feb 2023 01:28:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d8-20020adffbc8000000b002c5d3f0f737sm8757431wrs.30.2023.02.23.01.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:28:50 -0800 (PST)
Message-ID: <5c255eb3-ec9e-d66f-4a2b-ccc32edf5672@linaro.org>
Date: Thu, 23 Feb 2023 10:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
 <TYZPR06MB527427ADCCD29DFD77FB0EE3F2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <80d873d4-d813-6c25-8f47-f5ff9af718ec@linaro.org>
 <SEZPR06MB5269502D7CBCD5698B65FF9FF2A59@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c0ac0ab3-87fc-e74a-b4e2-3cf1b3a8a5e2@linaro.org>
 <SEZPR06MB52698CCA6AE59DDC6C15CBE4F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <94238c42-1250-4d51-86e5-0a960dea0ffc@linaro.org>
 <SEZPR06MB52696835ED8E2709D6A454DAF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <b7ca24ea-a265-81cb-3da6-19f938b35878@linaro.org>
 <SEZPR06MB5269052D7ADCD0D0F939E60DF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269052D7ADCD0D0F939E60DF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 22/02/2023 11:47, Ryan Chen wrote:
>>>> connector. That slave will keep state to drive clock stretching.
>>>>> So it is specific enable in i2c bus#1. Others is not needed enable timeout.
>>>>> Does this draw is more clear in scenario?
>>>>
>>>> I2C bus #1 works in slave mode? So you always need it for slave work?
>>>
>>> Yes, it is both slave/master mode. It is always dual role. Slave must always
>> work.
>>> Due to another board master will send.
>>
>> I meant that you need this property when it works in slave mode? It would be
>> then redundant to have in DT as it is implied by the mode.
> 
> But timeout feature is also apply in master. It for avoid suddenly slave miss(un-plug) 
> Master can timeout and release the SDA/SCL, return. 

OK, yet the property should describe the hardware, not the register
feature you want to program. You need to properly model it in DT binding
to represent hardware setup, not your desired Linux driver behavior.

>>>>> The same draw, in this case, i2c bus#1 that is multi-master transfer
>>>> architecture.
>>>>> Both will inactive with trunk data. That cane enable i2c#1 use DMA
>>>>> transfer
>>>> to reduce CPU utilized.
>>>>> Others (bus#2/3) can keep byte/buff mode.
>>>>
>>>> Isn't then current bus configuration for I2C#1 known to the driver?
>>>> Jeremy asked few other questions around here...
>>>
>>> No, The driver don't know currently board configuration.
>>
>> It knows whether it is working in multi-master/slave mode.
> 
> But in DT can decide which i2c bus number can use dma or buffer mode transfer.
> If in another i2c bus support master only, also can use dma to transfer trunk data to another slave. 

and none of these were explained in commit msg or device description.

Best regards,
Krzysztof

