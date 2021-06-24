Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E07ED3B38AD
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Jun 2021 23:29:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9tYg548jz3bnR
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Jun 2021 07:29:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.45; helo=mail-io1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9tYb47M0z306m
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Jun 2021 07:29:06 +1000 (AEST)
Received: by mail-io1-f45.google.com with SMTP id b14so10033872iow.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Jun 2021 14:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y+ykEWYcQLjlgpcIIfyX0n0bLIPZS2IJ5iGmNYAn4LQ=;
 b=NLvuy34ovRn6A6TWAIa2RJqyll5VEohzFjGHuPBaDJKcQBZ+gvsMH7KbwLgpVi1SLZ
 /2s2ZjS2/8C/ixtr2+JoICZxVEzGrDDL3bbNzr5FOod8shUwzOq8Pk807LnUBMHJn1fc
 ip6Ma1zsBbw7hJXpiF3sJ9RZmzZnfjYonkFMYdt1n0mrpXABen8ZIC7N9A6j11yJ/iJ7
 SyTMsIGvpdLMVa7ExexGPit71bQLnBSExsKTYbjT9i8NumPFnhBSpvgcD8VlebWGAge6
 HBQmsT6GuT/V/e0py3ojComEsFkXm1naW5QihYZSMIPxnv/ddKSfDR5IahO4VdmNR7It
 iuDg==
X-Gm-Message-State: AOAM531UekFwmKZrETv/991CQfpCqoSKjZmEZdcj73C6OMxBJuzI9IM+
 8T+jmaTPE2pt7ehwOYLTOA==
X-Google-Smtp-Source: ABdhPJxhsWo9K1agrJ//pvcpy6h/mSqqSv/FoLKL8s07k45EF5g8iQyCAq+n+lb59bzOfKRkUO748g==
X-Received: by 2002:a02:3781:: with SMTP id r123mr3387819jar.26.1624570142442; 
 Thu, 24 Jun 2021 14:29:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q8sm2118264iot.30.2021.06.24.14.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 14:29:01 -0700 (PDT)
Received: (nullmailer pid 2017356 invoked by uid 1000);
 Thu, 24 Jun 2021 21:28:53 -0000
Date: Thu, 24 Jun 2021 15:28:53 -0600
From: Rob Herring <robh@kernel.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 2/3] dt-bindings: i2c-new: Add bindings for AST2600 I2C
Message-ID: <20210624212853.GA2013136@robh.at.kernel.org>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-3-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617094424.27123-3-jamin_lin@aspeedtech.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.de>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Khalil Blaiech <kblaiech@mellanox.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
 Arnd Bergmann <arnd@arndb.de>, steven_lee@aspeedtech.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 17, 2021 at 05:43:39PM +0800, Jamin Lin wrote:
> AST2600 support the new register set of I2C controller
> Add bindings document to support the new driver of I2C
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,new-i2c.yaml          | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
> new file mode 100644
> index 000000000000..2c264596b138
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,new-i2c.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,new-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs Device Tree Bindings
> +
> +description: |
> +  ASPEED I2C controller support the new register set since AST26XX
> +  The i2c-global-regs device is used to enable new register set
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - aspeed,ast2600-i2c-bus
> +      - items:
> +          - enum:
> +              - aspeed,ast2600-i2c-global

This is not an i2c controller and a separate block, so it belongs in 
its own binding doc.

> +          - const: syscon
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2

Drop maxItems. 2 is implied by items length.

> +    items:
> +      - description: address offset and range of bus
> +      - description: address offset and range of bus buffer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      root clock of bus, should reference the APB
> +      clock in the second cell
> +
> +  resets:
> +    maxItems: 1
> +
> +  bus-frequency:
> +    minimum: 100
> +    maximum: 5000000
> +    default: 100000
> +    description: frequency of the bus clock in Hz defaults to 100 kHz when not
> +      specified
> +
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus
> +
> +  buff-mode:
> +    type: boolean
> +    description:
> +      buffer mode data transfer
> +
> +  byte-mode:
> +    type: boolean
> +    description:
> +      byte mode tata transfer
> +
> +  smbus-alert:
> +    type: boolean
> +    description:
> +      smbus alert protocol
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    i2c_gr: i2c-global-regs@0 {
> +      compatible = "aspeed,ast2600-i2c-global", "syscon";
> +      reg = <0x0 0x20>;
> +      clocks = <&syscon ASPEED_CLK_APB2>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +    };
> +
> +    i2c0: i2c-bus@80 {
> +      compatible = "aspeed,ast2600-i2c-bus";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <1>;
> +      reg = <0x80 0x80>, <0xC00 0x20>;
> +      clocks = <&syscon ASPEED_CLK_APB2>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      bus-frequency = <100000>;
> +    };
> -- 
> 2.17.1
> 
> 
