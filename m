Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62CB755F7F
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 11:39:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oNVQ4IxL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4H905M46z2xbC
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 19:39:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oNVQ4IxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4H8s0tbYz2xbC
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 19:39:08 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-991ef0b464cso1156263366b.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 02:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689586744; x=1692178744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0Abj6UC9IBcOuGYotmVfSuiZNB5aYWz62cWUjDEEUg=;
        b=oNVQ4IxLU5eX07C5sklU29DxI6u6wg6e2WB+o1jYa8ec1pIsG+BAHCXbIxFDRp3qTl
         /dzmITQUrQQAtrbiRbTKZ7mq/rdWdu+IY4bT2jTa5aUo9wx6WkrAvvLb0bRSd7M0ZydQ
         b29rvFfZZGyNnhzH4VVO4rGTo0TGUdB9O6a27CQXtCHKjU0W1AvEl5NC9OA7pA5Ua0WT
         2QAa11Z87kgv9ExsFKCWzMZMoLOgRhBMS8YGxwsV7sbWrTqGIVGhrip83rrcvyfi851o
         rJzoec2YkfyS05pvyryJhBl8FoshXHTLwU2JZW7ssjAP1OaNkbGfKIRVXNLz5N+4DxLD
         lKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689586744; x=1692178744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0Abj6UC9IBcOuGYotmVfSuiZNB5aYWz62cWUjDEEUg=;
        b=bXelBmyjNxYhMbxbodCdiQIjrG5GWCcJPd1Vs7dwLleP0pE9quitqIGRAMB7UbtLy3
         6dFJEdPYtxKd6h0I5hml8tkNK//yjhqUWqg+xQIpxOZ7h7NBLSP6B1oq6S4U8/DgaDRN
         ayc0cMkzxsUXCELIS3DiZqSTkSL0beVnZ2F78xU4f1CObCPJvsEqIvPbAEOuoIMZAXyf
         U3NoKNjGmSYqd413FPU+BEMkgrpLZEtGAO1HZd99/I2NSs2vIvaObv/CX9C041x41inV
         qDoKekBDemXRKsk+kEY1vN4L/h3pk5kxxQ5mEcmLOr2PdItpKd3drVuZImesB7bdSxjD
         HL5g==
X-Gm-Message-State: ABy/qLY5CTXNtJ5X2VoE6LeMq1V3wrl6BaIwATSecfiEwMNV8mwzsAUE
	6xI5xthRyNY6QXXtJU56tFn7ZA==
X-Google-Smtp-Source: APBJJlESrTNaJcx/BujEXJeNKPZNlBYFJGnbXsuE/wnWYk8Pltb8LBwpD6Msb01kwBYC5AzGsjQodw==
X-Received: by 2002:a17:906:28a:b0:988:15f4:fdba with SMTP id 10-20020a170906028a00b0098815f4fdbamr12038269ejf.14.1689586744230;
        Mon, 17 Jul 2023 02:39:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id ov4-20020a170906fc0400b00992b50fbbe9sm9051066ejb.90.2023.07.17.02.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 02:39:03 -0700 (PDT)
Message-ID: <b22b2ccc-6760-0db6-067b-109c3864d2e8@linaro.org>
Date: Mon, 17 Jul 2023 11:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
To: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
 <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
 <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
 <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
 <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org>
 <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
 <CAGUgbhCTDPGt_vpbfaEreX+iuLJ3WUBqt4kppxyaFZQus9Zf0Q@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGUgbhCTDPGt_vpbfaEreX+iuLJ3WUBqt4kppxyaFZQus9Zf0Q@mail.gmail.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/07/2023 11:01, 蔡承達 wrote:
> Guenter Roeck <linux@roeck-us.net> 於 2023年7月17日 週一 上午1:00寫道：
>>
>> On 7/16/23 09:08, Krzysztof Kozlowski wrote:
>>
>> [ ... ]
>>
>>>>
>>>> This patch serial doesn't use to binding the fan control h/w. It is
>>>> used to binding the two independent h/w blocks.
>>>> One is used to provide pwm output and another is used to monitor the
>>>> speed of the input.
>>>> My patch is used to point out that the pwm and the tach is the
>>>> different function and don't need to
>>>> bind together. You can not only combine them as the fan usage but also
>>>> treat them as the individual module for
>>>> use. For example: the pwm can use to be the beeper (pwm-beeper.c), the
>>>> tach can be used to monitor the heart beat signal.
>>>
>>> Isn't this exactly the same as in every other SoC? PWMs can be used in
>>> different ways?
>>>
>>
>> ... and in every fan controller. Not that it really makes sense because
>> normally the pwm controller part of such chips is tied to the fan input,
>> to enable automatic fan control, but it is technically possible.
>> In many cases this is also the case in SoCs, for example, in ast2500.
>> Apparently this was redesigned in ast2600 where they two blocks are
>> only lightly coupled (there are two pwm status bits in the fan status
>> register, but I have no idea what those mean). If the blocks are tightly
>> coupled, separate drivers don't really make sense.
>>
>> There are multiple ways to separate the pwm controller part from the
>> fan inputs if that is really necessary. One would be to provide a
>> sequence of address mappings, the other would be to pass the memory
>> region from an mfd driver. It is not necessary to have N instances
>> of the fan controller, even if the address space is not continuous.
>>
> 
> Hi Guenter,
> 
> May I ask about the meaning of the sequence of address mappings? It appears
> to consist of multiple tuples within the 'reg' property, indicating
> the usage of PWM/Tach
> registers within a single instance. After that I can use the dts like following:
> 
> pwm: pwm@1e610000 {
> ...
> reg = <0x1e610000 0x8
> 0x1e610010 0x8
> 0x1e610020 0x8
> 0x1e610030 0x8
> 0x1e610040 0x8
> 0x1e610050 0x8
> 0x1e610060 0x8
> 0x1e610070 0x8
> 0x1e610080 0x8
> 0x1e610090 0x8
> 0x1e6100A0 0x8
> 0x1e6100B0 0x8
> 0x1e6100C0 0x8
> 0x1e6100D0 0x8
> 0x1e6100E0 0x8
> 0x1e6100F0 0x8>;


Uh, no... I mean, why? We keep pointing out that this should not be done
differently than any other SoC. Open any other SoC PWM controller and
tell me why this is different? Why this cannot be one address space?

Best regards,
Krzysztof

