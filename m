Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB7923BBB
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jul 2024 12:47:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EIlGf8YI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD03Z55Jnz2y8Z
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jul 2024 20:47:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EIlGf8YI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD03T3CGcz3c5Y
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jul 2024 20:47:15 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so39725741fa.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 02 Jul 2024 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719917232; x=1720522032; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P92+0FeJgLTWh83yvzOS18H2gViBFUz3gdnOBY11d/4=;
        b=EIlGf8YIu1gfPokBiU8eChPNZSvmKSar3M7sy+rhJWpCioDxRLtWhdE/jYfVzuI4vd
         ryCy5esXM8stzdIhEvUwd6RwOBpLxWXf9hIGB1042ZFV3y9aHcusdHp3rYuKeUQIOW5F
         nHP6G2asfeJkhd4ULhBFsj8eSd13Fb1mWUWyCyClib+z3A430Vj8j1cE4lQzvtcdVYG6
         bU1vlNrLqpr8w7Y3H0lqmnd5HVU4p+tparlS/XZTvQ4Z2UGstcnNCzkuxwEV/07FEuZr
         JZfe8mpIXvERENR1DYM3stqm0Rwi3CL6xfNea+S8Dmmwmj3q97dkidrfNcy3vCB97zGC
         FT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719917232; x=1720522032;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P92+0FeJgLTWh83yvzOS18H2gViBFUz3gdnOBY11d/4=;
        b=bBBFliXRT3ms9HqMQOqcdbpxePQQ0hs5/jN2rYYo/aUsVJbNIu6g2jxKK8U//4B0oN
         6kiuJLuQmzfeMd+H8uU5TQF8l1OV7osjvOSiEz51zNi/HQaLvrXEh3OPdWTm/IAr14SK
         gnLw6y4qlVUYIfeOwBLJsb7pZ45nw0ELlt2kGX0FlyrkAl07W5Px+MQY1WX18v1N6NwY
         CpFXlNxNxfNptEMNzPpLfI8fH1Vdfv3aa2WJZpgi2ZX4sstzz+Ox4z8G5oM8MgGWhQj2
         MNYYZFkGdERm8OIc+Li9AAEJbOlNouqs3xWIKepOQ4cQ/0j0rIsV8u5XMflYEw0IahnG
         3rqw==
X-Forwarded-Encrypted: i=1; AJvYcCUof1cP56rkCntM3NHHwgiRzFF6NkaLMWWTgqjAH0G+rBwBmdAcVwuGV7U+k+/XwQOBozNLSDNYACStPm9G3NfXXSYZ+/YFFL+UOegTyg==
X-Gm-Message-State: AOJu0YzQciG7uslRemAZjaZLyc+ZaOHQ5rY/Do4icOL11GPu2S0/nJOK
	MdVQd56B0FmHmRLU8QEbMXuUpEPn143nEzUfovzPlAdAHgrz7agWF3lnBZLqFLw=
X-Google-Smtp-Source: AGHT+IGsyY8yXpt8X5axUiNk+A3akY1RMqxa/35yt/ICICyWTKIxiqpZt3x3eK+iUQN8LDGEn+W8hA==
X-Received: by 2002:a05:651c:b0b:b0:2ec:56d1:f28 with SMTP id 38308e7fff4ca-2ee5e3b241fmr62678771fa.26.1719917231561;
        Tue, 02 Jul 2024 03:47:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324eb41sm5539498a12.30.2024.07.02.03.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:47:10 -0700 (PDT)
Message-ID: <d7281992-821b-4eee-b028-7402a58524e3@linaro.org>
Date: Tue, 2 Jul 2024 12:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ARM: dts: aspeed: Add IEISystems NF5280M7 BMC
 machine
To: George Liu <liuxiwei1013@gmail.com>, linux-aspeed@lists.ozlabs.org
References: <20240701105259.972135-1-liuxiwei@ieisystem.com>
 <20240701105259.972135-3-liuxiwei@ieisystem.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240701105259.972135-3-liuxiwei@ieisystem.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 01/07/2024 12:52, George Liu wrote:
> The IEISystems NF5280M7 is an x86 platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
> 

...

> +		i2c613 = &i2c6s1ch3;
> +		i2c614 = &i2c6s1ch4;
> +		i2c615 = &i2c6s1ch5;
> +		i2c616 = &i2c6s1ch6;
> +		i2c617 = &i2c6s1ch7;
> +		i2c620 = &i2c6s2ch0;
> +		i2c621 = &i2c6s2ch1;
> +		i2c622 = &i2c6s2ch2;
> +		i2c623 = &i2c6s2ch3;
> +		i2c624 = &i2c6s2ch4;
> +		i2c625 = &i2c6s2ch5;
> +		i2c626 = &i2c6s2ch6;
> +		i2c627 = &i2c6s2ch7;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8 earlycon";

earlycon is debugging tool, not production, drop. This leads to totally
redundant bootargs, so drop it entirely.

> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +

...


> +&i2c2 {
> +	status = "okay";

Missing blank line (everywhere)

> +	pca9546@70{

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		bus2_mux70_0: i2c@2{
> +			reg = <0>;
> +			tmp112@49{

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Everywhere: missing space before {


> +				compatible = "ti,tmp112";
> +				reg = <0x49>;
> +				label = "Inlet_Temp";
> +			};

Missing blank line

> +			emc1413@4c{

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +				compatible = "microchip,emc1413";
> +				reg = <0x4c>;
> +				label = "Outlet_Temp";
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	multi-master;
> +	status = "okay";
> +	ipmb0@10 {
> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c5 {
> +	bus-frequency = <1000000>;
> +	multi-master;
> +	status = "okay";
> +	pca9546@70{

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Above comment applies to multiple places.

> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		bus5_mux00: i2c@0 {
> +			reg = <0>;
> +			status = "okay";

Where is it disabled?

> +			vrmp2888@76 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +				compatible = "mps,mp2888";
> +				reg = <0x76>;
> +			};
> +			vrmp2888@72 {
> +				compatible = "mps,mp2888";
> +				reg = <0x72>;
> +			};
> +			vrmp2888@62{
> +				compatible = "mps,mp2888";
> +				reg = <0x62>;
> +			};
> +		};
> +		bus5_mux01: i2c@1{
> +			reg = <1>;
> +			status = "okay";

Where is it disabled?

> +			vrmp2888@76{

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +				compatible = "mps,mp2888";
> +				reg = <0x76>;
> +			};
> +			vrmp2888@72 {
> +				compatible = "mps,mp2888";
> +				reg = <0x72>;
> +			};
> +			vrmp2888@62{
> +				compatible = "mps,mp2888";
> +				reg = <0x62>;
> +			};
> +		};
> +		bus5_mux02: i2c@2{
> +			reg = <2>;
> +		};
> +		bus5_mux03: i2c@3{
> +			reg = <3>;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	multi-master;
> +	status = "okay";
> +
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c6s0ch0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +			pca9548@71 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +				compatible = "nxp,pca9548";
> +				reg = <0x71>;
> +				i2c-mux-idle-disconnect;
> +
> +				i2c6s1ch0: i2c@0 {




> +		};
> +	};
> +};
> +
> +&i2c7 {
> +	multi-master;
> +	#retries = <3>;
> +	status = "okay";
> +
> +	adc128d818@1d {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "ti,adc128d818";
> +		reg = <0x1d>;
> +		ti,mode = /bits/ 8 <0x01>;
> +	};



Best regards,
Krzysztof

