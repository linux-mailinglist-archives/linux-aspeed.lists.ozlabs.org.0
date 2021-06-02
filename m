Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F11B139944F
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Jun 2021 22:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwKs52X6Pz2yxv
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 06:10:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwKs03D4kz2yXm
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 06:10:27 +1000 (AEST)
Received: by mail-ot1-f50.google.com with SMTP id
 c31-20020a056830349fb02903a5bfa6138bso3590089otu.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Jun 2021 13:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KJXe/j4S+tTBfupUvcLNtHwssps3qp4qDEKF4hgTJ3E=;
 b=Y9+1ByV8+5XgiqqDAlAAAwVvPe5IGQg3NJcIShH9/JJsJJmToFdy7rFnIt+7YBk2qc
 aHsXoyw9hUr7oah3O9g/C5KYeTU3f6VTzxd8A/5+IjvVqLENZoQ7mAvGHLESZvmp4MY0
 qHl+kbjYlX13cQTTvxQg+dD5/3QEHxEYz6z+elyJvOKsb8RxY7QKqzrBxN+WOrPzk3I5
 8TkI/5TO90/nPzX5k6P1Rck3wmZLY9R5StQDWt0u/UAei9TiTV3gHKv61xih9Egn908j
 c3cF8Vdx8JPTv/bXWTZFhJaF1UvUw+nf7xNB5pxMl2Nz5lF6l0MABWQhHGYN5FBx5hV4
 0VCA==
X-Gm-Message-State: AOAM5332wzTumRTcaOQTpS8wTOCDo//+/bxK3ZIoztWLu2FMQDoinhzu
 i2VNMKOiqwvlrlC8DgCPZA==
X-Google-Smtp-Source: ABdhPJx4iZCcx1NuCo6GfI2rKBzE1Fi8O4daJSQD2hB9/vnoJOnXkkRiZa8E39kJeTxqN6ge2Z8eQA==
X-Received: by 2002:a05:6830:164c:: with SMTP id
 h12mr27991909otr.321.1622664623785; 
 Wed, 02 Jun 2021 13:10:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h9sm189017otn.56.2021.06.02.13.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 13:10:22 -0700 (PDT)
Received: (nullmailer pid 3907739 invoked by uid 1000);
 Wed, 02 Jun 2021 20:10:21 -0000
Date: Wed, 2 Jun 2021 15:10:21 -0500
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210602201021.GA3900491@robh.at.kernel.org>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527005455.25758-2-steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 08:54:50AM +0800, Steven Lee wrote:
> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more flexible.

The rest of the binding looks fine. Make this property a separate patch 
if you don't end up dropping it.

> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 91 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ----------
>  2 files changed, 91 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> new file mode 100644
> index 000000000000..02eb0c5023e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed SGPIO controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +
> +description:
> +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> +  AST2600 have two sgpio master one with 128 pins another one with 80 pins,
> +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
> +  GPIO pins can be programmed to support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)
> +  - Support reset tolerance option for each output port
> +  - Directly connected to APB bus and its shift clock is from APB bus clock
> +    divided by a programmable value.
> +  - Co-work with external signal-chained TTL components (74LV165/74LV595)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-sgpiom
> +      - aspeed,ast2500-sgpiom
> +      - aspeed,ast2600-sgpiom
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  ngpios:
> +    minimum: 0
> +    maximum: 128
> +
> +  max-ngpios:
> +    description:
> +      represents the number of actual hardware-supported GPIOs (ie,
> +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> +      device. We also use it to define the split between the inputs and
> +      outputs; the inputs start at line 0, the outputs start at max_ngpios.
> +    minimum: 0
> +    maximum: 128
> +
> +  bus-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - interrupt-controller
> +  - ngpios
> +  - max-ngpios
> +  - clocks
> +  - bus-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    sgpio: sgpio@1e780200 {
> +        #gpio-cells = <2>;
> +        compatible = "aspeed,ast2500-sgpiom";
> +        gpio-controller;
> +        interrupts = <40>;
> +        reg = <0x1e780200 0x0100>;
> +        clocks = <&syscon ASPEED_CLK_APB>;
> +        interrupt-controller;
> +        ngpios = <8>;
> +        max-ngpios = <80>;
> +        bus-frequency = <12000000>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> deleted file mode 100644
> index be329ea4794f..000000000000
> --- a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Aspeed SGPIO controller Device Tree Bindings
> ---------------------------------------------
> -
> -This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> -featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> -support the following options:
> -- Support interrupt option for each input port and various interrupt
> -  sensitivity option (level-high, level-low, edge-high, edge-low)
> -- Support reset tolerance option for each output port
> -- Directly connected to APB bus and its shift clock is from APB bus clock
> -  divided by a programmable value.
> -- Co-work with external signal-chained TTL components (74LV165/74LV595)
> -
> -Required properties:
> -
> -- compatible : Should be one of
> -  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
> -- #gpio-cells : Should be 2, see gpio.txt
> -- reg : Address and length of the register set for the device
> -- gpio-controller : Marks the device node as a GPIO controller
> -- interrupts : Interrupt specifier, see interrupt-controller/interrupts.txt
> -- interrupt-controller : Mark the GPIO controller as an interrupt-controller
> -- ngpios : number of *hardware* GPIO lines, see gpio.txt. This will expose
> -  2 software GPIOs per hardware GPIO: one for hardware input, one for hardware
> -  output. Up to 80 pins, must be a multiple of 8.
> -- clocks : A phandle to the APB clock for SGPM clock division
> -- bus-frequency : SGPM CLK frequency
> -
> -The sgpio and interrupt properties are further described in their respective
> -bindings documentation:
> -
> -- Documentation/devicetree/bindings/gpio/gpio.txt
> -- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> -
> -  Example:
> -	sgpio: sgpio@1e780200 {
> -		#gpio-cells = <2>;
> -		compatible = "aspeed,ast2500-sgpio";
> -		gpio-controller;
> -		interrupts = <40>;
> -		reg = <0x1e780200 0x0100>;
> -		clocks = <&syscon ASPEED_CLK_APB>;
> -		interrupt-controller;
> -		ngpios = <8>;
> -		bus-frequency = <12000000>;
> -	};
> -- 
> 2.17.1
