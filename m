Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B673D5BEAB7
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Sep 2022 18:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX5w43G6jz3bdk
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 02:04:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VPtjkI+b;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VPtjkI+b;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX5w02RZVz30KY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 02:04:29 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id a8so4514791lff.13
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 09:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FogWB2FGGdAF/PqnPcBa4/GS/a8YaiRAD23uITPI7zk=;
        b=VPtjkI+boNwBC+sWLXnbJiTs2CsMQODoEZj3Q0kXubJ1OMA7atWZnTUQo3A21KFhr5
         2o0mBVwGdsOseRpFB9A1MaP7T2wiTTdIX5iZVi6gKOMbKZDwowN+qRS/d+vmr+6BL+DR
         7upD5DidRQEW3/rzdkH3bfkK37GfiNWqULvwc004e+79nXstNxRmTJ0yIUdnXYZtBFzs
         1nc3H2BXgkJdpkNwirulQqMZj8A89XOI4U55svfxzpVdXLfm/ny3GyuCWsxm7sKmDHYO
         CMVfkQBkI+DzzAFJkAUZyk+nHI1YTRaJiQhBwILXjciTBDCs2Fc5chhz6PzVuIZ4hCbe
         WVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FogWB2FGGdAF/PqnPcBa4/GS/a8YaiRAD23uITPI7zk=;
        b=LUWPmVXHGpRcYcX2PtmyWk0GCkKVmAc20qNu+IzfOZFfhqKmHzBZ0O9VD7yMjbjevp
         53S6D2S1zeK9g7hvCP4nXPYbEfczGdjOP5zf7iS/OQwszecgSZibQR8PfYObbnNwlHvA
         8s2etCRY9uLG+0+2CnC5d4u04tu4sTe0eD6crSmI/J77/qswGva0CpK83F0KtP0rd89y
         JeMhByhK//Cf7V3rKOeFqvEz1rJFZSeE10dje9nBhmsGxozyhxFdiuY6MPnzDwTN5QGa
         K7+bT5H2atp6vBBqO+6ZLA8IRQQIDFrXFpFKfBUfRT0M8Q064ih0kkHZ9LFT4FLtCc3F
         CuHA==
X-Gm-Message-State: ACrzQf008F08YKj9Sj/z3RoFtNo+kl/GYDEcF72yGNYW06Ns9PNlfgH9
	kK+SMWR1EX243gu9o0GelwzxXg==
X-Google-Smtp-Source: AMsMyM6sD1Pr9eVFc6gnNTiuKWVfGjowPR9KRj0qBDptnRoLcvnkhKYp34+NmU7ATCCjXNm5ebQrWg==
X-Received: by 2002:a05:6512:3e26:b0:497:3a4f:d1f with SMTP id i38-20020a0565123e2600b004973a4f0d1fmr9455339lfv.31.1663689865187;
        Tue, 20 Sep 2022 09:04:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e8e8d000000b00261a8e56fe4sm23885ljk.55.2022.09.20.09.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 09:04:24 -0700 (PDT)
Message-ID: <62aab493-fe9b-07af-2d9a-a85ba1d1060f@linaro.org>
Date: Tue, 20 Sep 2022 18:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add AMD DaytonaX BMC
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
References: <20220920153928.6454-1-aladyshev22@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920153928.6454-1-aladyshev22@gmail.com>
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

On 20/09/2022 17:39, Konstantin Aladyshev wrote:
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.


Thank you for your patch. There is something to discuss/improve.

> 
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
> index 000000000000..0e066b5ae0fb
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> @@ -0,0 +1,320 @@
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

Missing bindings documentation.

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

bootargs do not belong to mainline DTS. earlycon for sure.

> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		fault {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Nodes are wrong.

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		identify {

Ditto

> +			gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +			<&adc 10>, <&adc 11>, <&adc 12>, <&adc 13>, <&adc 14>,
> +			<&adc 15>;
> +	};
> +};
> +
> +&fmc {

(...)


> +	fan@15 {
> +		reg = <0x07>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
> +	};
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&vhub {
> +	status = "okay";
> +};
> +

No need for trailing new line.

Best regards,
Krzysztof
