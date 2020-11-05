Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 897722A8A02
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Nov 2020 23:40:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRz4465rxzDqxd
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Nov 2020 09:40:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.52; helo=mail-ot1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRz3x47wmzDqxd
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Nov 2020 09:39:55 +1100 (AEDT)
Received: by mail-ot1-f52.google.com with SMTP id g19so2955683otp.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Nov 2020 14:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l33mjh6Y58sdX7p0bIXXnh8X4f5mWO8LY9kaS0QVJ4A=;
 b=uZ6jaS4qGEh0eto8j02hNW3xhTk7wA9js/dsaJPZV3eCFl5tkDynzL/SwhY7kS2eSR
 6s2325EkfUfJytmazJsdT0b/TFunbV7uUk+qWSwriX0UWpXxShsawM8DZunjdTM3PreM
 z4W/cWrp1mQR7UDDvRebgKA+o1CyyXbyesLnDIEvj1mFI+eQcBsQ2Um0dWRVOhloGlLc
 YtqWtog4knrXeO78apfcoWWPdphHHix8OQWZPwKuB/FC2DVj2rRghhqCcecEVM4NBkzI
 Fd/+OxsjbeNQPpKv256jbUASiUurCJBmouT9/GV9afTezcaxRZE0dedviUyYVlAJ+QC9
 zcbQ==
X-Gm-Message-State: AOAM5310uwpU+Pjn8iFlCsLfokUUspNYS//oeMCBg4QBP+svyn6U+vqg
 zaWSbBARHgGjk3CUp1MV9A==
X-Google-Smtp-Source: ABdhPJzDd/toUHUVegfNxYe5pmvS84hMCVzJYSgsN1/BIcuceQS9+OMgPmZABerM5vzQWRnLkG768w==
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr3430400otj.9.1604615992062;
 Thu, 05 Nov 2020 14:39:52 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x190sm693150oia.35.2020.11.05.14.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 14:39:50 -0800 (PST)
Received: (nullmailer pid 1931122 invoked by uid 1000);
 Thu, 05 Nov 2020 22:39:49 -0000
Date: Thu, 5 Nov 2020 16:39:49 -0600
From: Rob Herring <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: [v3 1/4] dt-bindings: spi: Add binding file for ASPEED FMC/SPI
 memory controller
Message-ID: <20201105223949.GA1927504@bogus>
References: <20201105120331.9853-1-chin-ting_kuo@aspeedtech.com>
 <20201105120331.9853-2-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105120331.9853-2-chin-ting_kuo@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, BMC-SW@aspeedtech.com, clg@kaod.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Nov 05, 2020 at 08:03:28PM +0800, Chin-Ting Kuo wrote:
> Create binding file with YAML syntax for ASPEED FMC/SPI memory controller.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  .../bindings/spi/aspeed,spi-aspeed.yaml       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml b/Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml
> new file mode 100644
> index 000000000000..41b9692c7226
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/aspeed,spi-aspeed.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/aspeed,spi-aspeed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI memory controller for ASPEED SoCs
> +
> +maintainers:
> +  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> +
> +description: |
> +  There are three SPI memory controllers embedded in a ASPEED SoC.
> +  They are usually connected to SPI NOR flashes. Each of them has
> +  more than a chip select. They also support SPI single, dual and
> +  quad IO modes for SPI NOR flash.
> +
> +allOf:
> +  - $ref: /spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

You can drop oneOf (there's only 1) and items.

> +          - enum:
> +              - aspeed,ast2600-fmc
> +              - aspeed,ast2600-spi
> +
> +  reg:
> +    items:
> +      - description: the control register location and length
> +      - description: the flash memory mapping address and length
> +
> +  clocks:
> +    description: AHB bus clock which will be converted to SPI bus clock

maxItems: 1

Constraints on num-cs values? Or up to 2^32 is good?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - num-cs
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    spi1: spi@1e630000 {
> +      compatible = "aspeed,ast2600-spi";
> +      reg = <0x1e630000 0xc4>, <0x30000000 0x10000000>;
> +      reg-names = "spi_ctrl_reg", "spi_mmap";
> +      clocks = <&syscon ASPEED_CLK_AHB>;
> +      num-cs = <2>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      flash@0 {
> +        compatible = "jedec,spi-nor";
> +        reg = <0>;
> +        spi-max-frequency = <50000000>;
> +      };
> +      flash@1 {
> +        compatible = "jedec,spi-nor";
> +        reg = <1>;
> +        spi-max-frequency = <50000000>;
> +      };
> +    };
> -- 
> 2.17.1
> 
