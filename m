Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13A89E06D
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 18:31:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ALfFzUyk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDWg62wv0z3dfM
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Apr 2024 02:31:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ALfFzUyk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDWfz0MvNz3dLl
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 02:31:05 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso4072696b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Apr 2024 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712680260; x=1713285060; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5jDn3MTaqDeILwbAuiKYkg/Duk3E3U9ahMYMgz3dp4=;
        b=ALfFzUykGt9Q+7HCA14GkKiMQ3BL4cElLprhvy0jaIUC4ClNpzh3NEILx+cNW/8+5I
         UbWVHNECb9HoD6N4ljACnETIeMiWV03IzvYEPsvjKluNVw2c7tPruprqNQdxnzEA4c/C
         EONlfi7zTy0l2Y4xQWk6gLcWK/Efjxu9gx8y2Qid9VBHSBiLiv/UlyYY9fHkamJc+/fm
         EpFbnqKZymj6bkFTCK6fJ47VGzEOx6AKm33JKlD6iK7UBBbMSE7Ok6nSHF8NfVDNCelJ
         XppZGhEo6or9gyrccS43DoHXQ6cFTB7eBqH4jpniYv+vOYLiAMoUlQ5M8W8oQ4NgC77O
         CGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712680260; x=1713285060;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5jDn3MTaqDeILwbAuiKYkg/Duk3E3U9ahMYMgz3dp4=;
        b=XWpFW5pq4Tj/gOVmrAjIz1zazfWfyHrKVyY7J5tZgjjEBY7zD+fWe6eACoudPHjans
         zGdzZ3RXlovjzH4zoeWQjYjmmjP4h8g/1da/Tp9Ythg89E0yHVIIXNHTWvtnHBaQdf3o
         bCOodzt5I08aU7G1pYEmliRMXSa2S+z/BQMI7GgFexXYykRG3rvukc9iYf2puQ4dPoWJ
         woNGexxJUlVPyaCJAcaXjtkBkBFehOwSjirwDq7e4CmVT2HS/0KMeLwNgj8hvO6KzcoE
         EB95nTsreoaXYU6sUh3I4P0bzYjPqhaV8PDSlKBR7bfnygVIrx9C5UVLdY7lmOFmBJ2W
         UDKw==
X-Forwarded-Encrypted: i=1; AJvYcCXEBirvNQbafamfR9gkZ+DtgRU7tTqHdCxn3gjDP8VmoOnRu8NUDXmRl7abHJRrjyG3t2/onYP/FGZpF3AF6H9buUxBz1D6HRKiu8mjRg==
X-Gm-Message-State: AOJu0Yze7mJeOPoNI3YzwR+tgwxE3wr89uNi2S3DNscgZmUcbEj52V5u
	IznsS9oDCVtpb2fQZRCBN5mKCSPMO1r1MAi37J8xFlYRQTxvAbWe
X-Google-Smtp-Source: AGHT+IHLfR8agCuvFel6ntEWfiy+fZrIfE1ihB/JnlmAX263CXs8KVa/MgkQI7sLDI8UzplSZX1hvg==
X-Received: by 2002:a05:6a00:985:b0:6ec:f5cf:2bb1 with SMTP id u5-20020a056a00098500b006ecf5cf2bb1mr73165pfg.6.1712680260278;
        Tue, 09 Apr 2024 09:31:00 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id r14-20020aa79ece000000b006ecf72cf8easm8486979pfq.22.2024.04.09.09.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 09:30:59 -0700 (PDT)
Message-ID: <47835475-36de-4682-84ae-0163d45d0bac@gmail.com>
Date: Wed, 10 Apr 2024 00:28:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drivers: watchdog: ast2500 and ast2600 support
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
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
 <20240328022231.3649741-5-peteryin.openbmc@gmail.com>
Content-Language: en-US
In-Reply-To: <20240328022231.3649741-5-peteryin.openbmc@gmail.com>
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



Peter Yin 於 3/28/24 10:22 寫道:
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
>   drivers/watchdog/aspeed_wdt.c | 35 +++++++++++++++++++++++++++++++----
>   1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..0e7ef860cbdc 100644
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
> @@ -77,11 +79,19 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define WDT_TIMEOUT_STATUS	0x10
>   #define   WDT_TIMEOUT_STATUS_IRQ		BIT(2)
>   #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
> +#define   WDT_TIMEOUT_STATUS_EVENT		BIT(0)
>   #define WDT_CLEAR_TIMEOUT_STATUS	0x14
>   #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
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
> @@ -330,6 +340,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
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
> @@ -459,14 +474,26 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
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

Hi Guenter,
    Could you help me understand the definition of WDIOF_CARDRESET in 
the kernel? If it resets the CPU, should all values be reset to default? 
Should we check the POR (RstPwr Power on reset SRST# flag) flag in SCU 
0x74 register bit 0 in ast2600?


