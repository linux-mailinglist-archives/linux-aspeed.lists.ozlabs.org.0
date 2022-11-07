Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D29EF61EA1C
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Nov 2022 05:13:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Hss5Qb8z3cL7
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Nov 2022 15:13:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ViZ13WAo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ViZ13WAo;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5Hsj281Mz3cC8
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Nov 2022 15:13:43 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id l14so14431183wrw.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Nov 2022 20:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dRIfE03XJR4sPtyA9agEpyzis8FHTRoen74Zq17Yutw=;
        b=ViZ13WAoZ83K5FGafJq0T9w3TlWwTPFhv28BhsqUfBqgwZxLShGalMkifHbKgrRFlp
         E0KUmCyybL4T5UGWfO78InMgsB6J2NR5mfnbp5eVZ5TvBEvE3SpkkrYS3xT6U9/GiJyz
         5HExEZrPsJjqabPJkXwml5Cfqnfvp3jKEVww4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRIfE03XJR4sPtyA9agEpyzis8FHTRoen74Zq17Yutw=;
        b=0F4JQEloc/OXHPs5eHbi7KSMN9ZoeVKg8obf5P8JmtmP49gcZBWgx6mKSxwDailbfu
         rV6MUlcv2h5alEsrJoQ+fYtZiihbuL5Wm1teGVEokSZHm+Yz4xHJJPF/sEN0/op26mLk
         oIHgma/RbgKRK1OUS6jn3LkWvEBEzg0PaIR6KGiTptnqOKdtqgu4U7ny6TjOEJr6/0TN
         v1lsaplES1FZ2Ct0T5k/wFfkJCOOGV/CXbj/8EEFwzXNXr2BnsZb1eJAIJaSDwqVn4Ya
         iP6o1fMrujOOoafUYmA8s3aFeSFRB+YjMxliNsPHKc2j1ym+UpvGAYt0RujiLuN3csk+
         HjOQ==
X-Gm-Message-State: ACrzQf3cMrY0RoODMyREstT8CukQry3KbgZS98wu2zHy720gHK1g7bzQ
	YiVCL/36XmAGAdnX47oK/RsUZRDwMnrAvvN/6OU=
X-Google-Smtp-Source: AMsMyM5xnDpHErInoWK3wkYLN8uDCYzLS1RCOwQ2NrTIWnq68hn+yjOewFMu7QrBWBpcChMI2l3FCeB7oXqWcLfLBtU=
X-Received: by 2002:a05:6000:1008:b0:236:60e8:3d40 with SMTP id
 a8-20020a056000100800b0023660e83d40mr29609200wrx.3.1667794416866; Sun, 06 Nov
 2022 20:13:36 -0800 (PST)
MIME-Version: 1.0
References: <7baebe77f0f8963e06d5ddeec6c737f5@rnplus.nl>
In-Reply-To: <7baebe77f0f8963e06d5ddeec6c737f5@rnplus.nl>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2022 04:13:24 +0000
Message-ID: <CACPK8XfnXFt1KHa=xQvC2r_1CBDPeSyHisM=UiU_a=FYaF=R=w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add ASRock X570D4U BMC
To: Renze Nicolai <renze@rnplus.nl>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 6 Nov 2022 at 22:42, Renze Nicolai <renze@rnplus.nl> wrote:
>
> This is a relatively low-cost AST2500-based Amd Ryzen 5000 Series
> micro-ATX board that we hope can provide a decent platform for OpenBMC
> development.
>
> This initial device-tree provides the necessary configuration for
> basic BMC functionality such as serial console, KVM support
> and POST code snooping.

Cool!

>
> Signed-off-by: Renze Nicolai <renze@rnplus.nl>
> ---
>   arch/arm/boot/dts/Makefile                    |   1 +
>   .../boot/dts/aspeed-bmc-asrock-x570d4u.dts    | 360 ++++++++++++++++++
>   2 files changed, 361 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-x570d4u.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6aa7dc4db2fc..adbbf27dfcee 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1587,6 +1587,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-asrock-e3c246d4i.dtb \
>         aspeed-bmc-asrock-romed8hm3.dtb \
> +       aspeed-bmc-asrock-x570d4u.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
>         aspeed-bmc-facebook-bletchley.dtb \
>         aspeed-bmc-facebook-cloudripper.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-x570d4u.dts
> b/arch/arm/boot/dts/aspeed-bmc-asrock-x570d4u.dts
> new file mode 100644
> index 000000000000..818c8879e0a0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-x570d4u.dts
> @@ -0,0 +1,360 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2022 Renze Nicolai <renze@rnplus.nl>
> +
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Asrock Rack X570D4U BMC";
> +       compatible = "asrock,x570d4u-bmc";
> +
> +       chosen {
> +                       stdout-path = &uart5;
> +                       bootargs = "console=ttyS4,115200 earlycon";
> +       };
> +
> +       memory@80000000 {
> +                       reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +
> +                       flash_memory: region@98000000 {
> +                                       no-map;
> +                                       reg = <0x98000000 0x04000000>; /* 64M */
> +                       };

Do you need this? Normally it's used for loading the host firmware
from DRAM instead of SPI flash on OpenPower machines.

> +
> +                       vga_memory: framebuffer@9f000000 {
> +                               no-map;
> +                               reg = <0x9f000000 0x01000000>; /* 16M */
> +                       };

The VGA device is for the BMC driving the display. If you're only
interested in the host processor driving the display you don't need to
enable this.

> +
> +                       pci_memory: region@9A000000 {
> +                               no-map;
> +                               reg = <0x9A000000 0x00010000>; /* 64K */
> +                       };
> +
> +                       video_engine_memory: jpegbuffer {
> +                               size = <0x02800000>;    /* 40M */
> +                               alignment = <0x01000000>;
> +                               compatible = "shared-dma-pool";
> +                               reusable;
> +                       };
> +
> +                       gfx_memory: framebuffer {
> +                               size = <0x01000000>;
> +                               alignment = <0x01000000>;
> +                               compatible = "shared-dma-pool";
> +                               reusable;
> +                       };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               heartbeat {
> +                       /* BMC_HB_LED_N */
> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "timer";
> +               };
> +
> +               system-fault {
> +                       /* SYSTEM_FAULT_LED_N */
> +                       gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
> +                       panic-indicator;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +                       <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +                       <&adc 10>, <&adc 11>, <&adc 12>;
> +       };
> +};
> +
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =

Are you familiar with this one?

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

If you can use any of the common names that would be preferred.

> +       /*A0-A3*/       "LOCATORLED_STATUS_N",    "",
> "NMI_BTN_N",          "BMC_NMI",
> +       /*A4-A7*/       "",                       "",                     "",
>                   "",
> +       /*B0-B3*/       "FM_BIOS_POST_CMPLT_N",   "",                     "",
>                   "",
> +       /*B4-B7*/       "",                       "IRQ_BMC_PCH_SMI_LPC_N","",
>                   "",
> +       /*C0-C3*/       "",                       "",                     "",
>                   "",
> +       /*C4-C7*/       "",                       "",
> "LOCATORBTN",         "",
> +       /*D0-D3*/       "BMC_PSIN",               "BMC_PSOUT",
> "BMC_RESETCON",       "RESETCON",
> +       /*D4-D7*/       "",                       "",                     "",
>                   "",
> +       /*E0-E3*/       "",                       "",                     "",
>                   "",
> +       /*E4-E7*/       "",                       "",                     "",
>                   "",
> +       /*F0-F3*/       "",                       "",                     "",
>                   "",
> +       /*F4-F7*/       "",                       "",                     "",
>                   "",
> +       /*G0-G3*/       "HWM_BAT_EN",             "CHASSIS_ID0",
> "CHASSIS_ID1",        "CHASSIS_ID2",
> +       /*G4-G7*/       "BMC_ALERT1_N_R",         "BMC_ALERT2_N_R",
> "BMC_ALERT3_N",       "SML0ALERT",
> +       /*H0-H3*/       "",                       "O_PWROK",              "",
>                   "",
> +       /*H4-H7*/       "MFG_MODE_N",             "BMC_RTCRST",
> "BMC_HB_LED_N",       "BMC_CASEOPEN",
> +       /*I0-I3*/       "",                       "",                     "",
>                   "",
> +       /*I4-I7*/       "",                       "",                     "",
>                   "",
> +       /*J0-J3*/       "BMC_READY",              "",                     "",
>                   "",
> +       /*J4-J7*/       "VGAHS",                  "VGAVS",
> "DDCCLK",             "DDCDAT",
> +       /*K0-K3*/       "I2C_SCL4",               "I2C_SDA4",
> "I2C_SCL5",           "I2C_SDA5",
> +       /*K4-K7*/       "",                       "",
> "I2C_SCL7",           "I2C_SDA7",
> +       /*L0-L3*/       "BMC_CTS1",               "BMC_DCD1",
> "BMC_DSR1",           "BMC_RI1",
> +       /*L4-L7*/       "BMC_DTR1",               "BMC_RTS1",
> "BMC_TXD1",           "BMC_RXD1",
> +       /*M0-M3*/       "BMC_LAN0_DIS_N",         "BMC_LAN1_DIS_N",       "",
>                   "",
> +       /*M4-M7*/       "",                       "",                     "",
>                   "",
> +       /*N0-N3*/       "PWM_FAN1",               "PWM_FAN2",
> "PWM_FAN3",           "PWM_FAN4",
> +       /*N4-N7*/       "PWM_FAN6",               "PWM_FAN5",             "",
>                   "",
> +       /*O0-O3*/       "TACHO_FAN1",             "TACHO_FAN2",
> "TACHO_FAN3",         "TACHO_FAN4",
> +       /*O4-O7*/       "TACHO_FAN5",             "TACHO_FAN6",           "",
>                   "",
> +       /*P0-P3*/       "",                       "",                     "",
>                   "PS_PWROK",
> +       /*P4-P7*/       "",                       "",                     "",
>                   "",
> +       /*Q0-Q3*/       "I2C_SCL2",               "I2C_SDA2",
> "I2C_SCL3",           "I2C_SDA3",
> +       /*Q4-Q7*/       "BMC_SBM_PRESENT_1_N",    "BMC_SBM_PRESENT_2_N",
> "BMC_SBM_PRESENT_3_N","BMC_PCIE_WAKE_N",
> +       /*R0-R3*/       "",                       "",                     "",
>                   "",
> +       /*R4-R7*/       "",                       "",                     "",
>                   "",
> +       /*S0-S3*/       "PCHHOT_BMC_N",           "",
> "RSMRST",             "",
> +       /*S4-S7*/       "",                       "",                     "",
>                   "",
> +       /*T0-T3*/       "RGMII1TXCK",             "RGMII1TXCL",
> "RGMII1TXD0",         "RGMII1TXD1",
> +       /*T4-T7*/       "RGMII1TXD2",            "RGMII1TXD3",
> "RMII2RCLKO",         "RMII2TXEN",
> +       /*U0-U3*/       "RMII2TXD0",              "RMII2TXD1",            "",
>                   "",
> +       /*U4-U7*/       "RGMII1RXCK",             "RGMII1RXCTL",
> "RGMII1RXD0",         "RGMII1RXD1",
> +       /*V0-V3*/       "RGMII1RXD2",             "RGMII1RXD3",
> "RMII2RCLKI",         "",
> +       /*V4-V7*/       "RMII2RXD0",              "RMII2RXD1",
> "RMII2CRSDV",         "RMII2RXER",
> +       /*W0-W3*/       "",                       "",                     "",
>                   "",
> +       /*W4-W7*/       "",                       "",                     "",
>                   "",
> +       /*X0-X3*/       "",                       "",                     "",
>                   "",
> +       /*X4-X7*/       "",                       "",                     "",
>                   "",
> +       /*Y0-Y3*/       "SLP_S3",                 "SLP_S5",               "",
>                   "",
> +       /*Y4-Y7*/       "I2C_SCL0",               "I2C_SDA0",
> "I2C_SCL1",           "I2C_SDA1",
> +       /*Z0-Z3*/       "",                       "",
> "SYSTEM_FAULT_LED_N", "BMC_THROTTLE_N",
> +       /*Z4-Z7*/       "",                       "",                     "",
>                   "",
> +       /*AA0-AA3*/     "CPU1_THERMTRIP_LATCH_N", "",
> "CPU1_PROCHOT_N",     "",
> +       /*AA4-AC7*/     "",                       "",                     "",
>                   "",
> +       /*AB0-AB3*/     "",                       "",                     "",
>                   "",
> +       /*AB4-AC7*/     "",                       "",                     "",
>                   "",
> +       /*AC0-AC3*/     "LAD0",                   "LAD1",
> "LAD2",               "LAD3",
> +       /*AC4-AC7*/     "CK_33M_BMC",             "LFRAME",
> "SERIRQ",             "S_PLTRST";
> +
> +
> +       /* Assert BMC_READY so BIOS doesn't sit around waiting for it */
> +       bmc-ready {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
> +               output-high;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +                       status = "okay";
> +                       label = "bmc";
> +                       m25p,fast-read;
> +                       spi-max-frequency = <10000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&vuart {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii2_default &pinctrl_mdio2_default>;
> +       use-ncsi;

mdio and ncsi are mutually exclusive. If this port is connected via
NCSI, you want to do this:

&mac0 {
        status = "okay";

        use-ncsi;

        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_rmii1_default>;
        clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
                 <&syscon ASPEED_CLK_MAC1RCLK>;
        clock-names = "MACCLK", "RCLK";
};

(I can't recall if everyone needs to enable RCLK or if that's specific
to the openpower designs)

> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +       w83773g@4c {
> +               compatible = "nuvoton,w83773g";
> +               reg = <0x4c>;
> +       };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9545";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +
> +               interrupt-parent = <&i2c_ic>;
> +               interrupts = <4>;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +
> +               i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +       };
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       eeprom@57 {
> +               compatible = "st,24c128", "atmel,24c128";
> +               reg = <0x57>;
> +               pagesize = <16>;
> +       };
> +};
> +
> +&gfx {
> +       status = "okay";
> +};

You've got GFX twice, see below.

> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +&uhci {
> +       status = "okay";
> +};
> +
> +&kcs3 {
> +       aspeed,lpc-io-reg = <0xca2>;
> +       status = "okay";
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +};
> +
> +&lpc_snoop {
> +       status = "okay";
> +       snoop-ports = <0x80>;
> +};
> +
> +&p2a {
> +       status = "okay";
> +       memory-region = <&pci_memory>;
> +};
> +
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
> +
> +&gfx {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default
> +                               &pinctrl_pwm1_default
> +                               &pinctrl_pwm2_default
> +                               &pinctrl_pwm3_default
> +                               &pinctrl_pwm4_default
> +                               &pinctrl_pwm5_default>;
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +       };
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +       };
> +       fan@2 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
> +       };
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
> +       };
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x08 0x09>;
> +       };
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0a 0x0b>;
> +       };
> +};
> +
> +&adc {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +                               &pinctrl_adc1_default
> +                               &pinctrl_adc2_default
> +                               &pinctrl_adc3_default
> +                               &pinctrl_adc4_default
> +                               &pinctrl_adc5_default
> +                               &pinctrl_adc6_default
> +                               &pinctrl_adc7_default
> +                               &pinctrl_adc8_default
> +                               &pinctrl_adc9_default
> +                               &pinctrl_adc10_default
> +                               &pinctrl_adc11_default
> +                               &pinctrl_adc12_default
> +                               &pinctrl_adc13_default
> +                               &pinctrl_adc14_default
> +                               &pinctrl_adc15_default>;
> +};
> --
> 2.38.1
