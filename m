Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB04CB144
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 22:26:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K86dD731fz3brl
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 08:26:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.44; helo=mail-oo1-f44.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K86d66x8Kz30QR
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 08:26:49 +1100 (AEDT)
Received: by mail-oo1-f44.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso3495157ooi.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 13:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hbPLIPVEhqYqHfs1Um9iAPDP4qWKQ+uSdm7/6sopBSs=;
 b=pAGe6+rDWy/5dPGrnlP630oSKZZ8imoqU1489x6aTYXqrC9t44ocUzLq/Zvh7O+a68
 8UNGV/LOkqhsFWy6tvXC2mFtSb564niENj6kPJNMRJldg1BmA1n2iJ53b1bkO5H7Pwdq
 2Vq0K3outuQq5ED91GoeAk2kt1733YP8aIyn/DtkwzLpEQG/Xt6Pbm3NBbLEN0dumdmy
 DJXsUndLCJYwoXX///E4Xmr/AUwJXzgeRPFwjBo90iO9YP1fl7njPrdUeYcxtmuOIDw4
 hIVvcTWz7ZPBVDzGsXw+psgJ/aKE88PHSvot+7MQQ2+P6sNNkvCjwu+BdOBoVMiVH3JU
 FR1A==
X-Gm-Message-State: AOAM530UCAd5pnBW5av0E8PdGLmHZGVVVae4FV+sX89cSftc5DVqYYIz
 5PLcd1wjw3gwwHTORpQg2g==
X-Google-Smtp-Source: ABdhPJze+wINl7VQoz5UIFxIOi5ofrkD+iYOPHxAw6NzR+bGkT+e8/nTZouORjU+OMOwKXIhDU/5pA==
X-Received: by 2002:a05:6870:1242:b0:d3:6168:3191 with SMTP id
 2-20020a056870124200b000d361683191mr1471979oao.9.1646256407349; 
 Wed, 02 Mar 2022 13:26:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 p185-20020aca5bc2000000b002d97bda3871sm49303oib.54.2022.03.02.13.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 13:26:46 -0800 (PST)
Received: (nullmailer pid 79377 invoked by uid 1000);
 Wed, 02 Mar 2022 21:26:45 -0000
Date: Wed, 2 Mar 2022 15:26:45 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Message-ID: <Yh/hFS2XW9SjK4Pl@robh.at.kernel.org>
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302173114.927476-4-clg@kaod.org>
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 02, 2022 at 06:31:07PM +0100, Cédric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> 
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 90 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> new file mode 100644
> index 000000000000..0289a4f52196
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/aspeed,ast2600-fmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed SMC controllers bindings
> +
> +maintainers:
> +  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> +  - Cédric Le Goater <clg@kaod.org>
> +
> +description: |
> +  This binding describes the Aspeed Static Memory Controllers (FMC and
> +  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-fmc
> +      - aspeed,ast2600-spi
> +      - aspeed,ast2500-fmc
> +      - aspeed,ast2500-spi
> +      - aspeed,ast2400-fmc
> +      - aspeed,ast2400-spi
> +
> +  reg:
> +    items:
> +      - description: registers
> +      - description: memory mapping
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "@[0-9a-f]+":
> +    type: object
> +
> +    properties:
> +      spi-rx-bus-width:
> +        enum: [1, 2, 4]
> +
> +    required:
> +      - reg

No need for required here, spi-controller.yaml already enforces that.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    spi@1e620000 {
> +        reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "aspeed,ast2600-fmc";
> +        clocks = <&syscon ASPEED_CLK_AHB>;
> +        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +        flash@0 {
> +                reg = < 0 >;
> +                compatible = "jedec,spi-nor";
> +                spi-max-frequency = <50000000>;
> +                spi-rx-bus-width = <2>;
> +        };
> +        flash@1 {
> +                reg = < 1 >;
> +                compatible = "jedec,spi-nor";
> +                spi-max-frequency = <50000000>;
> +                spi-rx-bus-width = <2>;
> +        };
> +        flash@2 {
> +                reg = < 2 >;
> +                compatible = "jedec,spi-nor";
> +                spi-max-frequency = <50000000>;
> +                spi-rx-bus-width = <2>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4175103e928d..f5ab77548ef6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2925,6 +2925,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>  F:	drivers/mmc/host/sdhci-of-aspeed*
>  
> +ASPEED SMC SPI DRIVER
> +M:	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> +M:	Cédric Le Goater <clg@kaod.org>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-spi@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> +
>  ASPEED VIDEO ENGINE DRIVER
>  M:	Eddie James <eajames@linux.ibm.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.34.1
> 
> 
