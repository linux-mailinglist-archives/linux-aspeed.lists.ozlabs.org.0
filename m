Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC38757395
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 08:04:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MHy1+SYO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4pM00y1Qz30N8
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 16:04:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MHy1+SYO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4pLr2QJtz2ytg
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jul 2023 16:04:33 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991f956fb5aso655762766b.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689660267; x=1692252267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5f7NuoL+/s8bYQq96dyzOfuTIeGEJ1Q95iMxVbPcgI=;
        b=MHy1+SYOHT+v734z3zl3xn74SFQLQkv9kc8FKVktNOw56L3SKY61lRQ78NIIT3vUvo
         ulEO0QRsuhEpb++gPsLvHzmZR9h1DhUbLG+tnxxmWjOQNTgFAM/zzIPRJN5S564tH9aG
         LKIoq5w8p7yTYcR2U+mEg4zzpFSaGpI7TSg03jHUaydmbWxAr6QYzKjJxs4VunuwN9Y5
         erITxs2iEJt++4glBFj7M9wvY+9uDAsrKqiQfwy++246qnXAKWZ/LswXgt+Zlm093oxp
         LflpWgjGKXAiljfK4QfjQrV0dyBSIuLuX3rZEV8tjv21Lw/kBNmk6WPdQKFb3W6UYtuw
         9iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660267; x=1692252267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5f7NuoL+/s8bYQq96dyzOfuTIeGEJ1Q95iMxVbPcgI=;
        b=ZtafFFAjKtcjeDwFXk/KKLlGZMqGii7AYPM4DhxZXzTr1J15CtZJIYiOWJqDz1KTKZ
         /47iRPeWEdpQYtXxYC0G1LiQpt8IJqeeivAIiP2GMDkP50rc6epmYvFuLuI68DslA9FT
         aOgx6CK6G8cwZi/gRav62aSKMm5p3n1YU00Cx2hqfIBuatXp8O8gHZ0HSKkwUxi4ypPZ
         VmqZlEuMkEPIBsqWKCNq18Y2JU4YOUtoyNJO8D19SK6RJhmahu7h4avBjB61mngo1OU1
         WCd3tHF1JVRpM1ydUgjPm560n80qFfM1z8thffNegRLns1OaRiu851syyhDvUK5OLCUT
         XHbA==
X-Gm-Message-State: ABy/qLbSbgRYfc622d5eOq9JcuvqgIWs0rbxwVKxW38v9S0HMF3yFEtL
	FYyb8DSJZRxngLmTHmawto6dTw==
X-Google-Smtp-Source: APBJJlFZbIMU5j4Cb+CtvRvuwgexr97UBWi37cXm30GLf2vtnoY8xEMV54HgvT+rU0dOhPyaqKQscQ==
X-Received: by 2002:a17:906:e17:b0:993:ffcb:ad4e with SMTP id l23-20020a1709060e1700b00993ffcbad4emr10760990eji.13.1689660267020;
        Mon, 17 Jul 2023 23:04:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l22-20020a170906231600b00992e4d8cc89sm571966eja.57.2023.07.17.23.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:04:26 -0700 (PDT)
Message-ID: <3756dffd-1407-d656-485a-9cf1eefd9ae1@linaro.org>
Date: Tue, 18 Jul 2023 08:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
To: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
 <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
 <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
 <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
 <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org>
 <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
 <CAGUgbhCTDPGt_vpbfaEreX+iuLJ3WUBqt4kppxyaFZQus9Zf0Q@mail.gmail.com>
 <b22b2ccc-6760-0db6-067b-109c3864d2e8@linaro.org>
 <CAGUgbhDmXnyxYCL9h9C0P4ByDSTstWnGqW=uFoDVVHeK3BerHA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGUgbhDmXnyxYCL9h9C0P4ByDSTstWnGqW=uFoDVVHeK3BerHA@mail.gmail.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 18/07/2023 06:01, 蔡承達 wrote:
>>
>> On 17/07/2023 11:01, 蔡承達 wrote:
>>> Guenter Roeck <linux@roeck-us.net> 於 2023年7月17日 週一 上午1:00寫道：
>>>>
>>>> On 7/16/23 09:08, Krzysztof Kozlowski wrote:
>>>>
>>>> [ ... ]
>>>>
>>>>>>
>>>>>> This patch serial doesn't use to binding the fan control h/w. It is
>>>>>> used to binding the two independent h/w blocks.
>>>>>> One is used to provide pwm output and another is used to monitor the
>>>>>> speed of the input.
>>>>>> My patch is used to point out that the pwm and the tach is the
>>>>>> different function and don't need to
>>>>>> bind together. You can not only combine them as the fan usage but also
>>>>>> treat them as the individual module for
>>>>>> use. For example: the pwm can use to be the beeper (pwm-beeper.c), the
>>>>>> tach can be used to monitor the heart beat signal.
>>>>>
>>>>> Isn't this exactly the same as in every other SoC? PWMs can be used in
>>>>> different ways?
>>>>>
>>>>
>>>> ... and in every fan controller. Not that it really makes sense because
>>>> normally the pwm controller part of such chips is tied to the fan input,
>>>> to enable automatic fan control, but it is technically possible.
>>>> In many cases this is also the case in SoCs, for example, in ast2500.
>>>> Apparently this was redesigned in ast2600 where they two blocks are
>>>> only lightly coupled (there are two pwm status bits in the fan status
>>>> register, but I have no idea what those mean). If the blocks are tightly
>>>> coupled, separate drivers don't really make sense.
>>>>
>>>> There are multiple ways to separate the pwm controller part from the
>>>> fan inputs if that is really necessary. One would be to provide a
>>>> sequence of address mappings, the other would be to pass the memory
>>>> region from an mfd driver. It is not necessary to have N instances
>>>> of the fan controller, even if the address space is not continuous.
>>>>
>>>
>>> Hi Guenter,
>>>
>>> May I ask about the meaning of the sequence of address mappings? It appears
>>> to consist of multiple tuples within the 'reg' property, indicating
>>> the usage of PWM/Tach
>>> registers within a single instance. After that I can use the dts like following:
>>>
>>> pwm: pwm@1e610000 {
>>> ...
>>> reg = <0x1e610000 0x8
>>> 0x1e610010 0x8
>>> 0x1e610020 0x8
>>> 0x1e610030 0x8
>>> 0x1e610040 0x8
>>> 0x1e610050 0x8
>>> 0x1e610060 0x8
>>> 0x1e610070 0x8
>>> 0x1e610080 0x8
>>> 0x1e610090 0x8
>>> 0x1e6100A0 0x8
>>> 0x1e6100B0 0x8
>>> 0x1e6100C0 0x8
>>> 0x1e6100D0 0x8
>>> 0x1e6100E0 0x8
>>> 0x1e6100F0 0x8>;
>>
>>
>> Uh, no... I mean, why? We keep pointing out that this should not be done
>> differently than any other SoC. Open any other SoC PWM controller and
>> tell me why this is different? Why this cannot be one address space?
> 
> Hi Krzysztof,
> 
> This is because the register layout for PWM and Tach is not continuous.
> Each PWM/Tach instance has its own set of controller registers, and they
> are independent of each other.

Register layout is not continuous in many other devices, so again - why
this must be different?

> 
> For example:
> PWM0 uses registers 0x0 and 0x4, while Tach0 uses registers 0x8 and 0xc.
> PWM1 uses registers 0x10 and 0x14, while Tach1 uses registers 0x18 and 0x1c.
> ...
> 
> To separate the PWM controller part from the fan inputs, Guenter has
> provided two methods.
> The first method involves passing the memory region from an MFD
> driver, which was the

I have no clue how can you pass memory region
(Documentation/devicetree/bindings/reserved-memory/) from MFD and why
does it make sense here.

> initial method I intended to use. However, it seems that this method
> does not make sense to you.
> 
> Therefore, I would like to explore the second method suggested by
> Guenter, which involves providing
> a sequence of address mappings.

Best regards,
Krzysztof

