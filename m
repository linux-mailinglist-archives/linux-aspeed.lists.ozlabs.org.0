Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8E554DDC
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 16:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSmXr2glYz3brj
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 00:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K7eZU5oc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K7eZU5oc;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSmXh37CDz2yn5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 00:50:59 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id e63so14807331pgc.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HwGgXv57vIH+vNvmwOGexPPvL9K+C+WCJj+G6bet3ZE=;
        b=K7eZU5ocjviFrvddUIWA8/SYtQoAHHvL/J4hg4OHdkvpE5b9PKZgdLvNBHGKscYUeX
         lqmRg+lHOqLL70Py4esnQtMmo/IMRD10svIwiywrM1/7tTshKZFQoX+27l/SUzpIbKJq
         q3ix5miUFGAM/J1OUQc8cIYTsgukNlWhXpIOqrMoCamxkhwo/QBnPKDA6im+da6hjBdv
         fTf+K/vIi9XKv2v1jOQu/2bnInOws3OGGRB9sgfpLjt4JgT6pE6sIb0b6WcyzfauxEJm
         sLf70ZNGxi2hDCziaATozP7nfkB1CAvFeY+imykxdGg+yl7L9mjdjz2V6oj8HUTji9tg
         6W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HwGgXv57vIH+vNvmwOGexPPvL9K+C+WCJj+G6bet3ZE=;
        b=ZQOl+4Ibc2QDno5fpS1umoCzDfi1Qa+RwQ0Q9k2F7gSBMiRJMuP+6lbq1HT3O3Bx6A
         4NM182V9CJ/tb/8oKfxJDgl3v3ZLAZzM3xV8F8jZge+hSYwAkMgkC12uxBDn9xhfD4pp
         X8mEXBAgr3mE6eSghyRK1DfB29Ksd3pdKaCZOoS8U7iV0jZlRnC1/Od5/L5nf3kYkWaM
         cp2Py43dLXV1KiE8vRrUs1E0bv7lSS6l6+A28oiXVbzgrKd62WBZHLCTOVJVHWcU4g65
         J4W9dxq2qclS7w6l2FJNPjUq7lLgjWuP8akNqsGkNrJ7eJbbsaZY/8dLHuQ5Gf+Y5TE7
         YSVw==
X-Gm-Message-State: AJIora9FKRNClnDjSZeQCuKGrdat+XRTz7JRrRr+M1dGJ2wRZ9/IBySc
	p+ruazGeYhIfBQuoQ99PXdY=
X-Google-Smtp-Source: AGRyM1vETBSZjozRlOirypbBkscRSt7sV+KO4H1vgtPEU6hGtgwIhm92CaQOU49KL79G7Xf6SbWG7w==
X-Received: by 2002:a63:b34d:0:b0:40c:76b2:b725 with SMTP id x13-20020a63b34d000000b0040c76b2b725mr3271773pgt.440.1655909455367;
        Wed, 22 Jun 2022 07:50:55 -0700 (PDT)
Received: from [192.168.1.24] (1-162-200-193.dynamic-ip.hinet.net. [1.162.200.193])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902f70200b0015e8d4eb231sm12863122plo.123.2022.06.22.07.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:50:54 -0700 (PDT)
Message-ID: <47e7eb15-e38d-ead3-de84-b7454e2c6eb8@gmail.com>
Date: Wed, 22 Jun 2022 22:50:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/2] aspeed: i2c: add clock duty cycle property
Content-Language: en-US
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Rob Herring <robh+dt@kernel.org>, Rayn Chen <rayn_chen@aspeedtech.com>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
 <20220610054722.32229-2-potin.lai.pt@gmail.com>
From: Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <20220610054722.32229-2-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Potin Lai 於 6/10/2022 1:47 PM 寫道:
> Introduce i2c-clk-high-min-percent property for setting a minimum clock
> high percentage.
>
> This driver calculate clk_high and clk_low with giving duty cycle. If it
> could not find a suit clk_high and clk_low, it apply default duty cycle
> 50%.
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 56 ++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 67e8b97c0c95..9715dc4f933f 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -19,6 +19,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/math.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> @@ -27,6 +28,8 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  
> +#define DEFAULT_I2C_CLK_DUTY_CYCLE			50
> +
>  /* I2C Register */
>  #define ASPEED_I2C_FUN_CTRL_REG				0x00
>  #define ASPEED_I2C_AC_TIMING_REG1			0x04
> @@ -149,9 +152,11 @@ struct aspeed_i2c_bus {
>  	spinlock_t			lock;
>  	struct completion		cmd_complete;
>  	u32				(*get_clk_reg_val)(struct device *dev,
> -							   u32 divisor);
> +							   u32 divisor,
> +							   u32 duty_cycle);
>  	unsigned long			parent_clk_frequency;
>  	u32				bus_frequency;
> +	u32				duty_cycle;
>  	/* Transaction state. */
>  	enum aspeed_i2c_master_state	master_state;
>  	struct i2c_msg			*msgs;
> @@ -798,9 +803,11 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
>  
>  static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
>  				      u32 clk_high_low_mask,
> -				      u32 divisor)
> +				      u32 divisor,
> +				      u32 duty_cycle)
>  {
>  	u32 base_clk_divisor, clk_high_low_max, clk_high, clk_low, tmp;
> +	u32 tmp_base_clk_divisor;
>  
>  	/*
>  	 * SCL_high and SCL_low represent a value 1 greater than what is stored
> @@ -842,10 +849,32 @@ static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
>  			"clamping clock divider: divider requested, %u, is greater than largest possible divider, %u.\n",
>  			divisor, (1 << base_clk_divisor) * clk_high_low_max);
>  	} else {
> -		tmp = (divisor + (1 << base_clk_divisor) - 1)
> +		for (tmp_base_clk_divisor = base_clk_divisor;
> +		    tmp_base_clk_divisor <= ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
> +		    tmp_base_clk_divisor++) {
> +			/* calculate clk_high and clk_low with duty cycle */
> +			tmp = (divisor + (1 << tmp_base_clk_divisor) - 1)
> +				>> tmp_base_clk_divisor;
> +
> +			clk_high = DIV_ROUND_UP(tmp * duty_cycle, 100);
> +			clk_low = tmp - clk_high;
> +
> +			if (max(clk_high, clk_low) <= (clk_high_low_mask + 1))
> +				break;
> +		}
> +
> +		if (tmp_base_clk_divisor <= ASPEED_I2CD_TIME_BASE_DIVISOR_MASK)
> +			base_clk_divisor = tmp_base_clk_divisor;
> +		else {
> +			dev_err(dev,
> +				"could not find clk_high and clk_low with duty cycle %u%%\n, recalculate with base_clk_divisor %u and duty_cycle 50%%",
> +				duty_cycle, base_clk_divisor);
> +			duty_cycle = 50;
> +			tmp = (divisor + (1 << base_clk_divisor) - 1)
>  				>> base_clk_divisor;
> -		clk_low = tmp / 2;
> -		clk_high = tmp - clk_low;
> +			clk_high = DIV_ROUND_UP(tmp * duty_cycle, 100);
> +			clk_low = tmp - clk_high;
> +		}
>  
>  		if (clk_high)
>  			clk_high--;
> @@ -863,22 +892,22 @@ static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
>  			   & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
>  }
>  
> -static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev, u32 divisor)
> +static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev, u32 divisor, u32 duty_cycle)
>  {
>  	/*
>  	 * clk_high and clk_low are each 3 bits wide, so each can hold a max
>  	 * value of 8 giving a clk_high_low_max of 16.
>  	 */
> -	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor);
> +	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor, duty_cycle);
>  }
>  
> -static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
> +static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor, u32 duty_cycle)
>  {
>  	/*
>  	 * clk_high and clk_low are each 4 bits wide, so each can hold a max
>  	 * value of 16 giving a clk_high_low_max of 32.
>  	 */
> -	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor);
> +	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor, duty_cycle);
>  }
>  
>  /* precondition: bus.lock has been acquired. */
> @@ -891,7 +920,7 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
>  	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
>  			ASPEED_I2CD_TIME_THDSTA_MASK |
>  			ASPEED_I2CD_TIME_TACST_MASK);
> -	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor);
> +	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor, bus->duty_cycle);
>  	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
>  	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
>  
> @@ -1009,11 +1038,16 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>  		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  
> +	ret = of_property_read_u32(pdev->dev.of_node,
> +				   "i2c-clk-high-min-percent", &bus->duty_cycle);
> +	if (ret < 0 || !bus->duty_cycle || bus->duty_cycle > 100)
> +		bus->duty_cycle = DEFAULT_I2C_CLK_DUTY_CYCLE;
> +
>  	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
>  	if (!match)
>  		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
>  	else
> -		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
> +		bus->get_clk_reg_val = (u32 (*)(struct device *, u32, u32))
>  				match->data;
>  
>  	/* Initialize the I2C adapter */
Hi Maintainers,
Could someone please help me review this patch and give me some advice?
Thanks!

Potin
