Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0A3FAC79
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Aug 2021 17:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyHB84nsrz2yJB
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 01:17:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyHB52pcmz2xr1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Aug 2021 01:17:17 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB906606A5;
 Sun, 29 Aug 2021 15:17:09 +0000 (UTC)
Date: Sun, 29 Aug 2021 16:20:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [RESEND v4 08/15] iio: adc: aspeed: Use model_data to set clk
 scaler.
Message-ID: <20210829162022.7ee18854@jic23-huawei>
In-Reply-To: <202108250006.17P06IgG097015@twspam01.aspeedtech.com>
References: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
 <202108250006.17P06IgG097015@twspam01.aspeedtech.com>
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

On Tue, 24 Aug 2021 17:12:36 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> This patch use need_prescaler and scaler_bit_width to set the adc clock
> scaler.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Hi Billy,

One minor comment inline.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/aspeed_adc.c | 39 +++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 2d6215a91f99..52db38be9699 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -202,9 +202,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  {
>  	struct iio_dev *indio_dev;
>  	struct aspeed_adc_data *data;
> -	const char *clk_parent_name;
>  	int ret;
>  	u32 adc_engine_control_reg_val;
> +	unsigned long scaler_flags = 0;
> +	char clk_name[32], clk_parent_name[32];
>  
>  	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
>  	if (!indio_dev)
> @@ -221,24 +222,28 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  
>  	/* Register ADC clock prescaler with source specified by device tree. */
>  	spin_lock_init(&data->clk_lock);
> -	clk_parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
> -
> -	data->clk_prescaler = clk_hw_register_divider(
> -				&pdev->dev, "prescaler", clk_parent_name, 0,
> -				data->base + ASPEED_REG_CLOCK_CONTROL,
> -				17, 15, 0, &data->clk_lock);
> -	if (IS_ERR(data->clk_prescaler))
> -		return PTR_ERR(data->clk_prescaler);
> -
> +	snprintf(clk_parent_name, 32, of_clk_get_parent_name(pdev->dev.of_node, 0));

ARRAY_SIZE(clk_parent_name) instead of 32.
Same for other places this pattern occurs.


> +	if (data->model_data->need_prescaler) {
> +		snprintf(clk_name, 32, "%s-prescaler",
> +			 data->model_data->model_name);
> +		data->clk_prescaler = clk_hw_register_divider(
> +			&pdev->dev, clk_name, clk_parent_name, 0,
> +			data->base + ASPEED_REG_CLOCK_CONTROL, 17, 15, 0,
> +			&data->clk_lock);
> +		if (IS_ERR(data->clk_prescaler))
> +			return PTR_ERR(data->clk_prescaler);
> +		snprintf(clk_parent_name, 32, clk_name);
> +		scaler_flags = CLK_SET_RATE_PARENT;
> +	}
>  	/*
>  	 * Register ADC clock scaler downstream from the prescaler. Allow rate
>  	 * setting to adjust the prescaler as well.
>  	 */
> +	snprintf(clk_name, 32, "%s-scaler", data->model_data->model_name);
>  	data->clk_scaler = clk_hw_register_divider(
> -				&pdev->dev, "scaler", "prescaler",
> -				CLK_SET_RATE_PARENT,
> -				data->base + ASPEED_REG_CLOCK_CONTROL,
> -				0, 10, 0, &data->clk_lock);
> +		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
> +		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
> +		data->model_data->scaler_bit_width, 0, &data->clk_lock);
>  	if (IS_ERR(data->clk_scaler)) {
>  		ret = PTR_ERR(data->clk_scaler);
>  		goto scaler_error;
> @@ -310,7 +315,8 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  reset_error:
>  	clk_hw_unregister_divider(data->clk_scaler);
>  scaler_error:
> -	clk_hw_unregister_divider(data->clk_prescaler);
> +	if (data->model_data->need_prescaler)
> +		clk_hw_unregister_divider(data->clk_prescaler);
>  	return ret;
>  }
>  
> @@ -325,7 +331,8 @@ static int aspeed_adc_remove(struct platform_device *pdev)
>  	clk_disable_unprepare(data->clk_scaler->clk);
>  	reset_control_assert(data->rst);
>  	clk_hw_unregister_divider(data->clk_scaler);
> -	clk_hw_unregister_divider(data->clk_prescaler);
> +	if (data->model_data->need_prescaler)
> +		clk_hw_unregister_divider(data->clk_prescaler);
>  
>  	return 0;
>  }

