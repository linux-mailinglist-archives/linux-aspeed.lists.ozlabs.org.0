Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C6C6A9247
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 09:20:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSgrm497cz3cff
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Mar 2023 19:20:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jp+cz8zb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jp+cz8zb;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSgrf2bYxz3cNF
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Mar 2023 19:20:18 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id o15so6975955edr.13
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Mar 2023 00:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677831612;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IaQd5sInzBzFtTjrz9shXsqEyVwEzcyl/SxF1kXcy/U=;
        b=jp+cz8zbDShbL93MYv7FkPN3LI1luwnZQpMMD2QLd82GwMERpC0Rk1kQM1bVGuEqZO
         RWWupiCof7O8v2j/FUhDWJM/kzOR2J2/64Lv2eJmzn6NHVfMa/6jQTl0xlygFujhCIzm
         31TRuXUrh7hVI54bX2T+y2CLu+OQYVNyGvDLyyBs/8HpYOkzCVvRqEkcLlzcVnZjUkab
         qMPzCeBD0HpiKAefyCNnVO2PzUNYWnEaqR9jIIaAqC2JZb9tGxNx/CC7in5TTIth66OR
         /nv5nyzLL3bgR08T19Y6v7VDDEm4sVrzH140NXM8N6cmcwFbDVj0mM52HHrK/OFaxXZk
         nE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677831612;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IaQd5sInzBzFtTjrz9shXsqEyVwEzcyl/SxF1kXcy/U=;
        b=Ak8FDTB+JjM/WeZmYdScTbZAF2CQ9SJT06l1oC5hWPBMEggvmOt9M6wvuvC8yUD5+b
         tJwMESleCF7OpdHjums5+rIE7wlqj3AsftnKu7LIA7eCjIAijh6lXL6qFjGbTrfJXKpL
         TIyM9ijPQYwR0XHpVpFEF2apgX0U6Ws7Ul1If7zv7vC0BwDDl4wWV6QK/ROhMwTpCaXR
         +W2oZuVstVLz75bXFLD7SyasnUeHuPw+ox3f0tQ1ERatiZTw5XFj8GZLss7Zqrko8qOj
         mjPGMa0RRAbPvbYYkIB92n6uZy8/QOGFatAosMxXiN4tBm7g+26AZTD4bQjn9nl+ogpG
         uwRw==
X-Gm-Message-State: AO0yUKVdtLXtg70P5WBzq+ovGj7Q4NJvL069vbvNtOht81r7XmBaFerc
	82tJbhcFv1IMQrJjqFLT/3bVZw==
X-Google-Smtp-Source: AK7set/JbtmNuxtTAhEQHihlNhtpUsx5t+fmEJHmeNUg47DKWeHZnMmKDVf4W9mHzL2WeurnjL5C4g==
X-Received: by 2002:aa7:d404:0:b0:4aa:ca81:a528 with SMTP id z4-20020aa7d404000000b004aaca81a528mr1039879edq.40.1677831612104;
        Fri, 03 Mar 2023 00:20:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906678900b008d68d018153sm687016ejp.23.2023.03.03.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:20:11 -0800 (PST)
Message-ID: <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
Date: Fri, 3 Mar 2023 09:20:09 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 01/03/2023 06:57, Ryan Chen wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Monday, February 27, 2023 4:25 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Andrew Jeffery
>> <andrew@aj.id.au>; Brendan Higgins <brendan.higgins@linux.dev>; Benjamin
>> Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley <joel@jms.id.au>;
>> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Philipp Zabel <p.zabel@pengutronix.de>;
>> linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
>>
>> On 26/02/2023 04:13, Ryan Chen wrote:
>>> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,timeout
>>> aspeed,xfer-mode description for ast2600-i2cv2.
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>> ---
>>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
>>>  1 file changed, 44 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> index f597f73ccd87..75de3ce41cf5 100644
>>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> @@ -49,6 +49,25 @@ properties:
>>>      description:
>>>        states that there is another master active on this bus
>>>
>>> +  aspeed,timeout:
>>> +    type: boolean
>>> +    description: I2C bus timeout enable for master/slave mode
>>
>> Nothing improved here in regards to my last comment.
> 
> Yes, as I know your require is about " DT binding to represent hardware setup"
> So I add more description about aspeed,timeout as blow.
> 
> ASPEED SOC chip is server product, i2c bus may have fingerprint connect to another board. And also support hotplug.
> The following is board-specific design example.
> Board A                                         Board B
> -------------------------                       ------------------------
> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> |i2c bus#2(master)-> tmp i2c device |          |                       |
> |i2c bus#3(master)-> adc i2c device |          |                       |
> -------------------------                       ------------------------
> 
> aspeed,timout properites:
> For example I2C controller as slave mode, and suddenly disconnected.
> Slave state machine will keep waiting for master clock in for rx/tx transmit.
> So it need timeout setting to enable timeout unlock controller state.
> And in another side. In Master side also need avoid suddenly slave miss(un-plug), Master will timeout and release the SDA/SCL.
> 
> Do you mean add those description into ore aspeed,timout properites description?

You are describing here one particular feature you want to enable in the
driver which looks non-scalable and more difficult to configure/use.
What I was looking for is to describe the actual configuration you have
(e.g. multi-master) which leads to enable or disable such feature in
your hardware. Especially that bool value does not scale later to actual
timeout values in time (ms)...

I don't know I2C that much, but I wonder - why this should be specific
to Aspeed I2C and no other I2C controllers implement it? IOW, this looks
quite generic and every I2C controller should have it. Adding it
specific to Aspeed suggests that either we miss a generic property or
this should not be in DT at all (because no one else has it...).

Also I wonder, why you wouldn't enable timeout always...

+Cc Wolfram,
Maybe you know whether bool "timeout" property for one controller makes
sense? Why we do not have it for all controllers?

> 
>>
>>> +
>>> +  aspeed,xfer-mode:
>>> +    description: |
>>> +      I2C bus transfer mode selection.
>>> +      - "byte": I2C bus byte transfer mode.
>>> +      - "buffered": I2C bus buffer register transfer mode.
>>> +      - "dma": I2C bus dma transfer mode (default)
>>> +    items:
>>> +      enum: [byte, buffered, dma]
>>> +    maxItems: 1
>>
>> Drop, not an array.
>>
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>
>> Wrong ref. This is not an array, but one string.
> 
> Sorry, I can't catch your "one string" point.

How many strings you are going to have in this property? If one
(maxItems: 1), then this is not an array.

> Could you point me what ref I can refer to?
> That I can check into Linux example. Thanks a lot.
>>
>>> +
>>> +  aspeed,global-regs:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of i2c global register node.
>>> +
>>>  required:
>>>    - reg
>>>    - compatible
>>> @@ -57,6 +76,19 @@ required:
>>>
>>>  unevaluatedProperties: false
>>>
>>> +if:
>>
>> This should be under allOf (in this location)
>>
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: aspeed,ast2600-i2cv2
>>> +
>>> +then:
>>> +  properties:
>>> +    reg:
>>> +      minItems: 2
>>> +  required:
>>> +    - aspeed,global-regs
>>
>> else:
>>   aspeed,global-regs: false
>> and the same for other v2 properties
>>
> 
> Does modify by following? 
> 
> allOf:
>  -if:
>    properties:
>     compatible:
>       contains:
>         const: aspeed,ast2600-i2cv2
> 
>  then:
>   properties:
>     reg:
>       minItems: 2
>   required:
>     - aspeed,global-regs
>  else:
>     - aspeed,global-regs: false
>     -aspeed,timeout: false
>     - aspeed,xfer-mode: false

yes



Best regards,
Krzysztof

