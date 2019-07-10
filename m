Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599664A95
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 18:15:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPRx0Mq2zDqY3
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 02:15:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="dNr4F5Ha"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNtK5497zDqlw
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 01:50:01 +1000 (AEST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F008721530
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2019 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562773799;
 bh=f3705MLDMz7ZVRIZ/2mbpGAvk6+s8V0oHG6b0/yE9pg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dNr4F5HawxLIUhCtkX+gOEjtuf9BGR0CEIsliRqZH2O9ZtsdBVaq2kRHWU6Hi1+fo
 XRZwgaoUmOgituexlwOZw6yF+zL0fvnshjkK4ofv79S4KQTO3bO3TnB7b8CachtiCF
 KS0ZkAhzVzVQnnkBbUi8ZqjFD274etLB6JypO9QY=
Received: by mail-qt1-f177.google.com with SMTP id 44so2911942qtg.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2019 08:49:58 -0700 (PDT)
X-Gm-Message-State: APjAAAVHxs9iFF7oXTV1YOxN2yDWR7H8imgDDhPSdwcIS7Jf15Rcmue1
 6wJcA082o3dI4EFJ8t2kL9gmwyPAR6u8zGg5GQ==
X-Google-Smtp-Source: APXvYqz6I/p/hMSsLLeh44Lioj37XHZzwUteYHfVHSa7jufX40UundN85FK+bOouu15+3Q3HfQJkSkXH5cMd8kt4WyU=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr25025832qtc.300.1562773798149; 
 Wed, 10 Jul 2019 08:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190710141611.21159-1-andrew@aj.id.au>
 <20190710141611.21159-2-andrew@aj.id.au>
In-Reply-To: <20190710141611.21159-2-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 10 Jul 2019 09:49:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKrYcUbn_02z9GQO6U4rz7k=p3kB7_G0tKmv25MMZZNQg@mail.gmail.com>
Message-ID: <CAL_JsqKrYcUbn_02z9GQO6U4rz7k=p3kB7_G0tKmv25MMZZNQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: Document Aspeed SD controller
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 ryanchen.aspeed@gmail.com, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2019 at 8:16 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the
> SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> data bus if only a single slot is enabled.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/mmc/sdhci-of-aspeed.yaml         | 91 +++++++++++++++++++

aspeed,sdhci.yaml

>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml b/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
> new file mode 100644
> index 000000000000..e98a2ac4d46d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later

The preferred license is (GPL-2.0 OR BSD-2-Clause) if that is okay with you.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/sdhci-of-aspeed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED SD/SDIO/eMMC Controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +  - Ryan Chen <ryanchen.aspeed@gmail.com>
> +
> +description: |+
> +  The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the SDIO
> +  Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit data bus if
> +  only a single slot is enabled.
> +
> +  The two slots are supported by a common configuration area. As the SDHCIs for
> +  the slots are dependent on the common configuration area, they are described
> +  as child nodes.
> +
> +properties:
> +  compatible:
> +    enum: [ aspeed,ast2400-sdc, aspeed,ast2500-sdc ]
> +  reg:
> +    description: Common configuration registers

This should have a 'maxItems: 1'. Same for the child reg.

> +  ranges: true
> +  clocks:
> +    maxItems: 1
> +    description: The SD/SDIO controller clock gate
> +  sdhci:

This needs to be a pattern (under patternProperties) as these have
unit-addresses.

> +    type: object
> +    properties:
> +      compatible:
> +        allOf:
> +          - enum: [ aspeed,ast2400-sdhci, aspeed,ast2500-sdhci ]
> +          - const: sdhci

This condition can never be true. What you need is s/allOf/items/.
However, 'sdhci' is not really a useful compatible because every
implementation has quirks, so I'd drop it.

> +      reg:
> +        description: The SDHCI registers
> +      clocks:
> +        maxItems: 1
> +        description: The SD bus clock
> +      slot:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [0, 1]

Is this really needed? Offset 0x100 is slot 0 and offset 0x200 is slot
1. Does that ever change?

> +      interrupts:
> +        maxItems: 1
> +        description: The SD interrupt shared between both slots
> +    required:
> +      - compatible
> +      - reg
> +      - clocks
> +      - slot
> +      - interrupts
> +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - clocks

#address-cells and #size-cells are required too.

You should also add 'additionalProperties: false' here so other random
properties can't be present.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    sdc@1e740000 {
> +            compatible = "aspeed,ast2500-sdc";
> +            reg = <0x1e740000 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;

It's preferred to limit the range here and then the child addresses
are 0x100 and 0x200.

> +            clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
> +
> +            sdhci0: sdhci@1e740100 {
> +                    compatible = "aspeed,ast2500-sdhci", "sdhci";
> +                    reg = <0x1e740100 0x100>;
> +                    slot = <0>;
> +                    interrupts = <26>;
> +                    sdhci,auto-cmd12;
> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +            };
> +
> +            sdhci1: sdhci@1e740200 {
> +                    compatible = "aspeed,ast2500-sdhci", "sdhci";
> +                    reg = <0x1e740200 0x100>;
> +                    slot = <1>;
> +                    interrupts = <26>;
> +                    sdhci,auto-cmd12;
> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +            };
> +    };
> --
> 2.20.1
>
