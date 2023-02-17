Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC80769A71A
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 09:37:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ4v9488cz3f3q
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 19:37:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ls1Fayg6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ls1Fayg6;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ4tv5FFgz3chZ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 19:37:27 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id ee31so2974896edb.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rX+L+RQNvSmvl3vXjy6ejfPbMjDPoWjZZGv/1GsmR20=;
        b=Ls1Fayg63aBxblW6mHpeLVmXVbOasWCiICroEXVqnP5iZHKcq6ElDZ3ETAR60+Ep7m
         y33QuXhBCXzd8H1UAvoFVCb78iZpmUcHNTBgakDoCxEt9LWaSZCe+98JTYjQZ4OOlCDS
         Qm7P6yK/5PT3CwEIDxqzlItpjBCWr0R8jn9BMAxfWNIwmx7qfO1wgXD++qhq5RbyIvXf
         fxwXe0AzmtPBdAFjB7T4xTw9415OfcMhLuGHbX1Qad7qY5w89YUCBk7kAevg+mvcLtuw
         8MaUGG7UsPrgGU9tKCceGKwo4q8AzYD1oXBfLGjS9Y4cY3Y4S5cp0PHC0Ob2DajkmLKS
         qytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rX+L+RQNvSmvl3vXjy6ejfPbMjDPoWjZZGv/1GsmR20=;
        b=iKv2sFG+1qGuZwxguqUVcR+9Hmg+7Z7aR29RmMr3j4eqpjP33u8QGPhN8KXZVZdRgB
         41rVf7p7ZecDVGVnczYFJcOqinkX8v4zouLXj7qX+7+SniN1cll/rsQFc1kmLkmxxpY0
         fH/SKnZH7O2FH5G/XHPRe1ACdhqWzo/IXMgdUvipiABhwslmfoGOoi/Mkpv0459RYjML
         8a8f7OPD6qvS98cy8NOrPVi/S9zJ3byGrQZqTwtohu8gw4qN7llZykafqoVNMpWSAUDe
         ALkrlSRgE8/QIHJ7/dAacdZqFqER7X/ArWwbbGr0QoiCTG/Wn3GlhB01dbaDHX8+eVat
         b2MA==
X-Gm-Message-State: AO0yUKU1N5TS5wxCKnBMNp9VjOWIO2n4g2sJZzrD2vDtddpH77OWeZso
	lsRKjbUdpc/5fj6GZwD673Y+nQ==
X-Google-Smtp-Source: AK7set/Y69SId1gyB/TFH7/ENtT0fJggoSlC+ReCLuRDgDfgQBRqc3eqQ+xubhnrYJ7kz3dsmzGGHw==
X-Received: by 2002:a05:6402:18:b0:4ab:4011:ff3d with SMTP id d24-20020a056402001800b004ab4011ff3dmr61844edu.0.1676623042189;
        Fri, 17 Feb 2023 00:37:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v30-20020a50d09e000000b004acdef7baaesm1921274edd.96.2023.02.17.00.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 00:37:21 -0800 (PST)
Message-ID: <bb73393c-d642-0128-9e63-1a751f090a85@linaro.org>
Date: Fri, 17 Feb 2023 09:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR06MB5274B15C35A6030CB49BFD23F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
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

On 16/02/2023 10:26, Ryan Chen wrote:
> Hello Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, February 16, 2023 5:22 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
>> Jeffery <andrew@aj.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
>> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
>> i2C driver
>>
>> On 16/02/2023 10:20, Ryan Chen wrote:
>>> Hello Krzysztof
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Thursday, February 16, 2023 4:18 AM
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
>>>> On 15/02/2023 06:43, Ryan Chen wrote:
>>>>>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    enum:
>>>>>>> +      - aspeed,ast2600-i2c
>>>>>>
>>>>>> NAK. It's already there. Please do not waste our time in submitting
>>>>>> duplicated drivers.
>>>>>
>>>>> It is not duplicated, as my description in cover " This series add
>>>>> AST2600 i2c
>>>> new register set driver"
>>>>> So, this will be different driver compatible.
>>>>> The original compatible is
>>>>>       - aspeed,ast2400-i2c-bus
>>>>>       - aspeed,ast2500-i2c-bus
>>>>>       - aspeed,ast2600-i2c-bus
>>>>> So the new register set compatible is "- aspeed,ast2600-i2c", remove
>> "bus".
>>>>
>>>> Bindings are documenting hardware, so I claim - we already have this
>>>> hardware described and this is duplicated. Otherwise - what are these
>>>> two I2C controllers and what are the differences? Why they do not
>>>> have really different name? Bus looks more like a mistake than a
>> differentiating name.
>>> For misunderstanding, or mistaken.
>>> I purpose to be aspeed,ast2600-i2cv2, will it more clear way ?
>>
>> I don't know. I still did not get answers. I asked here several questions.
> Those are different i2c controller, as I description in cover letter.

The cover letter does not explain here anything. It barely mentions "new
register set" and "separate register set". This is really short, so
without proper explanations you will get all these questions. Are they
compatible? Do they overlap? Are they completely different? If so, why
datasheet uses same name for them? So many questions but cover letter is
basically two sentences and here:

> The i2c new register mode, there have two separate slave/master register.
> And different register with old register.

you repeat the same.

> So now, avoid misunderstanding, or mistaken.
> I purpose to be aspeed,ast2600-i2cv2.


Best regards,
Krzysztof

