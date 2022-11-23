Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34196352C0
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 09:33:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHDt23jrCz3cKb
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 19:33:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IOlJksGN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IOlJksGN;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHDsx23q2z3cJq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 19:33:25 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id a29so27067681lfj.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 00:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r24+kxiwoCSvm2ayWOZArpjPKCuE4SnymqyJAd3zIYM=;
        b=IOlJksGNdbJbrBpJA3cBm5xy486N/lEda8ByQPM70Vn2iN6r40/7a8iMKvXvbONgot
         dTJRLBkxGogODzjpQHPXfCuRt0SxPUiYwNZapRMJItO9VYrAvduz/YyTAXv81YAGLexT
         BFXU2sSbdjP7kWM4wiENR6YE1J09HxsVAPfm5mVtOFdnoXMfhBEHeKPqxDSEVrHKgs06
         Q5P8Hp3iHER6Nx4H3p/ZqW6tkLcflP9UhrVqKv4SL3Vad5jdoQCfbGdxWx3TvLi+fDFp
         0JGDldMXrOOiYsbT9fBpEjMbS5rABl99l6YBfO3Z5sFcYXGW0oqpuIAr/yptdQpUhNSL
         cG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r24+kxiwoCSvm2ayWOZArpjPKCuE4SnymqyJAd3zIYM=;
        b=lrzKzEKSmT9uesOi6fCHtvZtf+rW26eYuO2m/gY9FXIhGXpUQPzTeRZgWjCvUCpki9
         0GUfO0qDb3MQ1O8IQAhVYQL8c3zwyznu5fgSmSnP6wcmadEbm3v3vthoVPLdkIcq1h39
         4k3D35josooplTgOk5/Hx2E2wAYoI3NycxKtUFKt+LzY2qjAIUCfA6gPnoj4AZYZXZn9
         8ZwP+MsvpPidpbEZk+6gCi4wGvzY4woscYF5HM8aJiR1b9wag0ckIwTXfulrAthXkbvY
         tUVmUJSLZyFsxF9+tEBK/QSLebHk4A05P0fF9a20VgjU7hDTgjF5cwHkDvzbJXk9QzN2
         sgKQ==
X-Gm-Message-State: ANoB5pnbX0HXw5Bj+Egmh8cnc5IRx+oAdtnUx839xZuM7VdMTK0q6EjX
	3f1UAUHXBCeFroLoapTdtofO3g==
X-Google-Smtp-Source: AA0mqf67rrmrBfbzQZgJMP0M0a0H3ooRG18aVbjknpNHm5vqSTPAfytlNHVUmddpFWSVh4iqF+jDXg==
X-Received: by 2002:ac2:47fc:0:b0:4a2:2f31:12bf with SMTP id b28-20020ac247fc000000b004a22f3112bfmr9699219lfp.550.1669192400912;
        Wed, 23 Nov 2022 00:33:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j8-20020ac24548000000b00499fe9ce5f2sm2834949lfm.175.2022.11.23.00.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:33:20 -0800 (PST)
Message-ID: <d7538ba3-c326-ffcb-afe0-5abb7f0deff1@linaro.org>
Date: Wed, 23 Nov 2022 09:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [v4 3/5] dt-bindings: hwmon: Add bindings for aspeed tach
 controller
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-4-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123061635.32025-4-billy_tsai@aspeedtech.com>
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

On 23/11/2022 07:16, Billy Tsai wrote:
> Add the aspeed tach device bindings which should be the child-node of
> pwm-tach mfd.

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> new file mode 100644
> index 000000000000..f42114f8e3c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,ast2600-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Ast2600 Tach controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The Aspeed Tach controller can support upto 16 fan input.

Same comments as before. When you receive feedback about something,
please correct it everywhere, not only in one place.

> +  This module is part of the ast2600-pwm-tach multi-function device. For more
> +  details see ../mfd/aspeed,ast2600-pwm-tach.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-tach


Missing blank line.

> +patternProperties:
> +  "^fan@[a-z0-9]+$":
> +    type: object

Missing description. But more important - why do you have such child
nodes? Your example does not have them. What's the point? Do you expect
different number of fans per one device (one compatible)?

> +    properties:
> +      reg:
> +        description:
> +          The tach channel used for this node.
> +        maxItems: 1

Missing blank line.

> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

Best regards,
Krzysztof

