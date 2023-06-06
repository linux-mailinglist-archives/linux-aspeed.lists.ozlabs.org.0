Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9160723FF7
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 12:46:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb6bl3wYqz3dwj
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 20:46:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=THdgqVu+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=THdgqVu+;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb6bf3Qm8z30hh
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Jun 2023 20:46:36 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9745ba45cd1so746140666b.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Jun 2023 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686048392; x=1688640392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IwF81Uszex7htTNK3p1MH/L9IV1Rte84JPTknI851dg=;
        b=THdgqVu+vY8gBqOdTZMw0AmNc6mFnvwxj9ZJ7FmSN3G8T0riJ390M9/uFura4aNH6r
         ZLdDgY76ymTqBJSDQFGo3xI4kNU/Ow0jv5KJSZPb6p3pbJcMWfjIQDTPet+3z9z3jEKY
         /nPhNWfU8nZFTaDSzh/eBFw7QvBR1462yhwe+elTPkM6gImFCYhUaL4HD+/14Rb07pdk
         PzCnmoBLhaOdP4IyBH7fPzF50Lg2ZKEWf64s0a0aauQ3QHX0rBwmMA82MnVGl4zIetUA
         FIdayuGRLfrxEBBcEHyZGfUuOsrQsSKIj3/53Yp+sfYyRXXDpW6uoOeN/GkqJ9a90RAm
         ukVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048392; x=1688640392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwF81Uszex7htTNK3p1MH/L9IV1Rte84JPTknI851dg=;
        b=gOSgcpzvwL2Q79YhIWrMeRl/pLnHJcqs+xxDPYqged0D8aecx3OEcprDRaV+LItFfn
         +RtNFIFubYdKYbloETY3DIdSLASTg/R4RjyTISH2h81wwkL0FcNiIWQzA5hxs+/gwd3D
         HqeAuCaYxzmQfbk4Wk/BO274KJg3QB8UChHNY4jkkvqS83tsPPSY2oKTsc12tprcZLHV
         qm6HydNoBKyhjd0AnnW/qY2/B13QuPthSjk85bOM3ijCg1Y0Pw7s7Hi591QqLBrWU92a
         WgJoU79g4jRF/YS8WvRwmymw3tv4Dz6Fz9r/4fT4MNbCs2+wyy4IPKor9bIek9+JY4kt
         zCTw==
X-Gm-Message-State: AC+VfDwz5P1wSXGySZb+ClFsP8q128KjOkMH0Sl1KL6/UnJMe0CzrVQ6
	xGY1S2mYJ/peUvEQBLsD7JOU+Q==
X-Google-Smtp-Source: ACHHUZ4qdGWPGdQz77Iote61dJgae30lb2JlzA6V3oh4lZI/epujOFp9DJLcmngZs+OFwjsSZyiqMw==
X-Received: by 2002:a17:906:730c:b0:94f:956:b3f7 with SMTP id di12-20020a170906730c00b0094f0956b3f7mr1903651ejc.2.1686048392634;
        Tue, 06 Jun 2023 03:46:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709064f8900b0094e6a9c1d24sm5599121eju.12.2023.06.06.03.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:46:32 -0700 (PDT)
Message-ID: <d7d0d46f-853d-ca78-9e6c-8b05011f2f69@linaro.org>
Date: Tue, 6 Jun 2023 12:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 2/5] dt-bindings: hwmon: Add bindings for aspeed tach
 controller
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
 <20230606094535.5388-3-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-3-billy_tsai@aspeedtech.com>
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
> Add the aspeed tach device which should be the child-node of pwm-tach mfd.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> new file mode 100644
> index 000000000000..50b3d8c98d55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> @@ -0,0 +1,40 @@
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
> +  This module is part of the ast2600-pwm-tach multi-function device. For more
> +  details see ../mfd/aspeed,ast2600-pwm-tach.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-tach
> +
> +patternProperties:
> +  "^fan@[a-z0-9]+$":
> +    type: object

additionalProperties: false


> +    description:
> +      Child nodes used to enable the tach channel.

Anyway you did not respond to our concerns. Why do you need it at the
first place?

I clearly asked:
But more important - why do you have such child
nodes? Your example does not have them. What's the point? Do you expect
different number of fans per one device (one compatible)?

Where is the answer to these?

Sorry, but ignoring the feedback and resending same stuff will bring you
nowhere. Several comments in the patchset were ignored.


Best regards,
Krzysztof

