Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D786898B
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 08:06:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IVbIRAqB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkT6y0v2Mz3vZ7
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 18:06:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IVbIRAqB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkT6q0Sdhz3brl
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 18:06:26 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so5207353a12.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 23:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709017582; x=1709622382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLCxLnglQud6AafcMTZGxWqddfDheQOqmiuHd+EOBrk=;
        b=IVbIRAqBJrDmcSF9rMBtQNIexel1n9SpJkkb82yhPrkFARFIJiFyXiZWnyWOLMIiK0
         /P4/yeeNvXFo15PotupOexnuS5C7a2tW/Bl1VmS9PW5CjETi3gIlMPT+1/2YuECgwEWt
         zioxWvUNB9dy9WyWEFoEqPDIyijfj1zizI5k5MiDxWWNcXsISfFTnx3RD6pLt9LTw8lU
         c95O855a3i5yUZnRqAjYwBiuO/sbac6SOE+cpkTgMMrAJ/a6F3y33cMjgPaEtno4JQK+
         GJGdmE6XoYqf8TDAYy9B3URHNySrD2toqF5Ej3dgjvDascEOZc0ktPRdUpKjwlQVr+jd
         2xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709017582; x=1709622382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLCxLnglQud6AafcMTZGxWqddfDheQOqmiuHd+EOBrk=;
        b=uTqzuPNwx5+Fi4+LDxck08vV1PHXGV01HoJeRd52Oa8JT45GS6SUQ/cEyCwjNez8UK
         qPg2MmPq3hCka5UQHInDL7iupL5UykEHQ68Aql4GYkHaahWQZEB3FOETbMhWE8CoTOya
         6Qq7MOqPo9mq6t/0xTE5HcJYtge+9pF4HkexckdrO0wPSbNIl3RZCbkhs4fE+J1kvR1/
         XlyRM6AtL7SxLkRd0fOXBpIBnn4gb1TZ3GoV8axbWXnOCIY/sZ4WSWPQJwUP9l/ZZXA4
         b8k/QShDCH1iIAM3S+YhlWI6PBLqiZbi+ErjDHFq0pL1WaA1X17b1VfOtLhT2vIjiafp
         bAVg==
X-Forwarded-Encrypted: i=1; AJvYcCVkUyY6AZJ1sXRwBny5s3Wm3nGG6L6B04CTRS2NohUUW6b2QSioS3sJsvNafMQ6tjgHDTrHZ4I+vfWO5SNLu0nbuQ1KAPkTiD26OUXJnA==
X-Gm-Message-State: AOJu0Yw2A9qhXuDtFHrkBqWcbKkGmZV0xl7CByQiNQxe9G4b7TCW3+ms
	ZSTHF37RwvH74SNVL7cvPuZb4u1chGhuG+y3aPbDH3c6BcNpoLOUYd5Wg600gAc=
X-Google-Smtp-Source: AGHT+IH3nPjxyLxePuzG85v10xOwBHg/CBPZEZjd12HuCqZJPvxpHQEs182DxeMGYt2iwDOWsPmcwg==
X-Received: by 2002:a05:6402:78f:b0:565:ced9:2657 with SMTP id d15-20020a056402078f00b00565ced92657mr4158876edy.7.1709017582311;
        Mon, 26 Feb 2024 23:06:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id r11-20020a056402018b00b0056608214577sm472173edv.16.2024.02.26.23.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 23:06:21 -0800 (PST)
Message-ID: <f69ef2ad-8ace-40c8-b923-4dde20eda2ec@linaro.org>
Date: Tue, 27 Feb 2024 08:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to DT
 schema
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>, linus.walleij@linaro.org,
 brgl@bgdev.pl, krzysztof.kozlowski+dt@linaro.org
References: <20240227052353.1060306-1-andrew@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240227052353.1060306-1-andrew@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 27/02/2024 06:23, Andrew Jeffery wrote:
> Squash warnings such as:
> 
> ```
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e600000/gpio@1e780000: failed to match any schema with compatible: ['aspeed,ast2400-gpio']
> ```
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> v5: Resolve macro definition clashes from aspeed clock headers in examples
>     identified by Rob's bot:
> 
>     https://lore.kernel.org/all/170900020204.2360855.790404478830111761.robh@kernel.org/
> 
>     Clearly I missed running `make dt_binding_check` on the final iteration of
>     the v4 patch I sent. Hopefully I'm running out of rakes to step on here!
> 
> v4: https://lore.kernel.org/all/20240227004414.841391-1-andrew@codeconstruct.com.au/
> 
>     Add constraints for gpio-line-names, ngpios as requested by Krzysztof:
>     https://lore.kernel.org/all/458becdb-fb1e-4808-87b6-3037ec945647@linaro.org/
> 
>     Add more examples to exercise constraints.

No, one or two examples (if there are quite different) is enough.

> 
> v3: https://lore.kernel.org/all/20240226051645.414935-1-andrew@codeconstruct.com.au/
> 
>     Base on v6.8-rc6, fix yamllint warning
> 
>     Rob's bot picked the missing `#interrupt-cells` in the example on v2[1]. The
>     patch was based on v6.8-rc1, and going back over my shell history I missed
>     the following output from `make dt_binding_check`:
> 
>     ```
>     ...
>       LINT    Documentation/devicetree/bindings
>       usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files] [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v] [FILE_OR_DIR ...]
>       yamllint: error: one of the arguments FILE_OR_DIR - is required   
>     ...
>     ```
> 
>     I've rebased on v6.8-rc6 and no-longer see the issue with the invocation
>     of `yamllint`.
> 
> [1]: https://lore.kernel.org/all/170892197611.2260479.15343562563553959436.robh@kernel.org/
> 
> v2: https://lore.kernel.org/all/20240226031951.284847-1-andrew@codeconstruct.com.au/
> 
>     Address feedback from Krzysztof:
>     https://lore.kernel.org/all/0d1dd262-b6dd-4d71-9239-8b0aec8cceff@linaro.org/
> 
> v1: https://lore.kernel.org/all/20240220052918.742793-1-andrew@codeconstruct.com.au/
> 
>  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 143 ++++++++++++++++++
>  .../devicetree/bindings/gpio/gpio-aspeed.txt  |  39 -----
>  2 files changed, 143 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> new file mode 100644
> index 000000000000..1aa28b1817cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed GPIO controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@codeconstruct.com.au>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-gpio
> +      - aspeed,ast2500-gpio
> +      - aspeed,ast2600-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: The clock to use for debounce timings
> +
> +  gpio-controller: true
> +  gpio-line-names: true

min/maxItems


> +  gpio-ranges: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  ngpios: true

minimum/maximum.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2400-gpio
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 220
> +          maxItems: 220
> +        ngpios:
> +          const: 220
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2500-gpio
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 232
> +          maxItems: 232
> +        ngpios:
> +          const: 232
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-gpio
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 36
> +          maxItems: 208
> +        ngpios:
> +          enum: [ 36, 208 ]
> +      required:
> +        - ngpios
Best regards,
Krzysztof

