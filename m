Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7231B693FD2
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 09:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFdCH0X0Nz3c6f
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 19:43:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FWK+6HEi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FWK+6HEi;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFdC95GbHz309V
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 19:42:59 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id n13so8137291wmr.4
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 00:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OmNYTifheZvD9PPxr9kkTRGJzSHdY4kbukQrLTBAW4=;
        b=FWK+6HEinSgiua2XGF21FAE0FGr7XnSb0PdJdZ9WqkvUH6IQkN/6MpvTzOiSj6sRXf
         zXiotXiz2tKlhrUQtBXKHMnYDZUpB0vKM2ljHRS+fjTBSQC9SghhIPCD3y0zOUfWvxq7
         tLTs4/cdzxdWgO7LD1m2vTWQyDHKHbXCQdhjXEtPXRmuJ1iwXmHE7Mf5mzrb6AuISa5b
         c30So5xwqsPrNf2KF6BbOA6IQXmj4APwUxT2UVzvjrui7Nv3meQpChtmA1F2nrXIr1Na
         x1ZdfYz0cXRjiQ35Ecbt9OykdOGic1HoLZrOFvydYRCOKO0ltE+xXxUNuXe0oQmA5SDg
         QV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OmNYTifheZvD9PPxr9kkTRGJzSHdY4kbukQrLTBAW4=;
        b=7JBAkEQGiI/2evEHQBpLaz6sycB6X3z+BWTd37co2sdZjHW/ffXXXMYFylFzU1ROps
         Tm9o9csNzjcKO1MWNt2CHC/YA4q//Gesg+AVwwNEgTvRACcj0dA8Z7ekR2dJRKQpMix3
         H8bdU+XpsUHRCOM/2/OKZfvHbBNojkwqzdVoYGntivGA5LvxL+aXvSULjSKpdkk3AMlb
         xXUuLU+dH5hCKUL6lNv0quk4+00XgWPRtL4I55DLuPvJltQkrzLioOA9KGr/I0VYi40n
         JSlPO2ZQ2u2qaa+DliJoh1aLqsTrA87s1rVwqLMyQ1gIoggMjVvykTSMgzbvx8+E819D
         EOgw==
X-Gm-Message-State: AO0yUKUrWHaCeC+PV1fXuedau9Fs/GDN1nmYzLZaiGtvW7S/O7DoK54a
	0QUNGmLTBBTprQYQ6oJEnghVeA==
X-Google-Smtp-Source: AK7set8dt7dKV4KWBja4N7OSEnkrJwuXkwT2UiLf0cdeBzHUv/RBuhO0QLIFvWWvTbc6kQb0Ztts5w==
X-Received: by 2002:a05:600c:a687:b0:3db:bc5:b2ae with SMTP id ip7-20020a05600ca68700b003db0bc5b2aemr17827029wmb.41.1676277775347;
        Mon, 13 Feb 2023 00:42:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003db12112fcfsm14458194wmo.4.2023.02.13.00.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:42:54 -0800 (PST)
Message-ID: <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
Date: Mon, 13 Feb 2023 09:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org
References: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/02/2023 08:41, Jeremy Kerr wrote:
> This change adds a devicetree binding for the ast2600 i3c controller

1. Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

2. Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

3. Subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.

4. Where is the driver? Where is the DTS? Why do we want unused binding
in the kernel?

> hardware. This is heavily based on the designware i3c hardware, plus a
> reset facility and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - global-regs: to reference the (ast2600-specific) i3c global register
>    block, and the device index to use within it.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
> RFC: the example in this depends on some not-yet-accepted patches for
> the clock and reset linkages:
> 
>   https://lore.kernel.org/linux-devicetree/cover.1676267865.git.jk@codeconstruct.com.au/T/
> 
> I'm also keen to get some review on the pullup configuration too.
> 
> ---
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> new file mode 100644
> index 000000000000..ef28a8b77c94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 i3c controller
> +
> +maintainers:
> +  - Jeremy Kerr <jk@codeconstruct.com.au>
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2600-i3c
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  sda-pullup-ohms:
> +    enum: [545, 750, 2000]
> +    default: 2000
> +    description: |
> +      Value of SDA pullup resistor in Ohms

Why this is property of i3c, not pinctrl?

> +
> +  global-regs:

Missing vendor prefix

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      A (phandle, controller index) reference to the i3c global register set
> +      used for this device.

Missing items description:
https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - global-regs
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i3c-master@2000 {
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +        compatible = "aspeed,ast2600-i3c";
> +        reg = <0x2000 0x1000>;

compatible and reg are first properties.

> +        clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
> +        resets = <&syscon ASPEED_RESET_I3C0>;
> +        global-regs = <&i3c_global 0>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i3c1_default>;
> +        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +    i3c_global: i3c-global@0 {

Drop node, unrelated.

> +        compatible = "aspeed,ast2600-i3c-global", "simple-mfd", "syscon";
> +        resets = <&syscon ASPEED_RESET_I3C_DMA>;
> +        reg = <0x0 0x1000>;
> +    };
> +...

Best regards,
Krzysztof

