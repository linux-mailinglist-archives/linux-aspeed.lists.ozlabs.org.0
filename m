Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22F6877EC
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:53:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6sxq50kwz3cdZ
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:53:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XwN8l9XY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XwN8l9XY;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6sxh0hLzz3cL0
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:52:53 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso765923wms.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UP/sXG6BbiZp8djPCPgh/7Unv00A4lZ4qBzipf/bhsw=;
        b=XwN8l9XYFjm4ZrMbgDED4aiv0zeRcUNbp5GZihY8LHKMp2UwRH2Rceypz6EYWj1aAd
         pUkIYqwM+QGYyHpBD4u00DZGyaUeYeRJLjBr3ODdsWyS8nV3+7IZT4u7bDXN/UaP+068
         1g2lKw7gO2oNZ4c8vC2s+WYt1ssRJ6836EB9ErE/ke2SCLndciXjSXIsi5/GrOm2Vib5
         bl35tk9xx+TuvQug7Q95iHzAhgrXMdwHtl+OxPNtqGcgxWPQGrHS8rP9zJX9IOgn508u
         Ut9iBVlktBP8cd56jpz7uDkbRayVArniaM24SadAEdomOMrHeCmm3+oQu8iNGsJyqY9+
         0PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UP/sXG6BbiZp8djPCPgh/7Unv00A4lZ4qBzipf/bhsw=;
        b=PEH6EmexAc0rG2e917t2olecnwP9c+IGowe5QI4gratJ7+RFG60Pl2CLeu13/KDxVT
         YLfxSXk7YEQ0M6GA9f6WyAahvVEFblcW2PRqf/4m5vdr3YBAjjUzO0HdAzVzkQKdISC3
         xLZawCVM0HiPoTv2baB2myP9M7IfOdaecYkt9/Dtc631FEpJomklyb1vw/2sOylIkITR
         44IQgExV//hMwa8Lfznna21jkZSOevBK9qPyMq6HOgTAWJGJnvNbPZJGqAXIwwaZCirT
         /IQblh4cGPYzE6DEM/1d0hF7UDFKzk7u2y1AVB5eiaZc0LGa0ciF4PBq5EfOA6yW/9S7
         1qYQ==
X-Gm-Message-State: AO0yUKUTEOZSqR6pcFlWPN6Ga1iX/iThFfFiLhOsb4eme0uni1SqMt8s
	rGklwyrixnWhRtqM6gSVcrwLmQ==
X-Google-Smtp-Source: AK7set9B04peanV4wBhLfFzs1g9pGIOA4lkMICSMs7zldQ2TUJBQMnQJ7ne0vOW2lLc8zPNnsIbVVQ==
X-Received: by 2002:a05:600c:4f41:b0:3dc:53da:329b with SMTP id m1-20020a05600c4f4100b003dc53da329bmr5029207wmq.17.1675327968137;
        Thu, 02 Feb 2023 00:52:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0ac700b003d1d5a83b2esm3976373wmr.35.2023.02.02.00.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 00:52:47 -0800 (PST)
Message-ID: <fcb460cd-f435-e52a-e335-ccea3ac56a30@linaro.org>
Date: Thu, 2 Feb 2023 09:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c-ast2600: Add support for AST2600
 I2C global controller
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201103359.1742140-2-ryan_chen@aspeedtech.com>
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
> AST2600 I2C global register controller, add bindings document
> to support driver of i2c global register set.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../i2c/aspeed,i2c-ast2600-global.yaml        | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml
> new file mode 100644
> index 000000000000..d92a0878d03b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2c-ast2600-global.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AST2600 I2C Global Register on the AST26XX SoCs Device Tree Bindings

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
> +      - aspeed,ast2600-i2c-global

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

I'll stop review till you test the patches before sending.

Best regards,
Krzysztof

