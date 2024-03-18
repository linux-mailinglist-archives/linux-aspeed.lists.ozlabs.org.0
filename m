Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9187EDC4
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 17:44:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aVoIXvh4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz10x1MRFz3vhj
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Mar 2024 03:44:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aVoIXvh4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz10p5HSlz3vgv
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Mar 2024 03:44:42 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso2554050a12.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Mar 2024 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710780277; x=1711385077; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gmB3Z9jgqq5Gui7RzOB9q1GAbvUMfntQMdwWF65GjFQ=;
        b=aVoIXvh4RLdLOhZNWW2jAiTb4BA1HysV9YWKS5/u0vepDGiBvSjQkB11MKdFW4em7f
         /Rt09zGrFhmKbgwjD+vTqgw57okLlKDnEmQoymaGfVlL5E9z611yO7+CdVHdcrEvEB2i
         Jfm/Cv+ac3lNjOHaulih20I72GygYV60wd+8KOfXNxTzOijAePBbvfm4MoNPpQ8iaqUu
         gMeehnK3550yebg07B1tBEE7YFQZk2fEyOB1CUBIpPs8JDKJvPrTI6JutGjcT7P/6df2
         I0b1A0jKUfswLsq3+3ChzvaReAS0/P+tGksHB039E7H1U1iE1goAyI7OftaQuzbrmjD6
         OLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780277; x=1711385077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmB3Z9jgqq5Gui7RzOB9q1GAbvUMfntQMdwWF65GjFQ=;
        b=Aw5YJ2e92ATOS6C05y8cbnMEz+H1YNTYsJMN+h9Z75Oha+V+9Gpjv3T0YmGodi624X
         jXJGWW1YOFsIJN9FrnuqkM1uLrrIkoKjYKGuyCwk1LEOMvgYD2rPeBR1AiAOao5RacWL
         mWkbaeoVRTqfHPuWDE9aBkGyExPHulq/CHUmuv5GxEio41SsSYEpGK7SlCuoi0PW3ujU
         biaNimRKhPlVh2vkLTDAPjsmtqZ4kicQ8uQti4HhysDKqQpkec1MYbkG+vQeK//II2J5
         nLYJDXOHD8KLHXkZrLS8UpW2oeqidhDZdIiwiTxTjPqbUA4wLwe/75f2MUqhcfnol/MX
         TOMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNrLFGK5WtKNNtcDokAeHP/Ycp12UYcn1jiu2uoqyEA3HE+3vSlAPbldX7D/USRg5n8vfrGaFRHShXjOJwdoPF2onJplllQcpplE0fPA==
X-Gm-Message-State: AOJu0YzBpxxKD3nIwtSmVbJ92EIQDGoqQIgSKxDjQ1vrzIXc1/iBV1Om
	nfYnFxAzjuxgfBXmRSlMTIGFAODfZ8VK8zebXOmRk0r90edAtj4M
X-Google-Smtp-Source: AGHT+IEYUzujeTm+Tgdcd4136nkMI+53tgP33ArKeVAGzdmL8vWfFS4lOYsHtJ6Dmh44LdogVWxZ8w==
X-Received: by 2002:a17:90a:f009:b0:29c:30b7:3617 with SMTP id bt9-20020a17090af00900b0029c30b73617mr9618816pjb.11.1710780277515;
        Mon, 18 Mar 2024 09:44:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r91-20020a17090a43e400b0029c14758eb4sm8859430pjg.8.2024.03.18.09.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 09:44:36 -0700 (PDT)
Message-ID: <c38c4226-e67d-462f-b930-8d9413863bf5@roeck-us.net>
Date: Mon, 18 Mar 2024 09:44:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (aspeed-g6-pwm-tacho): Make use of
 pwmchip_parent() accessor
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>
References: <cover.1710777536.git.u.kleine-koenig@pengutronix.de>
 <5c6a11dd10cd29e0f7bfaa1fdef145523347cb58.1710777536.git.u.kleine-koenig@pengutronix.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <5c6a11dd10cd29e0f7bfaa1fdef145523347cb58.1710777536.git.u.kleine-koenig@pengutronix.de>
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
> struct pwm_chip::dev is about to change. To not have to touch this
> driver in the same commit as struct pwm_chip::dev, use the accessor
> function provided for exactly this purpose.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/aspeed-g6-pwm-tach.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
> index 597b3b019d49..64def5e4cdf6 100644
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
> @@ -195,7 +195,7 @@ static int aspeed_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   
>   	expect_period = div64_u64(ULLONG_MAX, (u64)priv->clk_rate);
>   	expect_period = min(expect_period, state->period);
> -	dev_dbg(chip->dev, "expect period: %lldns, duty_cycle: %lldns",
> +	dev_dbg(pwmchip_parent(chip), "expect period: %lldns, duty_cycle: %lldns",
>   		expect_period, state->duty_cycle);
>   	/*
>   	 * Pick the smallest value for div_h so that div_l can be the biggest
> @@ -218,12 +218,12 @@ static int aspeed_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   	if (div_l > 255)
>   		div_l = 255;
>   
> -	dev_dbg(chip->dev, "clk source: %ld div_h %lld, div_l : %lld\n",
> +	dev_dbg(pwmchip_parent(chip), "clk source: %ld div_h %lld, div_l : %lld\n",
>   		priv->clk_rate, div_h, div_l);
>   	/* duty_pt = duty_cycle * (PERIOD + 1) / period */
>   	duty_pt = div64_u64(state->duty_cycle * priv->clk_rate,
>   			    (u64)NSEC_PER_SEC * (div_l + 1) << div_h);
> -	dev_dbg(chip->dev, "duty_cycle = %lld, duty_pt = %d\n",
> +	dev_dbg(pwmchip_parent(chip), "duty_cycle = %lld, duty_pt = %d\n",
>   		state->duty_cycle, duty_pt);
>   
>   	/*

