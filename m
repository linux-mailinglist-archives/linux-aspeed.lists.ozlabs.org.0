Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B10628A1B
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Nov 2022 21:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB0lR1s4zz3cKn
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Nov 2022 07:09:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qgc1Yfx3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qgc1Yfx3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NB0lH3fXBz3cGm
	for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Nov 2022 07:09:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89B4061440;
	Mon, 14 Nov 2022 20:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22D7C433D6;
	Mon, 14 Nov 2022 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668456567;
	bh=CG12EQqGhqcddZAaKvzY1RjvyFLqLPjqbkdgD9qGLHA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qgc1Yfx34GODBMR1J+DE3O48+t5FVIF7aPoVwTCdw7qwAZcfvuiLxFClpFBw/7qQ2
	 0dOuh6wk0M445tCti6l8nlpPshPO5cJ5E+Bm0ltNcVAGLhF59SfjkkwGtnGZE/Q1r8
	 mIoTrBIoUfILyApIcP1Yd/TQj9cDl62ZnzfnQ+7TllYxjIs9ziTt3IlToeVX+TrhjC
	 z2dVVvmrbBhYpD7WNWQF2KzLwC8G7VXTNn9dsM3VRnpRqRThB6skpwby8/ED7x+eTO
	 wis9svFl+wKpK9wCn7e+GtMrr33i1CGfktSVoCYQOLJOTBUg0ozRdIVwitMqlq5xLp
	 0asyMBgGbpJEA==
Date: Mon, 14 Nov 2022 20:21:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v3 1/2] iio: adc: aspeed: Remove the trim valid dts property.
Message-ID: <20221114202143.6156b436@jic23-huawei>
In-Reply-To: <20221114025057.10843-1-billy_tsai@aspeedtech.com>
References: <20221114025057.10843-1-billy_tsai@aspeedtech.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, lars@metafoo.de, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 14 Nov 2022 10:50:56 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The dts property "aspeed,trim-data-valid" is currently used to determine
> whether to read trimming data from the OTP register. If this is set on
> a device without valid trimming data in the OTP the ADC will not function
> correctly. This patch drops the use of this property and instead uses the
> default (unprogrammed) OTP value of 0 to detect when a fallback value of
> 0x8 should be used rather then the value read from the OTP.
> 
> Fixes: d0a4c17b4073 ("iio: adc: aspeed: Get and set trimming data.")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Series applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/aspeed_adc.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 9341e0e0eb55..998e8bcc06e1 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -202,6 +202,8 @@ static int aspeed_adc_set_trim_data(struct iio_dev *indio_dev)
>  				((scu_otp) &
>  				 (data->model_data->trim_locate->field)) >>
>  				__ffs(data->model_data->trim_locate->field);
> +			if (!trimming_val)
> +				trimming_val = 0x8;
>  		}
>  		dev_dbg(data->dev,
>  			"trimming val = %d, offset = %08x, fields = %08x\n",
> @@ -563,12 +565,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	if (of_find_property(data->dev->of_node, "aspeed,trim-data-valid",
> -			     NULL)) {
> -		ret = aspeed_adc_set_trim_data(indio_dev);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = aspeed_adc_set_trim_data(indio_dev);
> +	if (ret)
> +		return ret;
>  
>  	if (of_find_property(data->dev->of_node, "aspeed,battery-sensing",
>  			     NULL)) {

