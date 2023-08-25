Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F2787FB1
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 08:19:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvI/h3oY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX8th630zz3cBx
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 16:19:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvI/h3oY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX8tc0VJBz2xBV
	for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Aug 2023 16:19:35 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-500913779f5so822842e87.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Aug 2023 23:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692944371; x=1693549171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OvkT3Z0KfNNmbGikZj97H1hwqaycrzDTaDpACXf6YA=;
        b=bvI/h3oYjARxBhcx2gAUnY0OmpxRjHCDnFhJj3iBaT4ivDc062at/yKszxwLodPg/P
         z6FOSUUuBAMvfcjvWdeuYR7DfYKUdmx+QUJdohTSefZzAaOJyKs0hq8+WTrcsh7EcUXR
         zS/mfG1wwwPyiVrnR5N/vy2IIyqnxSlfb7w+kZyM/C3/oPk5+/Vx+2LB0XOyihfOMBhK
         +OoZeu6xl0MW4rKjSLVyIZn8R+t/8MY4kzZfuWkjpHjl7yuFJsUYjL2rImt0gtXLMqdH
         0uQqEnDU2MCEVlhErtDYJ63qu6R7mf4ALoA7Hn6R+YDFcp7yQKJr/J1J1JVcIsvEzGZC
         hYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692944371; x=1693549171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OvkT3Z0KfNNmbGikZj97H1hwqaycrzDTaDpACXf6YA=;
        b=aIQziq+zitpD/eE3jwWCYkpsxCHCTVmscMr+AGQWhwl51WtwlaN7mFM8miaOq3mRPc
         9o1g946V440S3yvBuyunse7nlg81fbqGlt89ewbl6/fWIADNSRqOFwrj7GhK8iVVcqJV
         1GTdkCtJFky1RrwDY/G7cnvCKW46nspDxql/GGcrn0/HtnmrSpuytWNnv6pPDn8PDwsJ
         4ysK/MQEo3CAR3dYEvAOjHYYIuP4hVLH9hlmwS8ZL54AtsTF54ZKOE3QVwN08MPYDRPL
         X+J8Yb7jrYbtqrANdsZhRzosRCzQMiLZSYE70jmR7+es/+UZTFNS3wywVtGR2Qby3csi
         vTYA==
X-Gm-Message-State: AOJu0YzBiEV3UtY0sjEVOltx9N5w023eQqyrtBWarSlMRKPbLRz6dJfb
	XiKUMEFO/ckAVVtlir8r6Ghuug==
X-Google-Smtp-Source: AGHT+IHJo9ECuER4vgAUWKW7gADLJpu+CPX5GLOGcHcEocLE44CuYzpz5xqqIZMthKOJ1+i6AoTUYw==
X-Received: by 2002:a05:6512:3406:b0:4f8:7781:9870 with SMTP id i6-20020a056512340600b004f877819870mr14983315lfr.60.1692944370837;
        Thu, 24 Aug 2023 23:19:30 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id e10-20020aa7d7ca000000b005256994e335sm629033eds.92.2023.08.24.23.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 23:19:30 -0700 (PDT)
Message-ID: <fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org>
Date: Fri, 25 Aug 2023 08:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] Add Meta openBMC Minerva dts file.
Content-Language: en-US
To: peteryin <peteryin.openbmc@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230825032945.1649050-1-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825032945.1649050-1-peteryin.openbmc@gmail.com>
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

On 25/08/2023 05:29, peteryin wrote:
> This is for Meta openBMC Minerva dts.
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> ---
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 330 ++++++++++++++++++>  1 file changed, 330 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> new file mode 100644
> index 000000000000..4fb9b5f72942
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Facebook Minerva";
> +	compatible = "facebook, minerva-bmc", "aspeed,ast2600";

Missing bindings and that's not correct compatible.

> +
> +	aliases {
> +		serial0 = &uart1;
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS4,57600n8";

Drop, use stdout path instead.

> +	};
> +

...

> +&gpio0 {
> +	pinctrl-names = "default";
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","","","","",
> +	/*B0-B7*/	"","","","","","","","",
> +	/*C0-C7*/	"","","","","","","","",
> +	/*D0-D7*/	"","","SOL_UART_SET","","","","","",
> +	/*E0-E7*/	"","","","","","","","",
> +	/*F0-F7*/	"","","","","","","","",
> +	/*G0-G7*/	"","","","","","","","",
> +	/*H0-H7*/	"","","","","","","","",
> +	/*I0-I7*/	"","","","","","","","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1",
> +			"LED_POSTCODE_2","LED_POSTCODE_3",
> +			"LED_POSTCODE_4","LED_POSTCODE_5",
> +			"LED_POSTCODE_6","LED_POSTCODE_7",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"","","","","","","","",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","","","","","","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","","","","","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","";
> +};
> +

Stray blank line.

Best regards,
Krzysztof

