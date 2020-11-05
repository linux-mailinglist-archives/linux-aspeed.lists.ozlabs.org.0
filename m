Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67F2A8637
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Nov 2020 19:40:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRslz4rQzzDr4Q
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Nov 2020 05:40:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRslt1JJvzDr3L
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Nov 2020 05:40:42 +1100 (AEDT)
Received: by mail-ot1-f54.google.com with SMTP id j14so2381009ots.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Nov 2020 10:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ROW7gLPvsixXdOUBku/rceehiE2QxPW3Gr2HLN1Tahs=;
 b=Oo+z5/n8amFf41EXiOFqxMjCMyzgU85CoWHNpSYtOeIuYM4vbuqsSaTOTbR/XKss60
 LYza7K2Vp/uwpci+U10ExVuDr01GqJhcW10uaCCQaJtijWpfbtCX1Cz6UWRnzRmt83pN
 MbM6U+LGZGNr2p6lKdCiCV7evQJKVqE/togReifUyWvW3aEA3pJlW+cMfGMy6fvTlHzv
 dnuJPv6K5VvFPu4b8sJPLkmK6f6MgT0fb9rzVPJAhokt85ZqL63DBzfZ1HyXw8DKMd/u
 sctKDbfS4OrquLXlxqaNbiUMnRD7htFxHjsaui4Xf0zED5iY8yIEih/1JK/4/d3KJTZh
 T41A==
X-Gm-Message-State: AOAM530aAb6au+mEbtD0Ys7b5QHYiQTJDixfUzbN1HEocRgbbVnoxzHY
 ZPbDouUoC/oYQD6shlT44g==
X-Google-Smtp-Source: ABdhPJwG1vUWe+mtCQWNMutnJxx2eoLNJArHfDOqxJL78DdzeDgv3gng8hQNHFIW5vfeIqU7slQlcQ==
X-Received: by 2002:a9d:7d87:: with SMTP id j7mr2645271otn.356.1604601638458; 
 Thu, 05 Nov 2020 10:40:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s26sm530580ood.38.2020.11.05.10.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:40:37 -0800 (PST)
Received: (nullmailer pid 1609469 invoked by uid 1000);
 Thu, 05 Nov 2020 18:40:36 -0000
Date: Thu, 5 Nov 2020 12:40:36 -0600
From: Rob Herring <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: [v2 1/4] dt-bindings: spi: Add binding file for ASPEED FMC/SPI
 memory controller
Message-ID: <20201105184036.GA1607865@bogus>
References: <20201103072202.24705-1-chin-ting_kuo@aspeedtech.com>
 <20201103072202.24705-2-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103072202.24705-2-chin-ting_kuo@aspeedtech.com>
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

On Tue, Nov 03, 2020 at 03:21:59PM +0800, Chin-Ting Kuo wrote:
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

Need to define how many clocks (maxItems: 1).

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
