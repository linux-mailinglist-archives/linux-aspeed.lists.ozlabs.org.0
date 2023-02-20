Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9D69C631
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 08:59:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKvvn2lX6z3c6R
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 18:59:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WaKJ92cl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WaKJ92cl;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKvvc4tF9z3bTS
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 18:59:22 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id o12so1559792edb.9
        for <linux-aspeed@lists.ozlabs.org>; Sun, 19 Feb 2023 23:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUXd3EJgXt9jaiMuApjVE+nqu/5p/KhwAsdKMV6hk14=;
        b=WaKJ92clZXg48bavKMAuhiINK6EHFq/7Se/0vqNwVV4XpEta8S9DyxOTtdCqRP90Lr
         IIOpNhqHH0aYDMuMqw1M0IVnApVN/sl1r9Lgdc7V3rasRihYGfJ2qx6bu+AafraMNglQ
         a/TY9+R7DeaKqFCQzeSxYF/3myCxKpsjLur8Ujf8d6+8Z5YLf2YiPKGBqTU7q68PnFWs
         FO2Pya++VGez7xVRNZ0FpdmoxLKzy8HXSwr5IAC9buLeKUkjo1+sMq/4J39jmHRBichY
         3oqjZC87GBmoZR2jMzZwonydJXQjd0V9Y2+1ntwIV70n7gDy5G5YeVA32nxnVMFAzqKN
         8JmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUXd3EJgXt9jaiMuApjVE+nqu/5p/KhwAsdKMV6hk14=;
        b=RtAf12TnrARSLEjy5soQXdUwN3iO7qs387hSm+czKGH0Bx3DkMc9GpSJCxDeQPrKDq
         ikzzTk3mnB303bBZAOK0QZZmOPzYX7tvZO1WWFgsi/3MWVMYzbGh1ukmo/EOOfOu/heM
         bmSDfPDu8bZPwmMFE/y57mG9MO3kL7aT4MvLagv9KFMNuB4A7yevnXHJgv7OO29Ehh/Q
         FyfrJtAO4giMYC7kmHHlhhfznI0EVs+ly+TeCmHYnxOXYmJAnmKhse9rMSrps0sGNHTE
         pBcLLc47pXqyQfTf+23Vj38Wiwzg2AUOdpE+hI1bquYFCreAezSQQQroTFHOinjO4/In
         pRqw==
X-Gm-Message-State: AO0yUKW2yMCheP+HA5B3Bs/Xk0Lxg/L0RXboClF6s6FhA0FVnGY6Au1a
	kmOo5DEmdM8Plx6q1+T+NziU9Q==
X-Google-Smtp-Source: AK7set9aFra3ws7gbG+x7nF/AMQK2zxJDAWkjpNpqbY61EYYeRDdrK2yZ9rH76CvvuD50+y5t+h2ew==
X-Received: by 2002:a05:6402:1a45:b0:4ab:1dcc:2786 with SMTP id bf5-20020a0564021a4500b004ab1dcc2786mr1044333edb.35.1676879955636;
        Sun, 19 Feb 2023 23:59:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v30-20020a50a45e000000b004acba0afaa3sm759428edb.21.2023.02.19.23.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Feb 2023 23:59:15 -0800 (PST)
Message-ID: <861da92e-c1a0-f08c-1241-8e833c32674e@linaro.org>
Date: Mon, 20 Feb 2023 08:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
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
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
 <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <b58fad13-12d5-346b-9452-d345c7bf5327@linaro.org>
 <TYZPR06MB5274C8D759C5C762C12A1CE9F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <c5aa358d-6fb8-9d4d-eef7-d3a8268229e8@linaro.org>
 <TYZPR06MB5274B15C35A6030CB49BFD23F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <bb73393c-d642-0128-9e63-1a751f090a85@linaro.org>
 <TYZPR06MB52741EB5CD43327A877CA20FF2A69@TYZPR06MB5274.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR06MB52741EB5CD43327A877CA20FF2A69@TYZPR06MB5274.apcprd06.prod.outlook.com>
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

On 18/02/2023 02:19, Ryan Chen wrote:
> Hello Krzysztof,
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, February 17, 2023 4:37 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
>> Jeffery <andrew@aj.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
>> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
>> i2C driver
>>
>> On 16/02/2023 10:26, Ryan Chen wrote:
>>> Hello Krzysztof
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Thursday, February 16, 2023 5:22 PM
>>>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
>>>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>>>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>;
>>>> Andrew Jeffery <andrew@aj.id.au>; Philipp Zabel
>>>> <p.zabel@pengutronix.de>; openbmc@lists.ozlabs.org;
>>>> linux-arm-kernel@lists.infradead.org;
>>>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>>>> Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for
>>>> AST2600 i2C driver
>>>>
>>>> On 16/02/2023 10:20, Ryan Chen wrote:
>>>>> Hello Krzysztof
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Sent: Thursday, February 16, 2023 4:18 AM
>>>>>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
>>>>>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>>>>>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>;
>>>>>> Andrew Jeffery <andrew@aj.id.au>; Philipp Zabel
>>>>>> <p.zabel@pengutronix.de>; openbmc@lists.ozlabs.org;
>>>>>> linux-arm-kernel@lists.infradead.org;
>>>>>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>>>>>> Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support
>>>>>> for
>>>>>> AST2600 i2C driver
>>>>>>
>>>>>> On 15/02/2023 06:43, Ryan Chen wrote:
>>>>>>>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>>>>>>>> +
>>>>>>>>> +properties:
>>>>>>>>> +  compatible:
>>>>>>>>> +    enum:
>>>>>>>>> +      - aspeed,ast2600-i2c
>>>>>>>>
>>>>>>>> NAK. It's already there. Please do not waste our time in
>>>>>>>> submitting duplicated drivers.
>>>>>>>
>>>>>>> It is not duplicated, as my description in cover " This series add
>>>>>>> AST2600 i2c
>>>>>> new register set driver"
>>>>>>> So, this will be different driver compatible.
>>>>>>> The original compatible is
>>>>>>>       - aspeed,ast2400-i2c-bus
>>>>>>>       - aspeed,ast2500-i2c-bus
>>>>>>>       - aspeed,ast2600-i2c-bus
>>>>>>> So the new register set compatible is "- aspeed,ast2600-i2c",
>>>>>>> remove
>>>> "bus".
>>>>>>
>>>>>> Bindings are documenting hardware, so I claim - we already have
>>>>>> this hardware described and this is duplicated. Otherwise - what
>>>>>> are these two I2C controllers and what are the differences? Why
>>>>>> they do not have really different name? Bus looks more like a
>>>>>> mistake than a
>>>> differentiating name.
>>>>> For misunderstanding, or mistaken.
>>>>> I purpose to be aspeed,ast2600-i2cv2, will it more clear way ?
>>>>
>>>> I don't know. I still did not get answers. I asked here several questions.
>>> Those are different i2c controller, as I description in cover letter.
>>
>> The cover letter does not explain here anything. It barely mentions "new
>> register set" and "separate register set". This is really short, so without proper
>> explanations you will get all these questions. Are they compatible? Do they
>> overlap? Are they completely different? If so, why datasheet uses same name
>> for them? So many questions but cover letter is basically two sentences and
>> here:
> 
> Sorry my misunderstanding.
> The legacy register layout is mix master/slave register control together.
> So will let confuse about register.
> The following is add more detail description about new register layout.
> And new feature set add for register.
> 
> -Add new clock divider option for more flexible and accurate clock rate generation
> -Add tCKHighMin timing to guarantee SCL high pulse width.
> -Add support dual pool buffer mode, split 32 bytes pool buffer of each device into 2 x 16 bytes for Tx and Rx individually.
> -Increase DMA buffer size to 4096 bytes and support byte alignment.
> -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> -Re-define registers for separating master and slave mode control.
> -Support 4 individual DMA buffers for master Tx and Rx, slave Tx and Rx.
> 
> And following is new register set for package transfer sequence.
> New Master operation mode: S -> Aw -> P {S: Start, Sr: Repeat Start, Aw/r: Address for write/read, P: Stop}.
> New Master operation mode: S -> Aw -> TxD -> P
> New Master operation mode: S -> Ar -> RxD -> P
> New Slave  operation mode: S -> Aw -> RxD -> Sr -> Ar -> TxD -> P.
> -Bus SDA lock auto-release capability for new master DMA command mode.
> -Bus auto timeout for new master/slave DMA mode.
> 
> The following is two versus register layout.
> Old:
> {I2CD00}: Function Control Register     
> {I2CD04}: Clock and AC Timing Control Register \#1  
> {I2CD08}: Clock and AC Timing Control Register \#2 
> {I2CD0C}: Interrupt Control Register   
> {I2CD10}: Interrupt Status Register  
> {I2CD14}: Command/Status Register     
> {I2CD18}: Slave Device Address Register   
> {I2CD1C}: Pool Buffer Control Register   
> {I2CD20}: Transmit/Receive Byte Buffer Register 
> {I2CD24}: DMA Mode Buffer Address Register  
> {I2CD28}: DMA Transfer Length Register 
> {I2CD2C}: Original DMA Mode Buffer Address Setting     
> {I2CD30}: Original DMA Transfer Length Setting and Final Status  
> 
> New Register mode 
> {I2CC00}: Master/Slave Function Control Register    
> {I2CC04}: Master/Slave Clock and AC Timing Control Register  
> {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register    
> {I2CC0C}: Master/Slave Pool Buffer Control Register   
> {I2CM10}: Master Interrupt Control Register       
> {I2CM14}: Master Interrupt Status Register   
> {I2CM18}: Master Command/Status Register 
> {I2CM1C}: Master DMA Buffer Length Register   
> {I2CS20}: Slave~ Interrupt Control Register        
> {I2CS24}: Slave~ Interrupt Status Register          
> {I2CS28}: Slave~ Command/Status Register          
> {I2CS2C}: Slave~ DMA Buffer Length Register          
> {I2CM30}: Master DMA Mode Tx Buffer Base Address     
> {I2CM34}: Master DMA Mode Rx Buffer Base Address        
> {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address           
> {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address        
> {I2CS40}: Slave Device Address Register                  
> {I2CM48}: Master DMA Length Status Register                 
> {I2CS4C}: Slave  DMA Length Status Register              
> {I2CC50}: Current DMA Operating Address Status           
> {I2CC54}: Current DMA Operating Length  Status     

Thanks for explanation, yet still I don't get whether these are separate
devices or not. So again, you got several questions and you should
answer them, not only parts of them.

Are they compatible? Do they overlap? Are they completely different? If
so, why datasheet uses same name for them?

I don't understand why we struggle so much to get basic info justifying
this patchset.


Best regards,
Krzysztof

