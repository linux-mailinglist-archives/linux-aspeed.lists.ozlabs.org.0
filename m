Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819F698FAD
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 10:22:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHTxL15Vgz3cgq
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 20:22:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GrUGTvJU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GrUGTvJU;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHTwx12csz3f3Q
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 20:22:08 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id jg8so3605706ejc.6
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 01:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=instFpBHV/JuNsnWbwYUXVPH2jqRlugl+D8EIlje5FQ=;
        b=GrUGTvJULPegvd61t+FvX4GJ1ZjZrTJ3eASv/bmwutJFj2QeHGRGB1FD/AGQ1XxuRE
         WOTMiUdZcblkLBuDPkmahhNkk4t+sdXMhO+S4hqew/OOQDbqX4hEXVDX0tfiatAoOUGK
         2jvogjL9yAVb2ql6c8Klqs2hAObfqG7b3/9Vwq3FZtZvy05MOyVWvc0r+6e/Tf9F5UzS
         GXm5UvijElk0MLM92Dzfh3Er0AZRUMGhho0lTIzgouVqzFu5f3LSfsWQQwDOQqqdTYfk
         8hnhYS1J6/YaDGebJEirp1RUBAVfegruIWEpxoxnzcxhTS+7EwkBjEj6TmXt2NQyridh
         Sv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=instFpBHV/JuNsnWbwYUXVPH2jqRlugl+D8EIlje5FQ=;
        b=kJAkjpebRWzMVeiCXp26g9zJzk4my/gB0iJHwXR52Xi4ZWYObmWfCpwyoBSNRchEfS
         VrOpXtGkzelHdA4hfPGdd4g9YqLJicP4FwWRAhJXAm6DT/iVpHocdL4yrqOoutMegz2S
         yhDyGSezkv/y7LUjcOw/YW+K24Tg/bxkVx/QFaQOvJhu0EeiNaENViHHUk7gGTpscIk1
         u/UCxf9uEdReINXejDtqBQlIh03Oh1hnmRrxzwY7lGSC8NA+fQ2TdyyWcmRxRgrs2IAU
         9MAHfklTo0Fivovx/qrCw8uubXMstunjM2V7Qy2N+/7IFAUFirFjYHJ8qI2Jt3huxl66
         hH5g==
X-Gm-Message-State: AO0yUKUgJYOsZYnM2jprlQYLahp4f9QHM/nJ03BTnff/pZUmah6THMbc
	kHtjhsrHGb3robRJ0c3qffzP8Q==
X-Google-Smtp-Source: AK7set/G+wS4JosvTqvxTxSGbj6EYBrpnJuw4HyLgb4b6T7aodQrpX4RymIdMOUmmQGVjEpMesOwKA==
X-Received: by 2002:a17:906:f6d9:b0:884:4806:c39 with SMTP id jo25-20020a170906f6d900b0088448060c39mr4958957ejb.11.1676539323879;
        Thu, 16 Feb 2023 01:22:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s9-20020a170906960900b0088091cca1besm548331ejx.134.2023.02.16.01.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:22:03 -0800 (PST)
Message-ID: <c5aa358d-6fb8-9d4d-eef7-d3a8268229e8@linaro.org>
Date: Thu, 16 Feb 2023 10:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR06MB5274C8D759C5C762C12A1CE9F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
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

On 16/02/2023 10:20, Ryan Chen wrote:
> Hello Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, February 16, 2023 4:18 AM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
>> Jeffery <andrew@aj.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
>> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
>> i2C driver
>>
>> On 15/02/2023 06:43, Ryan Chen wrote:
>>>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - aspeed,ast2600-i2c
>>>>
>>>> NAK. It's already there. Please do not waste our time in submitting
>>>> duplicated drivers.
>>>
>>> It is not duplicated, as my description in cover " This series add AST2600 i2c
>> new register set driver"
>>> So, this will be different driver compatible.
>>> The original compatible is
>>>       - aspeed,ast2400-i2c-bus
>>>       - aspeed,ast2500-i2c-bus
>>>       - aspeed,ast2600-i2c-bus
>>> So the new register set compatible is "- aspeed,ast2600-i2c", remove "bus".
>>
>> Bindings are documenting hardware, so I claim - we already have this
>> hardware described and this is duplicated. Otherwise - what are these two I2C
>> controllers and what are the differences? Why they do not have really different
>> name? Bus looks more like a mistake than a differentiating name.
> For misunderstanding, or mistaken. 
> I purpose to be aspeed,ast2600-i2cv2, will it more clear way ? 

I don't know. I still did not get answers. I asked here several questions.

Best regards,
Krzysztof

