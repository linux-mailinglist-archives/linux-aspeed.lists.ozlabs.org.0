Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A0269490
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 20:13:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqvcZ63p5zDqPj
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Sep 2020 04:13:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.68; helo=mail-io1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bqvc14xYSzDqQ1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Sep 2020 04:13:05 +1000 (AEST)
Received: by mail-io1-f68.google.com with SMTP id r25so1172985ioj.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Sep 2020 11:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=flh8Qx49o5v1NWGlnIlQV9lzKDaYx8c+g/EflzEDRhM=;
 b=Nvy52hW7sFOL8ASfcHZeEOSF1Gy3V2OJBt7T1aLQ1onOAnjBi3Ao6EVH8JU3A1JpHA
 s340AEZ6CiK58dFqP4M3Kv5HNTW1P9/vrV7MZ60i8Lq0i05nj2XPRWcPIsHDYhoPyvH1
 CklRCbor2Yro9sHYBQNqzVyuf3xWz9Th9RHTuMHh2xdovykDr6klt0FvSwWox2c1NPQE
 xkHErOoVZj3PD5nggAbOOm4OBbTvxTvmtC7W0BXq/YjcGSHWaeRK2Tl/OiFfBWHdwH+i
 NLbTZOJBuoPf7dqOta6jz+kg2T2bZ8P3bdymM725IwFPdxRYi9Wmzn9915IvnOE5RUh2
 jKRA==
X-Gm-Message-State: AOAM533WWeJNj/xMse5BgfTdbESt7h88iSvZ/oi4RlwJuBMZ+kMqnD3x
 hd88VS1VXSlnQreOrU3osA==
X-Google-Smtp-Source: ABdhPJzYORTqGUQ1Z+gz8wZ6y5/SfEqw40DmQXnoNlX57jjbB08mw8PJvJmpD1E7x1n5FyiJvddW5w==
X-Received: by 2002:a02:4b07:: with SMTP id q7mr14986215jaa.84.1600107181794; 
 Mon, 14 Sep 2020 11:13:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m19sm7410692ila.40.2020.09.14.11.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:13:00 -0700 (PDT)
Received: (nullmailer pid 4166255 invoked by uid 1000);
 Mon, 14 Sep 2020 18:12:57 -0000
Date: Mon, 14 Sep 2020 12:12:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: gpio: Convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200914181257.GA4163345@bogus>
References: <20200829094024.31842-1-krzk@kernel.org>
 <20200829094024.31842-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829094024.31842-2-krzk@kernel.org>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Aug 29, 2020 at 11:40:20AM +0200, Krzysztof Kozlowski wrote:
> Convert the Maxim MAX732x family of GPIO expanders bindings to device
> tree schema by merging it with existing PCA95xx schema.  These are quite
> similar so merging reduces duplication.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/gpio-max732x.txt | 58 ---------------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 72 ++++++++++++++++++-
>  2 files changed, 70 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-max732x.txt b/Documentation/devicetree/bindings/gpio/gpio-max732x.txt
> deleted file mode 100644
> index b3a9c0c32823..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-max732x.txt
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -* MAX732x-compatible I/O expanders
> -
> -Required properties:
> -  - compatible: Should be one of the following:
> -    - "maxim,max7319": For the Maxim MAX7319
> -    - "maxim,max7320": For the Maxim MAX7320
> -    - "maxim,max7321": For the Maxim MAX7321
> -    - "maxim,max7322": For the Maxim MAX7322
> -    - "maxim,max7323": For the Maxim MAX7323
> -    - "maxim,max7324": For the Maxim MAX7324
> -    - "maxim,max7325": For the Maxim MAX7325
> -    - "maxim,max7326": For the Maxim MAX7326
> -    - "maxim,max7327": For the Maxim MAX7327
> -  - reg: I2C slave address for this device.
> -  - gpio-controller: Marks the device node as a GPIO controller.
> -  - #gpio-cells: Should be 2.
> -    - first cell is the GPIO number
> -    - second cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
> -      Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
> -
> -Optional properties:
> -
> -  The I/O expander can detect input state changes, and thus optionally act as
> -  an interrupt controller. When the expander interrupt line is connected all the
> -  following properties must be set. For more information please see the
> -  interrupt controller device tree bindings documentation available at
> -  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
> -
> -  - interrupt-controller: Identifies the node as an interrupt controller.
> -  - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
> -    - first cell is the pin number
> -    - second cell is used to specify flags
> -  - interrupts: Interrupt specifier for the controllers interrupt.
> -
> -Please refer to gpio.txt in this directory for details of the common GPIO
> -bindings used by client devices.
> -
> -Example 1. MAX7325 with interrupt support enabled (CONFIG_GPIO_MAX732X_IRQ=y):
> -
> -	expander: max7325@6d {
> -		compatible = "maxim,max7325";
> -		reg = <0x6d>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio4>;
> -		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
> -	};
> -
> -Example 2. MAX7325 with interrupt support disabled (CONFIG_GPIO_MAX732X_IRQ=n):
> -
> -	expander: max7325@6d {
> -		compatible = "maxim,max7325";
> -		reg = <0x6d>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index c5bb24b3b7b5..e90433b7d52b 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -9,6 +9,10 @@ title: NXP PCA95xx I2C GPIO multiplexer
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>  
> +description: |+
> +  Bindings for the family of I2C GPIO multiplexers/expanders: NXP PCA95xx,
> +  Maxim MAX73xx
> +
>  properties:
>    compatible:
>      enum:
> @@ -17,6 +21,15 @@ properties:
>        - maxim,max7312
>        - maxim,max7313
>        - maxim,max7315
> +      - maxim,max7319
> +      - maxim,max7320
> +      - maxim,max7321
> +      - maxim,max7322
> +      - maxim,max7323
> +      - maxim,max7324
> +      - maxim,max7325
> +      - maxim,max7326
> +      - maxim,max7327
>        - nxp,pca6416
>        - nxp,pca9505
>        - nxp,pca9534
> @@ -69,11 +82,11 @@ properties:
>    reset-gpios:
>      description:
>        GPIO specification for the RESET input. This is an active low signal to
> -      the PCA953x.
> +      the PCA953x.  Not valid for Maxim MAX732x devices.
>  
>    vcc-supply:
>      description:
> -      Optional power supply
> +      Optional power supply.  Not valid for Maxim MAX732x devices.
>  
>  required:
>    - compatible
> @@ -83,6 +96,27 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max7320
> +              - maxim,max7321
> +              - maxim,max7322
> +              - maxim,max7323
> +              - maxim,max7324
> +              - maxim,max7325
> +              - maxim,max7326
> +              - maxim,max7327
> +    then:
> +      properties:
> +        reset-gpios:
> +          maxItems: 0
> +        vcc-supply:
> +          maxItems: 0

reset-gpios: false
vcc-supply: false

> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> @@ -136,3 +170,37 @@ examples:
>              ti,micbias = <0>;	/* 2.1V */
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c2 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        // MAX7325 with interrupt support enabled
> +        gpio@6d {
> +            compatible = "maxim,max7325";
> +            reg = <0x6d>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            interrupt-parent = <&gpio4>;
> +            interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
> +        };
> +    };
> +
> +  - |
> +    i2c3 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        // MAX7325 with interrupt support disabled
> +        gpio@6e {
> +            compatible = "maxim,max7325";
> +            reg = <0x6e>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };
> -- 
> 2.17.1
> 
