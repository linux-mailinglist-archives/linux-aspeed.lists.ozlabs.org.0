Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634DA5BF758
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 09:14:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV5s6rnhz3gJj
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 17:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ox1fKOJ9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ox1fKOJ9;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTxh38XVz3frt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 17:07:19 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id x27so7775919lfu.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YtABP0DqM9zEJdk0m73nlx/TsH7lbCUoL8cujDQ7aNE=;
        b=ox1fKOJ9o4w+DrZbYs2Po526yD7gucfmp0rf6GjudyDGT9Xjg9ClRm7XN/fZBOPuiw
         eqVORFG4AlfL9Hnf39Smw8yszHPExASgSZxpMH6G+bJr7YmcDwUaA2MZqg3D7dXdm4dg
         gog7imypWLTgIQ+NsSqc7IYfR/2RBKfaj9fyAnXp0Qi7gdgSfs9kMgTir58NioFt36hF
         GciOhfaOU3NdV2GV7be/Oyr5UGnGmPL29IH2G6Ygwk2ibGnWbCylI/dZaUU7zD0Hwd3n
         e5mJbfuiPj+CFnHu8hs0zpS7w3iyCDb4Aua8LpmGvSSMHsdHSin8O0GWcPD7Sya6u+7s
         jwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YtABP0DqM9zEJdk0m73nlx/TsH7lbCUoL8cujDQ7aNE=;
        b=VmcOkwQRCqQxNPgCz6TYv2LG9u5/lVFeojdYGULwFIOkLWDTvPvYMeH2xJRtxxjWGH
         0adYdEakTkcxpEZqtBzw1k89oj0NEf9Im91FWgt++C0vXjx++4DMIUOA4Pov0Q9HvInt
         me7R+jbOaDqSs05ObxSvUgGLteQAKv7umcx5qLWjjDkcgAH0Ioks2Ebs+KrMEfED3dYW
         BLJRUf0ueZyMXYrffpHfKziQOv1gH8vMcAtzE1+y0Mo1S0ahEU90FierPnFBUTnKKphc
         vyGifa+me3avXetNJCQi3KOzIBFR40nH68FF+UqcOj2OFj3SwAdXK1w4i3qT6k3r8EnQ
         BZqw==
X-Gm-Message-State: ACrzQf0r0gU2ZI8nDd0EaZVo7a6HXeSAaBdIwItDkdwujL4ZNbrYh6ip
	58pTJ7JukB8JjHjhoC4pGhxTWA==
X-Google-Smtp-Source: AMsMyM6ky8xTFCHnJtDxE68NR/SX+6TXHFxmF3SpTO8jQWt25fPgViaf2XPaDuOjRc3qEOhxL1jN7g==
X-Received: by 2002:a05:6512:3408:b0:49a:b195:7ab5 with SMTP id i8-20020a056512340800b0049ab1957ab5mr9107648lfr.92.1663744035087;
        Wed, 21 Sep 2022 00:07:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d19-20020ac24c93000000b00497ab34bf5asm318239lfl.20.2022.09.21.00.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:07:14 -0700 (PDT)
Message-ID: <98d70040-f442-98dd-eb50-39e2f39a9be3@linaro.org>
Date: Wed, 21 Sep 2022 09:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] ARM: dts: aspeed: Add AMD DaytonaX BMC
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920165404.14099-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/09/2022 18:54, Konstantin Aladyshev wrote:
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
> 
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 1895ce9de461..191a52595fea 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -30,6 +30,7 @@ properties:
>          items:
>            - enum:
>                - amd,ethanolx-bmc
> +              - amd,daytonax-bmc

Alphabetical order.

>                - ampere,mtjade-bmc
>                - aspeed,ast2500-evb
>                - asrock,e3c246d4i-bmc

This is always a separate patch.

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 05d8aef6e5d2..9eff88d410aa 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1575,6 +1575,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-ast2600-evb-a1.dtb \
>  	aspeed-ast2600-evb.dtb \
>  	aspeed-bmc-amd-ethanolx.dtb \
> +	aspeed-bmc-amd-daytonax.dtb \
>  	aspeed-bmc-ampere-mtjade.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> new file mode 100644
> index 000000000000..89634dda8e5f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "AMD DaytonaX BMC";
> +	compatible = "amd,daytonax-bmc", "aspeed,ast2500";
> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>;	/* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &uart1;
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlycon";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		fault {

No improvements here, so you did not test your DTS. You received comment
asking you to do it.

Please run `make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof
