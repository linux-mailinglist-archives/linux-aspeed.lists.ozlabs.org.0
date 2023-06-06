Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802B724034
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 12:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb6qT0wRfz3bkm
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 20:56:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vt7AVfq2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vt7AVfq2;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb6qN6yJ0z3bkm
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Jun 2023 20:56:48 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977e83d536fso249636466b.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Jun 2023 03:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686049005; x=1688641005;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEsKBsSffmKc/zSAV6wOrR7iFLeq5WaYkyI3CvHytZU=;
        b=vt7AVfq2arf4Qp5A3xYsMz1wdt5wTOuR1cIUFGDWwF34x+Q/CxhGrrilLmcuPuOVH3
         KVXiwsYRji6W04RLTHcRSTQzeiIOEuWZ6mWZRGZihFV3sZffr1KKmXaDNapD+zgymF39
         uI86z8eovwuubmiRV4jiHBV9by8kf4WULN+PXNgC2ld0+DsG6jfzqItIh4AdQgSZWi0b
         HpPjqi3HSEDLr9PpLkdMR8lZkKlK+U7FP4pAATmu646c+ykxn1/TYDhre/cjK1XeMUR8
         DBq/ELdF0EidJYsbnFzm/J0+u95cIC4hDlWJVFQlv3ecvunmjTIJkp+A5EhFt4DIPGan
         BTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049005; x=1688641005;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEsKBsSffmKc/zSAV6wOrR7iFLeq5WaYkyI3CvHytZU=;
        b=chTJ74oLaBm5OfJ1c5MwaiXSqaafiByPYBIEvmlPH/VVmbyT8J0kMxvNe8TRzdBZcV
         jLpIIkBO+AbX6qmjmNeOwEk5IgAiOsYXdK87FPDK8WSpRkHQzZCy+bKvQkdDkr/Weuku
         dFt34FQKkX1shuoGnT5wdmznkUVNl+vvesHnTXtKtbygiaAYi40oCDIE3kWwo1B392LX
         LMiVRqTeeVuK3XR001IY2UPEZ+gk6W1O2AhkmcRAm5DogKoaYoQbtHlXWM/lM1Sa8y4G
         DwxH2crIE6oPbj02jMcYRPFatcg79Jvj0uh6YYxFHxVZz5sxdz7MNd0hGy98K7don4SP
         eD/Q==
X-Gm-Message-State: AC+VfDwOAQYJBMJpqJTMECEh0XyI409C8eQ7KsA6fKRFRHXI870tlC2n
	UGOOV5x47LIxUHooMTdyFb7KeA==
X-Google-Smtp-Source: ACHHUZ50UOBCxUsXhaGVyDZif/C/c1U/u3c87IyMXAQmNbsv2lf0xkReTrxYEjK7HQ/nqHXyEVfvlQ==
X-Received: by 2002:a17:906:794a:b0:966:eb8:2f12 with SMTP id l10-20020a170906794a00b009660eb82f12mr1715450ejo.11.1686049005533;
        Tue, 06 Jun 2023 03:56:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b00514ad0e3167sm4878151eds.71.2023.06.06.03.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:56:44 -0700 (PDT)
Message-ID: <47d95067-12e0-4b19-6b6d-104532fae1e0@linaro.org>
Date: Tue, 6 Jun 2023 12:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 5/5] hwmon: Add Aspeed ast2600 TACH support
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-6-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-6-billy_tsai@aspeedtech.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 06/06/2023 11:45, Billy Tsai wrote:
> Add the support of Tachometer which can use to monitor the frequency of
> the input. The tach supports up to 16 channels and it's part function of
> multi-function device "pwm-tach controller".
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>


> +
> +static void aspeed_tach_reset_assert(void *data)
> +{
> +	struct reset_control *rst = data;
> +
> +	reset_control_assert(rst);
> +}
> +
> +static int aspeed_tach_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np, *child;
> +	struct aspeed_tach_data *priv;
> +	struct device *hwmon;
> +	int ret;
> +
> +	np = dev->parent->of_node;
> +	if (!of_device_is_compatible(np, "aspeed,ast2600-pwm-tach"))

Drop.

> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported tach device binding\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = &pdev->dev;
> +
> +	priv->regmap = syscon_node_to_regmap(np);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "Couldn't get regmap\n");
> +
> +	priv->clk = devm_clk_get_enabled(dev->parent, NULL);

NAK. Parent is simple-mfd, means it must not have clock.


> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Couldn't get clock\n");
> +
> +	priv->clk_source = clk_get_rate(priv->clk);
> +
> +	priv->reset = devm_reset_control_get_shared(dev->parent, NULL);

NAK, same reasons.

Best regards,
Krzysztof

