Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DACF3FACA2
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Aug 2021 17:34:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyHYJ0h6Rz2yJB
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 01:33:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyHYD4qtPz2xr6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Aug 2021 01:33:52 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2557760F3A;
 Sun, 29 Aug 2021 15:33:44 +0000 (UTC)
Date: Sun, 29 Aug 2021 16:36:59 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [RESEND v4 12/15] iio: adc: aspeed: Add func to set sampling rate.
Message-ID: <20210829163659.2f7f5974@jic23-huawei>
In-Reply-To: <202108250003.17P03KRU092474@twspam01.aspeedtech.com>
References: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
 <202108250003.17P03KRU092474@twspam01.aspeedtech.com>
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

On Tue, 24 Aug 2021 17:12:40 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Add the function to set the sampling rate and keep the sampling period
> for a driver used to wait the lastest value.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Why move the code as well as factoring out the setter function?
I doubt it does any harm, but I'd like to understand why you did it.

Jonathan


> ---
>  drivers/iio/adc/aspeed_adc.c | 58 +++++++++++++++++++++++++-----------
>  1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 8fe7da1a651f..4d979dd7fe88 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -65,6 +65,12 @@
>  
>  #define ASPEED_ADC_INIT_POLLING_TIME	500
>  #define ASPEED_ADC_INIT_TIMEOUT		500000
> +/*
> + * When the sampling rate is too high, the ADC may not have enough charging
> + * time, resulting in a low voltage value. Thus, default use slow sampling
> + * rate for most user case.
> + */
> +#define ASPEED_ADC_DEF_SAMPLING_RATE	65000
>  
>  struct aspeed_adc_model_data {
>  	const char *model_name;
> @@ -88,6 +94,7 @@ struct aspeed_adc_data {
>  	struct clk_hw		*clk_scaler;
>  	struct reset_control	*rst;
>  	int			vref;
> +	u32			sample_period_ns;
>  };
>  
>  #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
> @@ -119,6 +126,24 @@ static const struct iio_chan_spec aspeed_adc_iio_channels[] = {
>  	ASPEED_CHAN(15, 0x2E),
>  };
>  
> +static int aspeed_adc_set_sampling_rate(struct iio_dev *indio_dev, u32 rate)
> +{
> +	struct aspeed_adc_data *data = iio_priv(indio_dev);
> +
> +	if (rate < data->model_data->min_sampling_rate ||
> +	    rate > data->model_data->max_sampling_rate)
> +		return -EINVAL;
> +	/* Each sampling needs 12 clocks to covert.*/

convert.  Please run a spell checker over these patches.

> +	clk_set_rate(data->clk_scaler->clk, rate * ASPEED_CLOCKS_PER_SAMPLE);
> +	rate = clk_get_rate(data->clk_scaler->clk);
> +	data->sample_period_ns = DIV_ROUND_UP_ULL(
> +		(u64)NSEC_PER_SEC * ASPEED_CLOCKS_PER_SAMPLE, rate);
> +	dev_dbg(data->dev, "Adc clock = %d sample period = %d ns", rate,
> +		data->sample_period_ns);
> +
> +	return 0;
> +}
> +
>  static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
>  			       struct iio_chan_spec const *chan,
>  			       int *val, int *val2, long mask)
> @@ -149,17 +174,10 @@ static int aspeed_adc_write_raw(struct iio_dev *indio_dev,
>  				struct iio_chan_spec const *chan,
>  				int val, int val2, long mask)
>  {
> -	struct aspeed_adc_data *data = iio_priv(indio_dev);
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SAMP_FREQ:
> -		if (val < data->model_data->min_sampling_rate ||
> -			val > data->model_data->max_sampling_rate)
> -			return -EINVAL;
> -
> -		clk_set_rate(data->clk_scaler->clk,
> -				val * ASPEED_CLOCKS_PER_SAMPLE);
> -		return 0;
> +		return aspeed_adc_set_sampling_rate(indio_dev, val);
>  
>  	case IIO_CHAN_INFO_SCALE:
>  	case IIO_CHAN_INFO_RAW:
> @@ -386,6 +404,20 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = clk_prepare_enable(data->clk_scaler->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(data->dev,
> +				       aspeed_adc_clk_disable_unprepare,
> +				       data->clk_scaler->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = aspeed_adc_set_sampling_rate(indio_dev, ASPEED_ADC_DEF_SAMPLING_RATE);
> +	if (ret)
> +		return ret;
> +
>  	ret = aspeed_adc_vref_config(indio_dev);
>  	if (ret)
>  		return ret;
> @@ -413,16 +445,6 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Start all channels in normal mode. */

Why move this code up?

> -	ret = clk_prepare_enable(data->clk_scaler->clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(data->dev,
> -				       aspeed_adc_clk_disable_unprepare,
> -				       data->clk_scaler->clk);
> -	if (ret)
> -		return ret;
> -
>  	adc_engine_control_reg_val =
>  		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
>  	adc_engine_control_reg_val |=

