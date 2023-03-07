Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB26AD8D5
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:11:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW7T45F72z3cRW
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 19:11:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q3PBcvB1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q3PBcvB1;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW7Sx48TZz3cBm
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 19:11:43 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id k10so25030340edk.13
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Mar 2023 00:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678176698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gmLTaMxh+UgKG/kflrxb/f3sNJaZcDEgaX2MESY0eU=;
        b=q3PBcvB1zvsXE87gITbF/SzJQLo4Xx88B32/Tmw3dv2IrNfQYd8YbzJyVUtxwcFMDx
         rDtF1kRD/J5rUZPOvdQrEAbExMBQTrNf0mRJwrTD4e0RYlDjbmuEVLPhc59kpXOuBguq
         NyTY2kmk766MwbnpQMj2RcnYDPRvYilXFFVXrGGXa6GA9A20SUrpFbYn5+sC/xnzSEjE
         FKhWGUqha329de9TWzywrqVay3P5xsD6TFOP7FdCGyCFWBqV4svNe0CvcyDUW8zR9Ieu
         GkyggizmmZfQzDjfqt/w1nTLu3jfwmjXH29xP1JazPuuDhlWLd974oZW9quGhCvR2Jt1
         hokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678176698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gmLTaMxh+UgKG/kflrxb/f3sNJaZcDEgaX2MESY0eU=;
        b=7aoMgMEudpMS7q2VmrvorYR3sHEd+0nDBBhOrUc3oWB1TBmUR8qA+avafiLZ4KonU6
         l9MYPkEBFoV9Cy5IaS+3MZgWUeWVX56Cs5Diw7tD37P/Ea19B/z6NWN+crLoazT0IR6/
         2Ndo/+pd0JeQVy62nFx0DaBW5rkRNDUjErBZe4HHBlOJUYzsT5dIM/9GhPf/gDdFuCLE
         TUe8aYsikd0lE2QJSigI4DjS8Ur+l4khG2xGoCJXEibhPrzwHBQDLLiuNQulKbVGOiCb
         +Px+hBtf8bJcaclLlPcWge1t9zkTkJvqyWedkCkzbhOL+V3JRHCx4qdfoM5ZML2f0ve+
         msHA==
X-Gm-Message-State: AO0yUKU9oKiMwDH3Z2RjIvXfGmTY06xAtPTh6lynGWg6nD3qMOxtjMMz
	q69NjTvZYW70JAKFpIx67W79dg==
X-Google-Smtp-Source: AK7set8K0X83pfhJzpDlAHKtkhFREUYDfeXRLHVhI+OBX7UgwhDddxevyD4fRlkYHGhDqm65b0Wfbw==
X-Received: by 2002:a50:ed18:0:b0:4af:7bdc:1891 with SMTP id j24-20020a50ed18000000b004af7bdc1891mr12995254eds.11.1678176698410;
        Tue, 07 Mar 2023 00:11:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id u2-20020a50d502000000b004c0057b478bsm6341543edi.34.2023.03.07.00.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:11:38 -0800 (PST)
Message-ID: <d33145c3-e985-4d3c-a08c-6a249a8dc463@linaro.org>
Date: Tue, 7 Mar 2023 09:11:36 +0100
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
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
 <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
 <SEZPR06MB5269CB53B51B89C3CA039442F2B09@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <e59fe30a-75d1-eb59-52a3-014fe3c961a6@linaro.org>
 <SEZPR06MB5269B541150855BF0DABFACFF2B69@SEZPR06MB5269.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269B541150855BF0DABFACFF2B69@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 06/03/2023 01:48, Ryan Chen wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Sunday, March 5, 2023 5:49 PM
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
>> On 04/03/2023 02:33, Ryan Chen wrote:
>>> Hello Krzysztof,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Friday, March 3, 2023 6:41 PM
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
>>>> On 03/03/2023 11:16, Ryan Chen wrote:
>>>>>>>>>>> aspeed,timout properites:
>>>>>>>>>>> For example I2C controller as slave mode, and suddenly
>>>>>> disconnected.
>>>>>>>>>>> Slave state machine will keep waiting for master clock in for
>>>>>>>>>>> rx/tx
>>>>>>>> transmit.
>>>>>>>>>>> So it need timeout setting to enable timeout unlock controller
>> state.
>>>>>>>>>>> And in another side. In Master side also need avoid suddenly
>>>>>>>>>>> slave
>>>>>>>>>> miss(un-plug), Master will timeout and release the SDA/SCL.
>>>>>>>>>>>
>>>>>>>>>>> Do you mean add those description into ore aspeed,timout
>>>>>>>>>>> properites
>>>>>>>>>> description?
>>>>>>>>>>
>>>>>>>>>> You are describing here one particular feature you want to
>>>>>>>>>> enable in the driver which looks non-scalable and more
>>>>>>>>>> difficult to
>>>>>> configure/use.
>>>>>>>>>> What I was looking for is to describe the actual configuration
>>>>>>>>>> you have
>>>>>> (e.g.
>>>>>>>>>> multi-master) which leads to enable or disable such feature in
>>>>>>>>>> your
>>>>>>>> hardware.
>>>>>>>>>> Especially that bool value does not scale later to actual
>>>>>>>>>> timeout values in time (ms)...
>>>>>>>>>>
>>>>>>>>>> I don't know I2C that much, but I wonder - why this should be
>>>>>>>>>> specific to Aspeed I2C and no other I2C controllers implement it?
>>>>>>>>>> IOW, this looks quite generic and every I2C controller should
>>>>>>>>>> have it. Adding it specific to Aspeed suggests that either we
>>>>>>>>>> miss a generic property or this should not be in DT at all
>>>>>>>>>> (because no one else has
>>>>>>>> it...).
>>>>>>>>>>
>>>>>>>>>> Also I wonder, why you wouldn't enable timeout always...
>>>>>>>>>>
>>>>>>>>>> +Cc Wolfram,
>>>>>>>>>> Maybe you know whether bool "timeout" property for one
>>>>>>>>>> controller makes sense? Why we do not have it for all controllers?
>>>>>>>>>>
>>>>>>>>> Because, i2c bus didn’t specific timeout.
>>>>>>>>> But SMBus defines a clock low time-out, TIMEOUT of 35 ms.
>>>>>>>>>
>>>>>>>>> It have definition in SMBus specification.
>>>>>>>>> http://smbus.org/specs/SMBus_3_1_20180319.pdf
>>>>>>>>> You can check Page 18, Note3 that have timeout description.
>>>>>>>>
>>>>>>>> Then you have already property for this - "smbus"?
>>>>>>> To be a property "smbus", that would be a big topic, I saw fsl i2c
>>>>>>> also have this.
>>>>>>> https://github.com/torvalds/linux/blob/master/Documentation/device
>>>>>>> tr
>>>>>>> ee
>>>>>>> /bindings/i2c/i2c-mpc.yaml#L43-L47
>>>>>>> So, I just think the "timeout" property.
>>>>>>
>>>>>> Yeah and this is the only place. It also differs because it allows
>>>>>> actual timeout values.
>>>>> Thanks, So can I still keep the property "aspeed,timeout" here?
>>>>> It is the only place.
>>>>
>>>> No, because none of my concerns above are addressed.
>>>>
>>> Thanks, I realize your concerns.
>>>
>>> So, I modify it like i2c-mpc.yaml
>>> https://github.com/torvalds/linux/blob/master/Documentation/devicetree
>>> /bindings/i2c/i2c-mpc.yaml#L43-L47
>>>
>>>   aspeed,timeout:
>>>     $ref: /schemas/types.yaml#/definitions/uint32
>>>     description: |
>>>       I2C bus timeout in microseconds
>>> Is this way acceptable?
>>
>> So, let's repeat my last questions:
>>
>> 1. Why you wouldn't enable timeout always...
>>
>> You wrote:
>>> http://smbus.org/specs/SMBus_3_1_20180319.pdf
>>> You can check Page 18, Note3 that have timeout description.
>>
>> which indicates you should always use timeout, doesn't it?
> 
> Yes, if board design the bus is connected with SMBUS device, it should enable.
> But in my previous statement, the board design is two multi-master devices connected each other. 

For which you have the property, thus case is solved, isn't it? You want
timeout always except for multi-master?

> And both device is transfer with MCTP protocol. 
> That will not SMBUS protocol. 
> They need have timeout that prevent unexpected un-plug.
> I do the study with smbus in Linux, that will different slave call back. Compare with smbus slave and mctp slave.
> So in this scenario, that is only enable for timeout. 

And the driver knows which protocol it is going to talk and such choice
should not be in DT.

>  
>> 2. Why we do not have it for all controllers with SMBus v3? Why this one is
>> special?
> 
> Not all bus is connected with smbus. Most are i2c device connected in board.
> That will be specific statement for each bus.

That's not the answer to my question. Why other controllers which can be
connected to I2C or SMBus devices do not need this property?

Best regards,
Krzysztof

