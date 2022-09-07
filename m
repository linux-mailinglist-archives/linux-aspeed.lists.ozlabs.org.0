Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A49475B0E75
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 22:48:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNDqV6pn9z3bcv
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Sep 2022 06:48:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.42; helo=mail-oa1-f42.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNDqN0Wxbz2xrk
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Sep 2022 06:48:14 +1000 (AEST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-127ba06d03fso15462696fac.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Sep 2022 13:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OgZSfbLdmWOALRRb7JBf/hZJkZ02I3rXxvpAaPJjtss=;
        b=Dd4UbHWcXJWfjlpvoYoZjEf1IJOTLjOvWqkVfs/evyM/o2N7X9NJpvZu8oVBFoRBjg
         uujZsMwEgaTRYXCtot/EL56TjGUaB7cydpfdszQoJ6y0Cjs7Y6oULw1VRk/mlQMSVTP7
         /RpC1psSQyV5Tp535L7rgNDxdHBhj3cmN1ilEjM7CUKcr5f9kHSjP1eru+Dd0YLMt82k
         BZEEENdKhLVleLU9HFMOBxkDsgJo1GTFedaUmRSZ//7LzW6ak08rUdECfi4UT2f+if8E
         DyN4FzUKMogwzHRY/Sv0kOuvWT8+aIRVPEiJe1v5e9X3qzx++4FxlfzXZPiOkpIFLS+o
         Z2fQ==
X-Gm-Message-State: ACgBeo0QL7QAjjcTS5G06wcSSrm9XgQhvYMIasunG4/Jqa0Y9mnahnQ0
	ltWfbLWSioS5KA1XHjY9Sw==
X-Google-Smtp-Source: AA6agR6NS6tXDzOLHfWF+BuC8XbobxkJmCcNwfL3/mQLtSgFA6uV0lRUjSxT5Zi+7Jar40NgasRRDg==
X-Received: by 2002:a05:6870:a791:b0:10d:8606:c68b with SMTP id x17-20020a056870a79100b0010d8606c68bmr165876oao.234.1662583691370;
        Wed, 07 Sep 2022 13:48:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w8-20020a9d5388000000b00616d3ec6734sm7400219otg.53.2022.09.07.13.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:48:11 -0700 (PDT)
Received: (nullmailer pid 316597 invoked by uid 1000);
	Wed, 07 Sep 2022 20:48:10 -0000
Date: Wed, 7 Sep 2022 15:48:10 -0500
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v1 3/4] dt-bindings: crypto: add documentation for Aspeed
 ACRY
Message-ID: <20220907204810.GA312863-robh@kernel.org>
References: <20220902060012.3758637-1-neal_liu@aspeedtech.com>
 <20220902060012.3758637-4-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902060012.3758637-4-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 02:00:11PM +0800, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed
> ECDSA/RSA ACRY Engines Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  .../bindings/crypto/aspeed,ast2600-acry.yaml  | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
> new file mode 100644
> index 000000000000..192b40cd0a39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED ACRY ECDSA/RSA Hardware Accelerator Engines Device Tree Bindings

Drop ' Device Tree Bindings'

> +
> +maintainers:
> +  - Neal Liu <neal_liu@aspeedtech.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  The ACRY ECDSA/RSA engines is designed to accelerate the throughput
> +  of ECDSA/RSA signature and verification. Basically, ACRY can be
> +  divided into two independently engines - ECC Engine and RSA Engine.

independent

> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-acry
> +
> +  reg:
> +    items:
> +      - description: acry base address & size
> +      - description: acry sram base address & size
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    acry: crypto@1e6fa000 {
> +        compatible = "aspeed,ast2600-acry";
> +        reg = <0x1e6fa000 0x400>, <0x1e710000 0x1800>;
> +        interrupts = <160>;
> +        clocks = <&syscon ASPEED_CLK_GATE_RSACLK>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 832da6d77374..09ab1c3adbb7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3214,7 +3214,7 @@ ASPEED CRYPTO DRIVER
>  M:	Neal Liu <neal_liu@aspeedtech.com>
>  L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/crypto/aspeed,ast2500-hace.yaml
> +F:	Documentation/devicetree/bindings/crypto/aspeed,*
>  F:	drivers/crypto/aspeed/
>  
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
> -- 
> 2.25.1
> 
> 
