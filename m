Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4263FAC62
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Aug 2021 17:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyGx03T85z2xsW
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 01:05:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyGwx5W10z2xX4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Aug 2021 01:05:53 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFDBB60F36;
 Sun, 29 Aug 2021 15:05:45 +0000 (UTC)
Date: Sun, 29 Aug 2021 16:08:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [RESEND v4 03/15] iio: adc: aspeed: set driver data when adc
 probe.
Message-ID: <20210829160856.12dd9395@jic23-huawei>
In-Reply-To: <20210824091243.9393-4-billy_tsai@aspeedtech.com>
References: <20210824091243.9393-1-billy_tsai@aspeedtech.com>
 <20210824091243.9393-4-billy_tsai@aspeedtech.com>
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

On Tue, 24 Aug 2021 17:12:31 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Fix the issue when adc remove will get the null driver data.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is a fix that we should probably backport.  Please add a fixes tag and move
it to the start of the series so I can pick it during this kernel
cycle rather than waiting for the next one.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/aspeed_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 7010d56ac3b9..20462cf659e4 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -201,6 +201,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>  
>  	data = iio_priv(indio_dev);
>  	data->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, indio_dev);
>  
>  	data->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(data->base))

