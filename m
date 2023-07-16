Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE29754FED
	for <lists+linux-aspeed@lfdr.de>; Sun, 16 Jul 2023 19:00:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Xhgz+LJB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3s0J23zLz30fF
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 03:00:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Xhgz+LJB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3s092LKqz2xBV
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 03:00:08 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8ad907ba4so20557955ad.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 16 Jul 2023 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689526804; x=1692118804;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RZBSC9VlSCWDDQ9NaldE02NH19Agbf9l1F2PLZ3gMU=;
        b=Xhgz+LJBK80DgVAlAdMzAf9hJLuv4SUnLFdgKVhm7CIJMmSwB4uOUnzvuj91L751x6
         BdutsfJZ8dpA+kY1eU+7kkGYO80pdi2UHVijW6BxEp+xX7MTPEezQmcZ5jLqudo034zH
         z8q56R0ND8Ev7G40aXSvWeknaOnLokeZ+dhGaCwk6E+klX2YjhVmDNIKh91EjQSRRsXn
         CvuXXqon+6/PsPOzfN1Jz6DlTG5JJBlBofVFnjUpxZ50O1dfd/g9qZcWRV2iGww2magn
         i/Iq7vuXYgcWuoWeSsGzLY73/xU4wa710bYCPOET+TD/9JV0P70gEOfIwwT8LrBWUMnU
         ypVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689526804; x=1692118804;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RZBSC9VlSCWDDQ9NaldE02NH19Agbf9l1F2PLZ3gMU=;
        b=RFZU5rII0S+zSrGGBH5UeuBTNpv1QkfJXUw5IzWPuYNoMJjY97p+wdEFzO9kdsjPZV
         Wv3Tz7fjhw5nT9sl9Gl9VaIXhWYmgiYID4vL3+SQ/vqWko5yD/mZ2ut89x9jSJ3KA+cs
         Obx8b4/fPGD8+vmPXc4nIPQp8lIyvA6akFYXsfBbL0TWL8LGufqhgs7HeeQ0CX/ev0+3
         oSNUKBUogI1HoLS2TEtMxSsl9hb5ZvDmVTNlk5Y0Q9SNNbTjffGuM4JB7LRZF/l5O0he
         ykqhciC/Gq/a62qBS9qPt3Jynsad8RSbg04Nlimg1QtnESSlzjmCWkCGcOxrA5zeiqMH
         klzQ==
X-Gm-Message-State: ABy/qLaEATK91Z4RziUti82WPCsP/x7L61JWift9TGeJsyYusRtpUp0B
	hfOXTow89pILROqXXOFEdOo=
X-Google-Smtp-Source: APBJJlEf5Hxvs83+h5l+00e+naQWCiqNakhSinl9PZLGOJ0G+eMabdQR6VlF1n/dqXxDfUKPyylETg==
X-Received: by 2002:a17:903:2310:b0:1b8:7618:5414 with SMTP id d16-20020a170903231000b001b876185414mr9372013plh.60.1689526803628;
        Sun, 16 Jul 2023 10:00:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b001b8a54f99d1sm11183638plb.275.2023.07.16.10.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 10:00:02 -0700 (PDT)
Message-ID: <7a69bda1-5f4c-5b1f-8eb6-6fd58917a9b1@roeck-us.net>
Date: Sun, 16 Jul 2023 10:00:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
 <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
 <0ba3767c-d481-6e2c-2d32-b79af0e1efd8@roeck-us.net>
 <CAGUgbhC34-pUp4ECULc0ScaN7hUF1L-z69h+ji-TiVrv4gKd3Q@mail.gmail.com>
 <7b198d57-ddec-3074-314a-3e5e5b8f48f9@roeck-us.net>
 <CAGUgbhDbFedVe-pc+muD_NtDpjHpGqMDdrS3A73C-QbxeHn4oQ@mail.gmail.com>
 <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
In-Reply-To: <cf91edc9-1093-495b-48eb-6b05198c2541@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/16/23 09:08, Krzysztof Kozlowski wrote:

[ ... ]

>>
>> This patch serial doesn't use to binding the fan control h/w. It is
>> used to binding the two independent h/w blocks.
>> One is used to provide pwm output and another is used to monitor the
>> speed of the input.
>> My patch is used to point out that the pwm and the tach is the
>> different function and don't need to
>> bind together. You can not only combine them as the fan usage but also
>> treat them as the individual module for
>> use. For example: the pwm can use to be the beeper (pwm-beeper.c), the
>> tach can be used to monitor the heart beat signal.
> 
> Isn't this exactly the same as in every other SoC? PWMs can be used in
> different ways?
> 

... and in every fan controller. Not that it really makes sense because
normally the pwm controller part of such chips is tied to the fan input,
to enable automatic fan control, but it is technically possible.
In many cases this is also the case in SoCs, for example, in ast2500.
Apparently this was redesigned in ast2600 where they two blocks are
only lightly coupled (there are two pwm status bits in the fan status
register, but I have no idea what those mean). If the blocks are tightly
coupled, separate drivers don't really make sense.

There are multiple ways to separate the pwm controller part from the
fan inputs if that is really necessary. One would be to provide a
sequence of address mappings, the other would be to pass the memory
region from an mfd driver. It is not necessary to have N instances
of the fan controller, even if the address space is not continuous.

Guenter

> Anyway, it is tricky to keep the discussion since you avoid posting
> entire DTS. I already said:
> 
> "I will start NAKing such patches without DTS user. It's like reviewing
> fake code for some unknown solution and trying to get from you piece of
> answers one by one, because you do not want to share entire part."
> 
> 
> 
> Best regards,
> Krzysztof
> 

