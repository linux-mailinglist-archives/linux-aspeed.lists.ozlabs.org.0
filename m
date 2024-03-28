Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72388F5CC
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 04:17:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fpKgLw2N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4pcW3hpwz3vXk
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 14:17:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fpKgLw2N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4pcP65Gjz3cVG
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 14:17:07 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dddbe47ac1so10764635ad.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 20:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711595826; x=1712200626; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIic1Gjzm4RHTASBVGxTr3rcD5mx/7GlOl+VtL8tSQM=;
        b=fpKgLw2NJnIe13IQEgg0DOA7wflXcTvk7WW9nwui47NplFk7fAC/uyait4UlcCySzj
         kVUS3iqvf2ExlDOQwIDCv0T0YbhWF/gCrJPjmTmqb4PBLi70aI3g1zhS240OImM0RJww
         AEDqgMZPSqzPyp+QsmBpqphuQnwkOCheuxr43QJ45oxhCfYsJwf122iKyykC0ohZq7QD
         HyB4UN7s+561h/Hc/RC7OXO/Y0yg96lILYepIYeo2KmG2s8YF98zghZnD/ulZ1eB9z96
         o/YHg8X5vGTlfzvWUur2SV0DcFY1IAIVOj64WU04hDFpu8CkBeA3BUqRXFYfuz3e4wZI
         T3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711595826; x=1712200626;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aIic1Gjzm4RHTASBVGxTr3rcD5mx/7GlOl+VtL8tSQM=;
        b=w4i8PTZvryG6sKxkt/tunQ/GV08gK3Y7C1PTAos1GqbXFfEWrpz9etzS7KUUTGayzJ
         GSHUwkssjuXMZOGWDgQj57djNsx8gk2rUdKZsfegFkoTGj93Ud4dYpcbXIHBTyTzei6H
         upRqbu99D2kd0Jv1216ml+HOS+3HGSKU9yGdRWuz5UVlmjuZJZO0wcIyjqYsY4er1YkX
         ru74d0oR6t66smpY84ZSYPGqdBVHNlOUOuQPyPwbAS5jQaRyQX8o2EXkz+lUi+SFEBs6
         iXlY0DX9LsBZe00rGxhcwg39/rtzDD69pen5fXRHdLfnjd8rHakzHRM1eyZfxGeOFbMV
         f2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0SXQTW1RzYUiDVstgTem+GUyfYpvnWuEvC/8YIT4L/OXEq+y8RdckM7A7YphvwfKhHtYOo4foGiMrh0kUxPEn+g00ihUh6pk/RtX6fA==
X-Gm-Message-State: AOJu0Yxrsux9bEuCsL+60yMWEOATd6IActIC88RuI5xMlbv9yc57uRgB
	D3E6ZMpMA2eFBv9HVY1sB7gy3A/4q5AZuVrPIUaxtz1IReRPHdmX
X-Google-Smtp-Source: AGHT+IHPDlU0Hkncg5/5xwbzTu/Vk2SkkvwQsfse7RZqRzoporjOd6tmpv21FcCQ1w5TOTD1jZJJHQ==
X-Received: by 2002:a17:903:446:b0:1e0:cea:257e with SMTP id iw6-20020a170903044600b001e00cea257emr1359031plb.2.1711595825766;
        Wed, 27 Mar 2024 20:17:05 -0700 (PDT)
Received: from ?IPV6:2001:b400:e355:7eb0:17c6:c47d:d4ee:f9e8? (2001-b400-e355-7eb0-17c6-c47d-d4ee-f9e8.emome-ip6.hinet.net. [2001:b400:e355:7eb0:17c6:c47d:d4ee:f9e8])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001e20b3ccdc2sm303861pli.285.2024.03.27.20.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 20:17:05 -0700 (PDT)
Message-ID: <9dca6a69-5fa2-4184-8e18-f5fa1c17f3c3@gmail.com>
Date: Thu, 28 Mar 2024 11:17:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drivers: watchdog: ast2500 and ast2600 support
 bootstatus
From: PeterYin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
 <20240328013303.3609385-5-peteryin.openbmc@gmail.com>
Content-Language: en-US
In-Reply-To: <20240328013303.3609385-5-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Peter Yin 於 3/28/24 09:33 寫道:
> Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2600
> 
> Regarding the AST2600 specification, the WDTn Timeout Status Register
> (WDT10) has bit 1 reserved. Bit 1 of the status register indicates
> on ast2500 if the boot was from the second boot source.
> It does not indicate that the most recent reset was triggered by
> the watchdog. The code should just be changed to set WDIOF_CARDRESET
> if bit 0 of the status register is set.
> 
> Include SCU register to veriy WDIOF_EXTERN1 in ast2600 SCU74 or
> ast2500 SCU3C when bit1 is set.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 34 ++++++++++++++++++++++++++++++----
>   1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..c3c8098c035d 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -11,10 +11,12 @@
>   #include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/kstrtox.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/watchdog.h>
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
> @@ -82,6 +84,13 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define WDT_RESET_MASK1		0x1c
>   #define WDT_RESET_MASK2		0x20
>   
> +/*
> + * Ast2600 SCU74 bit1 is External reset flag
> + * Ast2500 SCU3C bit1 is External reset flag
> + */
> +#define AST2500_SYSTEM_RESET_EVENT	0x3C
> +#define AST2600_SYSTEM_RESET_EVENT	0x74
> +#define   EXTERN_RESET_FLAG		BIT(1)
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
>    * enabled), specifically:
> @@ -330,6 +339,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	if (IS_ERR(wdt->base))
>   		return PTR_ERR(wdt->base);
>   
> +	struct regmap *scu_base = syscon_regmap_lookup_by_phandle(dev->of_node,
> +							     "aspeed,scu");
> +	if (IS_ERR(scu_base))
> +		return PTR_ERR(scu_base);
> +
>   	wdt->wdd.info = &aspeed_wdt_info;
>   
>   	if (wdt->cfg->irq_mask) {
> @@ -459,14 +473,26 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> +	if (status & WDT_TIMEOUT_STATUS_EVENT)
>   		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>   
> -		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
> -		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
> -			wdt->wdd.groups = bswitch_groups;
> +	if (of_device_is_compatible(np, "aspeed,ast2600-wdt")) {
> +		ret = regmap_read(scu_base,
> +				  AST2600_SYSTEM_RESET_EVENT,
> +				  &status);
> +	} else {
> +		ret = regmap_read(scu_base,
> +				  AST2500_SYSTEM_RESET_EVENT,
> +				  &status);
> +		wdt->wdd.groups = bswitch_groups;
>   	}
>   
> +	/*
> +	 * Reset cause by Extern Reset
> +	 */
> +	if (status & EXTERN_RESET_FLAG && !ret)
> +		wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +
>   	dev_set_drvdata(dev, wdt);
>   
>   	return devm_watchdog_register_device(dev, &wdt->wdd);
Please ignore this version, as I lost the definition for 
WDT_TIMEOUT_STATUS_EVENT.


Thanks.
