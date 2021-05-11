Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366137A7C4
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 May 2021 15:35:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fff7J3wSgz2yxB
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 May 2021 23:35:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Cz7NhXEz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Cz7NhXEz; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fff7C1DxYz2xff
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 May 2021 23:35:18 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so11181326oth.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 May 2021 06:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h6fK7BnZuy9PHn9xxf/wsp5uxAeJb4ALs9dipuADBFY=;
 b=Cz7NhXEz5zhBwoP3xMiPki1O5IHCH/QOv9iq5NkHhSZGwU22h0zkyUoSP32uvRA5q4
 bvtY6jU9MiNAASgEcvFZ3jUs3Cg75n9sTzuQtDLcB6yhcKdGbvCxA5lPdpzoPPDyehyR
 Fy1vQZ1iX5VOMI3J3tvswpgfoIEVQ8l0ktX5r/eXvKuuryOSqPxAJEKtL0TYrs2YsZy7
 DmlNBPp7C8ArOsAmsbdf7TDyYJmpxmW2cR2R6KxbK9njIGXfzh/qqpFjoFmqOA/Vd0bv
 d9KIa/8OMWmlscb9Op/9lyVtIbFQnVBCK7yZvjMQQ50Yglkc4msczITaXoTUSEpa4QbV
 W13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h6fK7BnZuy9PHn9xxf/wsp5uxAeJb4ALs9dipuADBFY=;
 b=EsuOUQq4bPsajiVez4Cwq5y5xiBMj1dJKLIdGxahxppjlzNgBHx8JChYNLsy/4a3J0
 qBxAZosL5mvy16HZbt8oGEBqSRWdspWsMVuMz7I0HxIoXAWywLjZ9rTEppJjutEXQxDv
 Lh8G1Ytk6kua3V/08f4LSyl61xhFF2yn5mzG4/utoWKphETqSTlETvjSASNEJHOzsJ8M
 pPUeJInCIfL1ONO0A92fLhAnCnv6salg7uDqhFvzCg7mM/vTGce+3GqJRxelWMzZryXD
 Ioyh9+RLTOzvKA6EHt9ltJjmQdvZc+iPkJxZudbYDEdXPKklnJzO0Rxe9C5HK9aAWgbk
 pRAQ==
X-Gm-Message-State: AOAM531ipLrQfJ+lHLjj1Q71XV0mspl0EaxlU/rfuwiqV6CNHaNAgrOC
 N/ncD6S84GnrrwJcrr0tsnc=
X-Google-Smtp-Source: ABdhPJzZsguJjl3as/RigM4yjHDbwp+sJugUyMWZjcnqsJFWf1mf+ZNxwpRtnIJXLgKLbQR3QrkF/w==
X-Received: by 2002:a05:6830:1605:: with SMTP id
 g5mr25516254otr.22.1620740116730; 
 Tue, 11 May 2021 06:35:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v79sm1567350oia.14.2021.05.11.06.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 06:35:16 -0700 (PDT)
Subject: Re: [PATCH] watchdog: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
To: Juerg Haefliger <juerg.haefliger@canonical.com>, wim@linux-watchdog.org,
 joel@jms.id.au, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20210511061812.480172-1-juergh@canonical.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <dbb5b8ea-a62d-2d69-231f-06cc87551f5a@roeck-us.net>
Date: Tue, 11 May 2021 06:35:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511061812.480172-1-juergh@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/10/21 11:18 PM, Juerg Haefliger wrote:
> Convert sprintf() in sysfs "show" functions to sysfs_emit() and
> sysfs_emit_at() in order to check for buffer overruns in sysfs outputs.
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/aspeed_wdt.c          |  4 ++--
>   drivers/watchdog/watchdog_dev.c        | 19 ++++++++++---------
>   drivers/watchdog/watchdog_pretimeout.c |  4 ++--
>   drivers/watchdog/ziirave_wdt.c         | 12 +++++++-----
>   4 files changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 7e00960651fa..933998e5a9de 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -175,8 +175,8 @@ static ssize_t access_cs0_show(struct device *dev,
>   	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
>   	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
>   
> -	return sprintf(buf, "%u\n",
> -		      !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
> +	return sysfs_emit(buf, "%u\n",
> +			  !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
>   }
>   
>   static ssize_t access_cs0_store(struct device *dev,
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a63110..fe68a97973a5 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -451,7 +451,8 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
> +	return sysfs_emit(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT,
> +						  &wdd->status));
>   }
>   
>   static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
> @@ -485,7 +486,7 @@ static ssize_t status_show(struct device *dev, struct device_attribute *attr,
>   	status = watchdog_get_status(wdd);
>   	mutex_unlock(&wd_data->lock);
>   
> -	return sprintf(buf, "0x%x\n", status);
> +	return sysfs_emit(buf, "0x%x\n", status);
>   }
>   static DEVICE_ATTR_RO(status);
>   
> @@ -494,7 +495,7 @@ static ssize_t bootstatus_show(struct device *dev,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%u\n", wdd->bootstatus);
> +	return sysfs_emit(buf, "%u\n", wdd->bootstatus);
>   }
>   static DEVICE_ATTR_RO(bootstatus);
>   
> @@ -510,7 +511,7 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
>   	status = watchdog_get_timeleft(wdd, &val);
>   	mutex_unlock(&wd_data->lock);
>   	if (!status)
> -		status = sprintf(buf, "%u\n", val);
> +		status = sysfs_emit(buf, "%u\n", val);
>   
>   	return status;
>   }
> @@ -521,7 +522,7 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%u\n", wdd->timeout);
> +	return sysfs_emit(buf, "%u\n", wdd->timeout);
>   }
>   static DEVICE_ATTR_RO(timeout);
>   
> @@ -530,7 +531,7 @@ static ssize_t pretimeout_show(struct device *dev,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%u\n", wdd->pretimeout);
> +	return sysfs_emit(buf, "%u\n", wdd->pretimeout);
>   }
>   static DEVICE_ATTR_RO(pretimeout);
>   
> @@ -539,7 +540,7 @@ static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%s\n", wdd->info->identity);
> +	return sysfs_emit(buf, "%s\n", wdd->info->identity);
>   }
>   static DEVICE_ATTR_RO(identity);
>   
> @@ -549,9 +550,9 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
>   	if (watchdog_active(wdd))
> -		return sprintf(buf, "active\n");
> +		return sysfs_emit(buf, "active\n");
>   
> -	return sprintf(buf, "inactive\n");
> +	return sysfs_emit(buf, "inactive\n");
>   }
>   static DEVICE_ATTR_RO(state);
>   
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index 01ca84be240f..7f257c3485cd 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -55,7 +55,7 @@ int watchdog_pretimeout_available_governors_get(char *buf)
>   	mutex_lock(&governor_lock);
>   
>   	list_for_each_entry(priv, &governor_list, entry)
> -		count += sprintf(buf + count, "%s\n", priv->gov->name);
> +		count += sysfs_emit_at(buf, count, "%s\n", priv->gov->name);
>   
>   	mutex_unlock(&governor_lock);
>   
> @@ -68,7 +68,7 @@ int watchdog_pretimeout_governor_get(struct watchdog_device *wdd, char *buf)
>   
>   	spin_lock_irq(&pretimeout_lock);
>   	if (wdd->gov)
> -		count = sprintf(buf, "%s\n", wdd->gov->name);
> +		count = sysfs_emit(buf, "%s\n", wdd->gov->name);
>   	spin_unlock_irq(&pretimeout_lock);
>   
>   	return count;
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 4297280807ca..6c9414d09684 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -445,8 +445,9 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
> -		      w_priv->firmware_rev.minor);
> +	ret = sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
> +			 w_priv->firmware_rev.major,
> +			 w_priv->firmware_rev.minor);
>   
>   	mutex_unlock(&w_priv->sysfs_mutex);
>   
> @@ -468,8 +469,9 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
> -		      w_priv->bootloader_rev.minor);
> +	ret = sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
> +			 w_priv->bootloader_rev.major,
> +			 w_priv->bootloader_rev.minor);
>   
>   	mutex_unlock(&w_priv->sysfs_mutex);
>   
> @@ -491,7 +493,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
> +	ret = sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
>   
>   	mutex_unlock(&w_priv->sysfs_mutex);
>   
> 

