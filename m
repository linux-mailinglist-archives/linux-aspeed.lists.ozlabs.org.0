Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F36877FF
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:56:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6t1M1xz3z3ch3
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:56:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w8ujg9oN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w8ujg9oN;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6t153Wv0z3f4J
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:55:53 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id n13so799984wmr.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POWoFIiezkQ7xB1RHj3NozzgnXzo2XDIWIWlrZ65h/g=;
        b=w8ujg9oNS8uVlfJbDR44MAugiDMve16QPs97ZkiRiGFzVO32tk88W1WNopA88byYgT
         gZUXDe0LM0uzMFxsSJUJUh+mFk0Bu3qKqKtmoNm2QNYPNF6y9uxm4Y1ErqAIzdJaGOSn
         vgDGFlXhaCnt+lUhG/SBUpH66RP+kYspyh497Xh4ctpDocxl27T8ol7bib3eQkAu/EsX
         7L23EGdi6ww4gNxEoAxhCRxCGtv9BC/mposJXVOloH3Pn/GDe7SktTK44//4jGYSNOzT
         P3gP6A83EO434iElZnADFYp99QFRd3WHt28S/ezvLLGIxe42DnGuiPy/vNxfePE9X1fZ
         dyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POWoFIiezkQ7xB1RHj3NozzgnXzo2XDIWIWlrZ65h/g=;
        b=M8AbXyA1yNLA834iEA06zJu7vctLd9g7CSKx2omWEnP30zIuPlhlIhONWRPqmCOaFd
         5HkXikwYR+LIUttGkR6mJ2fafMZ34ZP4bZwzUTHFYeUgMmcwoIZ/BBH/RTUfSxKZQszi
         /5P+D5kVBFW97cZsP+FgAM+3qLEmtnfLbYG5VQeKMdGQkrx7dWNfxOMXLcT1t2htlB/w
         ZmQroD1r/JKrsUtSDLTiRtn7mTFnNZull4c9R/XpyraWWG1Nu3BTGdQNkZwgUvTz3476
         aYw7m9N/hP2HSbqE24WQJ7qi0oyiqt9RYPst8rPDdnipa3yeKKyHuwjzScpYALGdIp3b
         t9wA==
X-Gm-Message-State: AO0yUKWRDDCGKfuZuQqCNqzYFEE/yA94bgzAokX17TjgB4FNYwbEbYzF
	wSvK/jxzx3yTepOgGm1CoU5oWg==
X-Google-Smtp-Source: AK7set9nIjbCt0rzWfU1vQkAIIFH6HJ2GKEJdXgJBW28RvRh8fXf/ONu3jzIWkLZADeSv4W1sVeTpA==
X-Received: by 2002:a05:600c:1e13:b0:3d9:f836:3728 with SMTP id ay19-20020a05600c1e1300b003d9f8363728mr5242681wmb.11.1675328149379;
        Thu, 02 Feb 2023 00:55:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u15-20020a5d6daf000000b002bfe266d710sm938230wrs.90.2023.02.02.00.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 00:55:48 -0800 (PST)
Message-ID: <a3c63ebd-540b-40a0-6caf-bf2a8e629538@linaro.org>
Date: Thu, 2 Feb 2023 09:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
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

On 01/02/2023 11:33, Ryan Chen wrote:
> AST2600 support new register set for I2C controller, add bindings document
> to support driver of i2c new register mode controller.

Subject: drop "driver". You are not adding here driver.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,i2c-ast2600.yaml      | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.yaml
> new file mode 100644
> index 000000000000..b7d7bc303e77
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.yaml

Filename based on compatible.

> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2c-ast2600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AST2600 I2C Controller on the AST26XX SoCs Device Tree Bindings

Drop "Device Tree Bindings"

> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c
> +
> +  reg:
> +    minItems: 1

Why second item is optional?

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

Either this is root clock or APB clock. Decide and describe the clock
(hardware), not the DT syntax (drop "cell").

> +
> +  resets:
> +    maxItems: 1
> +
> +  bus-frequency:
> +    minimum: 500
> +    maximum: 2000000
> +    default: 100000
> +    description: frequency of the bus clock in Hz defaults to 100 kHz when not
> +      specified

Don't repeat constraints in free form text.

> +
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus
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
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    i2c_gr: i2c-global-regs@0 {
> +      compatible = "aspeed,ast2600-i2c-global", "syscon";
> +      reg = <0x0 0x20>;
> +      resets = <&syscon ASPEED_RESET_I2C>;

Drop. not related.

> +    };
> +
> +    i2c0: i2c-bus@80 {

Drop label.
Node name: i2c

I guess this wasn't tested, right?

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <1>;
> +      compatible = "aspeed,ast2600-i2c";
> +      reg = <0x80 0x80>, <0xC00 0x20>;

Compatible is first, reg is second.

Use lowercase hex.

> +      clocks = <&syscon ASPEED_CLK_APB2>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      bus-frequency = <100000>;
> +    };

Best regards,
Krzysztof

