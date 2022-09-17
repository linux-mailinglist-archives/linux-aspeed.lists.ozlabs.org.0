Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D22095BB9A0
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Sep 2022 18:57:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVHDx4CqHz3bdy
	for <lists+linux-aspeed@lfdr.de>; Sun, 18 Sep 2022 02:57:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=No9Noj/x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=No9Noj/x;
	dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVHDq4r6Wz2xjw
	for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Sep 2022 02:57:44 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id a8so40255906lff.13
        for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Sep 2022 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OW5cyFrIeNWs5Ezch0QGBm4fKKcV3jLO9wWt1aINiZI=;
        b=No9Noj/xjJC54ku/mz2dTEi6t2bCFDreezHwFeM57qECzGH+xP48vI8EyPI39aK2nU
         kb6/S+dOKWYFK5om5zoV2nDcVPntA7jHtj2XEx67JROVEg9gsrlmHdrCwYJtANHQyA7A
         hCJBF+/+jhartmbN4u02MQXVDU/p9qTGn7gwTCrV1w1Wp7Oj7OX7MgLCvIiVFxDpWj7G
         roJJiKtTjdxaCYV6Sio4Zn4ngdMh49AYZsWV/NkgWgGwwJ8Re4iCpYRs8bAbBS69LlN8
         l+Oqzc8faSPdvhHgDiFXyKRlfwM9p/gkDpjjGkROeU1Cmf3BM6Ro2er3Qjh2MJoXwJGN
         Okow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OW5cyFrIeNWs5Ezch0QGBm4fKKcV3jLO9wWt1aINiZI=;
        b=NeDoXCzmwnzcXiS9o1FPzwg52gVNpHrr8IdcgPxZ3uAEvlUufybzDFxzQN0s2iQM8/
         1TX/pzbaNduiXeHAZ7GdyTFrJL2Cc+XmQwkxbvSjJwsUvcrQo2BDGjz2iquEqqlkWjJ9
         BiIYzdnFnJOqsDrv2oRnxyxwhMnWozAGCPZQXdX/dT2hEfxlSEhSceGKnO2arvcm5DPm
         LlsYxi8dko0sRHpfWoQF0ZJEAuXDgHRxWtSqny8oHVgKyMc0hE2cfVHGIBOKw7ORxH7i
         6u7fekzwtMwK1BbrGEjtho9NpzEqTbHeBRSV6nVBolJ0tlPna/FzqEqHGcbVJpgi12Fj
         FAsg==
X-Gm-Message-State: ACrzQf1A+bnZXcG/R4eXFXtaF4yJhcP3VKR+MEDA8G1tqS0P4uaBjBPh
	wTCu0fcXA/ER2M55whnNU7EooA==
X-Google-Smtp-Source: AMsMyM456mL8Y53OX0R0V4J7fMAnnvEEdQmt4r0M/qYd7+Q36rEPaq+GH9DZNeKlDAp5SDRJbkXlBA==
X-Received: by 2002:a05:6512:3409:b0:49a:692:fd31 with SMTP id i9-20020a056512340900b0049a0692fd31mr3211320lfr.651.1663433856370;
        Sat, 17 Sep 2022 09:57:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b00497b198987bsm4180174lfk.26.2022.09.17.09.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 09:57:35 -0700 (PDT)
Message-ID: <10176630-3ff7-54f7-8836-779e5a2bf6d4@linaro.org>
Date: Sat, 17 Sep 2022 17:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Bonnie Lo <Bonnie_Lo@Wiwynn.com>, joel@jms.id.au
References: <20220915072304.1438-1-Bonnie_Lo@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915072304.1438-1-Bonnie_Lo@Wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com, linux-kernel@vger.kernel.org, Delphine_Chiu@Wiwynn.com, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, patrickw3@fb.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 15/09/2022 08:23, Bonnie Lo wrote:
> From: Bonnie Lo <Bonnie_Lo@wiwynn.com>

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> 
> Add linux device tree entry related to
> greatlakes specific devices connected to BMC SoC.

Please wrap commit message according to Linux coding style / submission
process:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

> 
> Signed-off-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 248 ++++++++++++++++++

Missing documentation of board compatible (bindings) as first patch.

>  2 files changed, 249 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 05d8aef6e5d2..40fa906ab17f 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1580,6 +1580,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-asrock-e3c246d4i.dtb \
>         aspeed-bmc-asrock-romed8hm3.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
> +       aspeed-bmc-facebook-greatlakes.dtb \

Wrong order.

>         aspeed-bmc-facebook-bletchley.dtb \
>         aspeed-bmc-facebook-cloudripper.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> new file mode 100644
> index 000000000000..f011cc4d370f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2022 Facebook Inc.
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "AST2600 EVB";

Wrong name.

> +       compatible = "aspeed,ast2600";

Missing board compatible.

> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";

Bootargs usually do not belong to mainline DTS.

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
> +                               <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +                               <&adc1 0>, <&adc1 2>, <&adc1 3>, <&adc1 4>,
> +                               <&adc1 5>, <&adc1 6>;
> +       };
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&uart2 {
> +       status = "okay";
> +};
> +
> +&uart3 {
> +       status = "okay";
> +};
> +
> +&uart4 {
> +       status = "okay";
> +};
> +
> +&uart5 {
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
> +       no-hw-checksum;
> +       use-ncsi;
> +       mlx,multi-host;
> +       ncsi-ctrl,start-redo-probe;
> +       ncsi-ctrl,no-channel-monitor;
> +       ncsi-package = <1>;
> +       ncsi-channel = <1>;
> +       ncsi-rexmit = <1>;
> +       ncsi-timeout = <2>;
> +};
> +
> +&rtc {
> +       status = "okay";
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-rx-bus-width = <4>;
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +       flash@1 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc2";
> +               spi-rx-bus-width = <4>;
> +               spi-max-frequency = <50000000>;
> +       };
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +       multi-master;
> +       ipmb0@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +       multi-master;
> +       ipmb1@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +       multi-master;
> +       ipmb2@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +       multi-master;
> +       ipmb3@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
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
> +       tmp421@1f {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +               compatible = "ti,tmp421";
> +               reg = <0x1f>;
> +       };
> +       // NIC EEPROM
> +       eeprom@50 {
> +               compatible = "st,24c32";
> +               reg = <0x50>;
> +       };
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +       multi-master;
> +       ipmb9@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +       eeprom@51 {
> +               compatible = "atmel,24c128";
> +               reg = <0x51>;
> +       };
> +       eeprom@54 {
> +               compatible = "atmel,24c128";
> +               reg = <0x54>;
> +       };
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +       lm75@4f {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +               compatible = "lm75";
> +               reg = <0x4f>;
> +       };
> +};
> +

(...)

> +
> +&gpio0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_gpiu1_default &pinctrl_gpiu7_default>;
> +};
> +
> +
> --
> 2.17.1
> 
> WIWYNN PROPRIETARY This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

This means we cannot take this patch. Proprietary and/or confidential
patches cannot be merged.

Please license the patch as you wrote in SPDX header.

Best regards,
Krzysztof
