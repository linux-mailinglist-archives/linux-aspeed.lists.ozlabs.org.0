Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66A754F96
	for <lists+linux-aspeed@lfdr.de>; Sun, 16 Jul 2023 18:08:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HE//uS2g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3qrx3lvhz3bcS
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 02:08:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HE//uS2g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3qrh5J96z30Jy
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 02:08:34 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e99584a82so4792574a12.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 16 Jul 2023 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689523707; x=1692115707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFNOxCkZidbalN7CuyDDRpdo9zeZvLW7A53Aw1rLKbM=;
        b=HE//uS2g8oJofWthSV32zbw+CJapJ/Tm9PZHDtSngUqz/r5XkJc+b4Tc0sLTaTvKec
         zqJ00IlLi8lak5WeR8YLitYN3Bkzh817YQi9Bp7ypzpZB2bE3EEk+U+xjVZ695Bn+EPt
         mERPLvOewkPUntu/559HrttHK4qFScRiUc8NPkyH4rEam7+/cn+U4N+UJkBVrQGoPJMV
         tnzvlkqbfdhnGCGytVmUv+CPan6p/vMJHvJ/lFJ4uq/721YrER1nWvVr/45mHJkJttAy
         6z2Hd9W8kMAP1CXmTvbfuQZbYSJwG5k0dgs0vQi6Iox0liE8LmiFvew9Hb13NsKLOVk5
         CkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689523707; x=1692115707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFNOxCkZidbalN7CuyDDRpdo9zeZvLW7A53Aw1rLKbM=;
        b=LrmEJJol4c3oupSXH12B3kfom72sY+B2WH2vqemGH77GmtV5FgVd6EFirZyADZNWxc
         xVJe6KOXxA4rNlXPPgzD0nPqjCJvSYgQTjjPQtohTkLzGgFPVwWiqe49Cg+0oHbNGtQQ
         lMGaXJjwM6QETFmxmRWZVfXrLKJuYMw+Ogq1z6lETUaxG9FFNXbdZ1quQ9xGkSf6+wF8
         vqG6CqrsfntkKhO9WVeAVg8Be2gAd7VWGhBPW65q9Uqp9HuMRQKs08LAn55771f/7ay5
         ZrMxdXx1WkpsSW4xpl3amEG4Y1Jo7agmqnnR/4f0s/eQiWjuodXhs4gMV/fJfGGWKOOG
         9uvA==
X-Gm-Message-State: ABy/qLZzgOHVg+Ga5yR4XePhYneCLinIxBqxDLYUho2h6qDaYyIrFh2m
	evJw/srsLi8Cb4pNSj/lM09g/Q==
X-Google-Smtp-Source: APBJJlGTep8KdTxvuPl0WnJS8vyPvSMZi8aDsQQ+H0L3EiFiiq2Ww4jKrPFs5gGwcbADlAqstdyWEA==
X-Received: by 2002:a17:906:1114:b0:98e:4c96:6e1f with SMTP id h20-20020a170906111400b0098e4c966e1fmr9722967eja.69.1689523706778;
        Sun, 16 Jul 2023 09:08:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b0099342c87775sm8124189eja.20.2023.07.16.09.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 09:08:25 -0700 (PDT)
Message-ID: <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org>
Date: Sun, 16 Jul 2023 18:08:23 +0200
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
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

On 14/07/2023 13:17, 蔡承達 wrote:
> Guenter Roeck <linux@roeck-us.net> 於 2023年7月14日 週五 下午6:26寫道：
>>
>> On 7/14/23 03:18, 蔡承達 wrote:
>>> Guenter Roeck <linux@roeck-us.net> 於 2023年7月14日 週五 下午5:59寫道：
>>>>
>>>> On 7/14/23 00:13, Krzysztof Kozlowski wrote:
>>>>> On 14/07/2023 09:04, 蔡承達 wrote:
>>>>>
>>>>>>           > This is because our register layout for PWM and Tach is not
>>>>>> continuous.
>>>>>>
>>>>>>           > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
>>>>>>
>>>>>>           > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
>>>>>>
>>>>>>           > ...
>>>>>>
>>>>>>           > Each PWM/Tach instance has its own controller register and is not
>>>>>> dependent on others.
>>>>>
>>>>> Your email reply quoting style is very difficult to read.
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Hi Guenter,
>>>>>>
>>>>>>
>>>>>>
>>>>>> Did you receive a response to my previous email?
>>>>>>
>>>>>> I would like to inquire if you have any further concerns regarding the PWM
>>>>>> and Tach with 16 instances.
>>>>>
>>>>> But isn't like this in all PWMs in all SoCs?
>>>>>
>>>>
>>>> Correct, pretty much every fan controller is implemented that way.
>>>> I don't understand the logic.
>>>>
>>>
>>> Hi Krzysztof and Guenter,
>>>
>>> Apologies for any confusion earlier.
>>> So, you think that the implementation with 16 instances of TACH/PWM
>>> device nodes in dts instead of one is ok to you, right?
>>>
>>
>> Did I say that ? No, it is not ok with me. It is confusing and doesn't make
>> sense to me. This is one fan controller with 16 channels, not 16 separate
>> controllers.
>>
> 
> This patch serial doesn't use to binding the fan control h/w. It is
> used to binding the two independent h/w blocks.
> One is used to provide pwm output and another is used to monitor the
> speed of the input.
> My patch is used to point out that the pwm and the tach is the
> different function and don't need to
> bind together. You can not only combine them as the fan usage but also
> treat them as the individual module for
> use. For example: the pwm can use to be the beeper (pwm-beeper.c), the
> tach can be used to monitor the heart beat signal.

Isn't this exactly the same as in every other SoC? PWMs can be used in
different ways?

Anyway, it is tricky to keep the discussion since you avoid posting
entire DTS. I already said:

"I will start NAKing such patches without DTS user. It's like reviewing
fake code for some unknown solution and trying to get from you piece of
answers one by one, because you do not want to share entire part."



Best regards,
Krzysztof

