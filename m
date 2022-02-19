Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0184BC93C
	for <lists+linux-aspeed@lfdr.de>; Sat, 19 Feb 2022 16:53:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1ClV5n5mz3cDw
	for <lists+linux-aspeed@lfdr.de>; Sun, 20 Feb 2022 02:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NrQkJ89I;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NrQkJ89I; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1ClM1M1Dz2ymb
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Feb 2022 02:53:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 231FA60B14;
 Sat, 19 Feb 2022 15:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10FBC004E1;
 Sat, 19 Feb 2022 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645285995;
 bh=11WW/0CiWWZWGKAlkXmLRY9zQt6EZ/inhLlfKd2t1A4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NrQkJ89IEx40yyfAVF3VfET136xZuCzqYWcRFvS5ee2ja7Ft4X6napM2LZkJuwNBz
 MWrPpGQVMACJwNX7COvOz67F/vFv0MbXghjvG33HGxVKrMn6cZHJ3QdIt2lkaeoUmq
 uZj8JaNHbKDtXl9Ru43GMDMQ/LzR/MRIPQS0d5xh1viDi01JVO/YwSMw746uSYEFL7
 eFCyEvtSSiZakS7BIqO5lEHFCXGYY0MqIH/pvBDHZxmZM8TFopsizZwu7VKuvxQi1i
 4ghNAtBMLKwQIfnoFp+34PqnlScK51VwXPSsIfol3WS7fiGCJMGBnnGKVVUPvJTk+R
 vghP+RdHubACA==
Date: Sat, 19 Feb 2022 16:00:02 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH] iio: adc: aspeed: Add divider flag to fix incorrect
 voltage reading.
Message-ID: <20220219160002.46e301b8@jic23-huawei>
In-Reply-To: <20220218085708.8194-1-billy_tsai@aspeedtech.com>
References: <20220218085708.8194-1-billy_tsai@aspeedtech.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
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
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>, lars@metafoo.de,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, colin.king@canonical.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 18 Feb 2022 16:57:08 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The formula for the ADC sampling period in ast2400/ast2500 is:
> ADC clock period = PCLK * 2 * (ADC0C[31:17] + 1) * (ADC0C[9:0])
> When ADC0C[9:0] is set to 0 the sampling voltage will be lower than
> expected, because the hardware may not have enough time to
> charge/discharge to a stable voltage.
> 
> Reported-by: Konstantin Klubnichkin <kitsok@yandex-team.ru>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Hi Billy,

Fixes tag?

Also, would be good to call out in the patch description that
CLK_DIVIDER_ONE_BASED rules at 0 as a valid value and hence
avoids the ADC0C[9:0] value of 0 that is causing problems.

That may be obvious to people who make frequent use of clk dividers
but it's not locally obvious when looking at this patch.

Otherwise looks good to me.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/aspeed_adc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index a957cad1bfab..ffae64f39221 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -539,7 +539,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  	data->clk_scaler = devm_clk_hw_register_divider(
>  		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
>  		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
> -		data->model_data->scaler_bit_width, 0, &data->clk_lock);
> +		data->model_data->scaler_bit_width,
> +		data->model_data->need_prescaler ? CLK_DIVIDER_ONE_BASED : 0,
> +		&data->clk_lock);
>  	if (IS_ERR(data->clk_scaler))
>  		return PTR_ERR(data->clk_scaler);
>  

