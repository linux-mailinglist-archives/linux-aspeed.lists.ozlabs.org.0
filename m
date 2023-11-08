Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444B7E5D60
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Nov 2023 19:38:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PLTpF1wj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQYkq2SVFz3cT0
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Nov 2023 05:38:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PLTpF1wj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQYkg4SH0z3cRF
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Nov 2023 05:38:33 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c08b7744so59557b3.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Nov 2023 10:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699468711; x=1700073511; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gnRY8hgDaxFo76ZgJWjN69ov12zpJHTXkWZBmrfUhmM=;
        b=PLTpF1wjjJyPBODrb593Xaync3daWjdNwknva3NK1WME2Q49Q0wO5slr/hWivJl5c4
         kM8jr5TKT3pNf7RSUjWhnzprJgCRLaWX0d3Jc9luHkn7n9lGeNcoTg6dmTg0tHHT0YUG
         t181hZ5IqZrDTGKX7fDFejN3RWZw/v8i7AoRKtsqfqL2h8S26fKtS3rsaLhLjGrpSTcd
         UUj8BmXdAEzBwVRFTCttZFcSmiEck3BJeSpRfpNNZP54/5UkjDm+nTl3g6H7AxdEDMc5
         OcxRkIxQa83n0+FFMS2DiTzLZ5Iz1PVsDKry90mySmg5aaMd4BiPw45hldPI67aWUgcN
         khXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699468711; x=1700073511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnRY8hgDaxFo76ZgJWjN69ov12zpJHTXkWZBmrfUhmM=;
        b=dXd0n0g40c3fyItetUNA5KRiDLa1h1iQlQj5N3dzlXeDXQ0HCLyAZtDBbE5iCVqTFz
         yR0kkKp0sAHkcIbrIDcP1yrMDfVJ2g25xbQeLqEYWXLu6q6Q6O0wsmTZJmjp+s7UBtUB
         OWRE4OtxbEZyON9XvScI3t5RcMqHOMaRO65WK2Ij6Ja7kRvvHUe7H8EPsFAld7XF2KLz
         XxNzl2Vc1GRL3+XSCw/LBlQN+OrMqQBwdasIClVbDYbbCVn/YmvbMbKLd3Qd+b8xD7dg
         lqwBGC7bIJVf9nlGJuHm+eWW11fLwFJjMlmp3RM0Wo0ySUh+wpxzGKcdjbJUL0pXUowB
         Q4zw==
X-Gm-Message-State: AOJu0YyRxtIYZK1IJXIOC8zfTB+zyCB+L4TXA0LJvfKBf1JpD7LeRaeD
	hs2iKwRpiH3n52xlx1boSUo=
X-Google-Smtp-Source: AGHT+IF5UCiZdRU27t6uGR6Xd3CxkQN829PGDg05me1nIK2Rmn3euTUJlk/yBnlm83LSrqEfb7D+wA==
X-Received: by 2002:a0d:f301:0:b0:583:b186:d817 with SMTP id c1-20020a0df301000000b00583b186d817mr2454238ywf.27.1699468710710;
        Wed, 08 Nov 2023 10:38:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x184-20020a814ac1000000b0057a8de72338sm7119235ywa.68.2023.11.08.10.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 10:38:30 -0800 (PST)
Message-ID: <d3204361-2d4c-41f9-8365-5826195aa884@roeck-us.net>
Date: Wed, 8 Nov 2023 10:38:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v10 1/3] dt-bindings: hwmon: fan: Add fan binding
 to schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
References: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
 <20231107105025.1480561-2-billy_tsai@aspeedtech.com>
 <20231108181654.GA2664986-robh@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231108181654.GA2664986-robh@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, BMC-SW@aspeedtech.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/8/23 10:16, Rob Herring wrote:
> On Tue, Nov 07, 2023 at 06:50:23PM +0800, Billy Tsai wrote:
>> From: Naresh Solanki <naresh.solanki@9elements.com>
>>
>> Add common fan properties bindings to a schema.
>>
>> Bindings for fan controllers can reference the common schema for the
>> fan
>>
>> child nodes:
>>
>>    patternProperties:
>>      "^fan@[0-2]":
>>        type: object
>>        $ref: fan-common.yaml#
>>        unevaluatedProperties: false
>>
>> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>> ---
>>   .../devicetree/bindings/hwmon/fan-common.yaml | 78 +++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
> 
> Looking pretty good to me. It's disappointing that no one else
> interested in upstreaming their fan controller can be bothered to
> comment.
> 

FWIW, I declined to comment since it basically looks ok to me
and because at this point I'd rather have something (whatever it is)
instead of nothing.

>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
>> new file mode 100644
>> index 000000000000..be4ce3bd7f22
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common Fan Properties
>> +
>> +maintainers:
>> +  - Naresh Solanki <naresh.solanki@9elements.com>
>> +  - Billy Tsai <billy_tsai@aspeedtech.com>
>> +
>> +properties:
>> +  max-rpm:
>> +    description:
>> +      Max RPM supported by fan.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 100000
>> +
>> +  min-rpm:
>> +    description:
>> +      Min RPM supported by fan.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 1000
>> +
>> +  pulses-per-revolution:
>> +    description:
>> +      The number of pulse from fan sensor per revolution.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 4
>> +
>> +  tach-div:
>> +    description:
>> +      Divisor for the tach sampling clock, which determines the sensitivity of the tach pin.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  target-rpm:
>> +    description:
>> +      The default desired fan speed in RPM.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  fan-driving-mode:
>> +    description:
>> +      Select the driving mode of the fan.(DC, PWM and so on)
>> +    $ref: /schemas/types.yaml#/definitions/string
> 
> You need to define the possible values. I assume it's:
> 
> enum:
>    - dc
>    - pwm
>    - anything else???
> 

I am not aware of any other possible method. dc and pwm is all
I have ever seen.

Guenter

> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

