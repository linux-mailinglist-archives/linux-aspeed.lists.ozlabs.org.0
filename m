Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A92857574B0
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 08:54:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FKyretqA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4qSb44Vqz30N8
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 16:54:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FKyretqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4qSV5nF0z2xq8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jul 2023 16:54:33 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bfe6ea01ff5so5503446276.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689663270; x=1692255270;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgDGchMF6LAYxhWhPSHJoTeV4E/Z+JNbtA7x+AzWiuU=;
        b=FKyretqAvz6qN5R7y+kMmkuYlpEmZmg5fIOt9zIVM+/zIGHzw7FlGbZgawcRA7dQwK
         Pe5qhDZ7G424Vj1QMADCJka6kdqm0nNMQLDFLgrOW9vOXiKWvK/I3+Qo4Cbq5OGBaIbI
         GYbSlmiDhFL4nDrqz/qO//ERN+dLT1PP00grTkSGK92K1yx201AlcgYQKbeQZpysI68G
         Zzqmmio50SmDnD7JtIsm7jO/cSpfTlb9Asp+nbfNtpkXLeHAEYw9WCE1/aPkDaRKJeZ6
         NLjgcWz8RIF3w9Tqyaj8VwxYe3S6pZ6i4PLeT+8QNq8BorQoioPS3+SHcxNWAec0aQoY
         xgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663270; x=1692255270;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgDGchMF6LAYxhWhPSHJoTeV4E/Z+JNbtA7x+AzWiuU=;
        b=dc+Mvz1tkjzaEXV0z6RyICbJUwY5OLzd2ZJM8LIl5aD8hJu7c5ZW9mSz0xYW9Ge4U4
         o5R2jsXW/xIBuaLjbphgUxLC9pr4JpUDnvICZoIXsr++iORUPDue77gFg5B/MKMpof+F
         +g+7LTOmY19hfJvgFBktsBRE110qA/GWcXlY66PTXrcVMWPCW2NYjYD2nw/hup/XxmJs
         Nw/6X5nAmRRt2tt20QdpKnm2q587uSDxD+bDyu475W4Pby3sLX656vBt6KXTRMnB612g
         WzbJhjPqDqKyJ2zWvplI8O86ruPBH5DoFm8SkLXaJPJfoDTqjM0O2GdBUdISmG0o8YLI
         t2hw==
X-Gm-Message-State: ABy/qLbQE9XBp5QUcuDw+3R6waG7G7cvcESBYe7mUiFIXIQDUAs5XWkC
	XOoa5CpJqAX45JyxgoLT8hc=
X-Google-Smtp-Source: APBJJlGG7jeJfAdlvA3jfevXWNsX7Z6XDnEdzmBFjE/l3f7O0vfTOPwf+XRLDlNSHZlqc8rEVsYa8w==
X-Received: by 2002:a25:aa74:0:b0:cea:5d93:3cc4 with SMTP id s107-20020a25aa74000000b00cea5d933cc4mr810955ybi.31.1689663270348;
        Mon, 17 Jul 2023 23:54:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j11-20020a25550b000000b00bceb538a275sm303404ybb.21.2023.07.17.23.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:54:29 -0700 (PDT)
Message-ID: <709d738c-3bf3-d808-4172-468d7ad947d7@roeck-us.net>
Date: Mon, 17 Jul 2023 23:54:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
References: <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
 <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
 <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
 <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org>
 <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
 <CAGUgbhCTDPGt_vpbfaEreX+iuLJ3WUBqt4kppxyaFZQus9Zf0Q@mail.gmail.com>
 <b22b2ccc-6760-0db6-067b-109c3864d2e8@linaro.org>
 <CAGUgbhDmXnyxYCL9h9C0P4ByDSTstWnGqW=uFoDVVHeK3BerHA@mail.gmail.com>
 <3756dffd-1407-d656-485a-9cf1eefd9ae1@linaro.org> <ZLYziWcIWcNnzMXR@orome>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
In-Reply-To: <ZLYziWcIWcNnzMXR@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/17/23 23:39, Thierry Reding wrote:
> On Tue, Jul 18, 2023 at 08:04:24AM +0200, Krzysztof Kozlowski wrote:
>> On 18/07/2023 06:01, 蔡承達 wrote:
>>>>
>>>> On 17/07/2023 11:01, 蔡承達 wrote:
>>>>> Guenter Roeck <linux@roeck-us.net> 於 2023年7月17日 週一 上午1:00寫道：
>>>>>>
>>>>>> On 7/16/23 09:08, Krzysztof Kozlowski wrote:
>>>>>>
>>>>>> [ ... ]
>>>>>>
>>>>>>>>
>>>>>>>> This patch serial doesn't use to binding the fan control h/w. It is
>>>>>>>> used to binding the two independent h/w blocks.
>>>>>>>> One is used to provide pwm output and another is used to monitor the
>>>>>>>> speed of the input.
>>>>>>>> My patch is used to point out that the pwm and the tach is the
>>>>>>>> different function and don't need to
>>>>>>>> bind together. You can not only combine them as the fan usage but also
>>>>>>>> treat them as the individual module for
>>>>>>>> use. For example: the pwm can use to be the beeper (pwm-beeper.c), the
>>>>>>>> tach can be used to monitor the heart beat signal.
>>>>>>>
>>>>>>> Isn't this exactly the same as in every other SoC? PWMs can be used in
>>>>>>> different ways?
>>>>>>>
>>>>>>
>>>>>> ... and in every fan controller. Not that it really makes sense because
>>>>>> normally the pwm controller part of such chips is tied to the fan input,
>>>>>> to enable automatic fan control, but it is technically possible.
>>>>>> In many cases this is also the case in SoCs, for example, in ast2500.
>>>>>> Apparently this was redesigned in ast2600 where they two blocks are
>>>>>> only lightly coupled (there are two pwm status bits in the fan status
>>>>>> register, but I have no idea what those mean). If the blocks are tightly
>>>>>> coupled, separate drivers don't really make sense.
>>>>>>
>>>>>> There are multiple ways to separate the pwm controller part from the
>>>>>> fan inputs if that is really necessary. One would be to provide a
>>>>>> sequence of address mappings, the other would be to pass the memory
>>>>>> region from an mfd driver. It is not necessary to have N instances
>>>>>> of the fan controller, even if the address space is not continuous.
>>>>>>
>>>>>
>>>>> Hi Guenter,
>>>>>
>>>>> May I ask about the meaning of the sequence of address mappings? It appears
>>>>> to consist of multiple tuples within the 'reg' property, indicating
>>>>> the usage of PWM/Tach
>>>>> registers within a single instance. After that I can use the dts like following:
>>>>>
>>>>> pwm: pwm@1e610000 {
>>>>> ...
>>>>> reg = <0x1e610000 0x8
>>>>> 0x1e610010 0x8
>>>>> 0x1e610020 0x8
>>>>> 0x1e610030 0x8
>>>>> 0x1e610040 0x8
>>>>> 0x1e610050 0x8
>>>>> 0x1e610060 0x8
>>>>> 0x1e610070 0x8
>>>>> 0x1e610080 0x8
>>>>> 0x1e610090 0x8
>>>>> 0x1e6100A0 0x8
>>>>> 0x1e6100B0 0x8
>>>>> 0x1e6100C0 0x8
>>>>> 0x1e6100D0 0x8
>>>>> 0x1e6100E0 0x8
>>>>> 0x1e6100F0 0x8>;
>>>>
>>>>
>>>> Uh, no... I mean, why? We keep pointing out that this should not be done
>>>> differently than any other SoC. Open any other SoC PWM controller and
>>>> tell me why this is different? Why this cannot be one address space?
>>>
>>> Hi Krzysztof,
>>>
>>> This is because the register layout for PWM and Tach is not continuous.
>>> Each PWM/Tach instance has its own set of controller registers, and they
>>> are independent of each other.
>>
>> Register layout is not continuous in many other devices, so again - why
>> this must be different?
>>
>>>
>>> For example:
>>> PWM0 uses registers 0x0 and 0x4, while Tach0 uses registers 0x8 and 0xc.
>>> PWM1 uses registers 0x10 and 0x14, while Tach1 uses registers 0x18 and 0x1c.
>>> ...
>>>
>>> To separate the PWM controller part from the fan inputs, Guenter has
>>> provided two methods.
>>> The first method involves passing the memory region from an MFD
>>> driver, which was the
>>
>> I have no clue how can you pass memory region
>> (Documentation/devicetree/bindings/reserved-memory/) from MFD and why
>> does it make sense here.
>>
>>> initial method I intended to use. However, it seems that this method
>>> does not make sense to you.
>>>
>>> Therefore, I would like to explore the second method suggested by
>>> Guenter, which involves providing
>>> a sequence of address mappings.
> 
> At the risk of saying what others have said: given that there's a single
> reset line and a single clock line controlling all of these channels and
> given what I recall of how address demuxers work in chips, everything
> indicates that this is a single hardware block/device.
> 
> So the way that this should be described in DT is:
> 
> 	pwm@1e610000 {
> 		reg = <0x1e610000 0x100>;
> 		clocks = ...;
> 		resets = ...
> 	};
> 
> That'd be the most accurate representation of this hardware in DT. It is
> then up to the driver to expose this in any way you see fit. For Linux
> it may make sense to expose this as 16 PWM channels and 16 hardware
> monitoring devices. Other operating systems using the same DT may choose

It is single chip. It should be a single hardware monitoring device with
16 channels. I don't even want to think about the mess we'd get if people
start modeling a single chip as N hardware monitoring devices, one for
each monitoring channel supported by that chip. It would be even more messy
if the driver supporting those N devices would be marked for asynchronous
probe, which would result in random hwmon device assignments.

> to expose this differently, depending on their frameworks, etc. A simple
> operating system may not expose this as separate resources at all but
> instead directly program individual registers from this block.
> 
> I'd also like to add that I think trying to split this up into multiple
> drivers in Linux is a bit overkill. In my opinion, though I know not
> everyone shares this view, it's perfectly fine for one driver to expose
> multiple types of resources. There's plenty of use-cases across the
> kernel where tightly coupled devices like this have a single driver that
> registers with multiple subsystems. Going through MFD only because this
> particular hardware doesn't split registers nicely along Linux subsystem
> boundaries.
> 
> So FWIW, I'm fine carrying hwmon code in a PWM driver and I'm equally
> fine if PWM code ends up in a hwmon driver (or any other subsystem
> really) if that makes sense for a given hardware.
> 

I am fine either way as well, as long as we are talking about a single
hwmon device and not 16 of them.

Guenter

