Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C303892C95
	for <lists+linux-aspeed@lfdr.de>; Sat, 30 Mar 2024 19:37:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JE3IrALs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V6Qx12Rwjz3d4D
	for <lists+linux-aspeed@lfdr.de>; Sun, 31 Mar 2024 05:37:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JE3IrALs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V6Qwv3LHpz3cDk
	for <linux-aspeed@lists.ozlabs.org>; Sun, 31 Mar 2024 05:37:01 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4154614b47eso13742215e9.1
        for <linux-aspeed@lists.ozlabs.org>; Sat, 30 Mar 2024 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711823815; x=1712428615; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2epNLcqYlDDxFlqorb7Cjat3BktL4sasPGtCRb+vLrQ=;
        b=JE3IrALs856F5vHCQRXDF1zcWULUyY3ZZV8ewS+1iPvuo+QzVBcEe22c8qDhtK7fdL
         IrU31mZn3FjIN3NGfgjZZ6PlfZNaXi6JownlUlYLhyHFsktF4q4ibYwxEtpEJqeuBVzs
         o7Qm2OltrQxLOuqtVBOCiOAAQw31edNbzgykpOJFG9yiY/TVRNqONEQmDOvGNMfNSmoC
         JsIANrCqdmSl6fOLBM8zi+ZFwFBbPg6G8qYgI4QjP7MgPJkg4mEe+Bcxr+cVriZVVKR5
         qm/zfmj8unViuq94X3VfdKYO+uImvqVxrxDXoxIVVMgjZeWo1xu3GKpCnV8ZN79joG0t
         35iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711823815; x=1712428615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2epNLcqYlDDxFlqorb7Cjat3BktL4sasPGtCRb+vLrQ=;
        b=DmhPINjabs/4alCrrCVga9xF5S/Kb0AYJ5V2M4bDRoShsBeOjSiRGFqEdXQl31ktvZ
         hDx0zNvXimWH8GLzqYPMevGFo5I2fosZuIFxbWT6VrenPJx00LbMMIHt+BRsLIYdc/CS
         8MVg64kQZ0/GPk3m4yvm/9g08NRraQwaoDfqIIa500kZpty2wMk46lbopZMXNmMlTEJT
         /SNpgxJmhZzSJ49lfHxvAPoS1yiB9brYcENaEhdCU/eiT9bGK6GWqYAb3Gr5gknG48Y7
         aSfYQixiNC+TtO3zdK/x/Yxu+qIPBu0fgd9cOe0s1eryRREQxeMNXb4WSp+3PNTlQYqw
         Za2A==
X-Forwarded-Encrypted: i=1; AJvYcCVm0AwgxUd+gGOwDEVVtVSvXjfJ9hyZET3yIbI9yFoUYIfetPSQdB1N+ZvXMS8KppsnvfGooNJl2ninqMKu7XLss/XBmnMpfEe8sL5YFQ==
X-Gm-Message-State: AOJu0YykRQ2mM4jbvvyF8okgVHaCxepT5zfdOEN1TYCLuLsfn7/Po0Sf
	yFIjan2vzEwOXpagn9WDEBiUREYPl4ZRb1JNkcxD27FpsNl5jZqgPofG/D/8at4=
X-Google-Smtp-Source: AGHT+IFnVFj7i3GEZdjCS5RRUzI2AJw0B5Vjpn+qZ4xY+uoBiHeOJ0ETODeVEXt0VqNUBa9c3fyCAw==
X-Received: by 2002:a05:600c:1c27:b0:414:37f:18dc with SMTP id j39-20020a05600c1c2700b00414037f18dcmr7990830wms.1.1711823814939;
        Sat, 30 Mar 2024 11:36:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b004147b824b08sm9302259wmo.7.2024.03.30.11.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 11:36:54 -0700 (PDT)
Message-ID: <98a5c1b4-b508-45ed-8719-149ec960250c@linaro.org>
Date: Sat, 30 Mar 2024 19:36:52 +0100
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
 <f2a487c4-eba3-4a78-9a14-67c8754c8b61@linaro.org>
 <582c276c-ea2f-456c-9bf9-47e39289a0b6@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <582c276c-ea2f-456c-9bf9-47e39289a0b6@gmail.com>
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 28/03/2024 12:33, Manojkiran Eda wrote:
>>>>> +    description: Controls the flash channel of eSPI hardware
>>>> That explains nothing. Unless you wanted to use here MTD bindings.
>>>>
>>>> This binding did not improve much. I don't understand why this is not
>>>> SPI (nothing in commit msg, nothing in description), what is eSPI,
>>>
>>> eSPI uses Peripheral, Virtual Wire, Out of Band, and Flash Access
>>> channels to communicate different sets of data.
>>
>> And what are these channels? What does it mean a "channel"? Is it just
>> how you organize transfers and classes of devices? Or some sort of
>> addressable instance on the bus?
>>
> 
> Yes, an espi channel provides a means to allow multiple independent 
> flows of traffic to share the same physical bus. Each of the channels 
> has its own dedicated resources such as queue and flow control.

Resources as queue and flow-control? Where are they defined in
Devicetree? Which binding?

> 
>> The channels feel like some sort of software or logical concept, not
>> physical. Physical would be endpoint with peripheral. Or flash memory.
> 
> A channel is a logical communication pathway or interface between the 
> chipset and peripheral devices. The concept of channels in the ESPI 
> protocol helps organize and manage different types of communication 
> between the chipset and peripherals. Each channel may have its own set 
> of protocols, data transfer rates, and supported features, tailored to 
> the requirements of the devices it serves.
> 
>> How do they fit here?
> 
> I am not sure I understand, can you please elaborate ?

All this suggests channel is programming aspect of your device thus does
not have to be represented in DT. I don't know, come with any DT
property to back up your case...

So far I see only interrupts and clocks, but then I would claim these
could be part of parent node.

Rob said it last time: your split of nodes looks artificial and it all
looks like one node.

Your DTS reg like:
	reg = <0x0 0x800>,<0x0 0x4000000>;
proves it. I don't know if this is just bug in your code or some silly
DTS just to create fake children. :/

> 
>>>
>>>    * The *Peripheral* Channel is used for communication between eSPI host
>>>      bridge located on the master side and eSPI endpoints located on the
>>>      slave side. LPC Host and LPC Peripherals are an example of eSPI host
>>>      bridge and eSPI endpoints respectively.
>>>    * *Virtual Wire* Channel: The Virtual Wire channel is used to
>>>      communicate the state of sideband pins or GPIO tunneled through eSPI
>>>      as in-band messages. Serial IRQ interrupts are communicated through
>>>      this channel as in-band messages.
>>>    * *OOB* Channel: The SMBus packets are tunneled through eSPI as
>>>      Out-Of-Band (OOB) messages. The whole SMBus packet is embedded
>>>      inside the eSPI OOB message as data.
>>>    * *Flash Access* Channel: The Flash Access channel provides a path
>>>      allowing the flash components to be shared run-time between chipset
>>>      and the eSPI slaves that require flash accesses such as EC (Embedded
>>>      Controller) and BMC.
>>
>> Please make binding complete, so define all of the channels.
> 
> 
> I would like to inquire about the rationale behind this request. Based 

Rationale - writing bindings document.
https://elixir.bootlin.com/linux/v6.9-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst#L17


> on previous feedback received from the upstream efforts 
> [https://lore.kernel.org/openbmc/HK0PR06MB37798462D17443C697433D7191D09@HK0PR06MB3779.apcprd06.prod.outlook.com/], 
> suggestions were made to model the flash channel by utilizing the mtd 
> subsystem, the virtual wire channel by utilizing the GPIO subsystem, and 
> to consider the OOB channel as a type of i2c device, thereby allowing it 
> to be utilized by the existing in-kernel MCTP subsystem, among others. 
> My intention was to prioritize upstreaming the flash channel binding, 
> along with its driver code, before proceeding to address other channels. 

Just to clarify: I don't care about drivers and we do not talk about
them here.

> I am curious to understand if it is a strict requirement to have the 
> complete binding upstreamed before addressing the device drivers code.

What if your other "devices" or "channels" are entirely different and
binding would just not work? Or how can we understand the design if you
upstream only part of it?

Best regards,
Krzysztof

