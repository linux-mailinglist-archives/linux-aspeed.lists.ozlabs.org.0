Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FF87BE08
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Mar 2024 14:50:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WOBj8ukq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwTKz6vppz3vZm
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Mar 2024 00:50:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WOBj8ukq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwTKr3F8Tz3vY2
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Mar 2024 00:50:39 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso718066b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Mar 2024 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710424235; x=1711029035; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vJp1W1BFyCTx9D6QxoVL4qIYyK7cv5fVEs0PxaztKc8=;
        b=WOBj8ukqN/EJR4EQkc4SyakyJ6HboFPOR7fNnJ5k3/qmWao2R/opswal2acX/QKos2
         Jt3e8UwzY8rR7B3kZCzIhra+TSshoEvVeOFIfNVej0qES9ytLS8mT2xUBQsmZ+gXernn
         pUM6wWqgCIQyS8BzAa3Q/e79XetqV01P/BRsvsk7CpajscBKDzFG38zkjlj0ofqHaxah
         ISYPkcC1/MmkS00EcVFAgb1b/eg9UbwZe7dPZ2WCl/G+pKAhujgBVeD98lp0/Ak3X5S1
         EODnsANHFpUds834KRGuFxi0K/4/47dc7KDnqJsRvmBwE3FPKkXpoR/MDv9bUr9J7k35
         veFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710424235; x=1711029035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJp1W1BFyCTx9D6QxoVL4qIYyK7cv5fVEs0PxaztKc8=;
        b=CbT4Y947ce6oPck2nStrNriuQnVieXbczUq4CGzXTr6/qBBRXKwaLlxmR2C1axs+4v
         QC8s8+vG6uZ7vj48djwHgsdPFFMV3p0ZAnWNn+BM11FgVE2oByaKbDJA5hh2iI7zfYrC
         yjxY5IE9RObeded8aCOQuQQpA8znL3UKFyp0Ie7j0/4kyEjcaeYQtSpNCo2gcZPxYDKA
         l/UIJeA+PJiOdxyEWmwfxEHfA3omslGA19oQ6/JIzqcIW4CiAhQ9GcdaZuPOEEsQ1Vc0
         dFaDogBQ1WLe9FCU3zCa5RpVIzDFLbA3zbk6VEMzWM2eK1+rTwm3XjI854bv5Y+R60mK
         OzKg==
X-Forwarded-Encrypted: i=1; AJvYcCX61Z5ndWHLC/YgQjgVMk23gyYZ3A/PCaGSPMV4lQc35aD9e66p+vryBle41CL41Fz1W/+uubjrWQwwx0HeYMsgW4x2qPUc7Brg5qG5jA==
X-Gm-Message-State: AOJu0YxheAeuLnv+FYuobnlKCOwjhNOG1hQNAvsYTLLyoBu0obUEr4pD
	/izg+FSSR+S9frOqAbrR33W+gmUSpZb6QlnaR+SPgWK4IYqXkTgJ
X-Google-Smtp-Source: AGHT+IFq8jao80Z/Ja9nZTGJGiEkdtmFrTaFi4uMIFzA/6Pv9cSD9FIUcGJ0KTKKK317fxG8FaUKAQ==
X-Received: by 2002:aa7:8881:0:b0:6e6:9fe2:e902 with SMTP id z1-20020aa78881000000b006e69fe2e902mr1931527pfe.20.1710424234932;
        Thu, 14 Mar 2024 06:50:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ks1-20020a056a004b8100b006e6cc458206sm1439506pfb.175.2024.03.14.06.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:50:29 -0700 (PDT)
Message-ID: <257fa47f-f1de-49ec-9ebf-c33d4de736e1@roeck-us.net>
Date: Thu, 14 Mar 2024 06:50:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: watchdog: ast2600 support bootstatus
Content-Language: en-US
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240314065744.1182701-1-peteryin.openbmc@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240314065744.1182701-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 3/13/24 23:57, Peter Yin wrote:
> Add WDIOF_EXTERN1 bootstatus in ast2600
> 

This does a bit more than that because it replaces
WDIOF_CARDRESET with WDIOF_EXTERN1 for ast2600.

> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
> Change log:
> 
> v1
>    - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
> ---
>   drivers/watchdog/aspeed_wdt.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..8adadd394be6 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -81,6 +81,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
>   #define WDT_RESET_MASK1		0x1c
>   #define WDT_RESET_MASK2		0x20
> +#define   WDT_EVENT_COUNTER_MASK       (0xFFF << 8)
>   
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -459,8 +460,17 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);/BOOT_SECON
> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
> +		if (status & WDT_EVENT_COUNTER_MASK) {
> +			/*
> +			 * Reset cause by WatchDog
> +			 */
> +			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +		}
> +	} else {
> +		if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
> +			wdt->wdd.bootstatus = WDIOF_CARDRESET;
>   
>   		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
>   		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))

This check is now unnecessary since it matches the else case.

Either case, it needs to be explained why WDIOF_CARDRESET ("Card previously
reset the CPU") is replaced by WDIOF_EXTERN1 ("External relay 1") for ast2600,
and why WDT_TIMEOUT_STATUS_BOOT_SECONDARY does not apply for ast2600 but
(status & WDT_EVENT_COUNTER_MASK) does.

Guenter

