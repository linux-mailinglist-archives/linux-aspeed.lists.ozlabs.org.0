Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D5953DE74
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Jun 2022 23:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGVZr2mZfz3bl5
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 07:47:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.173; helo=mail-qk1-f173.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGVZj6Xcmz304G
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Jun 2022 07:47:09 +1000 (AEST)
Received: by mail-qk1-f173.google.com with SMTP id x65so9767687qke.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 05 Jun 2022 14:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eEvBqpfDNp1gDkv6Nzdk7QI2mfC3GLl4R5QP+lrMbvA=;
        b=gjJVTLo1Ny6ZVZzPZSjpAt5CE9xZ3Q1IhViw4W7HHUgEaeBeNsjuWXltYeMt1h6dqa
         tLa96alSFZKbHfn8+aergak0B9NXDlfRwZkf9xVaL+h5dGdzlb+FD6oNYDlRZUCH6KLV
         XdPqECtpsKXyjm8Aim+0i80A3YiFsQ1EOIEC1078uZsb5sFs+f067yI2EcZaP2iFfnjF
         4F0DUrKFgN5IxZhJjUi0vT6B0MzyWSnlf3zD9eyjc8PjDSM4PCR++Yv11njfKypYGUDz
         y3WCNh6YyBEIng2KBXgHAcXrY8O5+3d+CeJGEqQDCo2omhU0Nek4XCV/0cNVhf/DdUHB
         Wxmw==
X-Gm-Message-State: AOAM530X8i/vi5e0Plxzrj8YoDTDRdvYoRi0FypXzxAVG4N5gN2YtJKD
	E/qyqY9luT/ZLFSadRYxCg==
X-Google-Smtp-Source: ABdhPJyC7nsRGp7r9R2CQWA/Cgx5aIH6CBASg7KC9/6/3ZpnQ/Ef21Dng8wLb0+nHlIU5qgGVTTGBQ==
X-Received: by 2002:a37:315:0:b0:6a6:a90c:9072 with SMTP id 21-20020a370315000000b006a6a90c9072mr6703509qkd.256.1654465624964;
        Sun, 05 Jun 2022 14:47:04 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a455000b006a6b1c11235sm3207461qkp.84.2022.06.05.14.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:47:04 -0700 (PDT)
Received: (nullmailer pid 3577933 invoked by uid 1000);
	Sun, 05 Jun 2022 21:47:00 -0000
Date: Sun, 5 Jun 2022 16:47:00 -0500
From: Rob Herring <robh@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: aspeed-i2c: add properties for
 manual clock setting
Message-ID: <20220605214700.GA3558088-robh@kernel.org>
References: <20220601041512.21484-1-potin.lai.pt@gmail.com>
 <20220601041512.21484-3-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601041512.21484-3-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rayn Chen <rayn_chen@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 12:15:12PM +0800, Potin Lai wrote:
> Add following properties for manual tuning clock divisor and cycle of
> hign/low pulse witdh.
> 
> * aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setting
> * aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
> * aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
> * aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index ea643e6c3ef5..e2f67fe2aa0c 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -12,6 +12,28 @@ maintainers:
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: st,stm32-uart

stm32 uart?

> +
> +    then:
> +      properties:
> +        aspeed,i2c-clk-high-cycle:
> +          maximum: 8
> +        aspeed,i2c-clk-low-cycle:
> +          maximum: 8
> +
> +  - if:
> +      required:
> +        - aspeed,i2c-manual-clk
> +
> +    then:
> +      required:
> +        - aspeed,i2c-base-clk-div
> +        - aspeed,i2c-clk-high-cycle
> +        - aspeed,i2c-clk-low-cycle

'dependencies' can better express this than an if/then.

However, I think this should all be done in a common way.

> +
>  properties:
>    compatible:
>      enum:
> @@ -49,6 +71,28 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  aspeed,i2c-manual-clk:
> +    type: boolean
> +    description: enable manual clock setting

No need for this as presence of the other properties can determine this.

> +
> +  aspeed,i2c-base-clk-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192,
> +           16384, 32768]
> +    description: base clock divisor

Specify the i2c bus frequency and calculate the divider.

> +
> +  aspeed,i2c-clk-high-cycle:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 16
> +    description: cycles of master clock-high pulse width
> +
> +  aspeed,i2c-clk-low-cycle:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 16
> +    description: cycles of master clock-low pulse width

These 2 should be common. I think you just need a single property 
expressing duty cycle.

Rob
