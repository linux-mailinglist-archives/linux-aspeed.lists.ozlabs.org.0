Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75B401035
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Sep 2021 16:30:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2Ypq4wTXz2yHV
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Sep 2021 00:30:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2Ypn0lDnz2xgJ
 for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Sep 2021 00:30:24 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78F3F60F21;
 Sun,  5 Sep 2021 14:30:17 +0000 (UTC)
Date: Sun, 5 Sep 2021 15:33:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v5 04/15] iio: adc: aspeed: Keep model data to driver data.
Message-ID: <20210905153339.751732cc@jic23-huawei>
In-Reply-To: <20210831071458.2334-5-billy_tsai@aspeedtech.com>
References: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
 <20210831071458.2334-5-billy_tsai@aspeedtech.com>
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

On Tue, 31 Aug 2021 15:14:47 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Keep the model data pointer to driver data for reducing the usage of
> of_device_get_match_data().
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
This one starts to be impacted by the fix (as its in the context).
Rather than making a mess of things for linux-next etc I'll hold
off on these until that fix is upstream in a few weeks.

If I seem to have lost it (it's been known to happen :( ) then
feel free to poke me!

Thanks,

Jonathan
> ---
>  drivers/iio/adc/aspeed_adc.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index f055fe7b2c40..76ae1c3f584b 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -77,6 +77,7 @@ struct aspeed_adc_model_data {
>  
>  struct aspeed_adc_data {
>  	struct device		*dev;
> +	const struct aspeed_adc_model_data *model_data;
>  	void __iomem		*base;
>  	spinlock_t		clk_lock;
>  	struct clk_hw		*clk_prescaler;
> @@ -118,8 +119,6 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
>  			       int *val, int *val2, long mask)
>  {
>  	struct aspeed_adc_data *data = iio_priv(indio_dev);
> -	const struct aspeed_adc_model_data *model_data =
> -			of_device_get_match_data(data->dev);
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> @@ -127,7 +126,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
>  		return IIO_VAL_INT;
>  
>  	case IIO_CHAN_INFO_SCALE:
> -		*val = model_data->vref_voltage;
> +		*val = data->model_data->vref_voltage;
>  		*val2 = ASPEED_RESOLUTION_BITS;
>  		return IIO_VAL_FRACTIONAL_LOG2;
>  
> @@ -146,13 +145,11 @@ static int aspeed_adc_write_raw(struct iio_dev *indio_dev,
>  				int val, int val2, long mask)
>  {
>  	struct aspeed_adc_data *data = iio_priv(indio_dev);
> -	const struct aspeed_adc_model_data *model_data =
> -			of_device_get_match_data(data->dev);
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SAMP_FREQ:
> -		if (val < model_data->min_sampling_rate ||
> -			val > model_data->max_sampling_rate)
> +		if (val < data->model_data->min_sampling_rate ||
> +			val > data->model_data->max_sampling_rate)
>  			return -EINVAL;
>  
>  		clk_set_rate(data->clk_scaler->clk,
> @@ -198,7 +195,6 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  {
>  	struct iio_dev *indio_dev;
>  	struct aspeed_adc_data *data;
> -	const struct aspeed_adc_model_data *model_data;
>  	const char *clk_parent_name;
>  	int ret;
>  	u32 adc_engine_control_reg_val;
> @@ -209,6 +205,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  
>  	data = iio_priv(indio_dev);
>  	data->dev = &pdev->dev;
> +	data->model_data = of_device_get_match_data(&pdev->dev);
>  	platform_set_drvdata(pdev, indio_dev);
>  
>  	data->base = devm_platform_ioremap_resource(pdev, 0);
> @@ -249,9 +246,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	}
>  	reset_control_deassert(data->rst);
>  
> -	model_data = of_device_get_match_data(&pdev->dev);
> -
> -	if (model_data->wait_init_sequence) {
> +	if (data->model_data->wait_init_sequence) {
>  		/* Enable engine in normal mode. */
>  		writel(FIELD_PREP(ASPEED_ADC_OP_MODE,
>  				  ASPEED_ADC_OP_MODE_NORMAL) |
> @@ -281,8 +276,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	writel(adc_engine_control_reg_val,
>  	       data->base + ASPEED_REG_ENGINE_CONTROL);
>  
> -	model_data = of_device_get_match_data(&pdev->dev);
> -	indio_dev->name = model_data->model_name;
> +	indio_dev->name = data->model_data->model_name;
>  	indio_dev->info = &aspeed_adc_iio_info;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  	indio_dev->channels = aspeed_adc_iio_channels;

