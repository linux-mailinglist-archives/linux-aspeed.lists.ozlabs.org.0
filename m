Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A88636344
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Nov 2022 16:22:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHPxN5c65z3cLW
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Nov 2022 02:22:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FIYqM2Z4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FIYqM2Z4;
	dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHPxF07xHz3c8C
	for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Nov 2022 02:21:52 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so11403148oti.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4aoLHgFE05riq4cmWmfmiT+Ki6XAw13WHmlMKR+7aRQ=;
        b=FIYqM2Z4zwJkd03cpZExtLXs5D1EcfVfgDi3wMib43kPB9h2immK0hfK6fkkeHo4Vk
         TQKdVEI1YB2me/wkf6fCRFIWhRWI3rLYQaoLoRgUB16YDck5XXxim6rYlrAFr9oz7fNL
         3lDvd8XxA9Xv3uSCXIG8QuprUR794x5W8tS9mgQtBmc5AgUxHKhBSiQOVWekB7Unut1h
         2lY8Mu3WyCGJrY5cKTbd6XYkk+DPzMm3ANgc/h/F8b6CXAchJF4XYtCqpsBWewSuSMDi
         m8xQtks+78XXRnWu1aDcUIl8TBFPJUpSaEHE75WhpWiNGxMgAFAJiz98+HI7A8kZwB6Z
         pnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aoLHgFE05riq4cmWmfmiT+Ki6XAw13WHmlMKR+7aRQ=;
        b=rSMKYhqbAUS2sg7dz+69/jndNDqm0MU8TpBI0I72IXIqKwn1LYc++nagKrLBCZGROc
         8+3LzLrBGdIZxrZMJSLmkhVev5ejKnq4540Z39wvgdmjFMbEZ52bYWmCCP99hfL6iH7/
         S5SxoX8qeC3CvpNsn5Cefm0MahVkVIfTNYz3em3JnZBq0oPqYbq3Pxq0sRLLogQQDsAb
         UkSUnGwh0GLGMCLe9j4MpyJDP/suBNeVLbMnVIyiRs7T0UtzsKPjkONWTQ7VS21DFIyZ
         9R8NxwXyORXTEna5kZQI1b3ok+1L702S/xob/c7pedXftVTAqJ48c1SuLbYbqbrgS4qp
         hkyQ==
X-Gm-Message-State: ANoB5pkSSTqs2HjvdzseX2r1JNxrrNY+zo8eG0zfKudKrS+hIJThNyFn
	gId1YboauFIW4lubwLHIcgg=
X-Google-Smtp-Source: AA0mqf6j3JfOqMGcXTRxGtsdc4OmDhJ+STJS3nrH05Ko1b+ciKHvjsbwSDRblJz5KBqDhemfYIO3AA==
X-Received: by 2002:a9d:4c84:0:b0:66b:34bd:772b with SMTP id m4-20020a9d4c84000000b0066b34bd772bmr15089714otf.276.1669216908871;
        Wed, 23 Nov 2022 07:21:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id el33-20020a056870f6a100b0013bc95650c8sm9263267oab.54.2022.11.23.07.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:21:48 -0800 (PST)
Message-ID: <979b192d-7011-680e-0e0d-d70519bec2b1@roeck-us.net>
Date: Wed, 23 Nov 2022 07:21:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [v4 3/5] dt-bindings: hwmon: Add bindings for aspeed tach
 controller
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
 andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-4-billy_tsai@aspeedtech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221123061635.32025-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/22/22 22:16, Billy Tsai wrote:
> Add the aspeed tach device bindings which should be the child-node of
> pwm-tach mfd.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 36 +++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
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
> +  This module is part of the ast2600-pwm-tach multi-function device. For more
> +  details see ../mfd/aspeed,ast2600-pwm-tach.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-tach
> +patternProperties:
> +  "^fan@[a-z0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        description:
> +          The tach channel used for this node.
> +        maxItems: 1
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

I am not a devicetree expert, but I have to say I find it confusing that
there is no clear explanation that this is for a single fan channel
which is really a child of aspeed,ast2600-tach. An example might be
helpful.

Guenter

