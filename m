Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748926A93F7
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 10:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSjJx52Hlz3bg8
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 20:26:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bO2ix8S4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bO2ix8S4;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSjJp5pcSz3bhJ
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Mar 2023 20:26:16 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id o12so7659808edb.9
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Mar 2023 01:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677835573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SlF2zG/u1Q0f4JIiCOTpE3WytpovcrC4zJMQaxFLdk=;
        b=bO2ix8S4DX76WS8YYXZsdBT7R/6mqRVmMF5s61tUdJthSq1N7H6IKPT5AmAQqRavw7
         hEV8yKffa6udbuBqP/3T+RopSN0NFR1aZgjgkxNZBboyUiovqe9aA4VHzqyVCJ0w80MF
         9ulxTd//AlMu9tea+4FZNww60RXEY3VFzPw4ZY9LwMnNhheLAZGs+2lXFFigaiHOnYPs
         fJFv//v9feasOJrIJFcxCE99bqe9GdfjvGPStpMzk/3L5LzxO+ij+nFURKUcZzZFN21A
         0q+FSnvpvOmvm3cDD3cGZFTPYzx0z2UOJuSFPRl/5gGjbUa3k4jVWLlZqmet66X7NmjH
         NVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677835573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0SlF2zG/u1Q0f4JIiCOTpE3WytpovcrC4zJMQaxFLdk=;
        b=EBJVbtAojPXdx71f0oPyptw/8nQWNw9gOByF5Zj7irTHAnSxawcZWxWY0jbv02r9WR
         szrDKV90tfQ+ciXM3OjLyIgS70rBhb50pL5qSI98CY7liF/bERS5vFHoKGTCRILcj7ZK
         UDSeB6cNPS0VDlelFeDVfy6ws339m1mOm99IqQ6nqIhflfL8eiKNGk2FSGmK78dImN4W
         5p0+ysv9xYzUfLNvw2JtJ/PdLCPoJ+7fnaiJuIGTNypIffaYKg66VJxrCMqEEykZYiEc
         LPibhKUn+CBpLxmSvYFt7A+sJ92KDFDWoc+ORI+Ds1ds0+HiC5J0kQX9346reuWrfcoy
         iJRg==
X-Gm-Message-State: AO0yUKXHoKYo9sqQuuQc6yqvDw6n9g592Jpa0hQKvXcXVoNg/ViU66lD
	+8Y9QsD2A9v72i0o/l1q9u7fmg==
X-Google-Smtp-Source: AK7set+oUdXxo6nfr1iZVDt/3FozY0zAGHyscdYC0a2zBc6NEV/LLvY6NY4iSxF/8/nZqw3X3rKrxw==
X-Received: by 2002:aa7:c399:0:b0:4af:63a7:7474 with SMTP id k25-20020aa7c399000000b004af63a77474mr1296985edq.17.1677835573495;
        Fri, 03 Mar 2023 01:26:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ky24-20020a170907779800b008edf49f10a7sm742001ejc.100.2023.03.03.01.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 01:26:13 -0800 (PST)
Message-ID: <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
Date: Fri, 3 Mar 2023 10:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Wolfram Sang <wsa@kernel.org>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 03/03/2023 09:55, Ryan Chen wrote:
> Hello Krzysztof,
> 	
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, March 3, 2023 4:51 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Wolfram Sang
>> <wsa@kernel.org>
>> Cc: Joel Stanley <joel@jms.id.au>; Brendan Higgins
>> <brendan.higgins@linux.dev>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Andrew Jeffery <andrew@aj.id.au>;
>> devicetree@vger.kernel.org; Philipp Zabel <p.zabel@pengutronix.de>; Rob
>> Herring <robh+dt@kernel.org>; Benjamin Herrenschmidt
>> <benh@kernel.crashing.org>; linux-aspeed@lists.ozlabs.org;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> openbmc@lists.ozlabs.org; linux-i2c@vger.kernel.org
>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
>>
>> On 03/03/2023 09:28, Ryan Chen wrote:
>>> Hello Krzysztof,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Friday, March 3, 2023 4:20 PM
>>>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Wolfram Sang
>>>> <wsa@kernel.org>
>>>> Cc: Joel Stanley <joel@jms.id.au>; Brendan Higgins
>>>> <brendan.higgins@linux.dev>; Krzysztof Kozlowski
>>>> <krzysztof.kozlowski+dt@linaro.org>; Andrew Jeffery
>>>> <andrew@aj.id.au>; devicetree@vger.kernel.org; Philipp Zabel
>>>> <p.zabel@pengutronix.de>; Rob Herring <robh+dt@kernel.org>; Benjamin
>>>> Herrenschmidt <benh@kernel.crashing.org>;
>>>> linux-aspeed@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>>>> linux-kernel@vger.kernel.org; openbmc@lists.ozlabs.org;
>>>> linux-i2c@vger.kernel.org
>>>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
>>>> AST2600-i2cv2
>>>>
>>>> On 01/03/2023 06:57, Ryan Chen wrote:
>>>>> Hello Krzysztof,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Sent: Monday, February 27, 2023 4:25 PM
>>>>>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Andrew Jeffery
>>>>>> <andrew@aj.id.au>; Brendan Higgins <brendan.higgins@linux.dev>;
>>>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley
>>>>>> <joel@jms.id.au>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>>>>>> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Philipp Zabel
>>>>>> <p.zabel@pengutronix.de>; linux-i2c@vger.kernel.org;
>>>>>> openbmc@lists.ozlabs.org; devicetree@vger.kernel.org;
>>>>>> linux-arm-kernel@lists.infradead.org;
>>>>>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>>>>>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
>>>>>> AST2600-i2cv2
>>>>>>
>>>>>> On 26/02/2023 04:13, Ryan Chen wrote:
>>>>>>> Add ast2600-i2cv2 compatible and aspeed,global-regs,
>>>>>>> aspeed,timeout aspeed,xfer-mode description for ast2600-i2cv2.
>>>>>>>
>>>>>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>>>>>> ---
>>>>>>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44
>>>> +++++++++++++++++++
>>>>>>>  1 file changed, 44 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>>>> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>>>> index f597f73ccd87..75de3ce41cf5 100644
>>>>>>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>>>>>> @@ -49,6 +49,25 @@ properties:
>>>>>>>      description:
>>>>>>>        states that there is another master active on this bus
>>>>>>>
>>>>>>> +  aspeed,timeout:
>>>>>>> +    type: boolean
>>>>>>> +    description: I2C bus timeout enable for master/slave mode
>>>>>>
>>>>>> Nothing improved here in regards to my last comment.
>>>>>
>>>>> Yes, as I know your require is about " DT binding to represent
>>>>> hardware
>>>> setup"
>>>>> So I add more description about aspeed,timeout as blow.
>>>>>
>>>>> ASPEED SOC chip is server product, i2c bus may have fingerprint
>>>>> connect to
>>>> another board. And also support hotplug.
>>>>> The following is board-specific design example.
>>>>> Board A                                         Board B
>>>>> -------------------------                       ------------------------
>>>>> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
>>>>> |i2c bus#2(master)-> tmp i2c device |          |
>>>> |
>>>>> |i2c bus#3(master)-> adc i2c device |          |
>>>> |
>>>>> -------------------------                       ------------------------
>>>>>
>>>>> aspeed,timout properites:
>>>>> For example I2C controller as slave mode, and suddenly disconnected.
>>>>> Slave state machine will keep waiting for master clock in for rx/tx
>> transmit.
>>>>> So it need timeout setting to enable timeout unlock controller state.
>>>>> And in another side. In Master side also need avoid suddenly slave
>>>> miss(un-plug), Master will timeout and release the SDA/SCL.
>>>>>
>>>>> Do you mean add those description into ore aspeed,timout properites
>>>> description?
>>>>
>>>> You are describing here one particular feature you want to enable in
>>>> the driver which looks non-scalable and more difficult to configure/use.
>>>> What I was looking for is to describe the actual configuration you have (e.g.
>>>> multi-master) which leads to enable or disable such feature in your
>> hardware.
>>>> Especially that bool value does not scale later to actual timeout
>>>> values in time (ms)...
>>>>
>>>> I don't know I2C that much, but I wonder - why this should be
>>>> specific to Aspeed I2C and no other I2C controllers implement it?
>>>> IOW, this looks quite generic and every I2C controller should have
>>>> it. Adding it specific to Aspeed suggests that either we miss a
>>>> generic property or this should not be in DT at all (because no one else has
>> it...).
>>>>
>>>> Also I wonder, why you wouldn't enable timeout always...
>>>>
>>>> +Cc Wolfram,
>>>> Maybe you know whether bool "timeout" property for one controller
>>>> makes sense? Why we do not have it for all controllers?
>>>>
>>> Because, i2c bus didn’t specific timeout.
>>> But SMBus defines a clock low time-out, TIMEOUT of 35 ms.
>>>
>>> It have definition in SMBus specification.
>>> http://smbus.org/specs/SMBus_3_1_20180319.pdf
>>> You can check Page 18, Note3 that have timeout description.
>>
>> Then you have already property for this - "smbus"?
> To be a property "smbus", that would be a big topic, 
> I saw fsl i2c also have this.
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml#L43-L47
> So, I just think the "timeout" property.

Yeah and this is the only place. It also differs because it allows
actual timeout values.

Best regards,
Krzysztof

