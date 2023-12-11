Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1414380C2AA
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 09:05:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qm9sT65f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpZ6l3xzHz30Pp
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 19:05:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qm9sT65f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpZ6d0KKqz30PD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 19:05:12 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33334480eb4so4776178f8f.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 00:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702281909; x=1702886709; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XiW6stVK+zCl5jjYuv+6r3x3fHHtlp11nkTseHtSQGc=;
        b=qm9sT65frRuTqbncxsCZ0Bn6xclkuZhJ9VQmon9ByHOU2u5GzZT+8HjOt7vGdZVMVG
         74f7TaUDLGNXyQwaIrH4mRZSyynvl/BH3O7AROx9abmxKDaSm5NnWGU7lZtXPmVS36++
         /lComl879U8D0Z7Q8lpHTt+He6QoLmUBjGFaIEznyt/v6CPq5QNkRnafnrnNPX9jIm98
         oEAZm7TvAqTCyOZ0XhXkhj5qU5CB5MArRvEOnxqDxdbhlHZX84QG1IU+t2yaIiIbFcTG
         nSNr0VKFnrpT+sFJgPjy2Nsnmv9tUCNHU41Q5X1r8bHw626G06+uG2Ak4iTYM5LcGfjv
         aWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702281909; x=1702886709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XiW6stVK+zCl5jjYuv+6r3x3fHHtlp11nkTseHtSQGc=;
        b=SlNrbPgj78aDwXzyNNK/JRpNBEj0cCTsIrTeAIsYyZbZechHWoAQSMFjt6yaN+4jzy
         RTIkKWPP30YPvF3VqJ3uiPuKRk9+agy1t3TBN6Ai4kUVKWAb5/XWABIhvcg+bA6nBtq2
         jneRwj9cQ2c4k7P/DB/cPKjf2I4w4uVkt3Q2DnO5HRZ65QYkTmTstSC8KzKii9+z2iBs
         HY/mxv2Px/qOpqcL0mkRTBzKGeaPWNa2itu0OGwzk0U35uQiIKhkjqvFPJhe7tnp+VjO
         T17vk39gED6GKF/u+YZdqqD1/sBjw0yw0LJbJ2bUR+3Psf1kr/Z79oZux/BkloFpSk5S
         Ismw==
X-Gm-Message-State: AOJu0YyzXjlo2iZ7BhTRnQpLO1C8cLBuSzbZWRsqNlpesOR9D83xiMX1
	1BFPCv9ZBit/ljdr1quCyRYBHHuGDFd6s2ReAjM=
X-Google-Smtp-Source: AGHT+IFvn6SovSKo7ry0mbHdc2tkznCZvQmATivqpNIRsCe+HI/+/lUTdwxkVpUaAeYKHOjfJ4ZbRw==
X-Received: by 2002:adf:e306:0:b0:332:e337:7c5f with SMTP id b6-20020adfe306000000b00332e3377c5fmr1704125wrj.61.1702281909038;
        Mon, 11 Dec 2023 00:05:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s18-20020adfea92000000b0033342d2bf02sm7857177wrm.25.2023.12.11.00.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:05:08 -0800 (PST)
Message-ID: <2339a35d-270f-4a55-a2fe-191dec44aa5b@linaro.org>
Date: Mon, 11 Dec 2023 09:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] ARM: dts: aspeed: yosemite4: Initialize bmc gpio
 state
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20231211024947.3990898-1-Delphine_CC_Chiu@wiwynn.com>
 <20231211024947.3990898-11-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231211024947.3990898-11-Delphine_CC_Chiu@wiwynn.com>
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

On 11/12/2023 03:49, Delphine CC Chiu wrote:
> Initialize bmc gpio state
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 195 ++++++++++++++++++
>  1 file changed, 195 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index ed2b1200603d..eb3687bfd632 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1271,6 +1271,7 @@ temperature-sensor@1f {
>  	};
>  };
>  
> +

Drop

>  &adc0 {
>  	ref_voltage = <2500>;
>  	status = "okay";
> @@ -1298,3 +1299,197 @@ &ehci1 {
>  &uhci {
>  	status = "okay";
>  };
> +
> +&sgpiom0 {
> +	status = "okay";
> +	ngpios = <128>;
> +	bus-frequency = <48000>;
> +};
> +
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
> +	/*Y0-Y7*/       "","","SPI_LOCK_REQ_BMC_N","PWRGD_SLOT7_STBY",
> +			"","","EN_NIC2_POWER_BMC_R","",
> +	/*Z0-Z7*/       "EN_P5V_USB_CPLD_R","'FLT_HSC_SERVER_SLOT5_N",
> +			"PWRGD_SLOT8_STBY","","","","","";
> +
> +	pin_gpio_b4 {

No underscores in node names.


Best regards,
Krzysztof

