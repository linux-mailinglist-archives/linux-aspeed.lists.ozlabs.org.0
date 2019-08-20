Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237596567
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2019 17:50:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CZxs49g9zDrG2
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 01:50:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fNasBHcc"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CZxg1PDpzDrFP
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 01:50:14 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w26so3617303pfq.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lYiV05ocruj81X/Vth9fboH+MCkm6RCCkzLgC1xVrmw=;
 b=fNasBHccmJLzP/62U4MV9sBWbQm7OW+UP4o3L47p/QOfrEwB12oFGN1SUeDNxTesTG
 oFVXAGPB/0yKLhB93KvtK39OGt91m5yjXxqiOI+Ne/g4PgiHtP6CnP+emNtm0S5AvRms
 wgLB3LlUTYNcu+oBWwl0mANSxbB8JPDz87T+ueLDw0vAvDTOpKYRKCXog9R0fmkLFIPi
 xzQou+UdcpRw5UdaAiachGeHx8UiMO5DSO/+NrOHHqD3BqcTTUABMqZt3SgFTXKwTSba
 S8dz/yisSiv/DmwTMJJoBD3YdQ0WsmL+fLh8i0MgTfW7wG4rpT5ju3QIDkhGNtSNHAG1
 7vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lYiV05ocruj81X/Vth9fboH+MCkm6RCCkzLgC1xVrmw=;
 b=G7Mr8+ttXG+VYKAIhfG4+JK7ZhSjmhm6FMwWKMv0nxxmoYH3svpYVtN5CjA+l2C46R
 KIwzGtvhrJDEwu+ByftHo2xZ9Jc8jSXRxvwrKY+SUNC+O4F9UPnf7Vntvl/nACa0HG15
 mMNEaWwpcJZkR3lbdsrE4EIcFlSecdWepMOiyxq4qyDAOeKYBhkzr4YCqjnNT3nG8diU
 qLxjVGHwNZOscIHEW8im4ZtBGAeC5CX0FjuWyPlAtRAQ3tsTjhWxu8wNVMqmw66Hpkcx
 TvKgnMoNU9D6hzdLNgkcgY9C5d3XSvRyII/2lYVN/agV3nLUqkCABsP9xTy1E8z0YtPw
 f85Q==
X-Gm-Message-State: APjAAAXjj5Wm2xr/PzZqRra5fx99EoneWfC0g/Mks6LvKHgBZD0OH8To
 b9JPljtdni2QjkGJhhj4rkc=
X-Google-Smtp-Source: APXvYqzcVZHhyB9DOXrMXzkr2BAV66JOb9oS1kaW6MbhIGd5s+OPyrNHhQiJmgISgBG2USF+eV4rvg==
X-Received: by 2002:a62:f204:: with SMTP id m4mr31653953pfh.7.1566316212404;
 Tue, 20 Aug 2019 08:50:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a6sm399723pjv.30.2019.08.20.08.50.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 08:50:11 -0700 (PDT)
Date: Tue, 20 Aug 2019 08:50:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] watchdog: aspeed: Add support for AST2600
Message-ID: <20190820155010.GA20408@roeck-us.net>
References: <20190819051738.17370-1-joel@jms.id.au>
 <20190819051738.17370-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819051738.17370-3-joel@jms.id.au>
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

On Mon, Aug 19, 2019 at 02:47:38PM +0930, Joel Stanley wrote:
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> The ast2600 can be supported by the same code as the ast2500.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  Reuse ast2500 config structure
> ---
>  drivers/watchdog/aspeed_wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..5b64bc2e8788 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -34,6 +34,7 @@ static const struct aspeed_wdt_config ast2500_config = {
>  static const struct of_device_id aspeed_wdt_of_table[] = {
>  	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
>  	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
> +	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2500_config },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
> @@ -259,7 +260,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>  	}
>  
> -	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> +	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
> +		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
>  		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>  
>  		reg &= config->ext_pulse_width_mask;
