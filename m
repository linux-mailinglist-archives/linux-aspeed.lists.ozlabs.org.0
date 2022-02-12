Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0A4B32EE
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Feb 2022 05:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwcJC49QQz3bsp
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Feb 2022 15:02:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WKT0f+xC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WKT0f+xC; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwcJ36VJ0z2ymg
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Feb 2022 15:02:10 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id u3so11678861oiv.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Feb 2022 20:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X3DWkDY6ESlWW05nvdEyd2HzU/P3SWIS/jrRQOMR1l4=;
 b=WKT0f+xCcOarZO8/foFf5IbjLo15xrueshlHrfTUo0hmkvtosR47Ck4vrH2xnL0nnz
 JsCIM+UhYKNsjdIaaeWO5FVMOLliQ2RzLc5F4t5l/eNVFKoFOjKqM3KyBW8vmCYCEiPo
 wqfXAzzUo4KUzSmjYqkIgiPDOTRKRq5Vz5QP3e6TjxssdwJK0BX4u2gmc/lj781x0piM
 d6j2LKbYJ1m+z6rI2fABp9HC8paZxDG6l0gO0w+5KZGK+ctLrIBIP0orTWk+1IQxDsM5
 iG6aSnBMdzCFi5YyKjGKwEV9A3xM4uKP84VjMC1X8YcakXmuv2xReADdueUQ5VOd/3EN
 d7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X3DWkDY6ESlWW05nvdEyd2HzU/P3SWIS/jrRQOMR1l4=;
 b=3ROlA9sz71F0caDwBmGzvHH21QrWqg/Ny36MZisZDGThqQ/xYY6YOa9pywIzoFJxM/
 IQmjPO3hSDQ0iBD7TA906ZKEbzvTXqnv273B5r2i1WefDlvydWqS5RSSuxmYrcFyYZ8c
 qBMAsdAEpUhkq8bt241ID0EszHLk3zamC1LoKEDEwg4rOgXA0n/TiyCRP3O8iOloOLpQ
 O3LtN2CHwjsF8ljVIPWUwUfDPV1tliOyMWrXxy2UNzfmagICNMDZb2OmFB789q+t+Nav
 /zzXYS7w9HoyCzOXH4bB3WDIy/WuyP38xpP9B/muOUYkGLg13JZyrj8Cc3EeDhfPrMrO
 1KVw==
X-Gm-Message-State: AOAM5327Gw7FLPU3uRoZbUYxy9A+zrMdQ6as7D1NjXGc07l/Up0JsPCX
 UkQYoL4SjAjjNC1WHnxfzYM=
X-Google-Smtp-Source: ABdhPJzNOYdgS4SXIN65376CQZW54WyRewQE8KvwxCdexhi/zH0UUxsVMFGMsWoTmeq52WFJKYPHaw==
X-Received: by 2002:a05:6808:138c:: with SMTP id
 c12mr1606395oiw.278.1644638527028; 
 Fri, 11 Feb 2022 20:02:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 9sm7134624oas.27.2022.02.11.20.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 20:02:06 -0800 (PST)
Message-ID: <af800c8b-8ad8-a335-0f72-ee636c02e9ef@roeck-us.net>
Date: Fri, 11 Feb 2022 20:02:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] watchdog: aspeed: add nowayout support
Content-Language: en-US
To: Eduardo Valentin <eduval@amazon.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20220212021033.2344-1-eduval@amazon.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220212021033.2344-1-eduval@amazon.com>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Eduardo Valentin <evalenti@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2/11/22 18:10, Eduardo Valentin wrote:
> Add support for not stopping the watchdog
> when the userspace application quits. At
> closing of the device, the driver cannot
> determine if this was a graceful closure
> or if the app crashed. If the support
> of nowayout on this driver, the system integrator
> can select the behaviour by setting the kernel
> config and enabling it.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE DRIVERS)
> Cc: Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
> Cc: Joel Stanley <joel@jms.id.au> (supporter:ARM/ASPEED MACHINE SUPPORT)
> Cc: Andrew Jeffery <andrew@aj.id.au> (reviewer:ARM/ASPEED MACHINE SUPPORT)
> Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
> Cc: linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
> Cc: linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
> Cc: linux-kernel@vger.kernel.org (open list)
> Signed-off-by: Eduardo Valentin <eduval@amazon.com>
> Signed-off-by: Eduardo Valentin <evalenti@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 436571b6fc79..bd06622813eb 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -13,6 +13,11 @@
>   #include <linux/platform_device.h>
>   #include <linux/watchdog.h>
>   
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
>   struct aspeed_wdt {
>   	struct watchdog_device	wdd;
>   	void __iomem		*base;
> @@ -266,6 +271,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
>   	watchdog_init_timeout(&wdt->wdd, 0, dev);
>   
> +	watchdog_set_nowayout(&wdt->wdd, nowayout);
> +
>   	np = dev->of_node;
>   
>   	ofdid = of_match_node(aspeed_wdt_of_table, np);

