Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62887AA9A7
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Sep 2023 09:04:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wpz2Lylf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNYh55pxz3dFP
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Sep 2023 17:04:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wpz2Lylf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsNYY25W6z3cDR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Sep 2023 17:04:31 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53339349956so1871327a12.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Sep 2023 00:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695366267; x=1695971067; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d11MyHLSxPw+t8/RS5zpmIoRffEzNYMR6CarslWvWd4=;
        b=Wpz2LylfSFTdTBZ/YsxjCeUQqrgftttq4F8zR97902KdY1VwaPec5EvOncQ1b37b77
         lOCT3UtHaNp1k/XGS51rQp7y1R1WhpKXYc1vho2lTHDdGSeAJvlD1C0+fPYEqP+WKBkd
         eaAfTvwV/v6WY9eI3gLnF6o7iZK6L/og3ErAlS9/VbbOZRY8p/Abql/V+T9wCBcTE1sn
         oaFLy+VBDouJ1PfRJEVly86tjBivkHz4Pnn6LNNP0cbn452RHFS82bGg6KTDLmRykDrb
         ruBEGH5pUXc5H33a0LYZp3rVpFJHY6euwPVxkNG04HxMOsBSehf3SwLtkpJk+gDdVykD
         vn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695366267; x=1695971067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d11MyHLSxPw+t8/RS5zpmIoRffEzNYMR6CarslWvWd4=;
        b=rHJgfShB1gph9ndK9gdPonuSW4BzFKTIG6smT7Yhhe4DS4Hp4mkz/vO/1R6B8FT9Se
         uVVSdMem94Z9AeKWz0Zcjm2ItEfUVxeyb/FsKAnKDr4Vn1FXpzyVKXdGzOfGtU5wam8N
         znjFHoJm/zSagX5nPxqIwH7tam7bwRrKPeMLroIwskGOJtrBMPH4NZDJmGabwvE4qXwZ
         Mr3eVlz6mNQKP9gwPY6NG/oWdkXvKau5KVEZ6rHSyHcOYxGDln0w/RybO78xTeDVc6PP
         QLwdxUVXQL0M+So6XBl5DI3VWN429yIkavJ2/i7SI/F9UZyylAefCjFjzb//L5izfi3z
         gp/Q==
X-Gm-Message-State: AOJu0YxXZI/3eP4148y+VDL5C1QgTi6ibP7XZwMjTxJ0QvDNm7KwCY5W
	6Sw96sMJCHz+A9Uq0jqyYwAlCQ==
X-Google-Smtp-Source: AGHT+IHogO17PwLU2znvUyO9/8APZZX660ORod7y/QACP44i/hmpfok6sl1Snj+DJ7SMPw5CPZR9ng==
X-Received: by 2002:a17:906:5386:b0:9a1:aea2:d18d with SMTP id g6-20020a170906538600b009a1aea2d18dmr6110360ejo.48.1695366267198;
        Fri, 22 Sep 2023 00:04:27 -0700 (PDT)
Received: from [10.41.192.245] ([77.241.232.19])
        by smtp.gmail.com with ESMTPSA id cb8-20020a170906a44800b00988dbbd1f7esm2209898ejb.213.2023.09.22.00.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:04:26 -0700 (PDT)
Message-ID: <3ce5feac-df61-586c-f617-dac916541821@linaro.org>
Date: Fri, 22 Sep 2023 09:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom
 devices
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230922064127.283625-1-Delphine_CC_Chiu@wiwynn.com>
 <20230922064127.283625-2-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922064127.283625-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 22/09/2023 08:41, Delphine CC Chiu wrote:
> Revise Yosemite 4 devicetree for i2c-mux and eeprom,
> also the following changes:

No. One change, one commit. This is absolutely unreviewable and
unbisectable.

> - Enable adc 15, tpm, wdt2
> - Change spi-tx/rx-bus-width to duo mode

Why?

> - Add device mp5023, pmbus for Flex power module
> - Change ina230 to ina233, pca9846 to pca9546

Why?

> - Set adc128d818 and max31790 config
> - Add jtag1 and gpio0 config
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
> Changelog:
>  v1 - Add gpio and eeprom devices
>     - Enable adc 15, tpm, wdt2
>     - Change spi-tx/rx-bus-width to duo mode
>     - Add device mp5023, pmbus for Flex power module
>     - Change ina230 to ina233, pca9846 to pca9546
>     - Set adc128d818 and max31790 config
>     - Add jtag1 and gpio0 config
>     - Separate binding dosument to corresponding driver patches
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 897 ++++++++++++++++--
>  1 file changed, 843 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index 64075cc41d92..894ee25c2654 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -17,6 +17,25 @@ aliases {
>  		serial6 = &uart7;
>  		serial7 = &uart8;
>  		serial8 = &uart9;
> +
> +		i2c16 = &imux16;
> +		i2c17 = &imux17;
> +		i2c18 = &imux18;
> +		i2c19 = &imux19;
> +		i2c20 = &imux20;
> +		i2c21 = &imux21;
> +		i2c22 = &imux22;
> +		i2c23 = &imux23;
> +		i2c24 = &imux24;
> +		i2c25 = &imux25;
> +		i2c26 = &imux26;
> +		i2c27 = &imux27;
> +		i2c28 = &imux28;
> +		i2c29 = &imux29;
> +		i2c30 = &imux30;
> +		i2c31 = &imux31;
> +		i2c32 = &imux32;
> +		i2c33 = &imux33;
>  	};
>  
>  	chosen {
> @@ -32,7 +51,26 @@ iio-hwmon {
>  		compatible = "iio-hwmon";
>  		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
>  				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> -				<&adc1 0>, <&adc1 1>;
> +				<&adc1 0>, <&adc1 1>, <&adc1 7>;
> +	};
> +
> +	spi_gpio: spi-gpio {
> +		status = "okay";

okay is  by default, why do you need it?

> +		compatible = "spi-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
> +		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
> +		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
> +		num-chipselects = <1>;
> +		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> +
> +		tpmdev@0 {
> +			compatible = "tcg,tpm_tis-spi";
> +			spi-max-frequency = <33000000>;
> +			reg = <0>;
> +		};
>  	};
>  };
>  

...

>  
>  	power-sensor@43 {
> -		compatible = "ti,ina230";
> +		compatible = "ti,ina233";
>  		reg = <0x43>;
> +		resistor-calibration = /bits/ 16 <0x0a00>;
> +		current-lsb= /bits/ 16 <0x0001>;
>  	};
>  
>  	power-sensor@44 {
> -		compatible = "ti,ina230";
> +		compatible = "ti,ina233";

Nope, you are doing why too many changes. One logical change, one patch.
You must explain WHY you are doing this.

>  		reg = <0x44>;
> +		resistor-calibration = /bits/ 16 <0x0a00>;
> +		current-lsb= /bits/ 16 <0x0001>;
>  	};
>  


>  			adc@33 {
> @@ -492,34 +1070,34 @@ gpio@61 {
>  			};
>  		};
>  
> -		i2c@1 {
> +		imux31: i2c@1 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			reg = <0>;
> +			reg = <1>;
>  
>  			adc@1f {
>  				compatible = "ti,adc128d818";
>  				reg = <0x1f>;
> -				ti,mode = /bits/ 8 <2>;
> +				ti,mode = /bits/ 8 <1>;
>  			};
>  
>  			pwm@20{
> -				compatible = "max31790";
> +				compatible = "maxim,max31790";
> +				pwm-as-tach = <4 5>;
>  				reg = <0x20>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>  			};
>  
>  			gpio@22{
>  				compatible = "ti,tca6424";
>  				reg = <0x22>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
>  			};
>  
> -			pwm@23{
> -				compatible = "max31790";
> -				reg = <0x23>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> +			pwm@2f{

Missing space

...

> +&gpio0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpiu2_default &pinctrl_gpiu3_default
> +		     &pinctrl_gpiu4_default &pinctrl_gpiu5_default
> +		     &pinctrl_gpiu6_default>;
> +	gpio-line-names =
> +	/*A0-A7*/       "","","","","","","","",
> +	/*B0-B7*/       "FLT_HSC_SERVER_SLOT8_N","AC_ON_OFF_BTN_CPLD_SLOT5_N",
> +			"PWRGD_SLOT1_STBY","PWRGD_SLOT2_STBY",
> +			"PWRGD_SLOT3_STBY","PWRGD_SLOT4_STBY","","",
> +	/*C0-C7*/       "PRSNT_NIC3_N","","","","FM_NIC0_WAKE_N",
> +			"FM_NIC1_WAKE_N","","RST_PCIE_SLOT2_N",
> +	/*D0-D7*/       "","","","","","","","",
> +	/*E0-E7*/       "PRSNT_NIC1_N","PRSNT_NIC2_N","","RST_PCIE_SLOT1_N",
> +			"","","","",
> +	/*F0-F7*/       "FM_RESBTN_SLOT1_BMC_N","FM_RESBTN_SLOT2_BMC_N",
> +			"FM_RESBTN_SLOT3_BMC_N","FM_RESBTN_SLOT4_BMC_N",
> +			"PRSNT_SB_SLOT1_N","PRSNT_SB_SLOT2_N",
> +			"PRSNT_SB_SLOT3_N","PRSNT_SB_SLOT4_N",
> +	/*G0-G7*/       "","","","","","","","",
> +	/*H0-H7*/       "","","","","","","","",
> +	/*I0-I7*/       "","","","","","ALT_MEDUSA_ADC_N",
> +			"ALT_SMB_BMC_CPLD2_N",
> +			"INT_SPIDER_ADC_R_N",
> +	/*J0-J7*/       "","","","","","","","",
> +	/*K0-K7*/       "","","","","","","","",
> +	/*L0-L7*/       "","","","","","","ALT_MEDUSA_P12V_EFUSE_N","",
> +	/*M0-M7*/       "EN_NIC0_POWER_BMC_R","EN_NIC1_POWER_BMC_R",
> +			"INT_MEDUSA_IOEXP_TEMP_N","FLT_P12V_NIC0_N",
> +			"INT_SMB_BMC_SLOT1_4_BMC_N",
> +			"AC_ON_OFF_BTN_CPLD_SLOT6_N","","",
> +	/*N0-N7*/       "FLT_HSC_SERVER_SLOT1_N","FLT_HSC_SERVER_SLOT2_N",
> +			"FLT_HSC_SERVER_SLOT3_N","FLT_HSC_SERVER_SLOT4_N",
> +			"FM_BMC_READY_R2","FLT_P12V_STBY_BMC_N","","",
> +	/*O0-O7*/       "AC_ON_OFF_BTN_CPLD_SLOT8_N","RST_SMB_NIC1_R_N",
> +			"RST_SMB_NIC2_R_N","RST_SMB_NIC3_R_N",
> +			"FLT_P3V3_NIC2_N","FLT_P3V3_NIC3_N",
> +			"","",
> +	/*P0-P7*/       "ALT_SMB_BMC_CPLD1_N","'BTN_BMC_R2_N",
> +			"EN_P3V_BAT_SCALED_R","PWRGD_P5V_USB_BMC",
> +			"FM_BMC_RTCRST_R","RST_USB_HUB_R_N",
> +			"FLAG_P5V_USB_BMC_N","",
> +	/*Q0-Q7*/       "AC_ON_OFF_BTN_CPLD_SLOT1_N","AC_ON_OFF_BTN_CPLD_SLOT2_N",
> +			"AC_ON_OFF_BTN_CPLD_SLOT3_N","AC_ON_OFF_BTN_CPLD_SLOT4_N",
> +			"PRSNT_SB_SLOT5_N","PRSNT_SB_SLOT6_N",
> +			"PRSNT_SB_SLOT7_N","PRSNT_SB_SLOT8_N",
> +	/*R0-R7*/       "AC_ON_OFF_BTN_CPLD_SLOT7_N","INT_SMB_BMC_SLOT5_8_BMC_N",
> +			"FM_PWRBRK_NIC_BMC_R2","RST_PCIE_SLOT4_N",
> +			"RST_PCIE_SLOT5_N","RST_PCIE_SLOT6_N",
> +			"RST_PCIE_SLOT7_N","RST_PCIE_SLOT8_N",
> +	/*S0-S7*/       "FM_NIC2_WAKE_N","FM_NIC3_WAKE_N",
> +			"EN_NIC3_POWER_BMC_R","SEL_BMC_JTAG_MUX_R",
> +			"","ALT_P12V_AUX_N","FAST_PROCHOT_N",
> +			"SPI_WP_DISABLE_STATUS_R_N",
> +	/*T0-T7*/       "","","","","","","","",
> +	/*U0-U7*/       "","","FLT_P3V3_NIC1_N","FLT_P12V_NIC1_N",
> +			"FLT_P12V_NIC2_N","FLT_P12V_NIC3_N",
> +			"FLT_P3V3_NIC0_N","",
> +	/*V0-V7*/       "FM_RESBTN_SLOT5_BMC_N","FM_RESBTN_SLOT6_BMC_N",
> +			"FM_RESBTN_SLOT7_BMC_N","FM_RESBTN_SLOT8_BMC_N",
> +			"","","","",
> +	/*W0-W7*/       "PRSNT_TPM_BMC_N","PRSNT_OCP_DEBUG_BMC_N","ALT_TEMP_BMC_N","ALT_RTC_BMC_N",
> +			"","","","",
> +	/*X0-X7*/       "","LT_HSC_SERVER_SLOT6_N","FLT_HSC_SERVER_SLOT7_N","","","",
> +			"PWRGD_SLOT5_STBY","PWRGD_SLOT6_STBY",
> +	/*Y0-Y7*/       "","","SPI_LOCK_REQ_BMC_N","PWRGD_SLOT7_STBY","","","EN_NIC2_POWER_BMC_R","",
> +	/*Z0-Z7*/       "EN_P5V_USB_CPLD_R","'FLT_HSC_SERVER_SLOT5_N",
> +			"PWRGD_SLOT8_STBY","","","","","";
> +
> +	pin_gpio_b4 {

We have been here. No underscores in node names.

Best regards,
Krzysztof

