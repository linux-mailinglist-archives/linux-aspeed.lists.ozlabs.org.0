Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07D3D3D01
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 17:57:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWYq8681Sz30Dg
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Jul 2021 01:57:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.79.56;
 helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com;
 receiver=<UNKNOWN>)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWYq35Dtlz308f
 for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Jul 2021 01:57:01 +1000 (AEST)
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GWYYW0jbQz6H7lk;
 Fri, 23 Jul 2021 23:45:19 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 17:56:56 +0200
Received: from localhost (10.210.170.238) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Fri, 23 Jul
 2021 16:56:55 +0100
Date: Fri, 23 Jul 2021 16:56:29 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 8/8] iio: adc: aspeed: Support battery sensing.
Message-ID: <20210723165629.00005610@Huawei.com>
In-Reply-To: <20210723081621.29477-9-billy_tsai@aspeedtech.com>
References: <20210723081621.29477-1-billy_tsai@aspeedtech.com>
 <20210723081621.29477-9-billy_tsai@aspeedtech.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.170.238]
X-ClientProxiedBy: lhreml704-chm.china.huawei.com (10.201.108.53) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 lars@metafoo.de, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 robh+dt@kernel.org, pmeerw@pmeerw.net, jic23@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 23 Jul 2021 16:16:21 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> In ast2600, ADC integrate dividing circuit at last input channel for
> battery sensing. This patch use the dts property "battery-sensing" to
> enable this feature makes the last channel of each adc can tolerance

this feature allows the last channel of each ADC to tolerate a higher
voltage than the reference voltage.

> higher voltage than reference voltage.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
This looks fine otherwise, but one more general question inline.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/aspeed_adc.c | 60 +++++++++++++++++++++++++++++++++---
>  1 file changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 7e674b607e36..6c7e2bb7b1ac 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -45,6 +45,9 @@
>  #define ASPEED_ADC_REF_VOLTAGE_1200mV		FIELD_PREP(ASPEED_ADC_REF_VOLTAGE, 1)
>  #define ASPEED_ADC_REF_VOLTAGE_EXT_HIGH		FIELD_PREP(ASPEED_ADC_REF_VOLTAGE, 2)
>  #define ASPEED_ADC_REF_VOLTAGE_EXT_LOW		FIELD_PREP(ASPEED_ADC_REF_VOLTAGE, 3)
> +#define ASPEED_ADC_BATTERY_SENSING_DIV		BIT(6)
> +#define ASPEED_ADC_BATTERY_SENSING_DIV_2_3	FIELD_PREP(ASPEED_ADC_BATTERY_SENSING_DIV, 0)
> +#define ASPEED_ADC_BATTERY_SENSING_DIV_1_3	FIELD_PREP(ASPEED_ADC_BATTERY_SENSING_DIV, 1)
>  #define ASPEED_ADC_CTRL_INIT_RDY		BIT(8)
>  #define ASPEED_ADC_CH7_MODE			BIT(12)
>  #define ASPEED_ADC_CH7_NORMAL			FIELD_PREP(ASPEED_ADC_CH7_MODE, 0)
> @@ -76,6 +79,11 @@ struct aspeed_adc_model_data {
>  	unsigned int num_channels;
>  };
>  
> +struct adc_gain {
> +	u8 mult;
> +	u8 div;
> +};
> +
>  struct aspeed_adc_data {
>  	struct device		*dev;
>  	void __iomem		*base;
> @@ -87,6 +95,8 @@ struct aspeed_adc_data {
>  	int			vref;
>  	u32			sample_period_ns;
>  	int			cv;
> +	bool			battery_sensing;
> +	struct adc_gain		battery_mode_gain;
>  };
>  
>  #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
> @@ -185,14 +195,38 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
>  			       int *val, int *val2, long mask)
>  {
>  	struct aspeed_adc_data *data = iio_priv(indio_dev);
> +	u32 adc_engine_control_reg_val;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> -		*val = readw(data->base + chan->address) + data->cv;
> -		if (*val < 0)
> -			*val = 0;
> -		else if (*val >= ASPEED_ADC_MAX_RAW_DATA)
> -			*val = ASPEED_ADC_MAX_RAW_DATA;

Not related to this patch, but can the device support a per channel
reference selection? I.e. some channels use different internal references or
external references from others?

If so we should consider if it is necessary to expose that functionality
in the dt-binding.

> +		if (data->battery_sensing && chan->channel == 7) {
> +			adc_engine_control_reg_val =
> +				readl(data->base + ASPEED_REG_ENGINE_CONTROL);
> +			writel(adc_engine_control_reg_val |
> +				       ASPEED_ADC_CH7_BATTERY |
> +				       ASPEED_ADC_BATTERY_SENSING_ENABLE,
> +			       data->base + ASPEED_REG_ENGINE_CONTROL);
> +			/*
> +			 * After enable battery sensing mode need to wait some time for adc stable
> +			 * Experiment result is 1ms.
> +			 */
> +			mdelay(1);
> +			*val = readw(data->base + chan->address) + data->cv;
> +			if (*val < 0)
> +				*val = 0;
> +			else if (*val >= ASPEED_ADC_MAX_RAW_DATA)
> +				*val = ASPEED_ADC_MAX_RAW_DATA;
> +			*val = (*val * data->battery_mode_gain.mult) /
> +			       data->battery_mode_gain.div;
> +			writel(adc_engine_control_reg_val,
> +			       data->base + ASPEED_REG_ENGINE_CONTROL);
> +		} else {
> +			*val = readw(data->base + chan->address) + data->cv;
> +			if (*val < 0)
> +				*val = 0;
> +			else if (*val >= ASPEED_ADC_MAX_RAW_DATA)
> +				*val = ASPEED_ADC_MAX_RAW_DATA;
> +		}
>  		return IIO_VAL_INT;
>  
>  	case IIO_CHAN_INFO_SCALE:
> @@ -392,6 +426,22 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto vref_config_error;
>  
> +	if (of_find_property(data->dev->of_node, "battery-sensing", NULL)) {
> +		if (model_data->version >= aspeed_adc_ast2600) {
> +			data->battery_sensing = 1;
> +			if (readl(data->base + ASPEED_REG_ENGINE_CONTROL) &
> +			    ASPEED_ADC_BATTERY_SENSING_DIV_1_3) {
> +				data->battery_mode_gain.mult = 3;
> +				data->battery_mode_gain.div = 1;
> +			} else {
> +				data->battery_mode_gain.mult = 3;
> +				data->battery_mode_gain.div = 2;
> +			}
> +		} else
> +			dev_warn(&pdev->dev,
> +				 "Failed to enable battey-sensing mode\n");
> +	}
> +
>  	if (model_data->wait_init_sequence) {
>  		adc_engine_control_reg_val =
>  			readl(data->base + ASPEED_REG_ENGINE_CONTROL);

