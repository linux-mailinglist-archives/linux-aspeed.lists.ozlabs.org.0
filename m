Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D76CBE0D
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Mar 2023 13:49:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm7JC3TZ6z3c8f
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Mar 2023 22:49:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BcznN7lk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BcznN7lk;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm7J35HN3z3bsK
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Mar 2023 22:49:06 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id eg48so48371069edb.13
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Mar 2023 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680004142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+gYkRLzPec9yxMWag3b4xjfGsVDDrPt8d2gXGuiwhyc=;
        b=BcznN7lkFma/0TZivl0KEICrWqRi9TGqtA9tTzAXu3QKGkxmXRQy0cH4kpcUe2z1vX
         bf3FLFqPc6dlbK79FiXeAnyr77XeCuI3YLCK+9MQBJgGMncLKrUozLL8eiSxhyqEUrjf
         4P72EC2tko+O1J2pfvPy7ZR/HddvVf5FSHPXS6DPt9THl5RtsHe1OWjl2m8bnP6NS2c1
         AZyyjBTU6QMhe/u7OSYAWQQU2rWm0lONPS0cIqnJNSgqjOIHI04omf/OODgeAHvHWOBX
         hXj16q0gwBjAAsfuDUfUocFZ8ZyYXpOwbgyS3zbT9k/dnSPwHG5n+IUqk1rfJPYYzpLF
         7Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680004142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gYkRLzPec9yxMWag3b4xjfGsVDDrPt8d2gXGuiwhyc=;
        b=lKGvUF7Wuixehdr/opVdODsADIgCISY9QU/UTrjsWP2z071Hz82ldBOdosqEskeGri
         ciKG4dibhp5NQyGL4t/nBLao0W2lnJz7NnYwJxe6EkavMndABzJ6VXVoqYxusEwJwmq/
         VTTWVKHYrGlmuFtjRh/SgYcN8Zzc6iPInzmzKBsVzDLcPCjgAibfUG8/LgN+ih20yR7Y
         Aqxx2DfIJpB5Y4VHEnJRmuFsb/N2obocWZ5Oqpy4ZYcb4bLGjWrnVw81mvZNNcezJ2RR
         DrSuFDyO2Dv5xhW8frUoukyP4qPUsvzitFGOSm3dx+NJ9VrmHkDMIbFCgxGJrW2MIXoc
         RYtA==
X-Gm-Message-State: AAQBX9eiLwnkHzxptVssl7NR4ygz6mzopImywXh38cH06sLPrdjgn/hM
	VJqU2o9urEjeC14lq0RwwG0rZQ==
X-Google-Smtp-Source: AKy350bF2c+luO4tOJ29JP8/XWmMZiTM2EJbdUi9zxizj83KcYXCQa4KgOsVqm+2Qp/3W18lnOXdyA==
X-Received: by 2002:a17:906:ac1:b0:92d:9767:8e0a with SMTP id z1-20020a1709060ac100b0092d97678e0amr13886925ejf.13.1680004141784;
        Tue, 28 Mar 2023 04:49:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id x23-20020a50d617000000b004fa268da13esm15980472edi.56.2023.03.28.04.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 04:49:01 -0700 (PDT)
Message-ID: <13440581-cc57-d47a-4745-c89a729f240b@linaro.org>
Date: Tue, 28 Mar 2023 13:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>, linux-aspeed@lists.ozlabs.org
References: <20230327092524.3916389-1-ryan_chen@aspeedtech.com>
 <20230327092524.3916389-2-ryan_chen@aspeedtech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327092524.3916389-2-ryan_chen@aspeedtech.com>
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

On 27/03/2023 11:25, Ryan Chen wrote:
> Update ASPEED I2C maintainers email.

Everything is an update. Describe what is wrong in original maintainer
email (e.g. Fix typo in maintainer's name and email).

> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 56 +++++++++++++++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index f597f73ccd87..00b92c97f432 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -7,10 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
>  
>  maintainers:
> -  - Rayn Chen <rayn_chen@aspeedtech.com>
> -
> -allOf:
> -  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
>  
>  properties:
>    compatible:
> @@ -49,6 +46,25 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  aspeed,enable-dma:
> +    type: boolean
> +    description: |
> +      I2C bus enable dma mode transfer.
> +
> +      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
> +      single DMA engine. DTS files can specify the data transfer mode to/from
> +      the device, either DMA or programmed I/O. However, hardware limitations
> +      may require a DTS to manually allocate which controller can use DMA mode.
> +      The "aspeed,enable-dma" property allows control of this.
> +
> +      In cases where one the hardware design results in a specific
> +      controller handling a larger amount of data, a DTS would likely
> +      enable DMA mode for that one controller.
> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.
> +
>  required:
>    - reg
>    - compatible
> @@ -57,6 +73,26 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
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
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> @@ -71,3 +107,15 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "aspeed,ast2600-i2cv2";
> +      reg = <0x80 0x80>, <0xc00 0x20>;

Compatible and reg are always first properties in DTS.

> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      aspeed,global-regs = <&i2c_global>;

Best regards,
Krzysztof

