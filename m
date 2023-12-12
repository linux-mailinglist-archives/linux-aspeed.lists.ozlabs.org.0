Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4CD80F7D7
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 21:25:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ajiY3DfP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqVV45z63z3cPN
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 07:25:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ajiY3DfP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqVTw5xN8z3c1g
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 07:25:08 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so57853915e9.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 12:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702412705; x=1703017505; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gg2VhOkDAyFX8Rm+h8gLNSLn5Q4DtPM59iL23zDHgQs=;
        b=ajiY3DfPeSrCDrEEoR6HCtfbs5125d9jDeom5vfWfV0SSMynJUskjIGbm36zqrvzKD
         o6j59neyEdEyVQEO6jcQQ3sJQ9AV5qbDbUXs5GoqQDJWNFjHKLsn0FanuGUP6weXrkKG
         Pdqhx3ip5Cvi6CSUxLiJ2hll1NwFjumNJZeMZK1QMe+ZsnSoOgWVSFEfY+Vs6be7rqzl
         GQGU8VfYTpt9qtKb/LPqod1ic6tg9Tc5ompqaPj9BPr63w+0Sqd1d2gqq/0UJdWObTQA
         lVqxRqCFFqgau4U7afQ/dZV+9xzmhl3B40QiNXXaNXgPEIlBRKQhep4xIbHYl7JpkuV6
         TkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702412705; x=1703017505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg2VhOkDAyFX8Rm+h8gLNSLn5Q4DtPM59iL23zDHgQs=;
        b=RTl+lZ3Qm8Rpg8gOkOhZGpomN0+FNvk/9tePcnAdZUQpaY5Xtgs/zHnI8B8+1nBSos
         Kh2TyKgLERRyfXQ1fQLG890hvR+21f3MvLZjlUu8QN4LIC10jA7s75G2QI2MbcVgfYax
         1hJSaRzy9d+QGZ24Ni83opBaIeITT5U3bAdDo5yyEEpJcLCq6TsXYTfj92QwAKZlV6oS
         wD+RMO7z5yOVxu35BvDqQuWLLoAX79Q1YPzOzGKeBE52obHMCGYvLp1FS48oaYEoIoUc
         CDytJuQrqmNXikRu+nARVc1OF0N7j2WailK3CSlBdu2BzZlE0Mbf5KYPnVNWkex8jkr4
         5whA==
X-Gm-Message-State: AOJu0Ywew3xDtYeHULkLQACADAAt1aasNhe//2VpiOsxx/0PCZRTJUej
	WQEKjDBgMqAl5Gaf18iJ8HyGkg==
X-Google-Smtp-Source: AGHT+IFQ06+o3v5U4i6nHVsfc7/wjTk6EGqq94+TOdJn7emzkIZzmR60D09Xdf40+S0+UEH+AGjfQQ==
X-Received: by 2002:a7b:c44b:0:b0:40c:3751:b661 with SMTP id l11-20020a7bc44b000000b0040c3751b661mr3360042wmi.61.1702412705095;
        Tue, 12 Dec 2023 12:25:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d6806000000b00336103442d2sm10177965wru.76.2023.12.12.12.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 12:25:04 -0800 (PST)
Message-ID: <1b19af6f-645a-4913-b9db-49b1f3ad54f9@linaro.org>
Date: Tue, 12 Dec 2023 21:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] ARM: dts: aspeed: System1: GPIO, Fan ctrl, Led
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, peterhuewe@gmx.de, jarkko@kernel.org,
 jgg@ziepe.ca, keescook@chromium.org, tony.luck@intel.com,
 gpiccoli@igalia.com, johannes.holland@infineon.com, linux@roeck-us.net,
 broonie@kernel.org
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-7-ninad@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231212164004.1683589-7-ninad@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, festevam@denx.de, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, linux-arm-kernel@lists.infradead.org, lakshmiy@us.ibm.com, bhelgaas@google.com, vincent@vtremblay.dev, linux-integrity@vger.kernel.org, geissonator@yahoo.com, patrick.rudolph@9elements.com, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12/12/2023 17:40, Ninad Palsule wrote:
> This commit adds following devices to the device tree.
> - GPIO pin assignements, GPIO expansion devices
> - LED brinker devices
> - Fan controllers
> 
> Tested:
>     This board is tested using the simics simulator.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 547 +++++++++++++++++-

Squash it.

>  1 file changed, 542 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index b8e7e52d4600..75562aa63701 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -114,6 +114,99 @@ vga_memory: region@bf000000 {
>  		};
>  	};
>  
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		bmc-ready {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

> +			gpios = <&gpio0 ASPEED_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		bmc-hb {

None of these were tested.


>  	/*A0-A7*/	"","","","","","","","",
> -	/*B0-B7*/	"","","","","","","","",
> +	/*B0-B7*/	"","","","","bmc-tpm-reset","","","",

Really? You just added these lines. There is no point in adding a new
line and immediately changing it.

This points how your split is artificial and not helpful.
...


>  &i2c2 {
> @@ -486,6 +744,20 @@ regulator@43 {
>  &i2c6 {
>  	status = "okay";
>  
> +	fan-controller@52 {
> +		compatible = "maxim,max31785a";
> +		reg = <0x52>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Why do you need cells?

> +	};
> +
> +	fan-controller@54 {
> +		compatible = "maxim,max31785a";
> +		reg = <0x54>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Why do you need cells?

> +	};
> +
>  	i2c-mux@70 {
>  		compatible = "nxp,pca9548";
>  		reg = <0x70>;
> @@ -522,6 +794,48 @@ i2c6mux0chn4: i2c@4 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			reg = <4>;
> +
> +			led-controller@60 {
> +				compatible = "nxp,pca9551";
> +				reg = <0x60>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				led@0 {
> +					label = "enclosure-id-led";
> +					reg = <0>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +
> +				led@1 {
> +					label = "attention-led";
> +					reg = <1>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +
> +				led@2 {
> +					label = "enclosure-fault-rollup-led";
> +					reg = <2>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +
> +				led@3 {
> +					label = "power-on-led";
> +					reg = <3>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +			};
>  		};
>  
>  		i2c6mux0chn5: i2c@5 {
> @@ -542,6 +856,44 @@ i2c6mux0chn7: i2c@7 {
>  			reg = <7>;
>  		};
>  	};
> +
> +	pca3: pca9539@74 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "nxp,pca9539";
> +		reg = <0x74>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	pca4: pca9539@77 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "nxp,pca9539";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names =
> +			"PE_NVMED0_EXP_PRSNT_N",
> +			"PE_NVMED1_EXP_PRSNT_N",
> +			"PE_NVMED2_EXP_PRSNT_N",
> +			"PE_NVMED3_EXP_PRSNT_N",
> +			"LED_FAULT_NVMED0",
> +			"LED_FAULT_NVMED1",
> +			"LED_FAULT_NVMED2",
> +			"LED_FAULT_NVMED3",
> +			"FAN0_PRESENCE_R_N",
> +			"FAN1_PRESENCE_R_N",
> +			"FAN2_PRESENCE_R_N",
> +			"FAN3_PRESENCE_R_N",
> +			"FAN4_PRESENCE_R_N",
> +			"FAN5_PRESENCE_N",
> +			"FAN6_PRESENCE_N",
> +			"";
> +	};
>  };
>  
>  &i2c7 {
> @@ -809,6 +1161,191 @@ regulator@41 {
>  		compatible = "infineon,ir38263";
>  		reg = <0x41>;
>  	};
> +
> +	led-controller@61 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x61>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +

...

> +		led@15 {
> +			label = "pe-cp-drv3-perst";
> +			reg = <15>;
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +	};
> +
> +	pca1: pca9539@75 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation




Best regards,
Krzysztof

