Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8C6D19AF
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 10:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PntXf1lZzz3fRC
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 19:21:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vnK9Srpy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vnK9Srpy;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PntXW3jxyz3cS4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 19:20:57 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id g17so27901004lfv.4
        for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680250850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LUNkFuCTpo4s4pgp3f84iyIbx4Bw8H+Fc6h+bxeTiw=;
        b=vnK9SrpyCi2xClxl047xnsMiazCp+evXnfM94UyrkMroflDjoHo0IsTsIHnFtmGaPU
         r5JkdFFVVc/P4vVm/UNt+R/5f7hDZizpcqfDEaTyJfKGx70Jz393RSBHm1lU0hbJd1aS
         80uIPfpbbBDXRRXwzDTdmRplKAjnRuwlDe7xak9r78c0OkcbG3AWbFXUhOfcIhqkIOMj
         SvuhuXmWxG+eCbakEzI9M7l4NiuFy5SOrVKVfDV2fRxMgoJq+kNSFsW9m2Vl5QP9Ms5v
         Bs4VgiT7zWkKdQr6vfsRDy0b60T1mDFryOI5eUdISSXdAxoyWqSEmqCHc/kXvPsvNaA4
         b/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680250850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LUNkFuCTpo4s4pgp3f84iyIbx4Bw8H+Fc6h+bxeTiw=;
        b=I01kfhL3oMp6LnaG/O2OWX33otOlgmHtQWYhvvnmOletEonCItEC5trVbP5pEP/6AR
         WmrRM616+A2/Ejiv83IE8yZeEutGIE/wDq5/nljAJeHnolALuQpeEWbnQL4H4UJuggAc
         GMrHk7627khuzAowwCc3nFEPzQi4iMJ7CMBy7fw5ufYnacqQG/11SHPOeJenJRaf4IFa
         aQeeSwBmnI702EktnvGo3n57HDEbmF++Q4iB3NutntRjwuVsFo0NsixMopBoWbFCT92x
         /96T/coC0QKkwrWvCJ3fWQbwxMnqRjmbwjs+Dm3lx1ZRjgOtD5skVcFWtNE+3m/Fq+o6
         oHmw==
X-Gm-Message-State: AAQBX9d+GA0ZI2ermh8wQ8PKoAWOCBVnLhz+jE0nXBXD93OjS0gEY4Br
	AsuzjSAdoztN8E4Xtrcjh/5aDg==
X-Google-Smtp-Source: AKy350ZyfH9M+fjJb2kjVrDFFL4yGwUxC1GNjIzGKIoXexJfz+KUvKqVPA1Oj4jRuqhm260Hiv/AuQ==
X-Received: by 2002:ac2:5963:0:b0:4d5:ae35:b221 with SMTP id h3-20020ac25963000000b004d5ae35b221mr7310080lfp.34.1680250850054;
        Fri, 31 Mar 2023 01:20:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004a9b9ccfbe6sm282482lfq.51.2023.03.31.01.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:20:49 -0700 (PDT)
Message-ID: <a4f12cc9-d9d2-2805-f9fa-58eafe0b976c@linaro.org>
Date: Fri, 31 Mar 2023 10:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>, linux-aspeed@lists.ozlabs.org
References: <20230330073259.485606-1-ryan_chen@aspeedtech.com>
 <20230330073259.485606-2-ryan_chen@aspeedtech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330073259.485606-2-ryan_chen@aspeedtech.com>
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

On 30/03/2023 09:32, Ryan Chen wrote:
> Fix typo in maintainer's name and email.
> Remove ddress-cells, size-cells.

Typo: address?

> Use Compatible and reg are always first properties.

I don't understand this at all - what does it explain here? It looks
unrelated, just random sentence in the middle of commit msg.

> Add ast2600-i2cv2 compatible and aspeed,global-regs,
> aspeed,enable-dma and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 56 +++++++++++++++++--
>  1 file changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index f597f73ccd87..81e8ced64900 100644
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
> @@ -57,12 +73,30 @@ required:
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
>      i2c0: i2c-bus@40 {
> -      #address-cells = <1>;
> -      #size-cells = <0>;

Why? Indeed without children this is not really needed, but it points to
the fact that your example without children is not entirely complete.

Anyway you are doing now way too many things in one patch.

https://elixir.bootlin.com/linux/v5.19-rc5/source/Documentation/process/submitting-patches.rst


>        compatible = "aspeed,ast2500-i2c-bus";
>        reg = <0x40 0x40>;
>        clocks = <&syscon ASPEED_CLK_APB>;
> @@ -71,3 +105,13 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      compatible = "aspeed,ast2600-i2cv2";
> +      reg = <0x80 0x80>, <0xc00 0x20>;
> +      aspeed,global-regs = <&i2c_global>;
> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +    };

Best regards,
Krzysztof

