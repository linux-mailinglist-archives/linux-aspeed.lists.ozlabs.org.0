Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8287EDCB
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 17:45:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fr1VNzXl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz1203cwSz3vkF
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Mar 2024 03:45:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fr1VNzXl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz11t3Ytbz3cp1
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Mar 2024 03:45:38 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-29f749b6667so1425515a91.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Mar 2024 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710780336; x=1711385136; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RIAmxMfGxmKF/2fO5lCEP9y+H3IyDxkrQtEBRJf8D24=;
        b=Fr1VNzXl82a+pGXquj664OoY4Z8o7S4ex/EXfAiRIyiQs6B/SSM7FCXuIud366wi3c
         u27qC8wImUdU2y59nxvyWV9Yk1uo/4z8C2LlRb5wBi/Cp4R7+/3FRoq+e0qrphxwRAuf
         9yQPTQsFvyCKexFebHMoKxuDSLSjKBErQW9ZryZe4eXlmFwU4GnvT0j/ImC75N73oBLD
         T4pO3qQrsoEVlyGNr6sYjFL4GQph/Mi/vXZhs1xGWTxVmYH/v5cDYRo+MytY/ElYxXco
         kaP2ks8utxNJJUgTDbakd5RbT7FZq0cVXWtD8Vn383HxRLnH2XwcrJL5X6aorEZflpEG
         S6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780336; x=1711385136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIAmxMfGxmKF/2fO5lCEP9y+H3IyDxkrQtEBRJf8D24=;
        b=VXYJN0XO5F0VQezAct8tccmmy5dnV0URKSgEbFFCr9NYawaD7owG7hXRw984t4AKMB
         yl1dEKKBeDQLxTQTFH2+WpFNxHSoaItNK5QIBGb7JPJmYOlk3zEeSyxBJUu/PmkdsSd8
         nCwsu5ooQ9IigYoebO9C0swCJRdT+80tyI4JtAUViXFAj5VGf+gJVjbrSAmkey9ZYpK8
         k7L4d5T0p4n8gqdKg6HEhp8mOlNHQjwDcsqelVm2f/zPXEJ0yl7sV128LbzQ0YaDjtbI
         c2eBHRJ0f9X1CcuMIWPr+giNu4/u7/xn7v27N+x/9CcsG/lOqSVrBHg1k7U7OaBIdYhR
         9y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN9h6IHDn2S3QSCTX5/7O97eNUYqpMuxD/3QA4dmgFp3Y7enfy8AdgPve58ZRXy8kRYZQu8Gl7j7ibIkhMb6XXnxlduNbQo3fVPsMp6w==
X-Gm-Message-State: AOJu0Yw9exdIV+opGMd1g3FbglE+UhLCWmHcMoeIEat4S3/ZTVqDfVNF
	7d9oA6d+DDXw8MneyYPikY0ya0cxIYGMl2aJ5L6F6JGoV3xVUfda
X-Google-Smtp-Source: AGHT+IGgowlilkJ3K7SQPHRQGwkmCkG6yPMWjsZrl6pn2FQFmDC8YkOEad9BoD7RmztczbFttM0yhg==
X-Received: by 2002:a17:90a:8044:b0:29e:5c51:28c5 with SMTP id e4-20020a17090a804400b0029e5c5128c5mr119719pjw.44.1710780335817;
        Mon, 18 Mar 2024 09:45:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r91-20020a17090a43e400b0029c14758eb4sm8859430pjg.8.2024.03.18.09.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 09:45:35 -0700 (PDT)
Message-ID: <b07680fe-969a-49aa-9995-aa51261f1bee@roeck-us.net>
Date: Mon, 18 Mar 2024 09:45:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (aspeed-g6-pwm-tacho): Make use of
 devm_pwmchip_alloc() function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>
References: <cover.1710777536.git.u.kleine-koenig@pengutronix.de>
 <e95e41eea5a138ae206c9116ba3cb1d9e0178284.1710777536.git.u.kleine-koenig@pengutronix.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e95e41eea5a138ae206c9116ba3cb1d9e0178284.1710777536.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 3/18/24 09:09, Uwe Kleine-König wrote:
> This prepares the aspeed-g6-pwm-tacho driver to further changes of the
> pwm core outlined in the commit introducing devm_pwmchip_alloc(). There
> is no intended semantical change and the driver should behave as before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/aspeed-g6-pwm-tach.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
> index 64def5e4cdf6..332c02216668 100644
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
> @@ -136,7 +136,6 @@ struct aspeed_pwm_tach_data {
>   	struct clk *clk;
>   	struct reset_control *reset;
>   	unsigned long clk_rate;
> -	struct pwm_chip chip;
>   	bool tach_present[TACH_ASPEED_NR_TACHS];
>   	u32 tach_divisor;
>   };
> @@ -144,7 +143,7 @@ struct aspeed_pwm_tach_data {
>   static inline struct aspeed_pwm_tach_data *
>   aspeed_pwm_chip_to_data(struct pwm_chip *chip)
>   {
> -	return container_of(chip, struct aspeed_pwm_tach_data, chip);
> +	return pwmchip_get_drvdata(chip);
>   }
>   
>   static int aspeed_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> @@ -459,6 +458,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>   	int ret;
>   	struct device_node *child;
>   	struct aspeed_pwm_tach_data *priv;
> +	struct pwm_chip *chip;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -487,11 +487,14 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	priv->chip.dev = dev;
> -	priv->chip.ops = &aspeed_pwm_ops;
> -	priv->chip.npwm = PWM_ASPEED_NR_PWMS;
> +	chip = devm_pwmchip_alloc(dev, PWM_ASPEED_NR_PWMS, 0);
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
>   
> -	ret = devm_pwmchip_add(dev, &priv->chip);
> +	pwmchip_set_drvdata(chip, priv);
> +	chip->ops = &aspeed_pwm_ops;
> +
> +	ret = devm_pwmchip_add(dev, chip);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
>   

