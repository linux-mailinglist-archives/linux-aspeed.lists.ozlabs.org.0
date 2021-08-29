Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 543823FAC97
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Aug 2021 17:30:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyHTb2B0fz2yJC
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 01:30:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyHTX0Zjyz2xr6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Aug 2021 01:30:39 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A7F860F45;
 Sun, 29 Aug 2021 15:30:32 +0000 (UTC)
Date: Sun, 29 Aug 2021 16:33:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [RESEND v4 11/15] iio: adc: aspeed: Fix the calculate error of
 clock.
Message-ID: <20210829163346.501fdb43@jic23-huawei>
In-Reply-To: <20210824091243.9393-12-billy_tsai@aspeedtech.com>
References: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
 <20210824091243.9393-12-billy_tsai@aspeedtech.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, pmeerw@pmeerw.net,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 robh+dt@kernel.org, p.zabel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 24 Aug 2021 17:12:39 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The adc clcok formula is

clock

> ast2400/2500:
> ADC clock period = PCLK * 2 * (ADC0C[31:17] + 1) * (ADC0C[9:0] + 1)
> ast2600:
> ADC clock period = PCLK * 2 * (ADC0C[15:0] + 1)
> They all have one fixed divided 2 and the legacy driver didn't handle it.
> This patch register the fixed factory clock device as the parent of adc
> clock scaler to fix this issue.

What are the impacts of this being wrong before?  Is this something we
should look to backport?

Comment inline.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/iio/adc/aspeed_adc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index ea3e9a52fcc9..8fe7da1a651f 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -4,6 +4,12 @@
>   *
>   * Copyright (C) 2017 Google, Inc.
>   * Copyright (C) 2021 Aspeed Technology Inc.
> + *
> + * ADC clock formula:
> + * Ast2400/Ast2500:
> + * clock period = period of PCLK * 2 * (ADC0C[31:17] + 1) * (ADC0C[9:0] + 1)
> + * Ast2600:
> + * clock period = period of PCLK * 2 * (ADC0C[15:0] + 1)
>   */
>  
>  #include <linux/clk.h>
> @@ -77,6 +83,7 @@ struct aspeed_adc_data {
>  	struct regulator	*regulator;
>  	void __iomem		*base;
>  	spinlock_t		clk_lock;
> +	struct clk_hw		*fixed_div_clk;
>  	struct clk_hw		*clk_prescaler;
>  	struct clk_hw		*clk_scaler;
>  	struct reset_control	*rst;
> @@ -196,6 +203,13 @@ static void aspeed_adc_unregister_divider(void *data)
>  	clk_hw_unregister_divider(clk);
>  }
>  
> +static void aspeed_adc_unregister_fixed_divider(void *data)
> +{
> +	struct clk_hw *clk = data;
> +
> +	clk_hw_unregister_fixed_factor(clk);
> +}
> +
>  static void aspeed_adc_reset_assert(void *data)
>  {
>  	struct reset_control *rst = data;
> @@ -312,6 +326,18 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	/* Register ADC clock prescaler with source specified by device tree. */
>  	spin_lock_init(&data->clk_lock);
>  	snprintf(clk_parent_name, 32, of_clk_get_parent_name(pdev->dev.of_node, 0));
> +	snprintf(clk_name, 32, "%s-fixed-div", data->model_data->model_name);

ARRAY_SIZE

> +	data->fixed_div_clk = clk_hw_register_fixed_factor(
> +		&pdev->dev, clk_name, clk_parent_name, 0, 1, 2);
> +	if (IS_ERR(data->fixed_div_clk))
> +		return PTR_ERR(data->fixed_div_clk);
> +
> +	ret = devm_add_action_or_reset(data->dev,
> +				       aspeed_adc_unregister_fixed_divider,
> +				       data->clk_prescaler);
> +	if (ret)
> +		return ret;
> +	snprintf(clk_parent_name, 32, clk_name);
>  	if (data->model_data->need_prescaler) {
>  		snprintf(clk_name, 32, "%s-prescaler",
>  			 data->model_data->model_name);

