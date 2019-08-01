Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637F7E61D
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2019 00:59:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4605Mh49x5zDqqY
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2019 08:59:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ROPgtKq1"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4605MW4ZvwzDqhN
 for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2019 08:59:19 +1000 (AEST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EB682084C
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2019 22:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564700356;
 bh=kASyP8PGtZ0rL4jNIcUKrCyx7pYnuPev55DZJBaSklM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ROPgtKq1KfpdkUQ/WwkuPZRlwKqXTl1UN7SM2HkqlXAf4hBAf34AxZLKGFbw4ZZ2J
 Uc27k6aqlqJJcItuknCk0YjdoQ5+l3aRVFpB/S+S3eE1o1tMYWccEuM7PbSu/SAS3d
 ld0XgBlBhhkxkSUs+J+EeCsS0vdcL9RptovKV4Ts=
Received: by mail-qt1-f177.google.com with SMTP id d23so72094048qto.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2019 15:59:16 -0700 (PDT)
X-Gm-Message-State: APjAAAWOv0wgIjlLNFBt7rp9N5yT9tWXchRnpnZYEihDyqns2zN/bUB3
 uK5JWO3HHkKpuJxyyIO5ILYQCbVzspyW2qyDqg==
X-Google-Smtp-Source: APXvYqx7WFIk+rochGPuukRrKofUEOPYVHhKW5sYMVeD23Voa28zVM0mZV9ERrGM3Tnt9e7Ssjzs/qZQDedTHVoiqog=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr96371146qve.72.1564700355781; 
 Thu, 01 Aug 2019 15:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190730062316.32037-1-andrew@aj.id.au>
 <20190730062316.32037-2-andrew@aj.id.au>
In-Reply-To: <20190730062316.32037-2-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 1 Aug 2019 16:59:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+oZRREV=VjYUxT3WphOa5tBaF1pvS_JKSphBY=3XB5MA@mail.gmail.com>
Message-ID: <CAL_Jsq+oZRREV=VjYUxT3WphOa5tBaF1pvS_JKSphBY=3XB5MA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: Document Aspeed SD controller
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
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 12:23 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the
> SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> data bus if only a single slot is enabled.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> ---
> v3:
> * Fix compatible enums
> * Add AST2600 compatibles
> * Describe #address-cells / #size-cells
> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> new file mode 100644
> index 000000000000..dd2a00c59641
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
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
> +    enum:
> +      - aspeed,ast2400-sd-controller
> +      - aspeed,ast2500-sd-controller
> +      - aspeed,ast2600-sd-controller
> +  reg:
> +    maxItems: 1
> +    description: Common configuration registers
> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 1
> +  ranges: true
> +  clocks:
> +    maxItems: 1
> +    description: The SD/SDIO controller clock gate
> +
> +patternProperties:
> +  "^sdhci@[0-9a-f]+$":

This should probably have:

allOf:
  - $ref: mmc-controller.yaml

Another new thing in 5.3. :)

> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - aspeed,ast2400-sdhci
> +          - aspeed,ast2500-sdhci
> +          - aspeed,ast2600-sdhci
> +      reg:
> +        maxItems: 1
> +        description: The SDHCI registers
> +      clocks:
> +        maxItems: 1
> +        description: The SD bus clock
> +      interrupts:
> +        maxItems: 1
> +        description: The SD interrupt shared between both slots
> +    required:
> +      - compatible
> +      - reg
> +      - clocks
> +      - interrupts
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - clocks
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    sdc@1e740000 {
> +            compatible = "aspeed,ast2500-sd-controller";
> +            reg = <0x1e740000 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges = <0 0x1e740000 0x10000>;
> +            clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
> +
> +            sdhci0: sdhci@100 {
> +                    compatible = "aspeed,ast2500-sdhci";
> +                    reg = <0x100 0x100>;
> +                    interrupts = <26>;
> +                    sdhci,auto-cmd12;

Not documented. Maybe should be common, but there's only a few users.

> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +            };
> +
> +            sdhci1: sdhci@200 {
> +                    compatible = "aspeed,ast2500-sdhci";
> +                    reg = <0x200 0x100>;
> +                    interrupts = <26>;
> +                    sdhci,auto-cmd12;
> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +            };
> +    };
> --
> 2.20.1
>
