Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449B72766E
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 06:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcBnG67RLz3dxH
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 14:58:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oJCk96Ik;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oJCk96Ik;
	dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcBn65kHVz3cGk
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 14:58:33 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-39aa8a055e0so189265b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686200310; x=1688792310;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JT3KlhOojBPgttBy2y+jESI/Sgq2kQ2/GXL/IhkMhrg=;
        b=oJCk96IkLeNGopmiIbbiZG7purBH3OY6c3kx4f0qRS/gRqCBKn6ar3hEUXrP3dvwlF
         TPbqJNotco49vVRe3uQS35fn+hDp6b3T5JNuEnCIVbpswFYUUF0BazJP7ZoKlMU99sQ7
         Mr1/N4Hi3nNv/FKHcCEL6otKiRd+y/tqroI/yWRNZYeTsslmp04L6m3lKH72cXW/OzmY
         YYH/gwVu1FLFC+LBMVAiZA6i9si4ErTgc6s57BYA/17cw9gAGqEpoNwFR1jJPJ9ZmGOM
         fbYnbiz4tveUXRwG6C35PiHwMP8/8pj6vM9xO9arqj59CL66NKzuFMmkPAMHAYGdPT4o
         KiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686200310; x=1688792310;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JT3KlhOojBPgttBy2y+jESI/Sgq2kQ2/GXL/IhkMhrg=;
        b=EHL2dSXN+V4n05uVhebQr1AARotTZQLYnBVRs6eDGNJg/dZbSpfsm0w8XQveT+pW7d
         vIkeWtM0RQ+NUPvOH5iSuKxUSBv43fJUoTmM5CdiHvr95xSFkfxFkIGd6kPdWYZHh3zw
         PKRVfU2f/8fl5qOw8iPpSwn0FWVDi7s7T2JFyFKpcHs3KYcnsVd03TrMiJTV8+I+xUgH
         mI84B+WPw+BDoyPR03EB4RzLnEBHnSyxyL6+IpA0zZSTv/UvXY5rd+vpma/db8t06deM
         0mpe18xYx68n84mET91qeTFXJkJttxm96m37i+daKDBt37n2V+uOzDzUMt6ytVyGK50/
         hAEg==
X-Gm-Message-State: AC+VfDwJgzXS3ff30FHslQciaH6TrsZzZTEuiXVHgWudY7SQGvkKK0gX
	+XyAuS1Y04Ys+uZmMLU4fxM=
X-Google-Smtp-Source: ACHHUZ7IbXKqWXIgk0etOFyy/EwK/wZPz4znrrxclmpf7ksuCGmhrJWXKHrojfeLz2BB2S+1qEaGHg==
X-Received: by 2002:a05:6808:96:b0:398:27d3:1fc3 with SMTP id s22-20020a056808009600b0039827d31fc3mr7051865oic.42.1686200310606;
        Wed, 07 Jun 2023 21:58:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n13-20020aa7904d000000b0064d1d8fd24asm206662pfo.60.2023.06.07.21.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 21:58:30 -0700 (PDT)
Message-ID: <c1c485b0-b68b-4db7-4b67-5d59f1ecb84e@roeck-us.net>
Date: Wed, 7 Jun 2023 21:58:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
 andrew@aj.id.au, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 corbet@lwn.net, p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-3-billy_tsai@aspeedtech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230608021839.12769-3-billy_tsai@aspeedtech.com>
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

On 6/7/23 19:18, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> new file mode 100644
> index 000000000000..627aa00f2e92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> @@ -0,0 +1,32 @@
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
> +  The Aspeed Tach controller can support upto 1 fan input.
> +

The code says:

In Aspeed AST2600 SoC features 16 TACH controllers, with each
controller capable of supporting up to 1 input.

which is a bit different. I guess there are no examples anymore,
but I'd really like to see how this looks like in the devicetree file,
and how the driver is supposed to distinguish/select the 16 inputs.

> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-tach
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

