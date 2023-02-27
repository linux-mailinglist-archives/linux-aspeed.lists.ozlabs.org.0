Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C23686A3C98
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Feb 2023 09:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQD8q0yzsz3cD8
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Feb 2023 19:25:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pHnoMo8x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pHnoMo8x;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQD8g0yl9z3bjw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Feb 2023 19:25:36 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id l25so5259221wrb.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Feb 2023 00:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7wawcQch3lNu+MG0Wy2sQLlrBSIfPCFFDnZ1A7TraE=;
        b=pHnoMo8xE+1HtXKcjUR26tXhOt//H0eiEimGk9ipnhjjM7zKxZclB5EAYneTx0PEmN
         ER82JRtpkYSpUrd9t5HuGN1bzO/Sfd6T+IdLacmQFM6ofpnZWxH1PbRuVuNvxLDW1kgi
         xR5Hgz1ya9Y4rqXYEYCWekO/OmoZaAZypSFl2Qhsn5OLzZ8NdWns9B8ji63tr49c2H1T
         OhMit2X0P5Wmz4Pezz8bZectgG7+SlY9QNb+LxJfg2IuAX35TrwlCtNYciJo5BTNJP+D
         EWr7k/CWEwKRChWA4Z1nGDFEUP4LdDnOIPwRIdvR+xYqFa1CnrcLHJnRiauOrjsk+hRa
         MsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7wawcQch3lNu+MG0Wy2sQLlrBSIfPCFFDnZ1A7TraE=;
        b=LrornT+9EiUJX1a58XVlM723VXWmJLFFkJO8QHCPMAsW15LFPgbPSWCTbdMPJpLxM0
         nW2H7K1Je1v7sD33f4+1emcJ/39hkPrnkmpuMQo1pWp5jfhMik4qJgFhc9fo9fWXw8jn
         jCtCO2Bfv9CRn0ZfJfTAznl4sTpm3Lo+ZpKkNBQ016kbJ/rMcrn9mjxW0Rr9l3DnxI1e
         07o6I8sqZOGnaf+jbIQlRLzvCByqOqUyxjMLCjzrYeGNeieGYe4qUVSwLznty3Nd/CvQ
         UD4w11HRFZN66AULFrTXR+TSPdGcDxZEHcu3xyKa2LmkK1UpglHbkjuVB7U2oqy5iXiA
         ffnA==
X-Gm-Message-State: AO0yUKVbWYVqI/HfWw/LoyXAXfSeMJxqTN/kUOvnzTSAaZC1Kl6XQbk/
	1WBQPPiYriAMJ5vilbvp5lhCKw==
X-Google-Smtp-Source: AK7set8msDbkhhTp2CHF66KjjFwBil0QNBCibqKaWkpjsyR0NI0l2qa6mBCMtcy9ziB1IY0cJmvegw==
X-Received: by 2002:a5d:4708:0:b0:2cb:3b68:3c1c with SMTP id y8-20020a5d4708000000b002cb3b683c1cmr3439137wrq.14.1677486331251;
        Mon, 27 Feb 2023 00:25:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r14-20020adff70e000000b002c567881dbcsm6381961wrp.48.2023.02.27.00.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:25:30 -0800 (PST)
Message-ID: <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
Date: Mon, 27 Feb 2023 09:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 26/02/2023 04:13, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,timeout
> aspeed,xfer-mode description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index f597f73ccd87..75de3ce41cf5 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -49,6 +49,25 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  aspeed,timeout:
> +    type: boolean
> +    description: I2C bus timeout enable for master/slave mode

Nothing improved here in regards to my last comment.

> +
> +  aspeed,xfer-mode:
> +    description: |
> +      I2C bus transfer mode selection.
> +      - "byte": I2C bus byte transfer mode.
> +      - "buffered": I2C bus buffer register transfer mode.
> +      - "dma": I2C bus dma transfer mode (default)
> +    items:
> +      enum: [byte, buffered, dma]
> +    maxItems: 1

Drop, not an array.

> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array

Wrong ref. This is not an array, but one string.

> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.
> +
>  required:
>    - reg
>    - compatible
> @@ -57,6 +76,19 @@ required:
>  
>  unevaluatedProperties: false
>  
> +if:

This should be under allOf (in this location)

> +  properties:
> +    compatible:
> +      contains:
> +        const: aspeed,ast2600-i2cv2
> +
> +then:
> +  properties:
> +    reg:
> +      minItems: 2
> +  required:
> +    - aspeed,global-regs

else:
  aspeed,global-regs: false
and the same for other v2 properties

> +
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> @@ -71,3 +103,15 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "aspeed,ast2600-i2cv2";
> +      reg = <0x80 0x80>, <0xc00 0x20>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      aspeed,global-regs = <&i2c_global>;
> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +    };

Best regards,
Krzysztof

