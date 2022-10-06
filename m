Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB295F616C
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 09:10:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjjJY0Ddbz3c2v
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Oct 2022 18:10:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PMmRUTc4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PMmRUTc4;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjjJQ0Zvfz2yZ8
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Oct 2022 18:10:28 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id m14so1196309ljg.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 06 Oct 2022 00:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2I/1QzQAyhs03U6EUbvdD9mrpDPgHGLdtO/kjkRzvpE=;
        b=PMmRUTc4YkNKV0tKu19tFM5wTJveTHPgqco/cfnP78Q1gRa5s/fGleDx+6TmialXfe
         AqEBUqEmNp2wZoGoZL9spUrszdbqPhgQVt0bn+tsNHtszuBW5cVNyk+LHXs6pHSFhCak
         56zoya76Gx8eDzbgSKEfldJiRyzHFyqpU8llVFy0WQjMXo858HCHwbnqASR8vPndWT8W
         iXnqcgRoMK12cGQgFRZbOjdyyFLuZbvP8BU+1Fmpk9NPGVthn00q9vtG5EQ54E0H2ujd
         5w+d/Hg7m/FsLITyoDvFvKxBqwK5cC1d6uNJMiNuFOR9tGA+iXhUaM8DjvkytS9q9W99
         Sz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2I/1QzQAyhs03U6EUbvdD9mrpDPgHGLdtO/kjkRzvpE=;
        b=Y6XtMnu+fk3QT/5T6vESEZ3qTeUu666lklxbHfIrK7THLJfzA2PLTaYzfyLi5IRSYd
         1yaZwarwIvY/hfIQfdQtob19qlmmpWoFdMhf5Uu4+Z0PPhnh6uwx+VGTD7XBDJ4Nl8Wy
         E3/W5cRRZVRg2guqNNdZMERDdSEOtSRWlMVPMV3zFJjQr0gmm0yvQY5Uu+9zVx+hW/8n
         iUOochiNJr6jXvG3tUNVWxihBbkQfMgHKuFwCwNHf3b1enkqyAEDYgLnS/vqatVAUcTI
         jsjTuSUNykORdmFRxh1ckDbdNLIydzuWcAJrTTWO5Lt4aFz6KCYGNyILOoV6FTwCj/qi
         7LAg==
X-Gm-Message-State: ACrzQf1vrgPBqB1AV+oc01FEQWCRIJV9bY6HPRyfKoLLH85ffhIuXE41
	HVIyg3NZ903g4eixiPzxth785g==
X-Google-Smtp-Source: AMsMyM7t0L4tSiNO8/WleoyInpCKagr+hmERnfJ+UdQDQjy3KxVKaSqD+N7nG5HG3VYX5V/Ybo67vw==
X-Received: by 2002:a2e:be9e:0:b0:26c:2d48:5c98 with SMTP id a30-20020a2ebe9e000000b0026c2d485c98mr1226092ljr.395.1665040223888;
        Thu, 06 Oct 2022 00:10:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x6-20020ac24886000000b00498f570aef2sm2604118lfc.209.2022.10.06.00.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:10:23 -0700 (PDT)
Message-ID: <a8854c8e-8868-461d-9f7b-d5b44f7288c7@linaro.org>
Date: Thu, 6 Oct 2022 09:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 2/2] greatlakes: dts: Add Facebook greatlakes (AST2600)
 BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 krzysztof.kozlowski@linaro.or
References: <20221006063527.2007802-1-Delphine_CC_Chiu@Wiwynn.com>
 <20221006063527.2007802-2-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006063527.2007802-2-Delphine_CC_Chiu@Wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 06/10/2022 08:35, Delphine CC Chiu wrote:
> Add linux device tree entry related to
> greatlakes specific devices connected to BMC SoC.
> 
> ---
> --- v1 - Add documentation of board compatible (bindings)
> ---    - Add board compatible
> ---    - Remove the bootargs
> ---    - Revise the DTS node name
> ---

This is v3, not v1, because you resent first patch twice Changelog does
not go above SoB. You can see the problem easily - save your patch, git
am xxx.mbox, git show

Subject is wrong. Use subject prefixes matching the subsystem (git log
--oneline -- ...).


> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 243 ++++++++++++++++++
>  2 files changed, 244 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 05d8aef6e5d2..d9f417f2d7df 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1586,6 +1586,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-elbert.dtb \
>  	aspeed-bmc-facebook-fuji.dtb \
>  	aspeed-bmc-facebook-galaxy100.dtb \
> +	aspeed-bmc-facebook-greatlakes.dtb \
>  	aspeed-bmc-facebook-minipack.dtb \
>  	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-facebook-wedge40.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> new file mode 100644
> index 000000000000..29c46d0e003e
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2022 Facebook Inc.
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Facebook Greatlakes BMC";
> +	compatible = "facebook,greatlakes-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +				<&adc1 0>, <&adc1 2>, <&adc1 3>, <&adc1 4>,
> +				<&adc1 5>, <&adc1 6>;
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&wdt1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdtrst1_default>;
> +	aspeed,reset-type = "soc";
> +	aspeed,external-signal;
> +	aspeed,ext-push-pull;
> +	aspeed,ext-active-high;
> +	aspeed,ext-pulse-duration = <256>;
> +};
> +
> +&mac3 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +	no-hw-checksum;
> +	use-ncsi;
> +	mlx,multi-host;
> +	ncsi-ctrl,start-redo-probe;
> +	ncsi-ctrl,no-channel-monitor;
> +	ncsi-package = <1>;
> +	ncsi-channel = <1>;
> +	ncsi-rexmit = <1>;
> +	ncsi-timeout = <2>;
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +	flash@1 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc2";
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <50000000>;
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	multi-master;
> +	ipmb0@10 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Therefore: ipmb@10

> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	multi-master;
> +	ipmb1@10 {

ipmb@10

> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	multi-master;
> +	ipmb2@10 {

ipmb@10

> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +	multi-master;
> +	ipmb3@10 {

ipmb@10

> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +	temperature-sensor@1f {
> +		compatible = "ti,tmp421";
> +		reg = <0x1f>;
> +	};
> +	// NIC EEPROM
> +	eeprom@50 {
> +		compatible = "st,24c32";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +	multi-master;
> +	ipmb9@10 {

ipmb@10

> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +	eeprom@51 {
> +		compatible = "atmel,24c128";
> +		reg = <0x51>;
> +	};
> +	eeprom@54 {
> +		compatible = "atmel,24c128";
> +		reg = <0x54>;
> +	};
> +};
> +
> +&i2c12 {
> +	status = "okay";
> +	temperature-sensor@4f {
> +		compatible = "lm75";
> +		reg = <0x4f>;
> +	};
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +};
> +
> +&adc0 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +			&pinctrl_adc2_default &pinctrl_adc3_default
> +			&pinctrl_adc4_default &pinctrl_adc5_default
> +			&pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc10_default
> +			&pinctrl_adc11_default &pinctrl_adc12_default
> +			&pinctrl_adc13_default &pinctrl_adc14_default>;
> +};
> +
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&uhci {
> +	status = "okay";
> +};
> +
> +&gpio0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpiu1_default &pinctrl_gpiu7_default>;
> +};
> +
> +

No need for two blank lines at the end. Drop both.

Best regards,
Krzysztof

