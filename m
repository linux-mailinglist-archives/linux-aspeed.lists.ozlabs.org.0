Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B778D4DD
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 11:45:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qC5vOlSw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbKCW34ltz3bfK
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 19:45:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qC5vOlSw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbKCP00brz2xm6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 19:45:04 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so7063965a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 02:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693388700; x=1693993500; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GinLhIkYK1eux6i+cjheW/SanM1hfGzP7zFFV4Pq7CI=;
        b=qC5vOlSw45kE8XjxzOH2SLdFJBABvhCGPyRjI4sIiCFU3AQcnlOORjkvERG0upKvZr
         TBzwitL9tFVHnBRp9E+GDd1kO602hsFR/O1jxW2fU9LeN3s4ZpjloHMFYhXFD0CshAAY
         dHXxAZqR6st0rafn7yH7gvfpmtnZhCFC8UGlULPQm68UMl5xZOExBk/L/K16BOID/XVJ
         rnSs69LXXzY5m7EqdkSlRos8YN9jVlrAIDIQ5eFGgYp2HUhioA7GM1ngKGk0riut2SWp
         8bHmjg8CJyjFwB+oQ0qzMg6I8cOUC7Sm/kVBviTWdErXcmO661LoNaBmbs053+rZ652w
         IAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693388700; x=1693993500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GinLhIkYK1eux6i+cjheW/SanM1hfGzP7zFFV4Pq7CI=;
        b=eJ39Hm1NmtBpvcKs7jo8LQhsGQpl6V2dJD28JieIAy16RQrMtJrJkES8qahPQMlT3s
         b8MyKf7fS2vSFMUlA7SUrx4irSbOLMxeYBusrZTY3yHMXqDGeNTzDTuM9qzdn7ymiDmE
         UEsN22S5cObQ5VPx3+Gwl2xGY+xnhXedTWD/nQSpPj5ejOUM59uLSX/Tds8IV+ieX3uF
         yKNc+Bp9DAb0FwNKyTqotzgXo+VWM2bbU1M52BFOmP4qehperHWTfU6G3iYRe5WT7PLg
         D5RqHQ02u4ivWWlCOjdmq5WRMcsssUYMHbqvGfhZDML6Es/Lqy8Km93zhWwmPKhQJqXe
         guLg==
X-Gm-Message-State: AOJu0YzUju/h1qmZqfgLB9C1mYZawBQim+6CkaZL++cLnY5cCJpFCUL/
	merlYWj2kv3FQJZVzUlvmbVKrg==
X-Google-Smtp-Source: AGHT+IErP0xuXzSAW/p+xjsBaBQUM/72RL+nvycu+pslby5SCw0FQTJk9JH2ZdMQgx3+rxaEkK5Myw==
X-Received: by 2002:a17:906:3152:b0:9a5:874a:9745 with SMTP id e18-20020a170906315200b009a5874a9745mr1129087eje.26.1693388700643;
        Wed, 30 Aug 2023 02:45:00 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a8-20020a1709066d4800b0098e422d6758sm6930455ejt.219.2023.08.30.02.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 02:44:59 -0700 (PDT)
Message-ID: <b9cbe9be-b03e-6c7a-d06c-b75b012b5b25@linaro.org>
Date: Wed, 30 Aug 2023 11:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
To: peteryin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
 <20230830090212.3880559-2-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830090212.3880559-2-peteryin.openbmc@gmail.com>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 30/08/2023 11:02, peteryin wrote:
> Add linux device tree entry related to
> Minerva specific devices connected to BMC SoC.
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>

To clarify: your full name or known identity is "peteryin"?

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>  2 files changed, 386 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9e1d7bf3cff6..edb0b2105333 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-wedge400.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-facebook-yosemitev2.dtb \
> +	aspeed-bmc-facebook-minerva.dtb \

Nothing improved here.

>  	aspeed-bmc-ibm-bonnell.dtb \
>  	aspeed-bmc-ibm-everest.dtb \
>  	aspeed-bmc-ibm-rainier.dtb \


> +	"","","","","","","","",
> +	/*O0-O3 line 224-231*/
> +	"","","","","","","","",
> +	/*O4-O7 line 232-239*/
> +	"","","","","","","","",
> +	/*P0-P3 line 240-247*/
> +	"","","","","","","","",
> +	/*P4-P7 line 248-255*/
> +	"","","","","","","","";
> +};
> +

Nor here.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

