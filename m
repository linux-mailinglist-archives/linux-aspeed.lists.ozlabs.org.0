Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC5C68C1FA
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Feb 2023 16:43:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9Vs768p1z3cZp
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 02:43:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eUivaHJ0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eUivaHJ0;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Vrz51HXz3bZj
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Feb 2023 02:42:56 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id r2so10780749wrv.7
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Feb 2023 07:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1rmMGWM7aksF5L0VhN0hng96AmwJQmBgJkYeuHcTuM=;
        b=eUivaHJ0jtk9IWS0bvVWDSWywjwYk5UB4FE53XcrSGCVqpcgbb4/hbj182pPavI6XD
         1jL/Pzsvcgd5HGmgD/5CW6w/pUxViztOiOcALe6aWgZZXSnBUx10Tn8++pz2fctcB6rr
         /kFKsBf3t8fRYchlajl75pWf9V+UCNHBqzLStOidhoiro4hiWUK2ii2h4E5fpUP9QSsi
         dxpaoHbyU35Jx32PofG5+T/bLOQ1afOvoB2OB/cSAU00NHlbsqMbMLC8R0es1WM/QooR
         R6Tl7uOs4h2ZZsNfBAfkPhwvAX2Nmd4IoDUIuk3//OJzj97ndYi+LIlnmgykktNp4z5B
         4FkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1rmMGWM7aksF5L0VhN0hng96AmwJQmBgJkYeuHcTuM=;
        b=oc4Ht42Zqs6j61AGZOj+c3iq1Sxl4bT9lody9xRwWutOCwoDdIOkXiGTpxbr3L8WQ1
         hjopevED0FiFQdxHB6NAD4y8jraWTjE0YoCL+WG0z8muJLN1OmK8cPK21pPF7YwT+SLF
         Y3OtTOzyOEcuH1yZagG60FVUasoAPPOOx8X/h8wHl+pRP8X3AZ7+XQWWkm/unHy5o2D1
         uXwxhQkIv2xWuyrEXLWaB/NxptXaJYly6vX8NFtapFXoMJpf/nMClneSObe2IFcLeCcX
         v8B0DhL3M3stIoyE8zFWvgaUegH+B683Jb6AoKep5j3Lsp+TftlmN8ioZ2TYoprhA0rL
         5t7g==
X-Gm-Message-State: AO0yUKVdRFR+DwjoCgFi2Iwi5jZ3wLgIO+qYAkFk+/FqIp5qdAUq5V9E
	9FxOipMYXhuDMvucnXynOY+8QQ==
X-Google-Smtp-Source: AK7set8IA3MEZbh+5u3YvK+B/yEpB076Ei6+jP+uA5+zZcW4IbMJdR2TCrTzSRvBwRayAY0ZaLu6Vw==
X-Received: by 2002:a5d:6b89:0:b0:2bf:ae2f:c6ff with SMTP id n9-20020a5d6b89000000b002bfae2fc6ffmr17416492wrx.31.1675698171248;
        Mon, 06 Feb 2023 07:42:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5002000000b002c3be6ae0b1sm9092299wrt.65.2023.02.06.07.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 07:42:50 -0800 (PST)
Message-ID: <f44fd173-07f3-6e08-8d3d-2a5bf538259a@linaro.org>
Date: Mon, 6 Feb 2023 16:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings : misc : aspeed,cvic interrupt controller :
 convert the binding document to yaml
Content-Language: en-US
To: Vijaya Anand <sunrockers8@gmail.com>
References: <20230206153325.43692-1-sunrockers8@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153325.43692-1-sunrockers8@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Subject: incorrect format. Use style consistent with subsystem (git log).


On 06/02/2023 16:33, Vijaya Anand wrote:
>     Convert the binding document for ASPEED AST2400 and AST2500 coprocessor interrupt controller
>     from txt to yaml so one could validate dt-entries correctly and any future additions can go
>     into yaml format. The options for compatability described according to the example given.

Weird commit msg indentation, wrong wrapping.
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

typo - compatibility

> ---
>  .../devicetree/bindings/misc/aspeed,cvic.txt  | 35 ----------
>  .../devicetree/bindings/misc/aspeed,cvic.yaml | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.yaml

It is interrupt controller, so move it to interrupt-controller directory.

> 
> diff --git a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt b/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
> deleted file mode 100644
> index d62c783d1d5e..000000000000
> --- a/Documentation/devicetree/bindings/misc/aspeed,cvic.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -* ASPEED AST2400 and AST2500 coprocessor interrupt controller
> -
> -This file describes the bindings for the interrupt controller present
> -in the AST2400 and AST2500 BMC SoCs which provides interrupt to the
> -ColdFire coprocessor.
> -
> -It is not a normal interrupt controller and it would be rather
> -inconvenient to create an interrupt tree for it as it somewhat shares
> -some of the same sources as the main ARM interrupt controller but with
> -different numbers.
> -
> -The AST2500 supports a SW generated interrupt
> -
> -Required properties:
> -- reg: address and length of the register for the device.
> -- compatible: "aspeed,cvic" and one of:
> -		"aspeed,ast2400-cvic"
> -	      or
> -		"aspeed,ast2500-cvic"
> -
> -- valid-sources: One cell, bitmap of supported sources for the implementation
> -
> -Optional properties;
> -- copro-sw-interrupts: List of interrupt numbers that can be used as
> -		       SW interrupts from the ARM to the coprocessor.
> -		       (AST2500 only)
> -
> -Example:
> -
> -	cvic: copro-interrupt-controller@1e6c2000 {
> -		compatible = "aspeed,ast2500-cvic";
> -		valid-sources = <0xffffffff>;
> -		copro-sw-interrupts = <1>;
> -		reg = <0x1e6c2000 0x80>;
> -	};
> diff --git a/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml b/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
> new file mode 100644
> index 000000000000..bbff0418fa2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/aspeed,cvic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2400 and AST2500 coprocessor interrupt controller
> +
> +maintainers: 
> +  - Benjamin Herrenschmidt <benh@kernel.crashing.org>
> +  - Rob Herring <robh@kernel.org>

These should be people having/knowing/responsible for hardware. I doubt
Rob has any interest in Aspeed...

> +
> +description: |
> +  This file describes the bindings for the interrupt controller present

Drop "This file describes the bindings for the" but instead rephrase it
and describe the hardware.

> +  in the AST2400 and AST2500 BMC SoCs which provides interrupt to the
> +  ColdFire coprocessor.
> +
> +  It is not a normal interrupt controller and it would be rather
> +  inconvenient to create an interrupt tree for it as it somewhat shares
> +  some of the same sources as the main ARM interrupt controller but with
> +  different numbers.
> +
> +  The AST2500 supports a SW generated interruptThe Soft Decision Forward Error Correction (SDFEC) Engine is a Hard IP block

Fix your wrapping and sentences.

> +  which provides high-throughput LDPC and Turbo Code implementations.
> +  The LDPC decode & encode functionality is capable of covering a range of
> +  customer specified Quasi-cyclic (QC) codes. The Turbo decode functionality
> +  principally covers codes used by LTE. The FEC Engine offers significant
> +  power and area savings versus implementations done in the FPGA fabric.
> +
> +properties:
> +

Drop blank line.

> +  compatible:
> +    enum: 
> +      - aspeed,ast2400-cvic
> +      - aspeed,ast2500-cvic
> +
> +  reg:
> +    maxItems: 1
> +    description: address and length of the register for the device.

Drop description

> +  
> +  valid-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: One cell, bitmap of supported sources for the implementation
> +
> +  copro-sw-interrupts:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |

Drop | and do fix wrapping.

> +                  List of interrupt numbers that can be used as
> +                  SW interrupts from the ARM to the coprocessor.
> +                  (AST2500 only)
> +
> +required:
> +  - compatible
> +  - reg
> +  - valid-sources
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cvic: copro-interrupt-controller@1e6c2000 

That's not DT coding style. Open DTS and look how this is coded in ARM.

Node name: interrupt-controller
Drop label.

> +    {
> +        compatible = "aspeed,ast2500-cvic";
> +        valid-sources = <0xffffffff>;
> +        copro-sw-interrupts = <1>;
> +        reg = <0x1e6c2000 0x80>;

reg is second property

> +    };

Best regards,
Krzysztof

