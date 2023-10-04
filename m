Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7A7BF104
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 04:41:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KdOsDsFV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Ksw3gDtz3cRN
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 13:41:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KdOsDsFV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0cz91qLPz2yGW
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Oct 2023 12:48:20 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3af5fda8f6fso1044462b6e.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Oct 2023 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696384097; x=1696988897; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXB97espiiKa/dBigNXA6trHtp2vvGRqvFKM/2JIshQ=;
        b=KdOsDsFVednMViSPAIutRAqUXjm1A19M7WejSsp7+UVDgtnBHWHNp0JCJi4gUP0/oh
         P2nKyqx5y3sTBhkUlc61bcUFqfK/ovOJEMnolXnTRHMweOMy+UmXBL7NL0+yCbzxasP7
         WCX1zfJiZ+u8kE/SoLkzVLa1NnMxyqWA1C8vGOp1FV5JYxP3j03M4E2TkhAaFBGmmvQr
         7Kk+XhyqQf4A3ygHerEctWGoyRQ5YBRwy2o4271Aac/3hOJVpMCyrdBWlA0rBUPswK8j
         tR+oitvq+Y4FJTGPGrPbc399p/FJbsR1etLCoKeoqJKXXxMs3ofuWIXY604PnJTkT5T7
         9QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696384097; x=1696988897;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXB97espiiKa/dBigNXA6trHtp2vvGRqvFKM/2JIshQ=;
        b=RdFZ2GGp3mKa4GuFUvEzWeEvidjXc1Odc/MRM5S/Z3wdffHmh4q96h25miB1it/Dfi
         wBsLCEGaNWAKePgCTts4kCYlRu7OxjGiq0PJJHUCJHGQMbdX3M506x1imJsJqIOTGgav
         4kJ50lBGA6P0MoVd7XLea/VomQvuzUlaaFlFcfGP8FDMOd9fMYC9v9pLgmWlOzNs6aEU
         hbf8IpkDhODzvbPtEQ7Dnrqx4IZm9yP00I5XO6pbzuijlsHTOg5C8UdE7HiHHIpACj1b
         7hSfmJoGhOyMev+yYhs5UNVbAngE+sAJhvDHQb+gmCNA2Qz1r4OFpmccDOdvPeIa1Xoz
         B1MQ==
X-Gm-Message-State: AOJu0YzYF7Nmg6Go1a35Nn3/9T52hoDkLOMRneSUym5mK8Wop8o8y50J
	utUZ4VZpF65mPRVIgzzR/x0=
X-Google-Smtp-Source: AGHT+IEjZrMBJeBnU4JRembx4qk8k3FmrkbJ60eNHJ5Z5jZnOTy5sCv38sqF7cm+ZEiQma+nO6fppg==
X-Received: by 2002:a05:6808:23c4:b0:3a7:5611:a53b with SMTP id bq4-20020a05680823c400b003a75611a53bmr1598706oib.0.1696384097531;
        Tue, 03 Oct 2023 18:48:17 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id k134-20020a636f8c000000b00585486d5aadsm2093385pgc.44.2023.10.03.18.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 18:48:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------TcqxRVlHreRy2MLrJyqGZvFl"
Message-ID: <02b596d2-c169-899b-bcba-5aff2dbd5113@gmail.com>
Date: Wed, 4 Oct 2023 09:46:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
To: patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230907064514.1764010-1-peteryin.openbmc@gmail.com>
 <20230907064514.1764010-2-peteryin.openbmc@gmail.com>
Content-Language: en-US
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <20230907064514.1764010-2-peteryin.openbmc@gmail.com>
X-Mailman-Approved-At: Tue, 10 Oct 2023 13:41:16 +1100
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
Cc: peter.yin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------TcqxRVlHreRy2MLrJyqGZvFl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/7/23 14:45, Peter Yin wrote:
> Add linux device tree entry related to Minerva
> specific devices connected to BMC SoC.
>
> Signed-off-by: Peter Yin<peteryin.openbmc@gmail.com>
> ---
>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>   .../aspeed/aspeed-bmc-facebook-minerva.dts    | 371 ++++++++++++++++++
>   2 files changed, 372 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 23cbc7203a8e..b1da302dbcd6 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-facebook-fuji.dtb \
>   	aspeed-bmc-facebook-galaxy100.dtb \
>   	aspeed-bmc-facebook-greatlakes.dtb \
> +	aspeed-bmc-facebook-minerva.dtb \
>   	aspeed-bmc-facebook-minipack.dtb \
>   	aspeed-bmc-facebook-tiogapass.dtb \
>   	aspeed-bmc-facebook-wedge40.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> new file mode 100644
> index 000000000000..4834473c3c39
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Facebook Minerva";
> +	compatible = "facebook,minerva-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart1;
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
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
> +			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +			<&adc1 2>;
> +	};
> +};
> +
> +// HOST BIOS Debug
> +&uart1 {
> +	status = "okay";
> +};
> +
> +// SOL Host Console
> +&uart2 {
> +	status = "okay";
> +	pinctrl-0 = <>;
> +};
> +
> +// SOL BMC Console
> +&uart4 {
> +	status = "okay";
> +	pinctrl-0 = <>;
> +};
> +
> +// BMC Debug Console
> +&uart5 {
> +	status = "okay";
> +};
> +
> +// MTIA
> +&uart6 {
> +	status = "okay";
> +};
> +
> +&uart_routing {
> +	status = "okay";
> +};
> +
> +&vuart1 {
> +	status = "okay";
> +	virtual;
> +	port=<0x3e8>;
> +	sirq = <7>;
> +	sirq-polarity = <0>;
> +	dma-mode;
> +	dma-channel = <12>;
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
> +	ncsi-ctrl,start-redo-probe;
> +	ncsi-ctrl,no-channel-monitor;
> +	mlx,multi-host;
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
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-128.dtsi"
> +	};
> +
> +	flash@1 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "alt-bmc";
> +		spi-max-frequency = <50000000>;
> +	};
> +};
> +
> +// BIOS Flash
> +&spi2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi2_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +		spi-max-frequency = <12000000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +	};
> +};
> +
> +&kcs2 {
> +	status = "okay";
> +	aspeed,lpc-io-reg = <0xca8>;
> +};
> +
> +&kcs3 {
> +	status = "okay";
> +	aspeed,lpc-io-reg = <0xca2>;
> +};
> +
> +&lpc_snoop {
> +	status = "okay";
> +	snoop-ports = <0x80>;
> +};
> +
> +&peci0 {
> +	status = "okay";
> +	clock-frequency = <1000000>;
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	tmp75@4B {
> +		compatible = "ti,tmp75";
> +		reg = <0x4B>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
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
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +};
> +
> +&i2c12 {
> +	status = "okay";
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +};
> +
> +// To Debug card
> +&i2c14 {
> +	status = "okay";
> +	multi-master;
> +
> +	ipmb@10 {
> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c15 {
> +	status = "okay";
> +
> +	// SCM FRU
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +	};
> +	// BSM FRU
> +	eeprom@56 {
> +		compatible = "atmel,24c64";
> +		reg = <0x56>;
> +	};
> +};
> +
> +&adc0 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default &pinctrl_adc3_default
> +		&pinctrl_adc4_default &pinctrl_adc5_default
> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc10_default>;
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&gpio0 {
> +	pinctrl-names = "default";
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","","","","",
> +	/*B0-B7*/	"","","","","","FM_ID_LED_N","","",
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
> +	/*P0-P7*/	"FP_SYS_PWRBTN_IN_N","BMC_SYS_PWRBTN_OUT_N",
> +			"FP_RST_BTN_IN_N","","","","","",
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
> +&sgpiom0 {
> +	status = "okay";
> +	max-ngpios = <128>;
> +	ngpios = <128>;
> +	bus-frequency = <2000000>;
> +	gpio-line-names =
> +	/*in - out - in - out */
> +	/*A0-A3 line 0-7*/
> +	"","","","","","ENABLE_SENSORS","","",
> +	/*A4-A7 line 8-15*/
> +	"","","","","","","","",
> +	/*B0-B3 line 16-23*/
> +	"","","","","","BMC_RST_BTN_OUT_N","","",
> +	/*B4-B7 line 24-31*/
> +	"","","","","","","","",
> +	/*C0-C3 line 32-39*/
> +	"","","","","","","","",
> +	/*C4-C7 line 40-47*/
> +	"","","","","","","","",
> +	/*D0-D3 line 48-55*/
> +	"","","","","","","","",
> +	/*D4-D7 line 56-63*/
> +	"","","","","","","","",
> +	/*E0-E3 line 64-71*/
> +	"","","","","","","","",
> +	/*E4-E7 line 72-79*/
> +	"","","","","","","","",
> +	/*F0-F3 line 80-87*/
> +	"","","","","","","","",
> +	/*F4-F7 line 88-95*/
> +	"","","","","","","","",
> +	/*G0-G3 line 96-103*/
> +	"","","","","","","","",
> +	/*G4-G7 line 104-111*/
> +	"","","","","","","","",
> +	/*H0-H3 line 112-119*/
> +	"","","","","PLD_SYS_POWER_GOOD","","","",
> +	/*H4-H7 line 120-127*/
> +	"","","","","","","","",
> +	/*I0-I3 line 128-135*/
> +	"","","","","","","","",
> +	/*I4-I7 line 136-143*/
> +	"","","","","","","","",
> +	/*J0-J3 line 144-151*/
> +	"","","PLD_BIOS_POST_CMPLT_N","","","","","",
> +	/*J4-J7 line 152-159*/
> +	"","","","","","","","",
> +	/*K0-K3 line 160-167*/
> +	"","","","","","","","",
> +	/*K4-K7 line 168-175*/
> +	"","","","","","","","",
> +	/*L0-L3 line 176-183*/
> +	"","","","","","","","",
> +	/*L4-L7 line 184-191*/
> +	"","","","","","","","",
> +	/*M0-M3 line 192-199*/
> +	"","","","","","","","",
> +	/*M4-M7 line 200-207*/
> +	"","","","","","","","",
> +	/*N0-N3 line 208-215*/
> +	"","","","","","","","",
> +	/*N4-N7 line 216-223*/
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

Hello Maintainer,

Are there any recommendations or modifications that you consider necessary?

Thank you.



--------------TcqxRVlHreRy2MLrJyqGZvFl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 9/7/23 14:45, Peter Yin wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20230907064514.1764010-2-peteryin.openbmc@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Add linux device tree entry =
related to Minerva
specific devices connected to BMC SoC.

Signed-off-by: Peter Yin <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:peteryin.openbmc@gmail.com">&lt;peteryin.openbmc@gmail.com&gt;</a>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 371 ++++++++++++++++++
 2 files changed, 372 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.=
dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
index 23cbc7203a8e..b1da302dbcd6 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-greatlakes.dtb \
+	aspeed-bmc-facebook-minerva.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
new file mode 100644
index 000000000000..4834473c3c39
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2023 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include &lt;dt-bindings/gpio/aspeed-gpio.h&gt;
+#include &lt;dt-bindings/i2c/i2c.h&gt;
+
+/ {
+	model =3D "Facebook Minerva";
+	compatible =3D "facebook,minerva-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 =3D &amp;uart1;
+		serial4 =3D &amp;uart5;
+	};
+
+	chosen {
+		stdout-path =3D &amp;uart5;
+	};
+
+	memory@80000000 {
+		device_type =3D "memory";
+		reg =3D &lt;0x80000000 0x80000000&gt;;
+	};
+
+	iio-hwmon {
+		compatible =3D "iio-hwmon";
+		io-channels =3D &lt;&amp;adc0 0&gt;, &lt;&amp;adc0 1&gt;, &lt;&amp;adc=
0 2&gt;, &lt;&amp;adc0 3&gt;,
+			&lt;&amp;adc0 4&gt;, &lt;&amp;adc0 5&gt;, &lt;&amp;adc0 6&gt;, &lt;&a=
mp;adc0 7&gt;,
+			&lt;&amp;adc1 2&gt;;
+	};
+};
+
+// HOST BIOS Debug
+&amp;uart1 {
+	status =3D "okay";
+};
+
+// SOL Host Console
+&amp;uart2 {
+	status =3D "okay";
+	pinctrl-0 =3D &lt;&gt;;
+};
+
+// SOL BMC Console
+&amp;uart4 {
+	status =3D "okay";
+	pinctrl-0 =3D &lt;&gt;;
+};
+
+// BMC Debug Console
+&amp;uart5 {
+	status =3D "okay";
+};
+
+// MTIA
+&amp;uart6 {
+	status =3D "okay";
+};
+
+&amp;uart_routing {
+	status =3D "okay";
+};
+
+&amp;vuart1 {
+	status =3D "okay";
+	virtual;
+	port=3D&lt;0x3e8&gt;;
+	sirq =3D &lt;7&gt;;
+	sirq-polarity =3D &lt;0&gt;;
+	dma-mode;
+	dma-channel =3D &lt;12&gt;;
+};
+
+&amp;wdt1 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D &lt;&amp;pinctrl_wdtrst1_default&gt;;
+	aspeed,reset-type =3D "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration =3D &lt;256&gt;;
+};
+
+&amp;mac3 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D &lt;&amp;pinctrl_rmii4_default&gt;;
+	no-hw-checksum;
+	use-ncsi;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-ctrl,no-channel-monitor;
+	mlx,multi-host;
+	ncsi-package =3D &lt;1&gt;;
+	ncsi-channel =3D &lt;1&gt;;
+	ncsi-rexmit =3D &lt;1&gt;;
+	ncsi-timeout =3D &lt;2&gt;;
+};
+
+&amp;rtc {
+	status =3D "okay";
+};
+
+&amp;fmc {
+	status =3D "okay";
+
+	flash@0 {
+		status =3D "okay";
+		m25p,fast-read;
+		label =3D "bmc";
+		spi-max-frequency =3D &lt;50000000&gt;;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+
+	flash@1 {
+		status =3D "okay";
+		m25p,fast-read;
+		label =3D "alt-bmc";
+		spi-max-frequency =3D &lt;50000000&gt;;
+	};
+};
+
+// BIOS Flash
+&amp;spi2 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D &lt;&amp;pinctrl_spi2_default&gt;;
+
+	flash@0 {
+		status =3D "okay";
+		m25p,fast-read;
+		label =3D "pnor";
+		spi-max-frequency =3D &lt;12000000&gt;;
+		spi-tx-bus-width =3D &lt;2&gt;;
+		spi-rx-bus-width =3D &lt;2&gt;;
+	};
+};
+
+&amp;kcs2 {
+	status =3D "okay";
+	aspeed,lpc-io-reg =3D &lt;0xca8&gt;;
+};
+
+&amp;kcs3 {
+	status =3D "okay";
+	aspeed,lpc-io-reg =3D &lt;0xca2&gt;;
+};
+
+&amp;lpc_snoop {
+	status =3D "okay";
+	snoop-ports =3D &lt;0x80&gt;;
+};
+
+&amp;peci0 {
+	status =3D "okay";
+	clock-frequency =3D &lt;1000000&gt;;
+};
+
+&amp;i2c0 {
+	status =3D "okay";
+};
+
+&amp;i2c1 {
+	status =3D "okay";
+
+	tmp75@4B {
+		compatible =3D "ti,tmp75";
+		reg =3D &lt;0x4B&gt;;
+	};
+};
+
+&amp;i2c2 {
+	status =3D "okay";
+};
+
+&amp;i2c3 {
+	status =3D "okay";
+};
+
+&amp;i2c4 {
+	status =3D "okay";
+};
+
+&amp;i2c5 {
+	status =3D "okay";
+};
+
+&amp;i2c6 {
+	status =3D "okay";
+};
+
+&amp;i2c7 {
+	status =3D "okay";
+};
+
+&amp;i2c8 {
+	status =3D "okay";
+};
+
+&amp;i2c9 {
+	status =3D "okay";
+};
+
+&amp;i2c11 {
+	status =3D "okay";
+};
+
+&amp;i2c12 {
+	status =3D "okay";
+};
+
+&amp;i2c13 {
+	status =3D "okay";
+};
+
+// To Debug card
+&amp;i2c14 {
+	status =3D "okay";
+	multi-master;
+
+	ipmb@10 {
+		compatible =3D "ipmb-dev";
+		reg =3D &lt;(0x10 | I2C_OWN_SLAVE_ADDRESS)&gt;;
+		i2c-protocol;
+	};
+};
+
+&amp;i2c15 {
+	status =3D "okay";
+
+	// SCM FRU
+	eeprom@50 {
+		compatible =3D "atmel,24c64";
+		reg =3D &lt;0x50&gt;;
+	};
+	// BSM FRU
+	eeprom@56 {
+		compatible =3D "atmel,24c64";
+		reg =3D &lt;0x56&gt;;
+	};
+};
+
+&amp;adc0 {
+	ref_voltage =3D &lt;2500&gt;;
+	status =3D "okay";
+	pinctrl-0 =3D &lt;&amp;pinctrl_adc0_default &amp;pinctrl_adc1_default
+		&amp;pinctrl_adc2_default &amp;pinctrl_adc3_default
+		&amp;pinctrl_adc4_default &amp;pinctrl_adc5_default
+		&amp;pinctrl_adc6_default &amp;pinctrl_adc7_default&gt;;
+};
+
+&amp;adc1 {
+	ref_voltage =3D &lt;2500&gt;;
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D &lt;&amp;pinctrl_adc10_default&gt;;
+};
+
+&amp;ehci1 {
+	status =3D "okay";
+};
+
+&amp;gpio0 {
+	pinctrl-names =3D "default";
+	gpio-line-names =3D
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","FM_ID_LED_N","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","SOL_UART_SET","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1",
+			"LED_POSTCODE_2","LED_POSTCODE_3",
+			"LED_POSTCODE_4","LED_POSTCODE_5",
+			"LED_POSTCODE_6","LED_POSTCODE_7",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"FP_SYS_PWRBTN_IN_N","BMC_SYS_PWRBTN_OUT_N",
+			"FP_RST_BTN_IN_N","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
+&amp;sgpiom0 {
+	status =3D "okay";
+	max-ngpios =3D &lt;128&gt;;
+	ngpios =3D &lt;128&gt;;
+	bus-frequency =3D &lt;2000000&gt;;
+	gpio-line-names =3D
+	/*in - out - in - out */
+	/*A0-A3 line 0-7*/
+	"","","","","","ENABLE_SENSORS","","",
+	/*A4-A7 line 8-15*/
+	"","","","","","","","",
+	/*B0-B3 line 16-23*/
+	"","","","","","BMC_RST_BTN_OUT_N","","",
+	/*B4-B7 line 24-31*/
+	"","","","","","","","",
+	/*C0-C3 line 32-39*/
+	"","","","","","","","",
+	/*C4-C7 line 40-47*/
+	"","","","","","","","",
+	/*D0-D3 line 48-55*/
+	"","","","","","","","",
+	/*D4-D7 line 56-63*/
+	"","","","","","","","",
+	/*E0-E3 line 64-71*/
+	"","","","","","","","",
+	/*E4-E7 line 72-79*/
+	"","","","","","","","",
+	/*F0-F3 line 80-87*/
+	"","","","","","","","",
+	/*F4-F7 line 88-95*/
+	"","","","","","","","",
+	/*G0-G3 line 96-103*/
+	"","","","","","","","",
+	/*G4-G7 line 104-111*/
+	"","","","","","","","",
+	/*H0-H3 line 112-119*/
+	"","","","","PLD_SYS_POWER_GOOD","","","",
+	/*H4-H7 line 120-127*/
+	"","","","","","","","",
+	/*I0-I3 line 128-135*/
+	"","","","","","","","",
+	/*I4-I7 line 136-143*/
+	"","","","","","","","",
+	/*J0-J3 line 144-151*/
+	"","","PLD_BIOS_POST_CMPLT_N","","","","","",
+	/*J4-J7 line 152-159*/
+	"","","","","","","","",
+	/*K0-K3 line 160-167*/
+	"","","","","","","","",
+	/*K4-K7 line 168-175*/
+	"","","","","","","","",
+	/*L0-L3 line 176-183*/
+	"","","","","","","","",
+	/*L4-L7 line 184-191*/
+	"","","","","","","","",
+	/*M0-M3 line 192-199*/
+	"","","","","","","","",
+	/*M4-M7 line 200-207*/
+	"","","","","","","","",
+	/*N0-N3 line 208-215*/
+	"","","","","","","","",
+	/*N4-N7 line 216-223*/
+	"","","","","","","","",
+	/*O0-O3 line 224-231*/
+	"","","","","","","","",
+	/*O4-O7 line 232-239*/
+	"","","","","","","","",
+	/*P0-P3 line 240-247*/
+	"","","","","","","","",
+	/*P4-P7 line 248-255*/
+	"","","","","","","","";
+};
</pre>
    </blockquote>
    <p style=3D"border: 0px solid rgb(217, 217, 227); box-sizing: border-=
box; --tw-border-spacing-x:0; --tw-border-spacing-y:0; --tw-translate-x:0=
; --tw-translate-y:0; --tw-rotate:0; --tw-skew-x:0; --tw-skew-y:0; --tw-s=
cale-x:1; --tw-scale-y:1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; =
--tw-scroll-snap-strictness:proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; -=
-tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-n=
umeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width:0px; --tw-ri=
ng-offset-color:#fff; --tw-ring-color:rgba(69,89,164,0.5); --tw-ring-offs=
et-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; --tw-shadow:=
0 0 transparent; --tw-shadow-colored:0 0 transparent; --tw-blur: ; --tw-b=
rightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-i=
nvert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop=
-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backd=
rop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw=
-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; mar=
gin: 0px 0px 1.25em; color: rgb(55, 65, 81); font-family: S=C3=B6hne, ui-=
sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubunt=
u, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quo=
t;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &qu=
ot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: pre-wrap; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-colo=
r: rgb(247, 247, 248); text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial;">
<font face=3D"Ubuntu,sans-serif" color=3D"#000000">Hello Maintainer,</fon=
t></p>
    <p style=3D"border: 0px solid rgb(217, 217, 227); box-sizing: border-=
box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x=
: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0;=
 --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch=
-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-posit=
ion: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-or=
dinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing=
: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0=
px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,0.5); -=
-tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparen=
t; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --=
tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue=
-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow=
: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contr=
ast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdr=
op-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-back=
drop-sepia: ; margin: 1.25em 0px; font-size: 16px; font-style: normal; fo=
nt-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: pre-wrap; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; background-color: rgb(247, 247, 248); text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: init=
ial;"><font face=3D"Ubuntu,sans-serif">    Are there any recommendations =
or modifications that you consider necessary?</font></p>
    <p style=3D"border: 0px solid rgb(217, 217, 227); box-sizing: border-=
box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x=
: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0;=
 --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch=
-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-posit=
ion: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-or=
dinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing=
: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0=
px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,0.5); -=
-tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparen=
t; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --=
tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue=
-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow=
: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contr=
ast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdr=
op-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-back=
drop-sepia: ; margin: 1.25em 0px 0px; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: pre-wrap; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; background-color: rgb(247, 247, 248); text-decoration-th=
ickness: initial; text-decoration-style: initial; text-decoration-color: =
initial;"><font face=3D"Ubuntu,sans-serif">Thank you.</font></p>
    <div class=3D"group w-full text-token-text-primary border-b
      border-black/10 gizmo:border-0 dark:border-gray-900/50
      gizmo:dark:border-0 gizmo:bg-transparent dark:bg-gray-800
      gizmo:dark:bg-transparent" data-testid=3D"conversation-turn-179"
      style=3D"border-width: 0px 0px 1px; border-style: solid;
      border-color: rgba(0, 0, 0, 0.1); border-image: initial;
      box-sizing: border-box; --tw-border-spacing-x:0;
      --tw-border-spacing-y:0; --tw-translate-x:0; --tw-translate-y:0;
      --tw-rotate:0; --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1;
      --tw-scale-y:1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;
      --tw-scroll-snap-strictness:proximity;
      --tw-gradient-from-position: ; --tw-gradient-via-position: ;
      --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ;
      --tw-numeric-figure: ; --tw-numeric-spacing: ;
      --tw-numeric-fraction: ; --tw-ring-inset: ;
      --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff;
      --tw-ring-color:rgba(69,89,164,0.5); --tw-ring-offset-shadow:0 0
      transparent; --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
      transparent; --tw-shadow-colored:0 0 transparent; --tw-blur: ;
      --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
      --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ;
      --tw-drop-shadow: ; --tw-backdrop-blur: ;
      --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
      --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
      --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
      --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; width: 1252.22px;
      color: var(--text-primary); font-family: S=C3=B6hne, ui-sans-serif,=

      system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu,
      Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica
      Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI
      Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color
      Emoji&quot;; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; --avatar-color:#19c37d;">
      <div class=3D"p-4 justify-center text-base md:gap-6 md:py-6 m-auto"=

        style=3D"border: 0px solid rgb(217, 217, 227); box-sizing:
        border-box; --tw-border-spacing-x:0; --tw-border-spacing-y:0;
        --tw-translate-x:0; --tw-translate-y:0; --tw-rotate:0;
        --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1;
        --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;
        --tw-scroll-snap-strictness:proximity;
        --tw-gradient-from-position: ; --tw-gradient-via-position: ;
        --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero:
        ; --tw-numeric-figure: ; --tw-numeric-spacing: ;
        --tw-numeric-fraction: ; --tw-ring-inset: ;
        --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff;
        --tw-ring-color:rgba(69,89,164,0.5); --tw-ring-offset-shadow:0 0
        transparent; --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
        transparent; --tw-shadow-colored:0 0 transparent; --tw-blur: ;
        --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
        --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ;
        --tw-drop-shadow: ; --tw-backdrop-blur: ;
        --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
        --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
        --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
        --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: auto;
        justify-content: center; padding: 1.5rem 1rem; font-size: 1rem;
        line-height: 1.5rem; gap: 1.5rem;">
        <div class=3D"flex flex-1 gap-4 text-base mx-auto md:gap-6
          gizmo:gap-3 gizmo:md:px-5 gizmo:lg:px-1 gizmo:xl:px-5
          md:max-w-2xl lg:max-w-[38rem] gizmo:md:max-w-3xl
          gizmo:lg:max-w-[40rem] gizmo:xl:max-w-[48rem] xl:max-w-3xl }"
          style=3D"border: 0px solid rgb(217, 217, 227); box-sizing:
          border-box; --tw-border-spacing-x:0; --tw-border-spacing-y:0;
          --tw-translate-x:0; --tw-translate-y:0; --tw-rotate:0;
          --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1;
          --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;
          --tw-scroll-snap-strictness:proximity;
          --tw-gradient-from-position: ; --tw-gradient-via-position: ;
          --tw-gradient-to-position: ; --tw-ordinal: ;
          --tw-slashed-zero: ; --tw-numeric-figure: ;
          --tw-numeric-spacing: ; --tw-numeric-fraction: ;
          --tw-ring-inset: ; --tw-ring-offset-width:0px;
          --tw-ring-offset-color:#fff;
          --tw-ring-color:rgba(69,89,164,0.5); --tw-ring-offset-shadow:0
          0 transparent; --tw-ring-shadow:0 0 transparent; --tw-shadow:0
          0 transparent; --tw-shadow-colored:0 0 transparent; --tw-blur:
          ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
          --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia:
          ; --tw-drop-shadow: ; --tw-backdrop-blur: ;
          --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
          --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
          --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
          --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-left:
          auto; margin-right: auto; display: flex; flex: 1 1 0%; gap:
          1.5rem; font-size: 1rem; line-height: 1.5rem; max-width:
          48rem;">
          <div class=3D"relative flex w-[calc(100%-50px)] flex-col gap-1
            gizmo:w-full md:gap-3 lg:w-[calc(100%-115px)]
            gizmo:text-gizmo-gray-600 gizmo:dark:text-gray-300"
            style=3D"border: 0px solid rgb(217, 217, 227); box-sizing:
            border-box; --tw-border-spacing-x:0;
            --tw-border-spacing-y:0; --tw-translate-x:0;
            --tw-translate-y:0; --tw-rotate:0; --tw-skew-x:0;
            --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1; --tw-pan-x: ;
            --tw-pan-y: ; --tw-pinch-zoom: ;
            --tw-scroll-snap-strictness:proximity;
            --tw-gradient-from-position: ; --tw-gradient-via-position: ;
            --tw-gradient-to-position: ; --tw-ordinal: ;
            --tw-slashed-zero: ; --tw-numeric-figure: ;
            --tw-numeric-spacing: ; --tw-numeric-fraction: ;
            --tw-ring-inset: ; --tw-ring-offset-width:0px;
            --tw-ring-offset-color:#fff;
            --tw-ring-color:rgba(69,89,164,0.5);
            --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0
            0 transparent; --tw-shadow:0 0 transparent;
            --tw-shadow-colored:0 0 transparent; --tw-blur: ;
            --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
            --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ;
            --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ;
            --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
            --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
            --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
            --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; position:
            relative; display: flex; width: calc(100% - 115px);
            flex-direction: column; gap: 0.75rem;">
            <div class=3D"text-gray-400 flex self-end lg:self-center
              justify-center gizmo:lg:justify-start mt-2 gizmo:mt-0
              visible lg:gap-1 lg:absolute lg:top-0 lg:translate-x-full
              lg:right-0 lg:mt-0 lg:pl-2 gap-2 md:gap-3 gizmo:absolute
              gizmo:right-0 gizmo:top-1/2 gizmo:-translate-y-1/2
              gizmo:transform" style=3D"border: 0px solid rgb(217, 217,
              227); box-sizing: border-box; --tw-border-spacing-x:0;
              --tw-border-spacing-y:0; --tw-translate-x:100%;
              --tw-translate-y:0; --tw-rotate:0; --tw-skew-x:0;
              --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1; --tw-pan-x:
              ; --tw-pan-y: ; --tw-pinch-zoom: ;
              --tw-scroll-snap-strictness:proximity;
              --tw-gradient-from-position: ; --tw-gradient-via-position:
              ; --tw-gradient-to-position: ; --tw-ordinal: ;
              --tw-slashed-zero: ; --tw-numeric-figure: ;
              --tw-numeric-spacing: ; --tw-numeric-fraction: ;
              --tw-ring-inset: ; --tw-ring-offset-width:0px;
              --tw-ring-offset-color:#fff;
              --tw-ring-color:rgba(69,89,164,0.5);
              --tw-ring-offset-shadow:0 0 transparent;
              --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
              transparent; --tw-shadow-colored:0 0 transparent;
              --tw-blur: ; --tw-brightness: ; --tw-contrast: ;
              --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;
              --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ;
              --tw-backdrop-blur: ; --tw-backdrop-brightness: ;
              --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ;
              --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ;
              --tw-backdrop-opacity: ; --tw-backdrop-saturate: ;
              --tw-backdrop-sepia: ; visibility: visible; margin-top:
              0px; display: flex; justify-content: center; gap: 0.25rem;
              align-self: center; --tw-text-opacity:1; color:
              rgba(172,172,190,var(--tw-text-opacity)); position:
              absolute; right: 0px; top: 0px; transform:
              translate(var(--tw-translate-x),var(--tw-translate-y))
              rotate(var(--tw-rotate)) skewX(var(--tw-skew-x))
              skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x))
              scaleY(var(--tw-scale-y)); padding-left: 0.5rem;"><button
                class=3D"p-1 gizmo:pl-0 rounded-md
                disabled:dark:hover:text-gray-400
                dark:hover:text-gray-200 dark:text-gray-400
                hover:bg-gray-100 hover:text-gray-700
                dark:hover:bg-gray-700 md:invisible
                md:group-hover:visible" style=3D"border: 0px solid
                rgb(217, 217, 227); box-sizing: border-box;
                --tw-border-spacing-x:0; --tw-border-spacing-y:0;
                --tw-translate-x:0; --tw-translate-y:0; --tw-rotate:0;
                --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1;
                --tw-scale-y:1; --tw-pan-x: ; --tw-pan-y: ;
                --tw-pinch-zoom: ;
                --tw-scroll-snap-strictness:proximity;
                --tw-gradient-from-position: ;
                --tw-gradient-via-position: ; --tw-gradient-to-position:
                ; --tw-ordinal: ; --tw-slashed-zero: ;
                --tw-numeric-figure: ; --tw-numeric-spacing: ;
                --tw-numeric-fraction: ; --tw-ring-inset: ;
                --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff;
                --tw-ring-color:rgba(69,89,164,0.5);
                --tw-ring-offset-shadow:0 0 transparent;
                --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
                transparent; --tw-shadow-colored:0 0 transparent;
                --tw-blur: ; --tw-brightness: ; --tw-contrast: ;
                --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;
                --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ;
                --tw-backdrop-blur: ; --tw-backdrop-brightness: ;
                --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ;
                --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ;
                --tw-backdrop-opacity: ; --tw-backdrop-saturate: ;
                --tw-backdrop-sepia: ; color: inherit; font-family:
                inherit; font-size: 16px; font-weight: inherit;
                line-height: inherit; margin: 0px; padding: 0.25rem;
                text-transform: none; appearance: button;
                background-color: transparent; background-image: none;
                cursor: pointer; border-radius: 0.375rem; visibility:
                visible;"><svg stroke=3D"currentColor" fill=3D"none"
                  stroke-width=3D"2" viewBox=3D"0 0 24 24"
                  stroke-linecap=3D"round" stroke-linejoin=3D"round"
                  class=3D"icon-sm" height=3D"1em" width=3D"1em"
                  xmlns=3D"http://www.w3.org/2000/svg"><path d=3D"M11 4H4=
a2
                    2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></p=
ath><path
                    d=3D"M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4
                    9.5-9.5z"></path></svg></button></div>
          </div>
        </div>
      </div>
    </div>
    <div class=3D"group w-full text-token-text-primary border-b
      border-black/10 gizmo:border-0 dark:border-gray-900/50
      gizmo:dark:border-0 bg-gray-50 gizmo:bg-transparent
      dark:bg-[#444654] gizmo:dark:bg-transparent"
      data-testid=3D"conversation-turn-180" style=3D"border-width: 0px 0p=
x
      1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);
      border-image: initial; box-sizing: border-box;
      --tw-border-spacing-x:0; --tw-border-spacing-y:0;
      --tw-translate-x:0; --tw-translate-y:0; --tw-rotate:0;
      --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1;
      --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;
      --tw-scroll-snap-strictness:proximity;
      --tw-gradient-from-position: ; --tw-gradient-via-position: ;
      --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ;
      --tw-numeric-figure: ; --tw-numeric-spacing: ;
      --tw-numeric-fraction: ; --tw-ring-inset: ;
      --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff;
      --tw-ring-color:rgba(69,89,164,0.5); --tw-ring-offset-shadow:0 0
      transparent; --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
      transparent; --tw-shadow-colored:0 0 transparent; --tw-blur: ;
      --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
      --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ;
      --tw-drop-shadow: ; --tw-backdrop-blur: ;
      --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
      --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
      --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
      --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; width: 1252.22px;
      --tw-bg-opacity:1; background-color:
      rgba(247,247,248,var(--tw-bg-opacity)); color:
      var(--text-primary); font-family: S=C3=B6hne, ui-sans-serif, system=
-ui,
      -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell,
      &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;,
      Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;,
      &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; --avatar-color:#19c37d;">
      <div class=3D"p-4 justify-center text-base md:gap-6 md:py-6 m-auto"=

        style=3D"border: 0px solid rgb(217, 217, 227); box-sizing:
        border-box; --tw-border-spacing-x:0; --tw-border-spacing-y:0;
        --tw-translate-x:0; --tw-translate-y:0; --tw-rotate:0;
        --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1;
        --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;
        --tw-scroll-snap-strictness:proximity;
        --tw-gradient-from-position: ; --tw-gradient-via-position: ;
        --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero:
        ; --tw-numeric-figure: ; --tw-numeric-spacing: ;
        --tw-numeric-fraction: ; --tw-ring-inset: ;
        --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff;
        --tw-ring-color:rgba(69,89,164,0.5); --tw-ring-offset-shadow:0 0
        transparent; --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
        transparent; --tw-shadow-colored:0 0 transparent; --tw-blur: ;
        --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
        --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ;
        --tw-drop-shadow: ; --tw-backdrop-blur: ;
        --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
        --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
        --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
        --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: auto;
        justify-content: center; padding: 1.5rem 1rem; font-size: 1rem;
        line-height: 1.5rem; gap: 1.5rem;">
        <div class=3D"flex flex-1 gap-4 text-base mx-auto md:gap-6
          gizmo:gap-3 gizmo:md:px-5 gizmo:lg:px-1 gizmo:xl:px-5
          md:max-w-2xl lg:max-w-[38rem] gizmo:md:max-w-3xl
          gizmo:lg:max-w-[40rem] gizmo:xl:max-w-[48rem] xl:max-w-3xl }"
          style=3D"border: 0px solid rgb(217, 217, 227); box-sizing:
          border-box; --tw-border-spacing-x:0; --tw-border-spacing-y:0;
          --tw-translate-x:0; --tw-translate-y:0; --tw-rotate:0;
          --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1;
          --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;
          --tw-scroll-snap-strictness:proximity;
          --tw-gradient-from-position: ; --tw-gradient-via-position: ;
          --tw-gradient-to-position: ; --tw-ordinal: ;
          --tw-slashed-zero: ; --tw-numeric-figure: ;
          --tw-numeric-spacing: ; --tw-numeric-fraction: ;
          --tw-ring-inset: ; --tw-ring-offset-width:0px;
          --tw-ring-offset-color:#fff;
          --tw-ring-color:rgba(69,89,164,0.5); --tw-ring-offset-shadow:0
          0 transparent; --tw-ring-shadow:0 0 transparent; --tw-shadow:0
          0 transparent; --tw-shadow-colored:0 0 transparent; --tw-blur:
          ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
          --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia:
          ; --tw-drop-shadow: ; --tw-backdrop-blur: ;
          --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
          --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
          --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
          --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-left:
          auto; margin-right: auto; display: flex; flex: 1 1 0%; gap:
          1.5rem; font-size: 1rem; line-height: 1.5rem; max-width:
          48rem;">
          <div class=3D"flex-shrink-0 flex flex-col relative items-end"
            style=3D"border: 0px solid rgb(217, 217, 227); box-sizing:
            border-box; --tw-border-spacing-x:0;
            --tw-border-spacing-y:0; --tw-translate-x:0;
            --tw-translate-y:0; --tw-rotate:0; --tw-skew-x:0;
            --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1; --tw-pan-x: ;
            --tw-pan-y: ; --tw-pinch-zoom: ;
            --tw-scroll-snap-strictness:proximity;
            --tw-gradient-from-position: ; --tw-gradient-via-position: ;
            --tw-gradient-to-position: ; --tw-ordinal: ;
            --tw-slashed-zero: ; --tw-numeric-figure: ;
            --tw-numeric-spacing: ; --tw-numeric-fraction: ;
            --tw-ring-inset: ; --tw-ring-offset-width:0px;
            --tw-ring-offset-color:#fff;
            --tw-ring-color:rgba(69,89,164,0.5);
            --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0
            0 transparent; --tw-shadow:0 0 transparent;
            --tw-shadow-colored:0 0 transparent; --tw-blur: ;
            --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ;
            --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ;
            --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ;
            --tw-backdrop-brightness: ; --tw-backdrop-contrast: ;
            --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;
            --tw-backdrop-invert: ; --tw-backdrop-opacity: ;
            --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; position:
            relative; display: flex; flex-shrink: 0; flex-direction:
            column; align-items: flex-end;">
            <div style=3D"border: 0px solid rgb(217, 217, 227);
              box-sizing: border-box; --tw-border-spacing-x:0;
              --tw-border-spacing-y:0; --tw-translate-x:0;
              --tw-translate-y:0; --tw-rotate:0; --tw-skew-x:0;
              --tw-skew-y:0; --tw-scale-x:1; --tw-scale-y:1; --tw-pan-x:
              ; --tw-pan-y: ; --tw-pinch-zoom: ;
              --tw-scroll-snap-strictness:proximity;
              --tw-gradient-from-position: ; --tw-gradient-via-position:
              ; --tw-gradient-to-position: ; --tw-ordinal: ;
              --tw-slashed-zero: ; --tw-numeric-figure: ;
              --tw-numeric-spacing: ; --tw-numeric-fraction: ;
              --tw-ring-inset: ; --tw-ring-offset-width:0px;
              --tw-ring-offset-color:#fff;
              --tw-ring-color:rgba(69,89,164,0.5);
              --tw-ring-offset-shadow:0 0 transparent;
              --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
              transparent; --tw-shadow-colored:0 0 transparent;
              --tw-blur: ; --tw-brightness: ; --tw-contrast: ;
              --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;
              --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ;
              --tw-backdrop-blur: ; --tw-backdrop-brightness: ;
              --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ;
              --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ;
              --tw-backdrop-opacity: ; --tw-backdrop-saturate: ;
              --tw-backdrop-sepia: ;">
              <div class=3D"relative p-1 rounded-sm h-9 w-9 text-white
                flex items-center justify-center" style=3D"border: 0px
                solid rgb(217, 217, 227); box-sizing: border-box;
                --tw-border-spacing-x:0; --tw-border-spacing-y:0;
                --tw-translate-x:0; --tw-translate-y:0; --tw-rotate:0;
                --tw-skew-x:0; --tw-skew-y:0; --tw-scale-x:1;
                --tw-scale-y:1; --tw-pan-x: ; --tw-pan-y: ;
                --tw-pinch-zoom: ;
                --tw-scroll-snap-strictness:proximity;
                --tw-gradient-from-position: ;
                --tw-gradient-via-position: ; --tw-gradient-to-position:
                ; --tw-ordinal: ; --tw-slashed-zero: ;
                --tw-numeric-figure: ; --tw-numeric-spacing: ;
                --tw-numeric-fraction: ; --tw-ring-inset: ;
                --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff;
                --tw-ring-color:rgba(69,89,164,0.5);
                --tw-ring-offset-shadow:0 0 transparent;
                --tw-ring-shadow:0 0 transparent; --tw-shadow:0 0
                transparent; --tw-shadow-colored:0 0 transparent;
                --tw-blur: ; --tw-brightness: ; --tw-contrast: ;
                --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;
                --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ;
                --tw-backdrop-blur: ; --tw-backdrop-brightness: ;
                --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ;
                --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ;
                --tw-backdrop-opacity: ; --tw-backdrop-saturate: ;
                --tw-backdrop-sepia: ; position: relative; display:
                flex; height: 36px; width: 36px; align-items: center;
                justify-content: center; border-radius: 0.125rem;
                padding: 0.25rem; --tw-text-opacity:1; color:
                rgba(255,255,255,var(--tw-text-opacity));
                background-color: rgb(25, 195, 125);"><svg width=3D"41"
                  height=3D"41" viewBox=3D"0 0 41 41" fill=3D"none"
                  xmlns=3D"http://www.w3.org/2000/svg" class=3D"icon-md">=
<br>
                </svg></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <p></p>
    <p><br>
    </p>
  </body>
</html>

--------------TcqxRVlHreRy2MLrJyqGZvFl--
