Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F073F5DB4
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 14:13:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv7L70xY5z2yLk
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 22:13:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv7L05hfNz2xjZ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 22:13:10 +1000 (AEST)
Received: by mail-ot1-f53.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso13653264otv.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 05:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ucW5ESnazpnHopEpKtJXSrUkYd/hKt6rzSaH/p9OLnU=;
 b=EYO6ljQAh5YBFyOBfzsGTiHzqX2SL5IxB2J5RCcAApMABbTAvcDJktJyQF+GZnH/2G
 G8PFTfkjZbatdR1Ps1FtQPH1dGx/aPqbrYgfUk4Fd0JGUBmUXTADCZyQ4jg/zLDIItG+
 X+vjbSjR3pCYMlg/pLuWjr/1emTUyCX6BmshI8D79/UbzRmnT0DRjCR0AKiw8UINfduP
 CAuPKYkeQdSRNFabOEXxc8Bf+wJ7dRcIT27+5VE8/NRzFlSqWgbn3TWSqu4jAIcgqa+N
 NvmM5h3KCt7xw6+nifv2KpNtzQVH7hXrZz5c46vhGocpssPfqt0KklIIs+N1wtDxiepJ
 0/sw==
X-Gm-Message-State: AOAM530hsZOg0SGyHOUxmhNq5J397J9USLTAfdB4eyXFsm1FTzRg7op4
 TFJ7CK/BBhTeDvdQSc36lA==
X-Google-Smtp-Source: ABdhPJwmL7fV+UFqhUhlvO56wKUhjbk2HWg/fnimn1UVUMQplLSBAYfIBSxvjbqmY8uN0GSWWUxrkA==
X-Received: by 2002:a05:6808:10c8:: with SMTP id
 s8mr2565522ois.6.1629807186746; 
 Tue, 24 Aug 2021 05:13:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 97sm4553510otv.26.2021.08.24.05.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 05:13:05 -0700 (PDT)
Received: (nullmailer pid 21234 invoked by uid 1000);
 Tue, 24 Aug 2021 12:13:04 -0000
Date: Tue, 24 Aug 2021 07:13:04 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v4 01/15] dt-bindings: iio: adc: Add ast2600-adc bindings
Message-ID: <YSTiUPQa+HYSA63t@robh.at.kernel.org>
References: <20210823070240.12600-1-billy_tsai@aspeedtech.com>
 <20210823070240.12600-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210823070240.12600-2-billy_tsai@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 lars@metafoo.de, pmeerw@pmeerw.net, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, broonie@kernel.org, p.zabel@pengutronix.de,
 jic23@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Aug 23, 2021 at 03:02:26PM +0800, Billy Tsai wrote:
> Add device tree bindings document for the aspeed ast2600 adc device
> driver.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml  | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> new file mode 100644
> index 000000000000..248cda7d91e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ADC that forms part of an ASPEED server management processor.
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  • 10-bits resolution for 16 voltage channels.
> +  • The device split into two individual engine and each contains 8 voltage
> +  channels.
> +  • Channel scanning can be non-continuous.
> +  • Programmable ADC clock frequency.
> +  • Programmable upper and lower threshold for each channels.
> +  • Interrupt when larger or less than threshold for each channels.
> +  • Support hysteresis for each channels.
> +  • Built-in a compensating method.
> +  • Built-in a register to trim internal reference voltage.
> +  • Internal or External reference voltage.
> +  • Support 2 Internal reference voltage 1.2v or 2.5v.
> +  • Integrate dividing circuit for battery sensing.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-adc0
> +      - aspeed,ast2600-adc1

What's the difference between 0 and 1?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Input clock used to derive the sample clock. Expected to be the
> +      SoC's APB clock.

How many clocks?

> +
> +  resets:
> +    maxItems: 1
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +  vref-supply:
> +    description:
> +      The external regulator supply ADC reference voltage.
> +
> +  aspeed,int_vref_mv:

Don't use '_' in property names.

Use standard unit suffixes as defined in property-units.yaml.

> +    $ref: /schemas/types.yaml#/definitions/uint32

And then you can drop this.

> +    enum: [1200, 2500]
> +    description:
> +      ADC internal reference voltage in millivolts.
> +
> +  aspeed,battery-sensing:
> +    type: boolean
> +    description:
> +      Inform the driver that last channel will be used to sensor battery.
> +
> +  aspeed,trim-data-valid:
> +    type: boolean
> +    description: |
> +      The ADC reference voltage can be calibrated to obtain the trimming
> +      data which will be stored in otp. This property informs the driver that
> +      the data store in the otp is valid.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - "#io-channel-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    adc0: adc@1e6e9000 {
> +        compatible = "aspeed,ast2600-adc0";
> +        reg = <0x1e6e9000 0x100>;
> +        clocks = <&syscon ASPEED_CLK_APB2>;
> +        resets = <&syscon ASPEED_RESET_ADC>;
> +        #io-channel-cells = <1>;
> +        aspeed,int_vref_mv = <2500>;
> +    };
> +    adc1: adc@1e6e9100 {
> +        compatible = "aspeed,ast2600-adc1";
> +        reg = <0x1e6e9100 0x100>;
> +        clocks = <&syscon ASPEED_CLK_APB2>;
> +        resets = <&syscon ASPEED_RESET_ADC>;
> +        #io-channel-cells = <1>;
> +        aspeed,int_vref_mv = <2500>;
> +    };
> +...
> -- 
> 2.25.1
> 
> 
