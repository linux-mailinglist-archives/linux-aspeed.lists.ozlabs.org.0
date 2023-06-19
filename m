Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085B734BFF
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jun 2023 08:59:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NWnPdS7D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql0x606g3z30PY
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Jun 2023 16:59:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NWnPdS7D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql0x00rKpz30Mc
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Jun 2023 16:58:59 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51a2fa4a45eso3991438a12.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Jun 2023 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687157935; x=1689749935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4G6hf18TKdmfNtJ8UCEo6JcM7dVVDUhqliUhTUBuICc=;
        b=NWnPdS7D1gDt3/LuJFeLM1TendCaMiVqQJD+F4P1R56EoN7m1O5j/1TOTzV4tW5QnM
         z3qSJa66nU6AVAXlSKmyMw7NsegMUwKGXm8x+Z7H7uR5VQUe1RKiqUi/3YDf+ipvqVWJ
         hfMZnmJd+vci2rzqV5EBfQaAiBXcZjLfnXZc9zlHgInF+kOyELYsxw8dYpWfkQ1taYhE
         3MqxdfI1BC2AQ5/9xkXVCHr/7zXKiCA1ZPyerIm0vjCqUMKFyA3lc82/CBp5mhvAUe9s
         iKqPqUVZoTtA0nVNpbq/PpBEESHcAtBD3A+maZyrJ1LCYAoDzhcCKF7kY5L9z9XaFWGL
         jKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687157936; x=1689749936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4G6hf18TKdmfNtJ8UCEo6JcM7dVVDUhqliUhTUBuICc=;
        b=PdEpSpv9/uYwDqdCt5jVGm0iGteaA8Wp3FBQg3LkkQb5aByijFmtRUA4cxB2+QZ9Xy
         PMJbE972eFPvPjW0XGQIokguTu61I1wdt5+NgzCj9kP9k7kR6MHztFOGKrWQMq0drgEi
         EuP9xMjxPPpT7VKyXeHjAAxFsg+g9d872tQ8shph4wI0WZTU2G8iwRniI0j8vZ4jgJ7V
         VlTJzInu7d3DH5hVjNgG0a/v5DBkRWqxA9AdZywF1kx3WSMhxxZV5vXyHx4ssO9Fqx/V
         uA36Ldb/od30CyY4DsO4o8oA0vRkXPH+p0hvItPh1YwWn85jFFZOCfT7GVJ6OzpHYRfu
         EsEw==
X-Gm-Message-State: AC+VfDxLZqi2yQDT+HK8MyK3kSRnzaN1HY714xC0QPyuBiRY8kvDX5SO
	43UlZcWfAvhD0gbmWfTuaZyptrztGQKK4UkEJPo=
X-Google-Smtp-Source: ACHHUZ7dJrESQHn9geXJxEPrr2M7TIYqbkSdh/fM8A4bQoGoLVTjbKoOXm0qEqvY2My4FfHw1MZbAQ==
X-Received: by 2002:a50:ef12:0:b0:51a:f6de:bb81 with SMTP id m18-20020a50ef12000000b0051af6debb81mr150817eds.28.1687157935727;
        Sun, 18 Jun 2023 23:58:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ca15-20020aa7cd6f000000b00514a5f7a145sm12562486edb.37.2023.06.18.23.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:58:55 -0700 (PDT)
Message-ID: <f5e6a29f-6df7-b56c-c7b2-9914008eaa33@linaro.org>
Date: Mon, 19 Jun 2023 08:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
Content-Language: en-US
To: PJ Chen <chen.pj@inventec.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
References: <20230619064249.3623-1-chen.pj@inventec.com>
 <20230619064249.3623-2-chen.pj@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619064249.3623-2-chen.pj@inventec.com>
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
Cc: ye.vic@inventec.com, Huang.Alang@inventec.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 19/06/2023 08:42, PJ Chen wrote:
> From: Chen PJ <Chen.pj@inventec.com>
> 
> Initial introduction of Inventec Starscream x86 family
> equipped with AST2600 BMC SoC.
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> 

...

> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: video {
> +			size = <0x04000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +

Drop stray blank lines. Only one blank line, not two. Comment applies to
multiple places.

> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels =
> +		<&adc_u74 0>, // P0_VDD11
> +		<&adc_u74 1>, // P1_VDD11
> +		<&adc_u74 2>, // P0_3V3_S5
> +		<&adc_u74 3>, // P1_3V3_S5
> +		<&adc_u74 4>, // P3V3
> +		<&adc_u74 5>, // VBAT
> +		<&adc_u74 6>, // P3V3_STBY
> +		<&adc_u74 7>, // P5V_STBY
> +		<&adc_u74 8>, // P5V
> +		<&adc_u74 9>, // P12V
> +		<&adc_u74 10>, // P1_VDD18_S5
> +		<&adc_u74 11> // P0_VDD18_S5
> +		;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		uid {

No improvements. Still not fixed and not tested.

Best regards,
Krzysztof

