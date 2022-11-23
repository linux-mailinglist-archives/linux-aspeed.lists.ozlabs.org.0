Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505363525D
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 09:24:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHDh52zhLz3cT4
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 19:24:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iAB9ioyF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iAB9ioyF;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHDgz28B3z3cJq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 19:24:44 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id r8so9955107ljn.8
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 00:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQrDHCXSqC/XpmgwTdQyvmX254FcV0tmVuSLVUTqodg=;
        b=iAB9ioyFKLlNCgKnD6q3l2t859zPNg4auZGsr2Rg5VGBclq0WCjr3EQb0wMWVg22j9
         UhlgN0IWOGV8Kh5mD/w0pVAMssS9mmhYioVWsmF3g1b07uSH/a0Gmycjw3hGXC/CJvVR
         voCFLtfj3bYYPgeOuNT/ARyXty0hTIT+rEtUbQYC6YRJgYQB8WuyqwQCacGgsIjZv2sY
         eDyGI/j/dqPaDd/KQPdJf8ADy3PbJeeAa9wgZiJcIZWzlaZd1VNfIQ30jNdTK6Ov/QPZ
         jbn8FF1tj8XKvRFIUUGqv2VaMLznuoEreBdkOWFwFHE0VQ+S7ZSQoXQ3GS+Ae8KcJCFt
         VqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQrDHCXSqC/XpmgwTdQyvmX254FcV0tmVuSLVUTqodg=;
        b=6Pg+7QaHxLjn0Z2mIljSsoilrurzs+NlZi4LzZr2OqF0ZSp5LiyVWJuHdxTaF7Qyth
         ffcUcXbqoAji/ZiZS0SfuV6J7ZV00no7x0BGpu3cyVjaZJ81J8dnIxHdazGJuyc2HJOI
         EzCKYZ7LxYrkZIK/F8+JCwzGl5rf8f+XC5C0u2nQqFUlPQWq5rKnXN94fpm7grC74DRp
         R7slNrMuSgrPKN+SGOPmboUyOb+wsX89jW5EECWox0mgNrn4xP0GdZAgA+JiSqKFMtqA
         NDyYg6na9gn3ERwHu9tEzg5H8uI5safheOiTV+zr3ftFqpya6e1/UXeZhModnw9gee+F
         tOCg==
X-Gm-Message-State: ANoB5plb5reDt54q8LvlFychRX1luJUn+QIJc3meVJtotVWq0vfrXU/M
	DQZRS6Z8Ryqf5DFGKmR6vI8SsA==
X-Google-Smtp-Source: AA0mqf6iwY1eT/pvUtAt3GMkQhHH6pJs3Gapli4TS8EaFHzKoaH3BxsLR6VynPRL9UadZ7c1M9Qsgw==
X-Received: by 2002:a05:651c:10a2:b0:279:e41:1481 with SMTP id k2-20020a05651c10a200b002790e411481mr3606750ljn.184.1669191876623;
        Wed, 23 Nov 2022 00:24:36 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512348300b004b4b5da5f80sm2791751lfr.219.2022.11.23.00.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:24:36 -0800 (PST)
Message-ID: <c4b188b1-06a4-3cb0-a758-e12942e1f67b@linaro.org>
Date: Wed, 23 Nov 2022 09:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [v4 1/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123061635.32025-2-billy_tsai@aspeedtech.com>
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

On 23/11/2022 07:16, Billy Tsai wrote:
> Add device binding for aspeed pwm-tach device which is a multi-function
> device include pwm and tach function.

Subject: drop second, redundant "bindings".
Also use proper PATCH prefix.

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> new file mode 100644
> index 000000000000..e2a7be2e0a18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PWM Tach controller
> +
> +description: |
> +  The PWM Tach controller is represented as a multi-function device which
> +  includes:
> +    PWM
> +    Tach
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2600-pwm-tach
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1

If this is simple-mfd then it cannot take clocks or resets.  Usually the
recommendation for such case is: This is not simple-mfd, drop it. Drop
also syscon and make a proper device.

However I am surprised to see such change, so I have no clue why this
was done.

> +
> +  pwm:
> +    type: object
> +    $ref: "/schemas/pwm/aspeed,ast2600-pwm.yaml"

Drop quotes.

There is no such file. Are you sure you ordered the patches correctly?

> +
> +  tach:
> +    type: object
> +    $ref: "/schemas/hwmon/aspeed,ast2600-tach.yaml"

Drop quotes.

There is no such file.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets

Best regards,
Krzysztof

