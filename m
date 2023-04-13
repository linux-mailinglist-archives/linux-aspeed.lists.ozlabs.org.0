Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 378696E122A
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Apr 2023 18:23:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4cx0rzwz3fkL
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Apr 2023 02:23:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K0rAxBsz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K0rAxBsz;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4V54MrHz3fvc
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Apr 2023 02:17:16 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id rp27so1777463ejb.12
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Apr 2023 09:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681402631; x=1683994631;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEOFxKNy3U0Hgu4EBIZNIx+9mDifLsjK29cZX/KJbkA=;
        b=K0rAxBszub74dCkhRGXZMGBJaRQlKup6HorTTNc5AbEVh92+AAOVjPcB4sEghRoSAx
         MqSP4jfNxZI2LffWurhn8/y0fBzGzT4mRT+XzJVCDAvBjuR+tdMkfC9fiMz+1/rQOAkY
         hKngEF6/jLVK8K43aw065epwWgILkqwbZ0ZaQ89+ojx8DlbE7kzuvSBopGOUK4A7idIc
         8LLyn25iqgsK6ArjS3oPJbqf8LDkVtjRfkIqFmu/vUUamfnGGiEm+hTuzV6Tw22F2DQV
         6yEF72MtFX+hmZ+So85NDphM2zUZnZfW8e1398WZpOBK+UfkRy0wIbKyEBHX0SYXpswn
         Pi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402631; x=1683994631;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEOFxKNy3U0Hgu4EBIZNIx+9mDifLsjK29cZX/KJbkA=;
        b=J4ocrNybtpobWj9obZ+vqY3UUNU6u3kmmVVNUNeFc0YLjfj3vLad1n5nXaDt/bK3YK
         TtlCih/Cjv2YKu4m5Wcpk4OAzTdQF+Je59o0/C/dqjmY9u9gJgq5FL6W2chz5pHqRMI6
         n/pJdpVWVn28Pxzi2lBXGORL0g7qmCMl0HGtsVN5Yf4bmQwQs/mxiGdsTJtw15G8z1eG
         3fjbWrNwH4zkhqeAJa7E9UXYjvc8BJ3L9/HZSORDyCNdnfYulqs5lZGuw5xQmhsiCfhX
         /1z5Bj8Mpf/RQFd+8HCokA+/gPhXn4reUbeABh2AeECB1pICeUcrW+zWv/qx6AscB9n2
         bDqg==
X-Gm-Message-State: AAQBX9fqCT2qmGlId2+t7zkYCt79CeFmJ7gS1MwR3G9GDC0yDDGVOPi9
	SG55LVwZ3GFj0KFYhxanfLVI5Q==
X-Google-Smtp-Source: AKy350Zeo4tNvuyj8lC6EBUYcdMn48Z6g3oSrpCwSIcWdbZYsDPng5J86Mqq3pWEbgJqhj5TZTigiw==
X-Received: by 2002:a17:906:3cf2:b0:94a:74b7:43e4 with SMTP id d18-20020a1709063cf200b0094a74b743e4mr3151258ejh.69.1681402631579;
        Thu, 13 Apr 2023 09:17:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5032:d2d4:ece5:b035? ([2a02:810d:15c0:828:5032:d2d4:ece5:b035])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090603c100b00882f9130eafsm1170488eja.26.2023.04.13.09.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 09:17:11 -0700 (PDT)
Message-ID: <653a9c34-7699-13d4-7599-f64e43345b14@linaro.org>
Date: Thu, 13 Apr 2023 18:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v9 1/2 RESEND] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Jean Delvare <jdelvare@suse.de>, William Zhang <william.zhang@broadcom.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230413075327.1397306-1-ryan_chen@aspeedtech.com>
 <20230413075327.1397306-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413075327.1397306-2-ryan_chen@aspeedtech.com>
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

On 13/04/2023 09:53, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

>  required:
>    - reg
>    - compatible
> @@ -57,6 +73,26 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:

allOf goes before unevaluatedProperties. Use example-schema.yaml as your
template/guidance.

> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-i2cv2
> +
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +      required:
> +        - aspeed,global-regs
> +    else:
> +      properties:
> +        aspeed,global-regs: false
> +        aspeed,enable-dma: false
> +
> +

Only one blank line.

Best regards,
Krzysztof

