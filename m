Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E055724031
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 12:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb6pV0Vy8z3bkm
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Jun 2023 20:56:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fNLnGrMK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fNLnGrMK;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb6pM1fcQz3bkm
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Jun 2023 20:55:52 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977d55ac17bso386413666b.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Jun 2023 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686048948; x=1688640948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pq4/1o8g+mHwxEzqKNg20efBPbAjrR6apZBJChO3sIo=;
        b=fNLnGrMKKPYmlkdlb1s0aa4qOdDS/E1AlGKBf/9H/8/BDC1jc8RVHNZ2oaY+CwKtBr
         Mnq8pM9pKveS+LblpZJNtwLfnkiC96AHJJSuXxBNMzE7lh/sikDrt8XkRtpQU7+pYmqv
         lbSK5/2/K03Z4GucrOFZcFIN0wrfLZp6+nNbDlkfUmVlHDj5alBigSC3y+K9JrYP5Ijk
         bRRFFVL1r2vlj8BIYt0pOjhKvGO2wuNawm1t5CdDE0M2y5TX/myn3vv4A4YeSjojnKvu
         XsgUEfbbYMSa++caqDvq7fg7tMDNxS4a9jKB76UfTASnlxpGEQktqxeqakR5pkdPRwEu
         jZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048948; x=1688640948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq4/1o8g+mHwxEzqKNg20efBPbAjrR6apZBJChO3sIo=;
        b=TUtiX6llssYhvqhpRTAS3fDj0lI3Jow1wmIecszg1aj+IP/C2UGy49EZKZMJFYptkB
         sUSEK5rpSOQaOTh1LUhikXsRs+orb7piJ0MT4K82+vQpE4RfSlbrloiT69r9+7HSbG38
         yp14B/UXTy43i47HiNcbdSajoguQ8ngmY6JgfjmfAU6bj22LWdltITyOwUDTdsRMoQ62
         gim9XP8e3a+6jb5Kfgsk9KfGYHHXDM/qaL3L5YRliAV49kNT6FiFto9UCzaZA72zJBca
         KqNDSyOUnQmQ45QKe+80QT/E36TTAHxKFs+GBaNaTk9hyMNuqLrUhIGwNkg8wEpAKAIt
         OZMQ==
X-Gm-Message-State: AC+VfDwWiv+Zg1h0ATOkgWRNattGODvdPzkVsDK/ofiuhLczBOZ4BqNJ
	/AoRT0MpjcnG7YrPgIQx5e5eWw==
X-Google-Smtp-Source: ACHHUZ6KgrMqGQMO7tZmwZnsNMzYsMhI4ucZxYbGLbrsL0Bzdh2tfgvpy05IWX5Q7ONoeyOU1C64ww==
X-Received: by 2002:a17:907:9721:b0:94e:2db:533e with SMTP id jg33-20020a170907972100b0094e02db533emr2144315ejc.49.1686048948580;
        Tue, 06 Jun 2023 03:55:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id sd17-20020a170906ce3100b0095fbb1b72c2sm5418402ejb.63.2023.06.06.03.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:55:48 -0700 (PDT)
Message-ID: <676e5c04-e13c-417b-5a2a-73ee339fbbd3@linaro.org>
Date: Tue, 6 Jun 2023 12:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 4/5] pwm: Add Aspeed ast2600 PWM support
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, lee@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-5-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-5-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> Add the support of PWM controller which can be found at aspeed ast2600
> soc. The pwm supoorts up to 16 channels and it's part function of
> multi-function device "pwm-tach controller".
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---


> +static int aspeed_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +	struct aspeed_pwm_data *priv;
> +	struct device_node *np;
> +	struct platform_device *parent_dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	np = pdev->dev.parent->of_node;
> +	if (!of_device_is_compatible(np, "aspeed,ast2600-pwm-tach"))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported pwm device binding\n");

No, don't embed compatibles in your code. This is useless, so drop it.

> +
> +	priv->regmap = syscon_node_to_regmap(np);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "Couldn't get regmap\n");
> +
> +	parent_dev = of_find_device_by_node(np);

Why? You already have parent!

> +	priv->clk = devm_clk_get_enabled(&parent_dev->dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Couldn't get clock\n");

NAK. This is purely broken. You cannot play with parent's clock and I
told you this last time. Parent is simple-mfd so this code is a hacky
workaround over using simple-mfd even though I told you that yuo cannot
use simple-mfd.

> +
> +	priv->reset = devm_reset_control_get_shared(&parent_dev->dev, NULL);

NAK.


Best regards,
Krzysztof

