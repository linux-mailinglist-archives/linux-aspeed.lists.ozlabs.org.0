Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0E78679A
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Aug 2023 08:41:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZuwcSB5H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWYQW6v5sz2yVT
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Aug 2023 16:41:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZuwcSB5H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWYQH3l58z2yTy
	for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Aug 2023 16:41:25 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5007f3d3235so6618641e87.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Aug 2023 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692859280; x=1693464080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9i9P/L8yrXEBknvUsgFXYcHwitiPfQ3Qj/oqiiME4Lo=;
        b=ZuwcSB5Hus8aOVLW2o1wnZ1BI4QqPj5ZQdLJvmCxifzTiZqutuagzuEA1DOLN2fqeB
         NzydH4s0b9CdTWryqzjY6Oyyej7z3Ypl/h0iWf3Zue4iaFXDfitpR8lcc7zq5GABmG3Q
         8EC2glB64JYIvSNByn3iTzZwLRP1WDLra7orTjgxVvOXuUQKtYkpANjnrBwhuWmqDlLQ
         w9Ix+F+oDFVULIdgL4Xj/BIY4zn89iJd6i4nut7yYQyzwLoWDZcDyKPxG0g4oc+/YRTY
         sOqznOYSYLDbcygVgsUS8whCrJlN0T0eov6qpN5A8HQB7Rf8JE062298n2Y9tF7Cv76g
         unzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692859280; x=1693464080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9i9P/L8yrXEBknvUsgFXYcHwitiPfQ3Qj/oqiiME4Lo=;
        b=IGaUPIpiUI2CwumqWRhdijPKBMhWGm24JuVi9EALXLQV6vTeQWNSmUIN1PPfogyogP
         mi06MkyHPnOupig7958QiMMcHxkrNa4MQgWjYG0B0zI7AASt+qnxgKNhDay4oTCHEYqh
         r08FLdXXtDBJDHGmPSkGsz1NqvpsMNh6no7y7piGjiX1ImDUSPP4rt1ranLMVoESnQ+w
         eaGLE/1sUY4kOcIXfd+htGP6y5QFwPYLi8zrMgh2scXiTzeeBey4H1BlP5r80EgNKDrs
         ikq3CEl7+St0JDSm/sBiEBwYOZ82oppFB08RA2Jfmbf4ddPDl0ppBX7R+NaM+efWgOZm
         Gfrw==
X-Gm-Message-State: AOJu0Yz9+xLsL84sdsBQUN4nj+kgojDsD18nCKJNiLQfw+leAnULN7BK
	nysVFRjjhR7pguuRIGVfKcNomg==
X-Google-Smtp-Source: AGHT+IG/WSER3YY2uiYGuTReO1vmCy0UJBRwseBs67v3EaFPUs/cxt5WDmhCRYsE/Jjdn53EClnBzg==
X-Received: by 2002:a19:2d17:0:b0:4fe:1b7b:3cc9 with SMTP id k23-20020a192d17000000b004fe1b7b3cc9mr9654809lfj.38.1692859279564;
        Wed, 23 Aug 2023 23:41:19 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id h3-20020aa7c603000000b005256ae8494asm10063848edq.17.2023.08.23.23.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 23:41:19 -0700 (PDT)
Message-ID: <41cabea8-f694-f860-b3c1-757e9b8119f8@linaro.org>
Date: Thu, 24 Aug 2023 08:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] Title: Select GPIO command source.
Content-Language: en-US
To: peteryin <peteryin.openbmc@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 eajames@linux.ibm.com, johnny_huang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230823160810.1067102-1-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823160810.1067102-1-peteryin.openbmc@gmail.com>
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
Cc: peteryin <peter.yin@quantatw.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 23/08/2023 18:08, peteryin wrote:
> From: peteryin <peter.yin@quantatw.com>
> 
> Description:
>   The capability to choose the GPIO command source
> between ARM LPC and Coprocessor CPU is supported.
> 
> Test Plan:
> Get Bank gpio command source
>   e.g.
>   cd /sys/bus/platform/drivers/aspeed-command-source/
>   cat 1e780000.gpio-command-source/bank_abcd
>   ARM ARM ARM ARM
> 
> Set Bank gpio command source.
>   e.g.
>   cd /sys/bus/platform/drivers/aspeed-command-source/
> 
>   echo "A ARM" > 1e780000.gpio-command-source/bank_abcd
>   or
>   echo "A LPC" > 1e780000.gpio-command-source/bank_abcd
>   or$
>   echo "A COP" > 1e780000.gpio-command-source/bank_abcd
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> ---
>  .../sysfs-driver-aspeed-gpio-command-source   |  24 ++
>  .../soc/aspeed/gpio-command-source.yaml       |  58 ++++

Bindings are separate patches. And it would be pointed out by checkpatch.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch` helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

>  drivers/soc/aspeed/Kconfig                    |   9 +
>  drivers/soc/aspeed/Makefile                   |   1 +
>  drivers/soc/aspeed/aspeed-command-source.c    | 266 ++++++++++++++++++
>  5 files changed, 358 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-gpio-command-source
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml
>  create mode 100644 drivers/soc/aspeed/aspeed-command-source.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-gpio-command-source b/Documentation/ABI/testing/sysfs-driver-aspeed-gpio-command-source
> new file mode 100644
> index 000000000000..4698f47a1f75
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-aspeed-gpio-command-source
> @@ -0,0 +1,24 @@
> +What:		/sys/bus/platform/drivers/aspeed-command-source/\*command\*/bank\*
> +Date:		August 2023
> +Contact:	Peter Yin <peter.yin@quantatw.com>
> +Description:	Get or set the gpio command source for ARM, LPC or Coprocessor CPU.
> +
> +		When read, each file shows the list of available options with bank
> +		that depends on the selected bank file.
> +
> +		e.g.
> +		get gpio command source
> +		cd /sys/bus/platform/drivers/aspeed-command-source/
> +		cat 1e780000.gpio-command-source/bank_abcd
> +		ARM ARM ARM ARM
> +		In this case, gets bank gpio command source.
> +
> +
> +		e.g.
> +		set gpio command source
> +		cd /sys/bus/platform/drivers/aspeed-command-source/
> +		echo "A ARM" > 1e780000.gpio-command-source/bank_abcd
> +		or
> +		echo "A LPC" > 1e780000.gpio-command-source/bank_abcd
> +		or
> +		echo "A COP" > 1e780000.gpio-command-source/bank_abcd
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml b/Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml
> new file mode 100644
> index 000000000000..034183667501
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# # Copyright (c) 2023 Quanta Inc.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/aspeed/gpio-command-source.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof

