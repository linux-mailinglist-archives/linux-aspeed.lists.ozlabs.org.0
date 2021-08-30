Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E46993FB365
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 11:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gyls927ZNz2yLN
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 19:49:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gyls1360xz2xvH
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Aug 2021 19:49:09 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7F406103D;
 Mon, 30 Aug 2021 09:49:01 +0000 (UTC)
Date: Mon, 30 Aug 2021 10:52:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [RESEND v4 12/15] iio: adc: aspeed: Add func to set sampling rate.
Message-ID: <20210830105213.25ee20a2@jic23-huawei>
In-Reply-To: <FE947284-E67B-49DB-B538-3ECAD8317BD4@aspeedtech.com>
References: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
 <202108250003.17P03KRU092474@twspam01.aspeedtech.com>
 <20210829163659.2f7f5974@jic23-huawei>
 <FE947284-E67B-49DB-B538-3ECAD8317BD4@aspeedtech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 30 Aug 2021 08:35:53 +0000
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Hi Jonathan,
> 
> On 2021/8/29, 11:33 PM, "Jonathan Cameron" <jic23@kernel.org> wrote:
> 
>     On Tue, 24 Aug 2021 17:12:40 +0800
>     Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> 
>     >> Add the function to set the sampling rate and keep the sampling period
>     >> for a driver used to wait the lastest value.
>     >> 
>     >> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>  
> 
>     > Why move the code as well as factoring out the setter function?
>     > I doubt it does any harm, but I'd like to understand why you did it.  
> 
>     > Jonathan  
> 
>     >> +	ret = clk_prepare_enable(data->clk_scaler->clk);
>     >> +	if (ret)
>     >> +		return ret;
>     >> +
>     >> +	ret = devm_add_action_or_reset(data->dev,
>     >> +				       aspeed_adc_clk_disable_unprepare,
>     >> +				       data->clk_scaler->clk);
>     >> +	if (ret)
>     >> +		return ret;
>     >> +
>     >> +	ret = aspeed_adc_set_sampling_rate(indio_dev, ASPEED_ADC_DEF_SAMPLING_RATE);
>     >> +	if (ret)
>     >> +		return ret;
>     >> +
>     >>  	ret = aspeed_adc_vref_config(indio_dev);
>     >>  	if (ret)
>     >>  		return ret;
>     >> @@ -413,16 +445,6 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>     >>  	}
>     >>  
>     >>  	/* Start all channels in normal mode. */  
> 
>     > Why move this code up?  
> 
> Because the ADC clock is required when initializing the ADC device.
> In our system, the clock is always on. Thus, the legacy driver won't encounter any issues.
> I move the clk_prepare_enable ahead of initializing phase for making the driver probe logically closer to the hardware. 

Thanks. Please add something to the patch description to say this.

Jonathan

> 
>     >> -	ret = clk_prepare_enable(data->clk_scaler->clk);
>     >> -	if (ret)
>     >> -		return ret;
>     >> -
>     >> -	ret = devm_add_action_or_reset(data->dev,
>     >> -				       aspeed_adc_clk_disable_unprepare,
>     >> -				       data->clk_scaler->clk);
>     >> -	if (ret)
>     >> -		return ret;
>     >> -
>     >>  	adc_engine_control_reg_val =
>     >>  		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
>     >>  	adc_engine_control_reg_val |=  
> 
> 
> Best Regards,
> Billy Tsai
> 

