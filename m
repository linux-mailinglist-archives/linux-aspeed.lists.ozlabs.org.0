Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFEA704866
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 May 2023 11:03:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL9Hw69NDz3f5F
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 May 2023 19:03:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=da+YQKzw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=da+YQKzw;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL9Hp1DLCz3bqv
	for <linux-aspeed@lists.ozlabs.org>; Tue, 16 May 2023 19:02:59 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so25201863a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 16 May 2023 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684227775; x=1686819775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ca8sdn0iye5nYhhu6HELH+yQ66jPOMzoa8BTX35CUc=;
        b=da+YQKzwtWqN7AVgB54WVjVs5pxWmwv+bVccws2/gozB1kAAhuDGcAkQ2bEdsuEQQY
         p6uFU9dXwgdNS2jcpyFARD43G5rbtBRmJA1yZ9blHIZ+InLXlrNedtlb/ENpkL3SW37w
         cJhfGTcCxsz9Vc1m9nuzwWzqpqEOB1QBeVmPe1QrDz9e3AYejX/isUavCxxlrx+e9sTE
         YCMukdNQDO4CXHI4pbSH8iKa/Ef4uYRPEmWvE0UDOPK8uDRoH5zVEyym38XYVzMHe6EL
         K32Vme+eWgEtUj2gfWCOJ4V+6m/F2jAMNr8/4n+2LQ8y5vhiLuwqdA/7+cbOEr2oAlct
         RCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684227775; x=1686819775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ca8sdn0iye5nYhhu6HELH+yQ66jPOMzoa8BTX35CUc=;
        b=FGWpM8fUzSeisjRbVygjepVpOfhRfyFp9XQK3zh6YlsdcLf/Z8BHWryXfJDg04BvwS
         wxOYntmEYbloiSEWI5UQJ00C+cyf4zv1t3zkxhjn3Gvi/7bXhQcqfAmw6gurFsPL81BT
         YPb+1irtPJgV7OblB2B0UrBZjM6VP5nn5Ef2E+65wPzuITkff0lUXNwo18yqo5aEwDHD
         9BNLyHM2o/U2EHgGSXl1ulQL+DWRpAfrczScJmlB6sJU1ajJ+tl4lXLxtzGnzoUt/+OE
         q85lqigQHgXHWFCu9HsBOW6CXByClV4nwrCQBTRHPpgxHeY6nCMryuX9e2piO2X6dLDS
         eUgw==
X-Gm-Message-State: AC+VfDz7Jg1FKfrK5zv1wDaa4LXKmrYAzvKMFS39dSIQId6kHtqpH2WS
	MvZwulIY7O65/evgbFR1CXhLVQ==
X-Google-Smtp-Source: ACHHUZ6GYdr8/FhOUTNa1wz6avwKcMCmjaFNi3EPcXwg9s0BNOKLvtHjo2XxEjkkgT7ZbTBa9L+HGw==
X-Received: by 2002:a17:906:99c4:b0:94e:4c8f:758 with SMTP id s4-20020a17090699c400b0094e4c8f0758mr32829873ejn.76.1684227775504;
        Tue, 16 May 2023 02:02:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id v20-20020a170906b01400b0096165b2703asm10688071ejy.110.2023.05.16.02.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:02:55 -0700 (PDT)
Message-ID: <2658c8aa-4bb2-fcd5-75c4-08612c8dd5a6@linaro.org>
Date: Tue, 16 May 2023 11:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Inventec Starscream BMC
Content-Language: en-US
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <d0cd49b86ba6446e8ed78cbeea0e8c1d>
 <f943333cf0b64c2ca10ec27fbba4ca93@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f943333cf0b64c2ca10ec27fbba4ca93@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>, =?UTF-8?B?SHVhbmcuQWxhbmcg6buD6Iux6YOOIFRBTw==?= <Huang.Alang@inventec.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/05/2023 10:46, Chen.PJ 陳柏任 TAO wrote:
> Initial introduction of Inventec Starscream x86 family equipped with AST2600 BMC SoC.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> 
> ---
> v2:
>  - Correct License description
>  - Remove not supported device
>  - Using openbmc-flash-layout.dtsi
>  - Correct device format
> ---
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-inventec-starscream.dts    | 513 ++++++++++++++++++
>  2 files changed, 514 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index eb681903d50b..0002290ae028 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1630,6 +1630,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-quanta-s6q.dtb \
>  	aspeed-bmc-supermicro-x11spi.dtb \
>  	aspeed-bmc-inventec-transformers.dtb \
> +	aspeed-bmc-inventec-starscream.dtb \

Please keep alphabetical order.

>  	aspeed-bmc-tyan-s7106.dtb \
>  	aspeed-bmc-tyan-s8036.dtb \
>  	aspeed-bmc-vegman-n110.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts b/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts
> new file mode 100644
> index 000000000000..a6c733b29d04
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts
> @@ -0,0 +1,513 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2023 Inventec Corp.
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "aspeed-g6-pinctrl.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "STARSCREAM BMC";
> +	compatible = "inventec,starscream-bmc", "aspeed,ast2600";

Still missing bindings.

> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=tty0 console=ttyS4,115200n8 root=/dev/ram rw init=/linuxrc";

Drop bootargs. They are not part of hardware description.

> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		video_engine_memory: video {
> +			size = <0x04000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		ssp_memory: ssp_memory {

No underscores in node names.

> +			size = <0x00200000>;
> +			alignment = <0x00100000>;
> +			compatible = "shared-dma-pool";
> +			no-map;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels =
> +		<&adc_u74 0>, // P0_VDD11
> +		<&adc_u74 1>, // P1_VDD11
> +		<&adc_u74 2>, // P0_3V3_S5
> +		<&adc_u74 3>, // P1_3V3_S5
> +		<&adc_u74 4>, // P3V3
> +		<&adc_u74 5>, // VBAT
> +		<&adc_u74 6>, // P3V3_STBY
> +		<&adc_u74 7>, // P5V_STBY
> +		<&adc_u74 8>, // P5V
> +		<&adc_u74 9>, // P12V
> +		<&adc_u74 10>, // P1_VDD18_S5
> +		<&adc_u74 11> // P0_VDD18_S5
> +		;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		// UID led

Redundant/obvious comment drop.

> +		uid {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +			label = "UID_LED";
> +			gpios = <&gpio0 ASPEED_GPIO(X, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		// Heart beat led
> +		heartbeat {

Ditto

> +			label = "HB_LED";
> +			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};

...

> +
> +		usb_hub:i2c@0 {

Missing space after label. Fix it everywhere.

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			// USB U114
> +			usb2512b@2c {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +				compatible = "microchip,usb2514b";
> +				reg = <0x2c>;
> +			};
> +		};
> +
> +		riser1:i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		riser2:i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +
> +	// FRU Motherboard
> +	eeprom@51 {
> +		compatible = "atmel,24c64";
> +		reg = <0x51>;
> +		pagesize = <32>;
> +	};
> +
> +	// ADC_U74
> +	adc_u74:max1139@35 {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "maxim,max1139";
> +		reg = <0x35>;
> +		#io-channel-cells = <1>;
> +	};
> +
> +	psu@58 {
> +		compatible = "pmbus";
> +		reg = <0x58>;
> +	};
> +
> +	psu@5a {
> +		compatible = "pmbus";
> +		reg = <0x5a>;
> +	};
> +
> +	// Motherboard Temp_U89
> +	tmp421@4e {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "ti,tmp421";
> +		reg = <0x4e>;
> +	};
> +
> +	// RunBMC Temp_U6
> +	tmp75@49 {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "ti,tmp75";
> +		reg = <0x49>;
> +	};
> +
> +	// Right ear board Temp_U1
> +	emc1412@7c {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

