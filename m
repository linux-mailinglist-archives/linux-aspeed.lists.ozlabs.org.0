Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BD69DE67
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Feb 2023 12:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLbzF1PjJz3bgs
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Feb 2023 22:04:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P42RwhbE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P42RwhbE;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLbz44vtxz2xjw
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Feb 2023 22:04:46 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id f13so14982733edz.6
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Feb 2023 03:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyofFYAHde+sYhK5cCQMoTBZJv121KLcv8Iwe1/b2n0=;
        b=P42RwhbEv/opgjVo8yyGM/qLLW+JRqgnrwzTqZc8CA026XfDkNzZ0XSbiBpBd5Iwj6
         na0Vy34uEpQA3qQVEJKthCmBgjhscjjPfdm/m4lP8D2R85SeaSVn4IL0QxhGZVNNYPFM
         nu60i09iyBOKaLhDlj0FzsRqIQTjgwZskZ3thccZkpLEdsFYLNJPMIDaZm4AxDXMRVy6
         9cZyoCF2hlupgkDAwcf1h0c7NLRveiIf3R0fk9N7vl9rtswGaQjZbS0gEZPubwzX4g3F
         r3EpfR4Qs2x8Z3sUZgSZ7aUMj+3agqqU91iBZ2Og3Y6k1a5k/K9UVmB5ymBP2xj9SHU9
         Lspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dyofFYAHde+sYhK5cCQMoTBZJv121KLcv8Iwe1/b2n0=;
        b=5NqquZivCdu6pemMXe4Q//kct1dUAWHKOIB4ONERiXqdeTDQlYVMa4nuRpu72Hsdqs
         8FTSHjPTLbaAEvTOPlhfTaP8TE5qbsYxcNeMNEYcukD/cUXJQhGCNERw6jFyi7NF7Zdp
         YVZz07XC/TzXOphDNTyMb3Znawj0wfMEphwPs6YcQ0CFDhNwdcQaQpH+V/88ll6T2WQE
         NkoIC831DWCDOqPCeiHIZ5+DGaKYoDqi9ghTuV4A0+fPFa6RKbDR71ktac1hR01OitQm
         45kcEMQ6MRLsS1lM8gGPhgt85ycK2yqj+tdpmdDf84Ws2Vu3ZGoJlfYq7aLImnvZJ3CQ
         QnXQ==
X-Gm-Message-State: AO0yUKXiQvDsIcLseXVn/54pFEMDctY0YwtoelaLZcMcihUo6Vr9D8rQ
	5JxPqYbNd9qeQ3IW5rpwnzvQeQ==
X-Google-Smtp-Source: AK7set9p7Oag1CegdVPeq33yIBspBrLGpmAMNHGT27KC89UEsFbVDhLyehQcfuvWJUxjZQGKDHgnlw==
X-Received: by 2002:a17:906:e59:b0:88e:2ff5:85d2 with SMTP id q25-20020a1709060e5900b0088e2ff585d2mr12026500eji.25.1676977481191;
        Tue, 21 Feb 2023 03:04:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f21-20020a170906049500b008e36f9b2308sm48028eja.43.2023.02.21.03.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:04:40 -0800 (PST)
Message-ID: <c0ac0ab3-87fc-e74a-b4e2-3cf1b3a8a5e2@linaro.org>
Date: Tue, 21 Feb 2023 12:04:38 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269502D7CBCD5698B65FF9FF2A59@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 21/02/2023 11:42, Ryan Chen wrote:
>>>>> +    type: boolean
>>>>> +    description: Enable i2c bus timeout for master/slave (35ms)
>>>>
>>>> Why this is property for DT? It's for sure not bool, but proper type
>>>> coming from units.
>>> This is i2c controller feature for enable slave mode inactive timeout
>>> and also master mode sda/scl auto release timeout.
>>> So I will modify to
>>>   aspeed,timeout:
>>> 	type: boolean
>>>     description: I2C bus timeout enable for master/slave mode
>>
>> This does not answer my concerns. Why this is board specific?
> Sorry, can’t catch your point.
> It is not board specific. It is controller feature.
> ASPEED SOC chip is server product, master connect may have fingerprint
> connect to another board. And also support hotplug.
> For example I2C controller as slave mode, and suddenly disconnected.
> Slave state machine will keep waiting for master clock in for rx/tx transfer.
> So it need timeout setting to enable timeout unlock controller state.
> And in another side. As master mode, slave is clock stretching.
> The master will be keep waiting, until slave release cll stretching.

OK, thanks for describing the feature. I still do not see how this is DT
related.

> 
> So in those reason add this timeout design in controller. 

You need to justify why DT is correct place for this property. DT is not
for configuring OS, but to describe hardware. I gave you one possibility
- why different boards would like to set this property. You said it is
not board specific, thus all boards will have it (or none of them).
Without any other reason, this is not a DT property. Drop.

>>
>>>
>>>>> +
>>>>> +  byte-mode:
>>>>> +    type: boolean
>>>>> +    description: Force i2c driver use byte mode transmit
>>>>
>>>> Drop, not a DT property.
>>>>
>>>>> +
>>>>> +  buff-mode:
>>>>> +    type: boolean
>>>>> +    description: Force i2c driver use buffer mode transmit
>>>>
>>>> Drop, not a DT property.
>>>>
>>> The controller support 3 different for transfer.
>>> Byte mode: it means step by step to issue transfer.
>>> Example i2c read, each step will issue interrupt then enable next step.
>>> Sr (start read) | D | D | D | P
>>> Buffer mode: it means, the data can prepare into buffer register, then
>>> Trigger transfer. So Sr D D D P, only have only 1 interrupt handling.
>>> The DMA mode most like with buffer mode, The differ is data prepare in
>>> DRAM, than trigger transfer.
>>>
>>> So, should I modify to
>>>   aspeed,byte:
>>> 	type: boolean
>>>     description: Enable i2c controller transfer with byte mode
>>>
>>>   aspeed,buff:
>>> 	type: boolean
>>>     description: Enable i2c controller transfer with buff mode
>>
>> 1. No, these are not bools but enum in such case.
> 
> Thanks, will modify following.
> aspeed,xfer_mode:
>     enum: [0, 1, 2]
>     description:
>       0: byte mode, 1: buff_mode, 2: dma_mode

Just keep it text - byte, buffered, dma

> 
>> 2. And why exactly this is board-specific?
> 
> No, it not depends on board design. It is only for register control for controller transfer behave.
> The controller support 3 different trigger mode for transfer.
> Assign bus#1 ~ 3 : dma tranfer and assign bus#4 ~ 6 : buffer mode transfer,
> That can reduce the dram usage. 

Then anyway it does not look like property for Devicetree. DT describes
hardware, not OS behavior.

Best regards,
Krzysztof

