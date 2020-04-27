Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCB1BA20F
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Apr 2020 13:12:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499hvd1Xy9zDqdl
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Apr 2020 21:12:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=N+WGbFSC; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499htH22YjzDqf1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Apr 2020 21:11:35 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id p16so13100802edm.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Apr 2020 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cYrmFZxs8semvvpV6t6EBUmZhrTRTZ0f8zlUla6LICQ=;
 b=N+WGbFSCdZbEUenghH0QLH3BTBuZdhZlrDZ5D2+d4BYZTAk4cbLlYI22WhrK6o+rW2
 tRjzrnLR5Xjb+HiTR4E8HLsaNJ8F0wX9v5e/VzjrvAnE+NPm7ugas1CcUbsZc+Fj8lYo
 y458imnNR2j6IJ1SyVLN32+/T/vROkI3zdRV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYrmFZxs8semvvpV6t6EBUmZhrTRTZ0f8zlUla6LICQ=;
 b=hVUOxW/YIjGsLylddNGhEAJr3rIyWxtSBUQqRxKr31dPhRx8ZR3f4AjBDYeGkwo2Es
 6vVH5IHUqHHSp3QMjDVMDqyeaanCCy9UDDQoIZqKbrYbulHeeg5dx8jDMa98rXNQbxkb
 DeeMVcuf0zwTeo+jBdZmhuKxi0/05EPjXR5U6R9mo+LTrAVD1Q4zGXawIBekNiTuDqh7
 v03X9seNVC04/XTQkNSfKAwA0EiRL0rJ7n0as/omFaKbqCUkAkPJUA47gsoKar0rh/E6
 QN+COkixOaiY14cGv/aqgIqmTDNeunQwvAIwOlQcGkeCx2LhSY3zsg5i+190u5A+G9JX
 N/4w==
X-Gm-Message-State: AGi0PuY1HuwWAEX9vaRTbt+hQNl+wmT0dBaFbP2Vwk41JFhojcj+G8to
 k8vs0f+QUjLXt/rnjTic9q8rPPPOsbmIk2T4v+k=
X-Google-Smtp-Source: APiQypJvTNP86+jD/SHwvVQQVFl05qRnj1+nh6IFWFMoDkqa+B4ehZ42APUY7IeEMp2DwNA/nH6GyozhlIz0M1az0EU=
X-Received: by 2002:aa7:cf16:: with SMTP id a22mr17747545edy.77.1587985890008; 
 Mon, 27 Apr 2020 04:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200424135303.20952-1-a.filippov@yadro.com>
In-Reply-To: <20200424135303.20952-1-a.filippov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Apr 2020 11:11:18 +0000
Message-ID: <CACPK8XcP3V=8fAUfNvRFqPU9G38dGR43Kpp=Uxm=P_AjrMnzBQ@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: DTS: Aspeed: Add YADRO Nicole BMC
To: Alexander Filippov <a.filippov@yadro.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 24 Apr 2020 at 13:53, Alexander Filippov <a.filippov@yadro.com> wrote:
>
> Nicole is an OpenPower machine with an Aspeed 2500 BMC SoC manufactured
> by YADRO.
>
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>

This looks good to me.

Andrew, do you have any comments before I merge?

> ---
>  arch/arm/boot/dts/Makefile                  |   1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts | 316 ++++++++++++++++++++
>  2 files changed, 317 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index e8dd99201397..6f9fe0f959f2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1347,6 +1347,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-microsoft-olympus.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
>         aspeed-bmc-opp-mihawk.dtb \
> +       aspeed-bmc-opp-nicole.dtb \
>         aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-romulus.dtb \
>         aspeed-bmc-opp-swift.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts b/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
> new file mode 100644
> index 000000000000..31b7e83adc46
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 YADRO
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Nicole BMC";
> +       compatible = "yadro,nicole-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vga_memory: framebuffer@9f000000 {
> +                       no-map;
> +                       reg = <0x9f000000 0x01000000>; /* 16M */
> +               };
> +
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +
> +               coldfire_memory: codefire_memory@9ef00000 {
> +                       reg = <0x9ef00000 0x00100000>;
> +                       no-map;
> +               };
> +
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;    /* 32M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               power {
> +                       gpios = <&gpio ASPEED_GPIO(AA, 4) GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               identify {
> +                       gpios = <&gpio ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               alarm_red {
> +                       gpios = <&gpio ASPEED_GPIO(AA, 3) GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               alarm_yellow {
> +                       gpios = <&gpio ASPEED_GPIO(AA, 1) GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +       fsi: gpio-fsi {
> +               compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +               no-gpio-delays;
> +
> +               memory-region = <&coldfire_memory>;
> +               aspeed,sram = <&sram>;
> +               aspeed,cvic = <&cvic>;
> +
> +               clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> +               mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +               trans-gpios = <&gpio ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(J, 2)>;
> +               };
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 12>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "pnor";
> +               spi-max-frequency = <100000000>;
> +       };
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +       flash = <&spi1>;
> +};
> +
> +&uart1 {
> +       /* Rear RS-232 connector */
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                       &pinctrl_rxd1_default
> +                       &pinctrl_nrts1_default
> +                       &pinctrl_ndtr1_default
> +                       &pinctrl_ndsr1_default
> +                       &pinctrl_ncts1_default
> +                       &pinctrl_ndcd1_default
> +                       &pinctrl_nri1_default>;
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       use-ncsi;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +                <&syscon ASPEED_CLK_MAC1RCLK>;
> +       clock-names = "MACCLK", "RCLK";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c256";
> +               reg = <0x50>;
> +               pagesize = <64>;
> +       };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +       /* CPU0 characterization connector */
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +       /* CLK GEN SI5338 */
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +       /* Voltage regulators for CPU0 */
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +       /* Voltage regulators for CPU1 */
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +
> +       rtc@32 {
> +               compatible = "epson,rx8900";
> +               reg = <0x32>;
> +       };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +       /* CPLD */
> +};
> +
> +&gpio {
> +       gpio-line-names =
> +       /*A0-A7*/       "","cfam-reset","","","","","fsi-mux","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "fsi-enable","","","nic_func_mode0","nic_func_mode1","","","",
> +       /*E0-E7*/       "","ncsi_cfg","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","checkstop","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","id-button","","","","","",
> +       /*P0-P7*/       "","fsi-trans","","","","","","",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","","","","","","",
> +       /*S0-S7*/       "","","","","","","","seq_cont",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "","","","","","","","",
> +       /*AA0-AA7*/     "fsi-clock","led_alarm_yellow","fsi-data","led_alarm_red",
> +                       "led_power","","","led_identify",
> +       /*AB0-AB7*/     "","","","","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +
> +       nic_func_mode0 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       nic_func_mode1 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       seq_cont {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       ncsi_cfg {
> +               gpio-hog;
> +               input;
> +               gpios = <ASPEED_GPIO(E, 1) GPIO_ACTIVE_HIGH>;
> +       };
> +};
> +
> +&vuart {
> +       status = "okay";
> +};
> +
> +&gfx {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
> +};
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&ibt {
> +       status = "okay";
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&adc {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +                       &pinctrl_adc1_default
> +                       &pinctrl_adc2_default
> +                       &pinctrl_adc3_default
> +                       &pinctrl_adc4_default
> +                       &pinctrl_adc5_default
> +                       &pinctrl_adc6_default
> +                       &pinctrl_adc7_default
> +                       &pinctrl_adc8_default
> +                       &pinctrl_adc9_default
> +                       &pinctrl_adc10_default
> +                       &pinctrl_adc11_default
> +                       &pinctrl_adc12_default
> +                       &pinctrl_adc13_default
> +                       &pinctrl_adc14_default
> +                       &pinctrl_adc15_default>;
> +};
> +
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
> +
> +#include "ibm-power9-dual.dtsi"
> --
> 2.21.1
>
