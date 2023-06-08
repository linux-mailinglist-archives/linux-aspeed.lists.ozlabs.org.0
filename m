Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A06727795
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 08:46:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcF9t6zgtz3dqt
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 16:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iGdtH8Yq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iGdtH8Yq;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcF9p1WnHz3cdt
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 16:46:37 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9745d99cfccso52240966b.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 23:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206795; x=1688798795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZgN/pq4zJXDMGVU52SbNy/IfFWaN7LSvJZjeMzXd3A=;
        b=iGdtH8Yqn6jyihGPQrVSC70sM4ACObapuBk2v11OGmQBItBAukIcUpZpLTmfOoBuMH
         MHMA687Xp4MEV2oWdJP/Wn/K3E5glM6aPgQL+wxe5WGRKiOHlCEefmESBl0dNa7Y1BSI
         J3bKeUuKfB2HIqfxCO/S/dQUt2PdVGLQmRA+DX2hVHY43g0SQfyYlk26IAh8GMiPJAAK
         k8oZ27dbhxkySftlDFX9G7fu82nMV96SdFjcG1j/pvBA6anzLU9pO1YuQUUebDzPcmol
         +y4mxiKfkVli1IYAh7BCSbrk1hcSw5wlO0WwSjUWivy5UYahTuamqSnpcWSrg+dTFkQ5
         eG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206795; x=1688798795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZgN/pq4zJXDMGVU52SbNy/IfFWaN7LSvJZjeMzXd3A=;
        b=TZpf3mlw+WSlzaH4RWNkwMh2ze1BMapdYunItF267UJXU1ScOHQ+c1C1fPJ1nPHETU
         c7Vb46MRMJ5ox2vA7017O/1Bq1EPvZtdnoXNl6cWPv8JaGQ+zJmA7dIwfFx7XOtfy3ls
         n0SfoKrm2SHW5RMophP4UxX+G+TiejOQBVJkm+cdTHIb4HPNLz0UjeqY9/yhXfzFkXPT
         CRNeI/+7jDZlgvOpZVJTEKnbyxB0cA5G0/JbfHR3epGM3DBIuySC7Xml3FdEuO6CFrvh
         uGx3nh58NBiyJgmPdo7AFAEaY8rHnGFjx8J0pIr0++NIt5pSeRvd2EJj6LW9ORwQu0E5
         elVw==
X-Gm-Message-State: AC+VfDxTo2I0H0evgyCejfFgLYT0Or6fJjkc/1SlrhydSJ9Xu/CQYAlR
	cI10dMFaT0Uucu4mlGu1mNC1mg==
X-Google-Smtp-Source: ACHHUZ5p6fnCJHV5uldMrLu0wmGEQEGXksmv6Ojnv/qWf/9hyk16AeQy+XeNgmX+HuGIJCAn8kxjXg==
X-Received: by 2002:a17:907:72d0:b0:974:5ece:19a6 with SMTP id du16-20020a17090772d000b009745ece19a6mr9808402ejc.54.1686206794751;
        Wed, 07 Jun 2023 23:46:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z18-20020a170906945200b00978874d1083sm273646ejx.135.2023.06.07.23.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:46:34 -0700 (PDT)
Message-ID: <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
Date: Thu, 8 Jun 2023 08:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-2-billy_tsai@aspeedtech.com>
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

On 08/06/2023 04:18, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> new file mode 100644
> index 000000000000..a9e040263578
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/aspeed,ast2600-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Ast2600 PWM controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The Aspeed PWM controller supports up to 1 PWM outputs.

This does not look right.

> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pwm
> +
> +  "#pwm-cells":
> +    const: 3

3 cells? For one PWM? What are they?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - resets
> +
> +additionalProperties: false

Missing examples. All bindings need examples.

Best regards,
Krzysztof

