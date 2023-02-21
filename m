Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0926C69DD19
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Feb 2023 10:44:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLZ9z6RZ9z3bh2
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Feb 2023 20:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n4wLVR8b;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n4wLVR8b;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLZ9s5rwWz30Ky
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Feb 2023 20:43:59 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id s26so14581407edw.11
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Feb 2023 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyKGI0nCGNiU3s1gpibfntG06MqeP3FH0OEDkylMToM=;
        b=n4wLVR8b4XV16OwzuC3dPqrraVOgyrp/pXNgwKTvXIzlL7MBtCjyVIN3twUx1diVwS
         vFyiJwlDaLHlgFb/TdGsmT0gRaUHNzD3eGVyA79dYHlOBmbzN7blYIrQiv5meUgHQENL
         SnutbpAZUP/ZKzY6LPan1UvbggVYU2rGhJP2guN4L+rI4snem+JvuyZEdHwdNiJ/DaT8
         CgUU1EniLLfPZdMGQ9VD4Z5q9YGRC0AhcuEnpgxY0HQQJppYOMUwbzwNUpnro9W+PKe9
         3l/w4XKLJSi6yUbkCfxmYfiulxMXjTkJ8P2rJNK52EOWdCi/dX2jvQtHi2YFygJqCbmO
         Y3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyKGI0nCGNiU3s1gpibfntG06MqeP3FH0OEDkylMToM=;
        b=hKs2zhjKs6BdafD4qrBBOWEGURWjsaOSn5FKLq/yEZxyBkPG6Uh4lWSAl1DfHbQNLP
         0VlD8oLfyqpS7oT+EljV1C82pLL0aotfhscv99SLDFS+71S0b0SSuEHRtjLOwIBWXUKR
         ufGRM2O4bXtf5sxhA0J0hAuWmSwSv6MtyVJ+8gYdeKAv4qtHgR6GseuEbfLRfSAYdb2l
         DeC/GVole1twQupiODTGiOh3YQp7qjnJ74Lwx9GGXz0UxJM/Q+iER8hfkaetBPVgfysF
         /N8vPQ2AY3U2qejFqWH/q+mRNnNKGHBcGNQK1B1FBjqjyhbe4ib31i/Ky5/R1Zk0+bOJ
         FMJg==
X-Gm-Message-State: AO0yUKWdFD+/S9dEwAh886DxCnU0GjKdCo3mCbL9t8qsaupkjG4QCppZ
	ahq38lGOxK8KAY18L5EvojaUTg==
X-Google-Smtp-Source: AK7set/YK40uzvhDahUih9uXPhcgv8EqyGGtNljX8QGKFaGfGBjTWJ9JDHZ9qMx/PoBQ85Hrk3fboQ==
X-Received: by 2002:a17:907:f99:b0:8b1:3b96:3fe8 with SMTP id kb25-20020a1709070f9900b008b13b963fe8mr11514916ejc.52.1676972636608;
        Tue, 21 Feb 2023 01:43:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id se11-20020a170906ce4b00b008cecb8f374asm2824876ejb.0.2023.02.21.01.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 01:43:56 -0800 (PST)
Message-ID: <6fd971de-19f6-84e4-154f-bd3117483881@linaro.org>
Date: Tue, 21 Feb 2023 10:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
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
 <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
 <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <dfc2c2c442af55f64e147c920585cb7e6a74939f.camel@codeconstruct.com.au>
 <TYZPR06MB527469EBE6A18B897D2C1F6CF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYZPR06MB527469EBE6A18B897D2C1F6CF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
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

On 21/02/2023 04:32, Ryan Chen wrote:
> Hello Jeremy,
> 
>> -----Original Message-----
>> From: Jeremy Kerr <jk@codeconstruct.com.au>
>> Sent: Monday, February 20, 2023 7:24 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
>> Jeffery <andrew@aj.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
>> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
>>
>> Hi Ryan,
>>
>>>>> +  clock-frequency:
>>>>> +    description:
>>>>> +      Desired I2C bus clock frequency in Hz. default 100khz.
>>>>> +
>>>>> +  multi-master:
>>>>> +    type: boolean
>>>>> +    description:
>>>>> +      states that there is another master active on this bus
>>>>
>>>> These are common to all i2c controllers, but I see that
>>>> i2c-controller.yaml doesn't include them (while i2c.text does).
>>>>
>>>> I assume we're OK to include these in the device bindings in the meantime.
>>>> But in that case, you may also want to include the common "smbus-alert"
>>>> property, which you consume in your driver.
>>>>
>>> Since i2c.text have multi-master, smbus-alert. I don't need those two right?
>>
>> Depends whether the maintainers consider i2c.text as part of the schema, I
>> figure. Might be best to get their input on this.
> 
> 
> Yes, I will drop this, also integrate into aspeed,i2c.yaml file.
> 
>>>>> +  timeout:
>>>>> +    type: boolean
>>>>> +    description: Enable i2c bus timeout for master/slave (35ms)
>>>>> +
>>>>> +  byte-mode:
>>>>> +    type: boolean
>>>>> +    description: Force i2c driver use byte mode transmit
>>>>> +
>>>>> +  buff-mode:
>>>>> +    type: boolean
>>>>> +    description: Force i2c driver use buffer mode transmit
>>>>
>>>> These three aren't really a property of the hardware, more of the
>>>> intended driver configuration. Do they really belong in the DT?
>>>>
>>> Sorry, I am confused.
>>> This is hardware controller mode setting for each i2c transfer.
>>> So I add it in property for change different i2c transfer mode.
>>> Is my mis-understand the property setting?
>>
>> It depends what this is configuration is for.
>>
>> Would you set the transfer mode based on the design of the board? Is there
>> something about the physical i2c bus wiring (or some other hardware design
>> choice) that would mean you use one setting over another?
>>
> No, it not depend on board design. It is only for register control for controller transfer behave.

Then DT does not look like suitable place for it. Drop the property.


> The controller support 3 different trigger mode for transfer.
> Byte mode: it means step by step to issue transfer.
> Example i2c read, each step will issue interrupt then driver need trigger for next step.
> Sr (start read) | D | D | D | P
> Buffer mode: it means, the data can prepare into buffer register, then Trigger transfer. So Sr D D D P, only have only 1 interrupt handling. 
> The DMA mode most like with buffer mode, The differ is data prepare in DRAM, than trigger transfer. 
> 
> 
>> On the other hand, if it's just because of OS behaviour, then this doesn't belong
>> in the DT.
>>
>> Maybe to help us understand: why would you ever *not* want DMA mode?
>> Isn't that always preferable?
> In AST SOC i2c design is 16 i2c bus share one dma engine. 
> It can be switch setting by dts setting. Otherwise driver by default probe is DMA mode.

DMA mode is chosen by existence (or lack) of dmas property, isn't it?
Why do you need separate property instead of using the standard one?

Best regards,
Krzysztof

