Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 314858813A7
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Mar 2024 15:45:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SqPyODRc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0BFm2BZJz2yN3
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Mar 2024 01:45:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SqPyODRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0BFb08bzz2xPV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Mar 2024 01:44:49 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-513e6777af4so6439158e87.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Mar 2024 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710945884; x=1711550684; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CzqmL++fUqfU6oIFpMAQIx8Bvp+0IxoTywCrVdfLPSM=;
        b=SqPyODRcfAVTCKebScANOV18t+mVmIFngYAINZjE1hbpoxjLpJk2yM0MdIzlaPwe0G
         1fmeNN4h6gdkamgztv88YHzWD9lyetOTYw+5gMo7HaePVjDTtC3eZqM5Nfsm2nOGawB1
         FXLEStpbvnbe6avvp78sCZROdUAPXN+4es1yn1kjg09+fNqAMdE+sn/GEF6B4w7bPpPH
         RrCpMoX4jgqAAGZUlrorx2Lelr1qTbiaNQkkBjBjRywqIDcv3NODwscC9yEbZpb48pQw
         iRPpMaV9G/ON8dqecnVI62HZsrxjp7cO7ccqzZy5SX4BaFvkvyiyeLwh07NogiZu18ww
         ySwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710945884; x=1711550684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzqmL++fUqfU6oIFpMAQIx8Bvp+0IxoTywCrVdfLPSM=;
        b=uqdvPAtmRsEvHfOhaRMbG5HAnSubNX2N+Y6SI0u9+r77WxE/+ihwzq5gQqRGRPqFqh
         aQIGujqBetQTDdKQLVdIqDMFLLZKCuat+7uVYH9GMkatoFcgq4iB556lp7IrQT0gyKyB
         z9KYtTa5YI9tMCNfLpiXXJJZDuQcc8eAWBdNghgdIwX7CJODRQ3nOr3O8/sU5BHXk5vH
         Pd2rCUvkEAdiAvMIuXYjc784fDNeTqHrnWijof8W+QH1HsWE8mtE5M4CEjTwerJIiTve
         VbKGHPhpCF37QwoO2mvlluSXJmgRb/I9xX3g4TaR4YoFP+tJADuC2UTvcyyf5749eMxC
         9AeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI7PZ46B5OdJsxkMu2MB0aaXesOTS8NKj5FaoTC2mkKkTr2IjqcvAqWS/mQt+XbVRVQdzlAwj5DPURfg7pTF1v5U6NZJbTXTFIQI895A==
X-Gm-Message-State: AOJu0YwepqGEqcI7f2w58p284FwHTAcqZTj2jqnWQHih4KWPpbbcm2fj
	bLkNWIuPgd8l1n/NsRIBvlTlzCm2dVuVBRiKVRMkIHcY7CaCWneGZs2qMrTrEUU=
X-Google-Smtp-Source: AGHT+IHzutHEQ6OuS1sm2yMFdFZii/yPJp3PLhWghrwUWCnKphL7YvxA75jjvIVkr3KYXkNcVFUBDA==
X-Received: by 2002:a05:6512:3e1b:b0:513:e7a0:5aa5 with SMTP id i27-20020a0565123e1b00b00513e7a05aa5mr11345122lfv.51.1710945883925;
        Wed, 20 Mar 2024 07:44:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090670c200b00a46f08093fasm984066ejk.133.2024.03.20.07.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:44:43 -0700 (PDT)
Message-ID: <f2a487c4-eba3-4a78-9a14-67c8754c8b61@linaro.org>
Date: Wed, 20 Mar 2024 15:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: aspeed: Add eSPI controller
To: Manojkiran Eda <manojkiran.eda@gmail.com>, patrick.rudolph@9elements.com,
 chiawei_wang@aspeedtech.com, ryan_chen@aspeedtech.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
 <20240319093405.39833-5-manojkiran.eda@gmail.com>
 <bad5df79-e040-4868-9db6-701110894ea3@linaro.org>
 <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/03/2024 10:59, Manojkiran Eda wrote:
> 
> On 19/03/24 3:26 pm, Krzysztof Kozlowski wrote:
>> On 19/03/2024 10:34, Manojkiran Eda wrote:
>>> This commit adds the device tree bindings for aspeed eSPI
>>> controller.
>>>
>>> Although aspeed eSPI hardware supports 4 different channels,
>>> this commit only adds the support for flash channel, the
>>> bindings for other channels could be upstreamed when the driver
>>> support for those are added.
>>>
>>> Signed-off-by: Manojkiran Eda<manojkiran.eda@gmail.com>
>>> ---
>>>   .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
>>>   1 file changed, 94 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>>> new file mode 100644
>>> index 000000000000..3d3ad528e3b3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>> Why Rob's comments got ignored?
>>
>> This is not a soc component.
> I did not mean to ignore, i have few reasons listed below that provides 
> information on why i felt this belongs into soc.

soc is dumping ground of things which are purely SoC specific, not
covered by existing hardware structure in bindings. Maybe indeed this
does not have any other place, but did you actually look?

Anyway, please CC SPI maintainers on future submission.

>>
>>> @@ -0,0 +1,94 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# # Copyright (c) 2024 IBM Corporation.
>>> +# # Copyright (c) 2021 Aspeed Technology Inc.
>>> +%YAML 1.2
>>> +---
>>> +$id:http://devicetree.org/schemas/soc/aspeed/aspeed,espi.yaml#
>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Aspeed eSPI Controller
>>> +
>>> +maintainers:
>>> +  - Manojkiran Eda<manojkiran.eda@gmail.com>
>>> +  - Patrick Rudolph<patrick.rudolph@9elements.com>
>>> +  - Chia-Wei Wang<chiawei_wang@aspeedtech.com>
>>> +  - Ryan Chen<ryan_chen@aspeedtech.com>
>>> +
>>> +description:
>>> +  Aspeed eSPI controller implements a device side eSPI endpoint device
>>> +  supporting the flash channel.
>> Explain what is eSPI.
> eSPI is a serial bus interface for client and server platforms that is 

Explain in description of the hardware.

> based on SPI,  using the same master and slave topology but operates 
> with a different protocol to meet new requirements. For instance, eSPI 
> uses I/O, or input/output, communication, instead of MOSI/MISO used in 
> SPI. It also includes a transaction layer on top of the SPI protocol, 
> defining packets such as command and response packets that allow both 
> the master and slave to initiate alert and reset signals. eSPI supports 
> communication between Embedded Controller (EC), Baseboard Management 
> Controller (BMC), Super-I/O (SIO) and Port-80 debug cards. I could add 
> this to the commit message as well in the next patchset.
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - aspeed,ast2500-espi
>>> +          - aspeed,ast2600-espi
>>> +      - const: simple-mfd
>>
>> That's not simple-mfd. You have driver for this. Drop.
>>
>>> +      - const: syscon
>> That's not syscon. Why do you have ranges then? Where is any explanation
>> of hardware which would justify such combination?
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  ranges: true
>>> +
>>> +patternProperties:
>>> +  "^espi-ctrl@[0-9a-f]+$":
>>> +    type: object
>>> +
>>> +    description: Controls the flash channel of eSPI hardware
>> That explains nothing. Unless you wanted to use here MTD bindings.
>>
>> This binding did not improve much. I don't understand why this is not
>> SPI (nothing in commit msg, nothing in description), what is eSPI,
> 
> eSPI uses Peripheral, Virtual Wire, Out of Band, and Flash Access 
> channels to communicate different sets of data.

And what are these channels? What does it mean a "channel"? Is it just
how you organize transfers and classes of devices? Or some sort of
addressable instance on the bus?

The channels feel like some sort of software or logical concept, not
physical. Physical would be endpoint with peripheral. Or flash memory.
How do they fit here?
> 
>   * The *Peripheral* Channel is used for communication between eSPI host
>     bridge located on the master side and eSPI endpoints located on the
>     slave side. LPC Host and LPC Peripherals are an example of eSPI host
>     bridge and eSPI endpoints respectively.
>   * *Virtual Wire* Channel: The Virtual Wire channel is used to
>     communicate the state of sideband pins or GPIO tunneled through eSPI
>     as in-band messages. Serial IRQ interrupts are communicated through
>     this channel as in-band messages.
>   * *OOB* Channel: The SMBus packets are tunneled through eSPI as
>     Out-Of-Band (OOB) messages. The whole SMBus packet is embedded
>     inside the eSPI OOB message as data.
>   * *Flash Access* Channel: The Flash Access channel provides a path
>     allowing the flash components to be shared run-time between chipset
>     and the eSPI slaves that require flash accesses such as EC (Embedded
>     Controller) and BMC.

Please make binding complete, so define all of the channels.

> 
> Although , eSPI reuses the timing and electrical specification of Serial 
> Peripheral Interface (SPI) but it runs an entirely different protocol to 
> meet a set of different requirements. Which is why i felt probably 
> placing this in soc was a better choice rather than spi. Do you think 
> otherwise ?

soc is dumping ground for things do not fit other places. Are there any
other buses / IP blocks similar to this one?


Best regards,
Krzysztof

