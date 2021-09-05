Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CD40103D
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Sep 2021 16:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2Yv44v85z2yHq
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Sep 2021 00:34:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2Yv16bx8z2xrD
 for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Sep 2021 00:34:05 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A0ED60E8B;
 Sun,  5 Sep 2021 14:33:57 +0000 (UTC)
Date: Sun, 5 Sep 2021 15:37:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v5 05/15] iio: adc: aspeed: Refactory model data structure
Message-ID: <20210905153720.178e9ff2@jic23-huawei>
In-Reply-To: <20210831071458.2334-6-billy_tsai@aspeedtech.com>
References: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
 <20210831071458.2334-6-billy_tsai@aspeedtech.com>
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

On Tue, 31 Aug 2021 15:14:48 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

Title.  Refactor (refactory isn't a word as far as I know though it perhaps should
be ;)

If you are rerolling the latter part of this series, merge patch 7 down into this one.
If not, it's fine as it stands.  That one is trivial and a direct result of this one.

Jonathan


> This patch refactors the model data structure to distinguish the
> function form different versions of aspeed ADC.
> - Rename the vref_voltage to vref_fixed_mv and add vref_mv driver data
> When driver probe will check vref_fixed_mv value and store it to vref_mv
> which isn't const value.
> - Add num_channels
> Make num_channles of iio device can be changed by different model_data
> - Add need_prescaler flag and scaler_bit_width
> The need_prescaler flag is used to tell the driver the clock divider needs
> another Prescaler and the scaler_bit_width to set the clock divider
> bitfield width.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/iio/adc/aspeed_adc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 76ae1c3f584b..6ce2f676c54a 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -71,8 +71,11 @@ struct aspeed_adc_model_data {
>  	const char *model_name;
>  	unsigned int min_sampling_rate;	// Hz
>  	unsigned int max_sampling_rate;	// Hz
> -	unsigned int vref_voltage;	// mV
> +	unsigned int vref_fixed_mv;
>  	bool wait_init_sequence;
> +	bool need_prescaler;
> +	u8 scaler_bit_width;
> +	unsigned int num_channels;
>  };
>  
>  struct aspeed_adc_data {
> @@ -83,6 +86,7 @@ struct aspeed_adc_data {
>  	struct clk_hw		*clk_prescaler;
>  	struct clk_hw		*clk_scaler;
>  	struct reset_control	*rst;
> +	int			vref_mv;
>  };
>  
>  #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
> @@ -126,7 +130,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
>  		return IIO_VAL_INT;
>  
>  	case IIO_CHAN_INFO_SCALE:
> -		*val = data->model_data->vref_voltage;
> +		*val = data->model_data->vref_fixed_mv;
>  		*val2 = ASPEED_RESOLUTION_BITS;
>  		return IIO_VAL_FRACTIONAL_LOG2;
>  
> @@ -320,17 +324,23 @@ static int aspeed_adc_remove(struct platform_device *pdev)
>  
>  static const struct aspeed_adc_model_data ast2400_model_data = {
>  	.model_name = "ast2400-adc",
> -	.vref_voltage = 2500, // mV
> +	.vref_fixed_mv = 2500,
>  	.min_sampling_rate = 10000,
>  	.max_sampling_rate = 500000,
> +	.need_prescaler = true,
> +	.scaler_bit_width = 10,
> +	.num_channels = 16,
>  };
>  
>  static const struct aspeed_adc_model_data ast2500_model_data = {
>  	.model_name = "ast2500-adc",
> -	.vref_voltage = 1800, // mV
> +	.vref_fixed_mv = 1800,
>  	.min_sampling_rate = 1,
>  	.max_sampling_rate = 1000000,
>  	.wait_init_sequence = true,
> +	.need_prescaler = true,
> +	.scaler_bit_width = 10,
> +	.num_channels = 16,
>  };
>  
>  static const struct of_device_id aspeed_adc_matches[] = {

