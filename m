Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0252E607D11
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Oct 2022 18:57:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv9cN5jxYz3dsk
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Oct 2022 03:57:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CLFsr7rj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CLFsr7rj;
	dkim-atps=neutral
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv9cD6V6rz3chN
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Oct 2022 03:56:59 +1100 (AEDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-13b103a3e5dso4293458fac.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Oct 2022 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zo7dyrvMcPcl4NiHW+MnUrTQJVTlfdJVx4mAsdOPepk=;
        b=CLFsr7rjk4KmpDAj9et7MXXutVkJocGiMMXh9xK7iCSXjESDIntSjLuvtzHZO1vHt3
         WVy64/E4Bh/qAXrhMDyBw8QYTEULYWubdfOqqeiX/fE0jkSqYw3ogw8e7mqnuE20XvB5
         xV+oEwXujJKc+uUWrwstm93aI3Fp64coAHuTegFwBvuSgqXl32By5tTkImM3oUw8Hj/V
         FIhVWYYsyCOqaJ5HxCaB1JyCB+NxbusZjPp3N0g7scR2jfMtCXtUa5WgfDvKKNRpbSDK
         zQDe8qbAILdoj64LttcbwMj/M2UYnVbMTYh5o+lBOzd/gsjPbecnwFFS6b2s4fTaNSTg
         1Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zo7dyrvMcPcl4NiHW+MnUrTQJVTlfdJVx4mAsdOPepk=;
        b=ixMXVYesjRW8vWtAcMe+Uz3cuEJktppcGR4p63cZFgjrtO2u+dX/my9MbolcEHwx1g
         W4C6eUwj+ggQbnmo5ftkyzK7zN8E7kIg0C1SGDWsRdEE/91gl6SDLnEnMfzZ10PU6aeO
         RGpRA4RtA6QY56kxiPw+0WC6xS03JpEPGXDXSnqeYXXNR7ed6h1wpGhTK+UXJwwOSe07
         9sLNc+TYJK0UYfzb33wbYVV2CjjSaFlXHWO3T2z+vfOulQBV8ar++cGfqzJ3hvEI2tqD
         9WUlB1ukrrmaaR+XmOU8RuPVcPcbuGfVWFrLmjhbHDJvd0nVjT7twg2ckdCP/jq+/Row
         9CjA==
X-Gm-Message-State: ACrzQf3Y2lZ0FP2bnERe9ao+UNX+uc8QEhXTOzjqlIexSMVM12iWAjQP
	y11D0pgLAHXk2v6T5ZTav9k=
X-Google-Smtp-Source: AMsMyM5/BK/sbLQBlXVzk5HF2eMhMeYeMbv0zFMLgzeR44gvXmpwZliT5lhOZsrwOYZQshsR01h2CQ==
X-Received: by 2002:a05:6870:5804:b0:12b:10f5:da57 with SMTP id r4-20020a056870580400b0012b10f5da57mr29042551oap.135.1666371413395;
        Fri, 21 Oct 2022 09:56:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ca11-20020a056830610b00b0063696cbb6bdsm1272624otb.62.2022.10.21.09.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:56:52 -0700 (PDT)
Date: Fri, 21 Oct 2022 09:56:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 1/2] watchdog: aspeed: Add pre-timeout interrupt support
Message-ID: <20221021165650.GA1888515@roeck-us.net>
References: <20221021151559.781983-1-eajames@linux.ibm.com>
 <20221021151559.781983-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021151559.781983-2-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 21, 2022 at 10:15:58AM -0500, Eddie James wrote:
> Enable the pre-timeout interrupt if requested by device property.
> 

I am not inclined to accept this patch without detailed explanation.
Why would it make sense and/or be desirable to completely bypass the
watchdog core with this pretimeout support ?

Thanks,
Guenter

> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 53 +++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 0cff2adfbfc9..8e12181a827e 100644
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
> @@ -26,20 +29,32 @@ struct aspeed_wdt {
>  
>  struct aspeed_wdt_config {
>  	u32 ext_pulse_width_mask;
> +	u32 irq_shift;
> +	u32 irq_mask;
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
> @@ -58,6 +73,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>  #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
>  #define   WDT_CTRL_ENABLE		BIT(0)
>  #define WDT_TIMEOUT_STATUS	0x10
> +#define   WDT_TIMEOUT_STATUS_IRQ		BIT(2)
>  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
>  #define WDT_CLEAR_TIMEOUT_STATUS	0x14
>  #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
> @@ -243,6 +259,17 @@ static const struct watchdog_info aspeed_wdt_info = {
>  	.identity	= KBUILD_MODNAME,
>  };
>  
> +static irqreturn_t aspeed_wdt_irq(int irq, void *arg)
> +{
> +	struct aspeed_wdt *wdt = arg;
> +	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> +
> +	if (status & WDT_TIMEOUT_STATUS_IRQ)
> +		panic("Watchdog pre-timeout IRQ");
> +
> +	return IRQ_NONE;
> +}
> +
>  static int aspeed_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -253,6 +280,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	const char *reset_type;
>  	u32 duration;
>  	u32 status;
> +	u32 timeout = 0;
>  	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> @@ -291,6 +319,27 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
>  		wdt->ctrl = WDT_CTRL_1MHZ_CLK;
>  
> +	if (config->irq_mask) {
> +		if (!of_property_read_u32(np, "aspeed,pre-timeout-irq-us", &timeout) && timeout) {
> +			int irq =  platform_get_irq(pdev, 0);
> +
> +			if (irq < 0) {
> +				dev_warn(dev, "Couldn't find IRQ: %d\n", irq);
> +				timeout = 0;
> +			} else {
> +				ret = devm_request_irq(dev, irq, aspeed_wdt_irq, IRQF_SHARED,
> +						       dev_name(dev), wdt);
> +				if (ret) {
> +					dev_warn(dev, "Couldn't request IRQ:%d\n", ret);
> +					timeout = 0;
> +				} else {
> +					wdt->ctrl |= ((timeout << config->irq_shift) &
> +						      config->irq_mask) | WDT_CTRL_WDT_INTR;
> +				}
> +			}
> +		}
> +	}
> +
>  	/*
>  	 * Control reset on a per-device basis to ensure the
>  	 * host is not affected by a BMC reboot
> @@ -308,7 +357,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		else if (!strcmp(reset_type, "system"))
>  			wdt->ctrl |= WDT_CTRL_RESET_MODE_FULL_CHIP |
>  				     WDT_CTRL_RESET_SYSTEM;
> -		else if (strcmp(reset_type, "none"))
> +		else if (strcmp(reset_type, "none") && !timeout)
>  			return -EINVAL;
>  	}
>  	if (of_property_read_bool(np, "aspeed,external-signal"))
> -- 
> 2.31.1
> 
