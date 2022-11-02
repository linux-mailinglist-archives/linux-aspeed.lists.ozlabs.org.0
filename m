Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA8616F48
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 22:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2fR95kkVz3cMw
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 08:00:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KAgJr5TK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KAgJr5TK;
	dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2fR26ZNjz3bbB
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 07:59:56 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id r76so13954485oie.13
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soS0Yn/ZfokS1qDWkDRsD0zJtKnYpfw4M0hFaCGBl6A=;
        b=KAgJr5TKogtZjSuef30nd+LiAEK4V2yhrt1PTlZZkWcR996CjbOhTvPai+AGSSVE99
         vMeCPW2O3U4TLaDwDwBJ6iTSzFKXd3VyBDfJccDj7yyht6fjkX8r5UaB8HAWxrf6K0bD
         8/2Rgr0t/5JYBR9RqzI979iJsRxNsNv+7f2FbuHuPcZLjizzfJeiNRgiZyewHe6H5+us
         L9PaSqk10wbv/vehz36H8r7rs3wYrkZrMx1685L5PbpTPDzPfpWWjlenWgwAULw4RHEY
         XWmvnNj5LpI5PxGYIcI/PhIzXFlzrI7j0BLCxU6mV8XZfeSH7MKxAoyuqAmFWSEoNlD0
         29vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soS0Yn/ZfokS1qDWkDRsD0zJtKnYpfw4M0hFaCGBl6A=;
        b=WNe3tf9H2D3iEVHdr1bgfKXdFhEZoH27nC6OqIQA8L1z6CSIyK/OE9mwI5Y0JEUoEe
         4sEaKW0u7vw2r+QQjleBKXDx7G3QlCEzd8F+FONEwhwhkul7MGyJ26dqOZXr1ucaBhiR
         FaE9zxyO/6ZWq/MoTQ6DC1nQNd7r1dNw20Wbzcv7prT/wZFgu09LfYHBW1/wC3JbkLD9
         koIe7E6KdoUQXa2PYLp0AvsWfVUhVMdvdkzP46Hgo5V2BRaJSAaaqJf4tJ9nvos/T1w4
         i8YlKoCbKRcBabaldp/bxp/Iev2d99YsxiTzLFV1tedvqZ7Qi6LBQKxhzRAwwwaJ1IFv
         QjmA==
X-Gm-Message-State: ACrzQf1uC9Db8KIae7Ndr/sqnO/T7iWii4Nn2EdIkNhx6j4vgvIoSn6k
	fLMvOKQdcpxxzSP1pDFiyPo=
X-Google-Smtp-Source: AMsMyM60QwbnBdqegQTHutWhgWFgSvG6RppshZhcmtSjy4OMnY4Pv8mxZyakqUgILkZBi4C2n9Pyaw==
X-Received: by 2002:a05:6808:1207:b0:353:e6cf:6d46 with SMTP id a7-20020a056808120700b00353e6cf6d46mr14534475oil.207.1667422792485;
        Wed, 02 Nov 2022 13:59:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 14-20020a54418e000000b0034d8abf42f1sm4953081oiy.23.2022.11.02.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 13:59:52 -0700 (PDT)
Date: Wed, 2 Nov 2022 13:59:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] watchdog: aspeed: Enable pre-timeout interrupt
Message-ID: <20221102205951.GA2090175@roeck-us.net>
References: <20221101205338.577427-1-eajames@linux.ibm.com>
 <20221101205338.577427-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101205338.577427-2-eajames@linux.ibm.com>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, wim@linux-watchdog.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 01, 2022 at 03:53:37PM -0500, Eddie James wrote:
> Enable the core pre-timeout interrupt on AST2500 and AST2600.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c | 104 ++++++++++++++++++++++++++++------
>  1 file changed, 88 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 0cff2adfbfc9..86b5331bc491 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -5,11 +5,14 @@
>   * Joel Stanley <joel@jms.id.au>
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/delay.h>
> +#include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/watchdog.h>
>  
> @@ -18,28 +21,41 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +struct aspeed_wdt_config {
> +	u32 ext_pulse_width_mask;
> +	u32 irq_shift;
> +	u32 irq_mask;
> +};
> +
>  struct aspeed_wdt {
>  	struct watchdog_device	wdd;
>  	void __iomem		*base;
>  	u32			ctrl;
> -};
> -
> -struct aspeed_wdt_config {
> -	u32 ext_pulse_width_mask;
> +	const struct aspeed_wdt_config *cfg;
>  };
>  
>  static const struct aspeed_wdt_config ast2400_config = {
>  	.ext_pulse_width_mask = 0xff,
> +	.irq_shift = 0,
> +	.irq_mask = 0,
>  };
>  
>  static const struct aspeed_wdt_config ast2500_config = {
>  	.ext_pulse_width_mask = 0xfffff,
> +	.irq_shift = 12,
> +	.irq_mask = GENMASK(31, 12),
> +};
> +
> +static const struct aspeed_wdt_config ast2600_config = {
> +	.ext_pulse_width_mask = 0xfffff,
> +	.irq_shift = 0,
> +	.irq_mask = GENMASK(31, 10),
>  };
>  
>  static const struct of_device_id aspeed_wdt_of_table[] = {
>  	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
>  	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
> -	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2500_config },
> +	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
> @@ -58,6 +74,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>  #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
>  #define   WDT_CTRL_ENABLE		BIT(0)
>  #define WDT_TIMEOUT_STATUS	0x10
> +#define   WDT_TIMEOUT_STATUS_IRQ		BIT(2)
>  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
>  #define WDT_CLEAR_TIMEOUT_STATUS	0x14
>  #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
> @@ -160,6 +177,26 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
> +				     unsigned int pretimeout)
> +{
> +	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
> +	u32 actual = pretimeout * WDT_RATE_1MHZ;
> +	u32 s = wdt->cfg->irq_shift;
> +	u32 m = wdt->cfg->irq_mask;
> +
> +	wdd->pretimeout = pretimeout;
> +	wdt->ctrl &= ~m;
> +	if (pretimeout)
> +		wdt->ctrl |= ((actual << s) & m) | WDT_CTRL_WDT_INTR;
> +	else
> +		wdt->ctrl &= ~WDT_CTRL_WDT_INTR;
> +
> +	writel(wdt->ctrl, wdt->base + WDT_CTRL);
> +
> +	return 0;
> +}
> +
>  static int aspeed_wdt_restart(struct watchdog_device *wdd,
>  			      unsigned long action, void *data)
>  {
> @@ -232,6 +269,7 @@ static const struct watchdog_ops aspeed_wdt_ops = {
>  	.stop		= aspeed_wdt_stop,
>  	.ping		= aspeed_wdt_ping,
>  	.set_timeout	= aspeed_wdt_set_timeout,
> +	.set_pretimeout = aspeed_wdt_set_pretimeout,
>  	.restart	= aspeed_wdt_restart,
>  	.owner		= THIS_MODULE,
>  };
> @@ -243,10 +281,29 @@ static const struct watchdog_info aspeed_wdt_info = {
>  	.identity	= KBUILD_MODNAME,
>  };
>  
> +static const struct watchdog_info aspeed_wdt_pretimeout_info = {
> +	.options	= WDIOF_KEEPALIVEPING
> +			| WDIOF_PRETIMEOUT
> +			| WDIOF_MAGICCLOSE
> +			| WDIOF_SETTIMEOUT,
> +	.identity	= KBUILD_MODNAME,
> +};
> +
> +static irqreturn_t aspeed_wdt_irq(int irq, void *arg)
> +{
> +	struct watchdog_device *wdd = arg;
> +	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
> +	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> +
> +	if (status & WDT_TIMEOUT_STATUS_IRQ)
> +		watchdog_notify_pretimeout(wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int aspeed_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	const struct aspeed_wdt_config *config;
>  	const struct of_device_id *ofdid;
>  	struct aspeed_wdt *wdt;
>  	struct device_node *np;
> @@ -259,11 +316,33 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (!wdt)
>  		return -ENOMEM;
>  
> +	np = dev->of_node;
> +
> +	ofdid = of_match_node(aspeed_wdt_of_table, np);
> +	if (!ofdid)
> +		return -EINVAL;
> +	wdt->cfg = ofdid->data;
> +
>  	wdt->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
>  	wdt->wdd.info = &aspeed_wdt_info;
> +
> +	if (wdt->cfg->irq_mask) {
> +		int irq = platform_get_irq_optional(pdev, 0);
> +
> +		if (irq > 0) {
> +			ret = devm_request_irq(dev, irq, aspeed_wdt_irq,
> +					       IRQF_SHARED, dev_name(dev),
> +					       wdt);
> +			if (ret)
> +				return ret;
> +
> +			wdt->wdd.info = &aspeed_wdt_pretimeout_info;
> +		}
> +	}
> +
>  	wdt->wdd.ops = &aspeed_wdt_ops;
>  	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
>  	wdt->wdd.parent = dev;
> @@ -273,13 +352,6 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_set_nowayout(&wdt->wdd, nowayout);
>  
> -	np = dev->of_node;
> -
> -	ofdid = of_match_node(aspeed_wdt_of_table, np);
> -	if (!ofdid)
> -		return -EINVAL;
> -	config = ofdid->data;
> -
>  	/*
>  	 * On clock rates:
>  	 *  - ast2400 wdt can run at PCLK, or 1MHz
> @@ -331,7 +403,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
>  		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>  
> -		reg &= config->ext_pulse_width_mask;
> +		reg &= wdt->cfg->ext_pulse_width_mask;
>  		if (of_property_read_bool(np, "aspeed,ext-active-high"))
>  			reg |= WDT_ACTIVE_HIGH_MAGIC;
>  		else
> @@ -339,7 +411,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  
>  		writel(reg, wdt->base + WDT_RESET_WIDTH);
>  
> -		reg &= config->ext_pulse_width_mask;
> +		reg &= wdt->cfg->ext_pulse_width_mask;
>  		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
>  			reg |= WDT_PUSH_PULL_MAGIC;
>  		else
> @@ -349,7 +421,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
> -		u32 max_duration = config->ext_pulse_width_mask + 1;
> +		u32 max_duration = wdt->cfg->ext_pulse_width_mask + 1;
>  
>  		if (duration == 0 || duration > max_duration) {
>  			dev_err(dev, "Invalid pulse duration: %uus\n",
