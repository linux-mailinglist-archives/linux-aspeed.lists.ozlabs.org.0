Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFFE635284
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 09:27:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHDl60qSQz3cLW
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 19:27:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwsMJSLD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwsMJSLD;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHDl10G1Mz3cJq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 19:27:24 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id j4so27146818lfk.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 00:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcQzfS4Peg1BcWVPqA3r5THwZqoD6UuyTScyPfW0+gk=;
        b=wwsMJSLDaFLkDmDTXJtxCSc0Yi9K/FrzEMP5aqu+f3DlffmLcAneNewS0AeVoruiVA
         P/UeSJbrk0e1LjmHE43sKXJW9qWXGXevFE80Yxar8Exmw3uJKnxVTottlDgGYvfxX1/s
         kk/OnKpMdejE9stbilHmFZz4R3CIxE1s4wpsH9FS4U5W8TyTm0TL7e6WX0mvjJwrnPmC
         comRH/5ZY+VXajexEne/REUOPAHJTj5ssKXbUQNCdIH6VEVSqy2k9eXfiU/TeNpHNTlK
         viWQ8x4OUOwoHLQCwSs8gLKi2Ggzr70p/tUZPb0B/V1fqvIzQrXjxXdhq9uro2PbBj3C
         Ra2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcQzfS4Peg1BcWVPqA3r5THwZqoD6UuyTScyPfW0+gk=;
        b=MawH0FbXlUQIOJ+7FbqVAVxNdtiTPNl/ZGxt7QqehSWychcFHQ3VIkK3BMJKa5h29Q
         y01tkSVxLDzq2pYvbfKWRuuCSxE6fkI/q8N3UJDu1545yJ0geRsB6coOsDIDypWDYiUO
         ydr6TGzDrSrtFHfYMg8uRIt3H7YdD01Xlzx1xsCNQ/C1OfJNbkXFXFR2ejT+e2ZW+3kL
         HLIV8BaLZHMm4frA9VXJVKTNJIGKcfXjnrboHIrPt2Ey94mb9WDi7UMTZmaW14oqsoEj
         CzuPMdCZyYdHciGLP88DaDWyF2NjRuZFAmuIIaAwE9BH2N3xxtHY9fQQOQMHDRoBVNP/
         bCpA==
X-Gm-Message-State: ANoB5plWTvkqd2/mkGH/+tkBjIrASKogcBvA/40cDnaQs5s65+GQdl/w
	B2oyK1RFmhngKktVMwwklWdgsw==
X-Google-Smtp-Source: AA0mqf43Wrz+lScpnmQazgR9edsrHf8CWzNzDGSguKpLX4o0m+7qhfGZ6s4+ZcKOiUFO9TVR0WiMOw==
X-Received: by 2002:a05:6512:2a89:b0:4b4:dffc:62a8 with SMTP id dt9-20020a0565122a8900b004b4dffc62a8mr2147155lfb.585.1669192039230;
        Wed, 23 Nov 2022 00:27:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f16-20020a05651c03d000b0026dffd032b8sm2110336ljp.2.2022.11.23.00.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:27:18 -0800 (PST)
Message-ID: <27055c13-11ab-cc73-f2ba-c269785b0e28@linaro.org>
Date: Wed, 23 Nov 2022 09:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-2-billy_tsai@aspeedtech.com>
 <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
In-Reply-To: <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/11/2022 09:24, Krzysztof Kozlowski wrote:
> On 23/11/2022 07:16, Billy Tsai wrote:
>> Add device binding for aspeed pwm-tach device which is a multi-function
>> device include pwm and tach function.
> 
> Subject: drop second, redundant "bindings".
> Also use proper PATCH prefix.
> 
>>
>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>> ---
>>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 73 +++++++++++++++++++
>>  1 file changed, 73 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>> new file mode 100644
>> index 000000000000..e2a7be2e0a18
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2021 Aspeed, Inc.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: PWM Tach controller
>> +
>> +description: |
>> +  The PWM Tach controller is represented as a multi-function device which
>> +  includes:
>> +    PWM
>> +    Tach
>> +
>> +maintainers:
>> +  - Billy Tsai <billy_tsai@aspeedtech.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - aspeed,ast2600-pwm-tach
>> +      - const: syscon
>> +      - const: simple-mfd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
> 
> If this is simple-mfd then it cannot take clocks or resets.  Usually the
> recommendation for such case is: This is not simple-mfd, drop it. Drop
> also syscon and make a proper device.
> 
> However I am surprised to see such change, so I have no clue why this
> was done.

Actually now I see it was like that in previous patch, I just missed it
during previous review. Anyway this must be fixed.

Best regards,
Krzysztof

