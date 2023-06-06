Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5B724015
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 12:49:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb6fl4ppnz3dtZ
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 20:49:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m1tCThnr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m1tCThnr;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb6fd09wmz3bcc
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Jun 2023 20:49:12 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9741a0fd134so988348666b.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Jun 2023 03:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686048548; x=1688640548;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OxQ/WVFYZmGc+9CMM9rjpLj4RMdDlgV2nWVue5FuEM=;
        b=m1tCThnr2QA5UotLP+/T+Gj9clGL6ioYl8gxstTn5hyE9T+4I10NPOzZrUr0uKT1uE
         QqVGSaFIguYSwKeTXKJiBo5ZaAWMY9gwTmYyj0Iw55khskv/NeSnSyivRpfC4yxEIx4f
         ayUb1xXsmfkWZyDgd2/YGfgUhee5AzNyLX5mSltAC+FpH6vS9bZglrI7UtwdKH26BqYa
         /F9UFAjS++gJ7IaslVqnZ2sYMz3TzCcHFjViLp1IpPS1FqhngLl+RJDwB7TCBajo1uCK
         dp1L4E8n7M1MuKXGCFuSMLeRm1d07aWg8NzCY272rEyC5un7/OXo57JShej+xQjwXlLv
         UN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048548; x=1688640548;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OxQ/WVFYZmGc+9CMM9rjpLj4RMdDlgV2nWVue5FuEM=;
        b=F2LfD4WdqxcSmnm1/1GpXBUbRGsF1oVMqvpxBigp3lycrjjGFTOyn1zSXeNO/gndPl
         aK2xXBKFbW6Apb3mlMjN7ELAsyGlJOwV8J/VAgXV9k6rU3Eh2evi6a9if5SP37vOqLzR
         E5y6ogLo6/mKPAyo/mmehx6j1LFZtiVPNlGxge205qaKZBtapZRG6ZYoB0ZFVn68tsAZ
         vcpUuzzvcQrFYmO/+hDZNaPtR5w2IoP2zeevyTSYpFHt3hLD0qkRAUsh/PxRuKPw1/yu
         d5Ux6rns7Oa44YU8+0Ytq58pe0QUgRWm/gXKtix+YsSbQ6ZQ6/KczWHDSVOHh9lAtZSZ
         ezfQ==
X-Gm-Message-State: AC+VfDypEJHmpSpxNVwsQZl5X979dM5+fY6UKcLTNCeChKqDbD2LpZC8
	JrqwQ2Q09aEPue4HnbiSCb1Pig==
X-Google-Smtp-Source: ACHHUZ62p9CREiTDBs8+NQvQxZi8jYGLp28YpDUxsKHxFW/5WSepttSvAu2okKmihhBbk0Igv/r/PA==
X-Received: by 2002:a17:906:9b8d:b0:965:7fba:6bcf with SMTP id dd13-20020a1709069b8d00b009657fba6bcfmr2266323ejc.67.1686048547910;
        Tue, 06 Jun 2023 03:49:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id oy8-20020a170907104800b0096b4ec45e10sm5420767ejb.139.2023.06.06.03.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:49:07 -0700 (PDT)
Message-ID: <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
Date: Tue, 6 Jun 2023 12:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-4-billy_tsai@aspeedtech.com>
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

On 06/06/2023 11:45, Billy Tsai wrote:
> Add device binding for aspeed pwm-tach device which is a multi-function
> device include pwm and tach function.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> 
> ---
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> new file mode 100644
> index 000000000000..f98c11ff3f8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PWM Tach controller
> +
> +description: |
> +  The PWM Tach controller is represented as a multi-function device which
> +  includes:
> +    PWM
> +    Tach
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2600-pwm-tach
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1

NAK. You got here clear comment. You cannot have simple MFD with
resources. It is not simple anymore.

Everywhere else you also ignored comments.

Best regards,
Krzysztof

