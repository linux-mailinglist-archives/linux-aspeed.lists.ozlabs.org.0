Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A66537F271
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 May 2021 06:54:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgfTD1PLwz2yxn
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 May 2021 14:54:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.153; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
X-Greylist: delayed 322 seconds by postgrey-1.36 at boromir;
 Thu, 13 May 2021 14:54:17 AEST
Received: from smtprelay.hostedemail.com (smtprelay0153.hostedemail.com
 [216.40.44.153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgfT56rDWz2yXd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 13 May 2021 14:54:16 +1000 (AEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 7965B181C9B84
 for <linux-aspeed@lists.ozlabs.org>; Thu, 13 May 2021 04:48:55 +0000 (UTC)
Received: from omf07.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 9CEC4BA02;
 Thu, 13 May 2021 04:48:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf07.hostedemail.com (Postfix) with ESMTPA id 1CAF7315D73; 
 Thu, 13 May 2021 04:48:39 +0000 (UTC)
Message-ID: <f2e616645f311ccaf6e0acb996f8c4360a0480ec.camel@perches.com>
Subject: Re: [PATCH] watchdog: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
From: Joe Perches <joe@perches.com>
To: Juerg Haefliger <juerg.haefliger@canonical.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, joel@jms.id.au, linux-watchdog@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Wed, 12 May 2021 21:48:37 -0700
In-Reply-To: <20210511061812.480172-1-juergh@canonical.com>
References: <20210511061812.480172-1-juergh@canonical.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.04
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 1CAF7315D73
X-Stat-Signature: 6kzj9cfeptqsg315pdhjnu5ex5kpbywt
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/YmSWARqT1SSQJOYqo5pk6qOvYyh48NP4=
X-HE-Tag: 1620881318-714369
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

On Tue, 2021-05-11 at 08:18 +0200, Juerg Haefliger wrote:
> Convert sprintf() in sysfs "show" functions to sysfs_emit() and
> sysfs_emit_at() in order to check for buffer overruns in sysfs outputs.
[]
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
[]
> @@ -445,8 +445,9 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> 
> -	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
> -		      w_priv->firmware_rev.minor);
> +	ret = sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
> +			 w_priv->firmware_rev.major,
> +			 w_priv->firmware_rev.minor);
>  
> 
>  	mutex_unlock(&w_priv->sysfs_mutex);
>  
> 
> @@ -468,8 +469,9 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> 
> -	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
> -		      w_priv->bootloader_rev.minor);
> +	ret = sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
> +			 w_priv->bootloader_rev.major,
> +			 w_priv->bootloader_rev.minor);
>  
> 
>  	mutex_unlock(&w_priv->sysfs_mutex);
>  
> 
> @@ -491,7 +493,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> 
> -	ret = sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
> +	ret = sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);

All of these formats should probably end with a newline
and the ZIIRAVE_<FOO>_VERSION_FMT defines are to me unnecessary.

