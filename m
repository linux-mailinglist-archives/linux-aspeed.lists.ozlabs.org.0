Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E17CB753806
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 12:26:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ex+LPH8w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2SMK5lbXz3c4t
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jul 2023 20:26:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ex+LPH8w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2SMF227Bz30XZ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 20:26:48 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6686c74183cso1692271b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jul 2023 03:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689330405; x=1691922405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OeDz9XOyO2BYg3Fsp6L2LMwg9YaX4dzxFbvqddCCNbc=;
        b=ex+LPH8wvfjEVCF0n3s6EmyDriahHf0k8cD+7xAUFjd8g86YStOQQ0TcV5a0oQOcnA
         yCdYEJt6bY1tHGnCKAoKi4J/e3jxJgGwhKlideP6K8PcX63uEh+tI7Buyzfj03/3AJGv
         cqEiPEpYBs1pjLKPJ4Y56tlxv/BmWZWFHsWT7jsajd+NQCHCuVxTnRX9sZBEnD+6yt/3
         Ni8+jTItOOTK7vmKAZg42GqkwxBQu8myDkQ8RGChgRrcvrY0qTKa9I8s119YcaCj9Epk
         RgTgNibToeN8Zi4jd6SLISN0wsoNTVbrjLlQ/8qZu/vkJoIqO2zs1PVE1vaYWHq/GDMd
         KFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689330405; x=1691922405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeDz9XOyO2BYg3Fsp6L2LMwg9YaX4dzxFbvqddCCNbc=;
        b=hLCKOeLimt+iUvHDJKemWMCOVe+16UF6kz1sO8PMqwQCSdLvKo9EdklMsGtJoxenKJ
         tZnOfRXN1sxm/C8flRPdJwvC7Qvs5XgffQhQRPXR9z92pq0EEt/wNv2yvl8YoRhtkN71
         mIOwTDWqz9GlFv7THcWXX1dcn9yDSCJWxHOINb6k/EJy4qfYWXFJI4+AU/RsthXgSmgK
         lpt7Kq6SBmqvzyJqTYqN0L6QkmtDVly0Eyyj0yddajtunxyeMUH1+i0i2kCpoDKpBZhs
         K7nXfWpLSaGfVsBuqJSKyYzWgyLoeBc9/GCRz0WUUPOHAncc7MboxLiT5Ks8c6LhOqWz
         uy/A==
X-Gm-Message-State: ABy/qLbQhmCheuVQ7EglyrmPagEtI2ClEnMdyJG2j2E827FRIyneFreX
	BujrN7WwC6WucPF9nIe3mbQ=
X-Google-Smtp-Source: APBJJlGPzXvxtEOFuHaJbQ4dhtA0fv1hirhejLpmoI89mcWrV+4LLQ+oGeZ2UFuMoX7KIEqT4a96/w==
X-Received: by 2002:a05:6a00:17a6:b0:666:e42c:d5fb with SMTP id s38-20020a056a0017a600b00666e42cd5fbmr6488013pfg.32.1689330405421;
        Fri, 14 Jul 2023 03:26:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s10-20020a62e70a000000b006687b41c4dasm6869160pfh.110.2023.07.14.03.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 03:26:44 -0700 (PDT)
Message-ID: <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
Date: Fri, 14 Jul 2023 03:26:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Content-Language: en-US
To: =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
 <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/14/23 03:18, 蔡承達 wrote:
> Guenter Roeck <linux@roeck-us.net> 於 2023年7月14日 週五 下午5:59寫道：
>>
>> On 7/14/23 00:13, Krzysztof Kozlowski wrote:
>>> On 14/07/2023 09:04, 蔡承達 wrote:
>>>
>>>>           > This is because our register layout for PWM and Tach is not
>>>> continuous.
>>>>
>>>>           > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
>>>>
>>>>           > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
>>>>
>>>>           > ...
>>>>
>>>>           > Each PWM/Tach instance has its own controller register and is not
>>>> dependent on others.
>>>
>>> Your email reply quoting style is very difficult to read.
>>>
>>>>
>>>>
>>>>
>>>> Hi Guenter,
>>>>
>>>>
>>>>
>>>> Did you receive a response to my previous email?
>>>>
>>>> I would like to inquire if you have any further concerns regarding the PWM
>>>> and Tach with 16 instances.
>>>
>>> But isn't like this in all PWMs in all SoCs?
>>>
>>
>> Correct, pretty much every fan controller is implemented that way.
>> I don't understand the logic.
>>
> 
> Hi Krzysztof and Guenter,
> 
> Apologies for any confusion earlier.
> So, you think that the implementation with 16 instances of TACH/PWM
> device nodes in dts instead of one is ok to you, right?
> 

Did I say that ? No, it is not ok with me. It is confusing and doesn't make
sense to me. This is one fan controller with 16 channels, not 16 separate
controllers.

Guenter

