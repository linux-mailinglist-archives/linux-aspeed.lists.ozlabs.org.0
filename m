Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7C687809
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 09:58:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6t3h073Fz3f3m
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 19:58:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tG+xBN5E;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tG+xBN5E;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6t381D4hz3f5G
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 19:57:40 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso3195057wms.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Feb 2023 00:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMiqUodml6uBOLajfZK6hc14FkG0GweLDtekS4XSxl0=;
        b=tG+xBN5Ejl7wU+JxdQXLH7IUd4en7sOPdSp1l6XzoC77o9VA4zCb/zf0HtVhXelPt6
         KR/7Wj/G6ejyvPtdEKd0OeZ8ZoHtM+kqKekS02afzNglfro8r6gIG2rZGVfA5lIZqPP3
         ZTgx+lzzOHeOH6WfDH7OXhONdD+OCpebDSfJAnJrg0PGo9jn375awJTi9FcQUWaiZsEJ
         EhhpOrK+CeMOvapWaCez9xOUEQFkhTB06xRdw6H5UZUUq/Hr6kgyN0JTPln2M47PFPMc
         FL92uvovQ19axKkHOJwbifSib92Cq0G2tBsg/mxFdzB953Fan3q68OUnFHa2KdkGc2mB
         ByDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMiqUodml6uBOLajfZK6hc14FkG0GweLDtekS4XSxl0=;
        b=nB13mi4TJ0uQxHuo4ITDppOthOBFxHnRfxQLFK57C7aAsTEBJkfe/2v1Kg+BBvrij+
         0tTYzGRTYMeGABm+9DHRsMCGm71iM0g8UADoOUR7+GI3ABtKvYEelpeb3dTOU2aSS+ZZ
         SpLaWNkklb/9bphLzCUecE8Z/O82ZHDFnehpdxIRywP9CBmofFg9Jpi331YNFic5TwNn
         iKKLX6sjiXfrphEad1B7sVnWfDYo8js2twbgpyLvVXySQGYGbNtu/7olPVIRi1OHaZnz
         9QwX7Z6U6zbVnfPYJw3gAxj5OcNvdKgSysUO1FBaCzUC3HGRI17HPfKCASzMaQrNj81h
         L6jA==
X-Gm-Message-State: AO0yUKUcsB/B1TdyWSeTtnawiGMmmKh9fzh3gLry2iVttACB7e14Os+v
	E03PceBwhDwQsH8m9/TWZc+BQg==
X-Google-Smtp-Source: AK7set9lWEW3d6A+NKvJN5QuCV0g6pCrziUQhEsGu/uZbaYXw7aieUCyeaBUlrgTMYcQhdApt+AFSg==
X-Received: by 2002:a7b:c3c6:0:b0:3da:22a6:7b6b with SMTP id t6-20020a7bc3c6000000b003da22a67b6bmr5172403wmj.13.1675328256059;
        Thu, 02 Feb 2023 00:57:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u1-20020a05600c00c100b003a3442f1229sm4059403wmm.29.2023.02.02.00.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 00:57:35 -0800 (PST)
Message-ID: <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
Date: Thu, 2 Feb 2023 09:57:33 +0100
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
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2c-ast2600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AST2600 I2C Controller on the AST26XX SoCs Device Tree Bindings
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

NAK. It's already there. Please do not waste our time in submitting
duplicated drivers.

Best regards,
Krzysztof

