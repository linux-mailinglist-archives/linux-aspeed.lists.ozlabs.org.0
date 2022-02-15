Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985854B7928
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 22:06:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jytv41PFkz3cGq
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 08:06:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.170;
 helo=mail-il1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jytv011lcz2xsc
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 08:06:50 +1100 (AEDT)
Received: by mail-il1-f170.google.com with SMTP id e8so15809857ilm.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 13:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B1+ZJcMtyBX3FqM5G6Lma2k2jOm6NmZZ5jVlCb7Pess=;
 b=ocUZOzKuBOyz1akWhOIzljPuSULijmBPlbHb7qghCn4j1pDYs7Hqd7GomNRELqZOat
 M0D6oX4Gy+uGkiprC65yzuKrwbu2C8op0OFo8+WR+mfg6Q6OBkFGKK0yDWQRQjcMJzT5
 eB6lg7PWQ55PQmTQMeV5HdkqnXJ6BfJGoGFmLzXqYRIj5k33ltwrY6n6y8kjsg/1rby4
 YXmEs5mZLbW+51QsBmt1TFnzHxwZdObU907RJkSXp4rMGIKqTcN7AzF3eTJOTJZ6r6ha
 5hnxHgPD/1WPC6cwhv7jgNKKrDn02ODG3Cf0Gho2W8YnrND3iEnkc0FQo6yf+IrGUeoV
 RbEw==
X-Gm-Message-State: AOAM530ec6+ZrkMhTKlw6xva7go/fnex60l9wP1WiGH6KiX6Uk4ZI7sw
 AqCytnNzOY90zD1Q55nQUg==
X-Google-Smtp-Source: ABdhPJx/uzMzNSMXMusiikoo4Gc24MlhELBj8Wua6sRn0ptpOYyIhLnne+CKrcXbcNur4Z/7s9dxng==
X-Received: by 2002:a05:6e02:20c6:: with SMTP id
 6mr569254ilq.242.1644959208389; 
 Tue, 15 Feb 2022 13:06:48 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id y29sm3877610iox.46.2022.02.15.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 13:06:47 -0800 (PST)
Received: (nullmailer pid 3921594 invoked by uid 1000);
 Tue, 15 Feb 2022 21:06:45 -0000
Date: Tue, 15 Feb 2022 15:06:45 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 02/10] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Message-ID: <YgwV5ZGCbrNhlk0s@robh.at.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220214094231.3753686-3-clg@kaod.org>
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

On Mon, Feb 14, 2022 at 10:42:23AM +0100, Cédric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> 
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> new file mode 100644
> index 000000000000..ed71c4d86930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -0,0 +1,92 @@
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
> +        reg = < 0x1e620000 0xc4
> +                0x20000000 0x10000000 >;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "aspeed,ast2600-fmc";
> +        clocks = <&syscon ASPEED_CLK_AHB>;
> +        status = "disabled";

Why is your example disabled? Drop 'status'.

> +        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +        flash@0 {
> +                reg = < 0 >;
> +                compatible = "jedec,spi-nor";
> +                spi-max-frequency = <50000000>;
> +                status = "disabled";

Ditto.

> +        };
> +        flash@1 {
> +                reg = < 1 >;
> +                compatible = "jedec,spi-nor";
> +                spi-max-frequency = <50000000>;
> +                status = "disabled";
> +        };
> +        flash@2 {
> +                reg = < 2 >;
> +                compatible = "jedec,spi-nor";
> +                spi-max-frequency = <50000000>;
> +                status = "disabled";
> +        };
> +    };
> -- 
> 2.34.1
> 
> 
