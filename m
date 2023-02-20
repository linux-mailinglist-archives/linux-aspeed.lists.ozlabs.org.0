Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9469C6CE
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 09:35:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKwj24tJyz3c81
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Feb 2023 19:35:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XWuKWkAU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XWuKWkAU;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKwhv2kHSz2ygG
	for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 19:35:10 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id h32so1655444eda.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Feb 2023 00:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPgdhAOmSIiYem88u79FyFtC580XWiSnDRefpcl3wxU=;
        b=XWuKWkAULnvOtoiztVJqveR6mJF0HJSLsHXvwCqTl47YE1Z09KyvXcf2p6HuH/9tS6
         1VDN4XRJZFPJ3TPX8UXippcMlEA0yObXO3eSR/pw60Ks8dgBAyQYb47UHzfHVXKItjVf
         9Lhk5+6yRVZi77L8OaxOOQFy9v8X+xQsKbG0ec3Fz7M534XEnmPtGXufX11HGrFzvseG
         JcYBiUgG+Qgda7WMkNL0PdAv9Mjw5qmgRhcA1s+o7HTP3BA5JqT7YhiRiPQ2WKLOaHq5
         W7DiYnGWmCTc+yiQohwONZc2jOyTKiV5RAdFIS9ni36dJWzATWW/GKDy3GnRl8boJl5o
         3iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPgdhAOmSIiYem88u79FyFtC580XWiSnDRefpcl3wxU=;
        b=hS7+J5kGFpc89PtO+7q+FDHcfdOBleTNhZDcQfMP7gdLr4EqB+uhwJRqFj526/Lv0K
         CcCrga2gK/rMcXgbjAVhEbYxO94qS/g/hWcsXkznoxbo3pvaR5IZUEnEHDPz4fGWjh0q
         UIyFgtXngGzUcNmvKGrcGbf9HEFRFbBic+T1rUvqqZIi7kcpmmrqWHN8Yj2t2nsReSkv
         hlcYWPZ4cjUhQLbg4YKAkA4k+FCLIvNNn/cQEVt9LaLL7JJpcZzFnlZ+oGuV3Q52dvEw
         41rJ9eSYZjibtVjJ8xfyZwoKbJ6C7qt/BowyoSi8R27SYm6lRVJMIcnA+Lwy5j7oD1Oz
         CetQ==
X-Gm-Message-State: AO0yUKWzXx+V+0wikhU7QV9f6TxBb05ekdN5dBJkZrNEL6SV3lC7wF4c
	H3JWn//ThWByxEGXnB10jzCJSw==
X-Google-Smtp-Source: AK7set80th0Zs5GwkSRoZ8yyoVVCdR5vADjna3NgcLVVDgQANN7HhHjfPwAuhBHbUzPjMXDUMdQ9sw==
X-Received: by 2002:a17:906:174b:b0:88e:e6ee:feab with SMTP id d11-20020a170906174b00b0088ee6eefeabmr9286561eje.62.1676882106773;
        Mon, 20 Feb 2023 00:35:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090629d000b008cc0294b69esm1665877eje.108.2023.02.20.00.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 00:35:06 -0800 (PST)
Message-ID: <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
Date: Mon, 20 Feb 2023 09:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
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

On 20/02/2023 07:17, Ryan Chen wrote:
> AST2600 support new register set for I2Cv2 controller, add bindings
> document to support driver of i2cv2 new register mode controller.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2cv2.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml

New compatible is okay, but as this is the same controller as old one,
this should go to old binding.

There are several issues anyway here, but I won't reviewing it except
few obvious cases.

> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml
> new file mode 100644
> index 000000000000..913fb45d5fbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2cv2.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2cv2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2Cv2 Controller on the AST26XX SoCs
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2cv2
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: address offset and range of register
> +      - description: address offset and range of buffer register

Why this is optional?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Reference clock for the I2C bus
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz. default 100khz.
> +
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus

Drop description and type. Just :true.

> +
> +  timeout:
> +    type: boolean
> +    description: Enable i2c bus timeout for master/slave (35ms)

Why this is property for DT? It's for sure not bool, but proper type
coming from units.

> +
> +  byte-mode:
> +    type: boolean
> +    description: Force i2c driver use byte mode transmit

Drop, not a DT property.

> +
> +  buff-mode:
> +    type: boolean
> +    description: Force i2c driver use buffer mode transmit

Drop, not a DT property.

> +
> +  aspeed,gr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - aspeed,gr
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    i2c: i2c-bus@80 {

You did not test the bindings... This is i2c.


Best regards,
Krzysztof

