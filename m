Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578087F4BE
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Mar 2024 01:47:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gDWsMn4u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzCjM2Bb4z3d2B
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Mar 2024 11:47:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gDWsMn4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzCjB376Jz3bvW
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Mar 2024 11:46:53 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-29b7164eef6so3867998a91.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Mar 2024 17:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710809211; x=1711414011; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EjEMCCW1c1Px24P8oKOq8kx+pFZ93LBk8LEdii5izfs=;
        b=gDWsMn4uQbYUsUGjATdmFFMo1m0CxP5fCNL+Pdh+h+DzGSsOLY8ZQpePhY8UWRW6np
         TSz9ZG7LNWRu/OZmQU2oev4y3Afjlsr2Y6zNk1SefV7M4mueO32l1V5kiesrp93vomEs
         PbkYcqnXyrJ3FYhnFpgdDeDDezebL4edyUrle1EXaUBktohC0XI45+H8GDF8hcuiSrKG
         u/wka7wyXgotMtiVbW8GKL0rHlQXOZ23aVPk5zUlaQHcL9nXX6ZT4Efk897oYrSMQZ56
         lE4kohPLF2uFmNySc+ZUCZcHulWKL0K+hLqtO7GM7kJMR4WXreS4c/IjlDpbRwP7K4eQ
         5Lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710809211; x=1711414011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjEMCCW1c1Px24P8oKOq8kx+pFZ93LBk8LEdii5izfs=;
        b=ipj9Wv8NFugvmhz2OJfq1UqnNUxg+yiaKuN1452dCuzo13GmZ8mXho2nPKc24Qa9hp
         az4F2WmlenN6JzC8zKxkmZQsdEYI/mbORXdK+w3jrDaJZ/I+ppBg+NsE+C5yvnlLADw0
         w5/puNK1QUPKTFR76hd8px3gGnSj4Mt9rdfctU8AaYsURt+07MH0v3vIDVWMULLjFi+c
         GSLjYdexeL8ajupWmus6f9v7k1R7QNumAokF0/D567qYgiM+r+6FzrNlRByD/7+svSRw
         00PQA4KsU9mYzlgLEdYlf6WOt74pYrTgm8w488T8BSLwb6/3SM7E4qM5O5rxsB3i2FMa
         gdCw==
X-Forwarded-Encrypted: i=1; AJvYcCWXdxrDSiwMo3tNquFknxCDiC5XiZNW3NiYydDmQpiaZKM1ZmOHlDhLJf8C/TejjpFcFiJmrDgj0ANkOHADV91hYkk/yzUwV2zbDY1kxw==
X-Gm-Message-State: AOJu0Yz9aETW+izK7TD5SfOKdVCY8M6BCEB8TFUSANicT0uVeazmNwm7
	QqQpfShrsYjw7qQfSq+qs5HCplZ+38Si047Cafq+4MqejDH1Ao3N
X-Google-Smtp-Source: AGHT+IEEGfj1yEeiLgflaQdMDDUqa1AXEmOMueS1c1+sZSozyjSdkxlrhu3MhCy7IfdLKw8unXiCKw==
X-Received: by 2002:a17:90a:420a:b0:29b:36a8:4742 with SMTP id o10-20020a17090a420a00b0029b36a84742mr11291099pjg.13.1710809211210;
        Mon, 18 Mar 2024 17:46:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902e2c500b001db8145a1a2sm9932093plc.274.2024.03.18.17.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 17:46:50 -0700 (PDT)
Message-ID: <13640a07-7395-4521-9c5d-748599202361@roeck-us.net>
Date: Mon, 18 Mar 2024 17:46:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: watchdog: ast2600 support bootstatus
Content-Language: en-US
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240318055219.3460121-1-peteryin.openbmc@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240318055219.3460121-1-peteryin.openbmc@gmail.com>
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

On 3/17/24 22:52, Peter Yin wrote:
> Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2600
> 
> Regarding the AST2600 specification, the WDTn Timeout Status Register
> (WDT10) has bit 1 reserved. To verify the second boot source,
> we need to check SEC14 bit 12 and bit 13.
> The bits 8-23 in the WDTn Timeout Status Register are the Watchdog
> Event Count, which we can use to verify WDIOF_EXTERN1.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

You'll have to separate dts and yaml file changes from driver changes.

> ---
> Change log:
> 
> v1 -> v2
>    - Add comment and support WDIOF_CARDRESET in ast2600
> 
> v1
>    - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
> ---
>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |  8 ++---
>   drivers/watchdog/aspeed_wdt.c           | 45 ++++++++++++++++++++++---
>   2 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index e0b44498269f..23ae7f0430e9 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -556,24 +556,24 @@ uart5: serial@1e784000 {
>   
>   			wdt1: watchdog@1e785000 {
>   				compatible = "aspeed,ast2600-wdt";
> -				reg = <0x1e785000 0x40>;
> +				reg = <0x1e785000 0x40>, <0x1e6f2000 0x20>;
>   			};
>   
>   			wdt2: watchdog@1e785040 {
>   				compatible = "aspeed,ast2600-wdt";
> -				reg = <0x1e785040 0x40>;
> +				reg = <0x1e785040 0x40>, <0x1e6f2000 0x020>;
>   				status = "disabled";
>   			};
>   
>   			wdt3: watchdog@1e785080 {
>   				compatible = "aspeed,ast2600-wdt";
> -				reg = <0x1e785080 0x40>;
> +				reg = <0x1e785080 0x40>, <0x1e6f2000 0x020>;
>   				status = "disabled";
>   			};
>   
>   			wdt4: watchdog@1e7850c0 {
>   				compatible = "aspeed,ast2600-wdt";
> -				reg = <0x1e7850C0 0x40>;
> +				reg = <0x1e7850C0 0x40>, <0x1e6f2000 0x020>;
>   				status = "disabled";
>   			};
>   
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..65118e461130 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -33,6 +33,7 @@ struct aspeed_wdt {
>   	void __iomem		*base;
>   	u32			ctrl;
>   	const struct aspeed_wdt_config *cfg;
> +	void __iomem		*sec_base;
>   };
>   
>   static const struct aspeed_wdt_config ast2400_config = {
> @@ -82,6 +83,15 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define WDT_RESET_MASK1		0x1c
>   #define WDT_RESET_MASK2		0x20
>   
> +/*
> + * Only Ast2600 support
> + */
> +#define   WDT_EVENT_COUNTER_MASK	(0xFFF << 8)
> +#define   WDT_SECURE_ENGINE_STATUS	(0x14)
> +#define   ABR_IMAGE_SOURCE		BIT(12)
> +#define   ABR_IMAGE_SOURCE_SPI		BIT(13)
> +#define   SECOND_BOOT_ENABLE		BIT(14)
> +
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
>    * enabled), specifically:
> @@ -313,6 +323,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	const char *reset_type;
>   	u32 duration;
>   	u32 status;
> +	u32 sec_st;
>   	int ret;
>   
>   	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> @@ -330,6 +341,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	if (IS_ERR(wdt->base))
>   		return PTR_ERR(wdt->base);
>   
> +	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
> +		wdt->sec_base = devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(wdt->sec_base))
> +			return PTR_ERR(wdt->sec_base);
> +	}
> +
>   	wdt->wdd.info = &aspeed_wdt_info;
>   
>   	if (wdt->cfg->irq_mask) {
> @@ -459,12 +476,30 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>   
> -		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
> -		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
> -			wdt->wdd.groups = bswitch_groups;
> +	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
> +		/*
> +		 * The WDTn Timeout Status Register bit 1 is reserved.
> +		 * To verify the second boot source,
> +		 * we need to check SEC14 bit 12 and bit 13.
> +		 */
> +		sec_st = readl(wdt->sec_base + WDT_SECURE_ENGINE_STATUS);
> +		if( sec_st & SECOND_BOOT_ENABLE)
> +			if (sec_st & ABR_IMAGE_SOURCE ||
> +			    sec_st & ABR_IMAGE_SOURCE_SPI)

I am sure that checkpatch as something to say here. Either case, I would very
much prefer a single if() statement such as

		if (sec_st & SECOND_BOOT_ENABLE &&
		    sec_st & (ABR_IMAGE_SOURCE | ABR_IMAGE_SOURCE_SPI))

> +				wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> +
> +		/*
> +		 * To check Watchdog Event Count for WDIOF_EXTERN1
> +		 */
> +		if (status & WDT_EVENT_COUNTER_MASK) {
> +			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +		}

Unnecessary { }

... but does this really indicate that there was a reset due to some event ?
This reads three 8-bit counters. Wouldn't it make more sense to check bit 0
instead ?

I am also not sure if reading the watchdog status from WDT_SECURE_ENGINE_STATUS
adds any value over the status reported in the watchdog status register.
You'll have to explain why the added complexity is necessary or even adds
value.

Never mind, though ...

Looking into the datasheets, the current code is quite completely wrong anyway.
Bit 1 of the status register indicates on ast2500 if the boot was from the second
boot source. It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET if bit 0
of the status register is set. The boot source is out of scope for the watchdog
status bits.

Thanks,
Guenter

