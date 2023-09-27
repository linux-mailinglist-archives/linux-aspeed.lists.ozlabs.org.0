Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2057AF84B
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Sep 2023 04:47:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mTxBP09h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwLcm562hz3c5n
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Sep 2023 12:47:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mTxBP09h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwLcf28MJz2yq2
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Sep 2023 12:47:30 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c136ee106so1241608166b.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Sep 2023 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695782846; x=1696387646; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/nKjSTgtvWlgWPru9cXgw85e2YDjLMZClxSdEw5Ww4=;
        b=mTxBP09h7XtRzOq9QmiPx3Q9iakn0uMsELaM+g55CH9Qe9+vHX2dRyocpxWAKVnRC8
         cEtiYhxUznORFyqt/MvHpMbiAnLkTKA8fXZN/eyyP1kvN0CWdubhaCh8c9OiL+8RY5NA
         ViF1ic72iKQqe9qsJHhr4CafqicEKzNFCWpLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695782846; x=1696387646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/nKjSTgtvWlgWPru9cXgw85e2YDjLMZClxSdEw5Ww4=;
        b=HKn2TEpc5is1Jaf4DHWHbia42fQUD9Mc9fpOuKpsibNND+kFLaZ0fmDvshKfKFeucr
         6vGJAIV5joH6cqC5lHPYz95qYq/wRurGpaZjZ4zpRnAdLL/ZH3kVKkGXiF/AO512fchR
         AqW2LHpx2IaSpnnaO1AMC8umI5ZALkqP6c83JyTgHd57kPHOnOp1++w++zUqBEscAKxO
         3jgvMwjNZTsTh6DrxI6EvucimEe1xrETOi7VskHSho9PkhKMbllrldgbPcAdeM5rt4Nr
         x1T7MEcORDaN8hlpvcjWZv98OeSm1jqmsgkAD1ra1nNpAG0IutBHYMYuNbsLYEI1QBhj
         uYaA==
X-Gm-Message-State: AOJu0Yy+wmA9Q8cGEuR3GTEHskXxacLJLqYcqLVNN3lUEK1D4KeeNrt6
	Z6JqNhWTQXQxCXLMdx/NHxgl2QuxfVQy27rWFt4=
X-Google-Smtp-Source: AGHT+IEVToxmq1ck7qTT4vRlPzD2CjW8BSfcPnd/9bVjdZ4q06w6pbCASwDHmM9n1gQYtQp/Hy0zzRCrlj95HJk2tyM=
X-Received: by 2002:a17:906:f15:b0:9ae:53df:9855 with SMTP id
 z21-20020a1709060f1500b009ae53df9855mr498026eji.58.1695782845675; Tue, 26 Sep
 2023 19:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230914125648.3966519-1-yangchen.openbmc@gmail.com> <20230914125648.3966519-3-yangchen.openbmc@gmail.com>
In-Reply-To: <20230914125648.3966519-3-yangchen.openbmc@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:47:14 +0000
Message-ID: <CACPK8XebBpDJ32Hqd06A+L_hw9qLOcRwg_FVFurD34DZgPwhEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 CMC board
To: Yang Chen <yangchen.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie.Chen@quantatw.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 14 Sept 2023 at 12:59, Yang Chen <yangchen.openbmc@gmail.com> wrote:
>
> Add linux device tree entry related to the Minerva Chassis Management
> Controller (CMC) specific devices connected to the Aspeed SoC (AST2600).
>
> Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

There was one warning when building. Please double check your code
compiles cleanly before submitting:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts:91.24-94.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@100/temperature-sensor@4B: I2C bus unit
address format error, expected "4b"

I've fixed that and added your patch to the aspeed tree for 6.7.


> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed-bmc-facebook-minerva-cmc.dts       | 265 ++++++++++++++++++
>  2 files changed, 266 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 23cbc7203a8e..d3ac20e316d0 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-facebook-fuji.dtb \
>         aspeed-bmc-facebook-galaxy100.dtb \
>         aspeed-bmc-facebook-greatlakes.dtb \
> +       aspeed-bmc-facebook-minerva-cmc.dtb \
>         aspeed-bmc-facebook-minipack.dtb \
>         aspeed-bmc-facebook-tiogapass.dtb \
>         aspeed-bmc-facebook-wedge40.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
> new file mode 100644
> index 000000000000..3c389fdf58a5
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +       model = "Facebook Minerva CMC";
> +       compatible = "facebook,minerva-cmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial5 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial5:57600n8";
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x80000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +                       <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +                       <&adc1 2>;
> +       };
> +};
> +
> +&uart6 {
> +       status = "okay";
> +};
> +
> +&wdt1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_wdtrst1_default>;
> +       aspeed,reset-type = "soc";
> +       aspeed,external-signal;
> +       aspeed,ext-push-pull;
> +       aspeed,ext-active-high;
> +       aspeed,ext-pulse-duration = <256>;
> +};
> +
> +&mac3 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii4_default>;
> +       use-ncsi;
> +       mlx,multi-host;
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-128.dtsi"
> +       };
> +       flash@1 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "alt-bmc";
> +               spi-max-frequency = <50000000>;
> +       };
> +};
> +
> +&rtc {
> +       status = "okay";
> +};
> +
> +&sgpiom1 {
> +       status = "okay";
> +       ngpios = <128>;
> +       bus-frequency = <2000000>;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +       temperature-sensor@4B {
> +               compatible = "ti,tmp75";
> +               reg = <0x4B>;
> +       };
> +
> +       eeprom@51 {
> +               compatible = "atmel,24c128";
> +               reg = <0x51>;
> +       };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +
> +       i2c-mux@77 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x77>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c128";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c128";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c128";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c128";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c128";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c128";
> +                               reg = <0x50>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> +
> +&i2c14 {
> +       status = "okay";
> +       multi-master;
> +
> +       ipmb@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c15 {
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c128";
> +               reg = <0x50>;
> +       };
> +};
> +
> +&adc0 {
> +       aspeed,int-vref-microvolt = <2500000>;
> +       status = "okay";
> +       pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +               &pinctrl_adc2_default &pinctrl_adc3_default
> +               &pinctrl_adc4_default &pinctrl_adc5_default
> +               &pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +       aspeed,int-vref-microvolt = <2500000>;
> +       status = "okay";
> +       pinctrl-0 = <&pinctrl_adc10_default>;
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&uhci {
> +       status = "okay";
> +};
> --
> 2.34.1
>
