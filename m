Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C190595
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2019 18:15:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697hj6S9bzDrS3
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2019 02:15:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cEY+U4e9"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697hc1NPNzDrPS
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Aug 2019 02:15:26 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id gn20so2639334plb.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2019 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hCoByiGuId6oRoUOKH9JltqEdAI/w+EDZR7ajwPu6Eg=;
 b=cEY+U4e9trgXyTjSEt9vrxrwlEj6etSwe8plNjb5q28w+Wxur+kCTmIF226UIgzk75
 dvPoTVJMRci3+YUoOFEBhnmPFKJWKXWQYi78uuYCC4gO3XWUoBq8L8m3OJF0iSy0z/0b
 fOrNu1ZIeDNAgu/++i71X8rIk6UWS7hrAmik3Fb1VfxRK6qRFS8/LBHOcLADPdHqmDBf
 nUSpPGyXinAFNpx+NMt59xxGH/sP9TBP+3a0nrez4KxiHw0nv8OGC3gcSBL63R41w7M0
 j4yynVIgTUUGsAl3YjT0hVhsXLDfXJ+9hX3K5lKIL7hCg4CvT94Ujts5O2T+YVPMdLqk
 ZyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=hCoByiGuId6oRoUOKH9JltqEdAI/w+EDZR7ajwPu6Eg=;
 b=JsF8HAQXhhw2qxo+oSOflb3Qf0YD6rZW24gecXiT6o2GjDwylhvfJNlCm1jeO8CNIu
 dqMB0y6Ii9pAIixAah23hquQnWvMJMb0XFIu0CW4ePVMWaDHN7+hkzwmhn36A+uXko5m
 //4y5uqy9jvkIkCkFanYvWJW+E39OYX/Oaf2xdPjlix9P+TZQxtC/ELBq5vfVC7K00cN
 +9bA+nz9zpKRyiMclOR4lIi2CE29VvJboKXUeTWpSDLnhurHcrg5fz9AEoOLy3jKmbFt
 QQETfex8OA+HM2brePgHQYX6J16ZOh990JNIDGv4BJOWWjuJ/K2Ih5P5kvsmdWR1KTAF
 MvUw==
X-Gm-Message-State: APjAAAVo9proB1TdCaPImgm3iA5W4xrydf7+h8HJzlGbUfMm6C8Q2yXt
 Pi1NgGxum1WvsJ0G5/OH1wk=
X-Google-Smtp-Source: APXvYqw+LolKRAdIcj6iyMrq3orXbq1VOEpKjI2WhIQf3CZL5CeFaTHUCj2rnQbX09fALyYKmfk+xg==
X-Received: by 2002:a17:902:b110:: with SMTP id
 q16mr155147plr.273.1565972124591; 
 Fri, 16 Aug 2019 09:15:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u69sm5262143pgu.77.2019.08.16.09.15.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 09:15:24 -0700 (PDT)
Date: Fri, 16 Aug 2019 09:15:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/2] watchdog: aspeed: Add support for AST2600
Message-ID: <20190816161523.GB5396@roeck-us.net>
References: <20190816160347.23393-1-joel@jms.id.au>
 <20190816160347.23393-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816160347.23393-3-joel@jms.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Aug 17, 2019 at 01:33:47AM +0930, Joel Stanley wrote:
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> The ast2600 can be supported by the same code as the ast2500.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/watchdog/aspeed_wdt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..94f73796ba9d 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -31,9 +31,14 @@ static const struct aspeed_wdt_config ast2500_config = {
>  	.ext_pulse_width_mask = 0xfffff,
>  };
>  
> +static const struct aspeed_wdt_config ast2600_config = {
> +	.ext_pulse_width_mask = 0xfffff,
> +};
> +

Why not just reuse ast2500_config ?

Guenter

>  static const struct of_device_id aspeed_wdt_of_table[] = {
>  	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
>  	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
> +	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
> @@ -259,7 +264,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>  	}
>  
> -	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> +	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
> +		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
>  		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>  
>  		reg &= config->ext_pulse_width_mask;
> -- 
> 2.23.0.rc1
> 
