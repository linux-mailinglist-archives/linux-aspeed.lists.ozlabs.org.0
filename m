Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E05539EA3
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 09:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCh4s6Qq4z3bkk
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 17:45:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hpCDFNGJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hpCDFNGJ;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCh4m0nLwz305D
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jun 2022 17:44:55 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id jx22so1935166ejb.12
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Jun 2022 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MD6HPERyaclpLbVMS6v8zy/sUdA8rjzF4KgrEmNDbGU=;
        b=hpCDFNGJOfLdJmn4/pwebhNLUcf3UnAL4E7KtosnNifftBSckZy+8V+W8exyq5uoNf
         +K8F8gNkChRV6cCtAef34O2RWKyl+1wl88ezP006HV4IGJhwGxk0dHHdeuN8C3Rz1YgW
         maUsuqUnpfkv8UqYhXaBB0ruMIlsPLytNmnG3tfP5Zt0pEtUa55T02LQZS0zkpO2nKi2
         ZewDtrUIfnG7yycAPH7sgryG50SuZIFEBErokp6CHB5IYAN+fkYBIeayEQGecgrVt8Xt
         C98Zv6CoXoorzOjKSH/PawJqhUAq+hg+y5oV0CPUlMSYbNKw0A9vqdWKBD1Y7XuKCsgG
         wnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MD6HPERyaclpLbVMS6v8zy/sUdA8rjzF4KgrEmNDbGU=;
        b=rJIWiJfZBPB2rgBTaoX0cjNL/gb1YxU3o46Hm7LsTSqXev/gsowr0u9j9hlHN7gwrx
         JbZzgT7E4yZQWk9qkpFIHye4WjBlFkhr+qlxBaaG+EQjgMY5XmB9173YajebMwFnlhRH
         9i7w8lx54zaIZmmVzij1poT1V8tdZDkt4CxUoL5rozO7EvCfVnidPyUTFcAG5Gu3rkoz
         Bb+0xtmN+WtvMSCVwa4NJaF1aXSplCG7g9n3roi9BqCgjuLqeScjyvPurRW0GO9yOfvt
         zfk3gOJ+oGykkl0EaQedNO+s5UM4jQrUmF8GPAq46ie6ZiEsL/acx7pSzszTuYcN2rem
         lV+A==
X-Gm-Message-State: AOAM530nNrSkRDMGCiM3RPoEj32yyQB06TCVnRMUYT/xMC3hF74kIBMR
	tyblljdh205sRX9Uiw8rj5edBA==
X-Google-Smtp-Source: ABdhPJxhiKO2Cr8rVY6Z7xoEe3aLmQOf+fpslbIVDg4hxcAF04VZVj+2cCeAb+WNtpL5juwTIyioDA==
X-Received: by 2002:a17:907:7baa:b0:6fe:b3dc:2378 with SMTP id ne42-20020a1709077baa00b006feb3dc2378mr49731224ejc.266.1654069491828;
        Wed, 01 Jun 2022 00:44:51 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fi20-20020a1709073ad400b006fec8e8eff6sm377188ejc.176.2022.06.01.00.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:44:51 -0700 (PDT)
Message-ID: <dca283db-0b2e-1fc1-bc76-811c4c918fb5@linaro.org>
Date: Wed, 1 Jun 2022 09:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] dt-bindings: crypto: add documentation for aspeed
 hace
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220601054204.1522976-1-neal_liu@aspeedtech.com>
 <20220601054204.1522976-5-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601054204.1522976-5-neal_liu@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 01/06/2022 07:42, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed Hash
> and Crypto Engines (HACE) Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> ---
>  .../bindings/crypto/aspeed,hace.yaml          | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/aspeed,hace.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/aspeed,hace.yaml b/Documentation/devicetree/bindings/crypto/aspeed,hace.yaml
> new file mode 100644
> index 000000000000..36b4ad0dc7fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/aspeed,hace.yaml

Filename should be rather from the first compatible, so
"aspeed,ast2500-hace.yaml"

> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/aspeed,hace.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED HACE hash and crypto Hardware Accelerator Device Tree Bindings

s/Device Tree Bindings//

> +
> +maintainers:
> +  - Neal Liu <neal_liu@aspeedtech.com>
> +
> +description: |
> +  The Hash and Crypto Engine (HACE) is designed to accelerate the throughput
> +  of hash data digest, encryption, and decryption. Basically, HACE can be
> +  divided into two independently engines - Hash Engine and Crypto Engine.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2500-hace
> +      - aspeed,ast2600-hace
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1

You need to list clock names, however usually it does not make sense to
have names for just one main device clock.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    hace: hace@1e6d0000 {

Generic node names so "crypto".

> +        compatible = "aspeed,ast2600-hace";
> +        reg = <0x1e6d0000 0x200>;
> +        interrupts = <4>;
> +        clocks = <&syscon ASPEED_CLK_GATE_YCLK>;
> +        clock-names = "yclk";
> +        resets = <&syscon ASPEED_RESET_HACE>;
> +    };


Best regards,
Krzysztof
