Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F034B79E485
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 12:05:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dzLL6iEg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlx015g7Lz3c3M
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 20:05:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dzLL6iEg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlwzw6KnPz3bPM
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 20:05:00 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso165869066b.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694599497; x=1695204297; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+8jQ9kgZhteJCnTpLuHVvtEChJ/PBj7uSStHbbRkHBA=;
        b=dzLL6iEg6YXR3olqrRdAhoAwiYZJB5t2+M/AtlUowgBiDWl8fgbgqJ/mCYJk0usf5u
         +tE0Ly+fvqTot1OxEVmSowu+6t4tBkJeKSvu8TOtzHsfQ6Df5wX+Wiitf4EOZ5WLOzug
         VOADve4/c9khgyqJRFBLW74K6RFuKGMY+3THf6SU7TZIz8KI+v8CYSMGZv1fHkqKVqZJ
         JSqbzDrT9IiuL0rLCuymZ2HWJRNhz6I5Wey4O4bKVXAYMyZUgJuxHXToqFXL+OxQ+HRz
         MJs1tDTe3ABfWL7GWlLfPwX0X0+Noi8WD5Yf/IvC6ZAfIGljLs6pVW/YrA97EM5kjWka
         rAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599497; x=1695204297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8jQ9kgZhteJCnTpLuHVvtEChJ/PBj7uSStHbbRkHBA=;
        b=gwwFWjSOunQpHOK5vlkAydk1ZUzqhsKP6Uuq4KchVYaQKhM9Sf7D9bWccWRYAut/xn
         McdBykwiH4nXftY2m+FaLW41ieqGVC6nlAkzp/EZOe0iBJD3Ux8g+yZk1kgWcioi+B0L
         OD1ICHWjochASgy3fqK+SrLB72ph17oT0RDMGYBmOgvmWqvyrpa2OpPAWxqtnZjyeDDq
         LlNCdLDpOOFH+xRniL5gzRx5CU9C+Y2OyQgbhBqRZrasrHjHGGFhuLgPQLt6/MGTpz8Q
         KuHJIVqIZFIkX5f7SIs6JkJYRHUunp1rEKDPAg2fygz8kvIvEU4DDto9gXFOUO6bO8qF
         r8Rg==
X-Gm-Message-State: AOJu0YzCfrM77sAQ2vvtQzgzyCwHmrxIRSA/C+0f3jK1UtjAjIWGy/bZ
	MnbVx5f6o4SnKgdLdCbIKSIiAQ==
X-Google-Smtp-Source: AGHT+IGcnHe8Cof2PTv779x4WyZcCCljCtks0CkDid6AVr83sjmocZ2x8ao7qjkkiXe0miEsy7Tcow==
X-Received: by 2002:a17:907:9408:b0:96f:9cea:a34d with SMTP id dk8-20020a170907940800b0096f9ceaa34dmr7433807ejc.21.1694599496473;
        Wed, 13 Sep 2023 03:04:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g21-20020a170906595500b009920a690cd9sm8012217ejr.59.2023.09.13.03.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:04:56 -0700 (PDT)
Message-ID: <1bfdc230-e358-6aa4-7d60-03b5477a6be9@linaro.org>
Date: Wed, 13 Sep 2023 12:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC
 board
Content-Language: en-US
To: yangchen.openbmc@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-3-yangchen.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912140532.3797736-3-yangchen.openbmc@gmail.com>
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
Cc: patrick@stwcx.xyz, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, Eddie.Chen@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12/09/2023 16:05, yangchen.openbmc@gmail.com wrote:
> From: Yang Chen <yangchen.openbmc@gmail.com>
> 
> Add linux device tree entry related to the Minerva Chassis Management
> Controller (CMC) specific devices connected to the Aspeed SoC (AST2600).
> 
> Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed-bmc-facebook-minerva-cmc.dts       | 265 ++++++++++++++++++
>  2 files changed, 266 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/


> +
> +&i2c15 {
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c128";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&adc0 {
> +	ref_voltage = <2500>;

There is no such property in the bindings.

> +	status = "okay";
> +	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default &pinctrl_adc3_default
> +		&pinctrl_adc4_default &pinctrl_adc5_default
> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +	ref_voltage = <2500>;

NAK, there is no such property.



Best regards,
Krzysztof

