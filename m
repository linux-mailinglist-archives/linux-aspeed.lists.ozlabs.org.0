Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162A7846A8
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 18:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVZDK0nGdz3c26
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 02:14:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVZDF0HRsz3bgs;
	Wed, 23 Aug 2023 02:14:20 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RVZCN5qYyz6HJbJ;
	Wed, 23 Aug 2023 00:13:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 17:14:16 +0100
Date: Tue, 22 Aug 2023 17:14:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next 24/25] spi: spl022: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230822171414.00003a69@Huawei.com>
In-Reply-To: <20230822131237.1022815-25-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
	<20230822131237.1022815-25-lizetao1@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, linux-rockchip@lists.infradead.org, khilman@baylibre.com, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, daire.mcnamara@microchip.com, venture@google.com, heiko@sntech.de, fancer.lancer@gmail.com, linux-spi@vger.kernel.org, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 22 Aug 2023 21:12:36 +0800
Li Zetao <lizetao1@huawei.com> wrote:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly.
> Moreover, the label "err_no_clk_en" is no used, drop it for clean code.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
Hi.

There is some odd formatting in the existing file, but cleaning that up
should probably be a separate patch.

Thanks,

Jonathan

> ---
>  drivers/spi/spi-pl022.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
> index 1af75eff26b6..468a7fea9091 100644
> --- a/drivers/spi/spi-pl022.c
> +++ b/drivers/spi/spi-pl022.c
> @@ -2168,19 +2168,13 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
>  	dev_info(&adev->dev, "mapped registers from %pa to %p\n",
>  		&adev->res.start, pl022->virtbase);
>  
> -	pl022->clk = devm_clk_get(&adev->dev, NULL);
> +	pl022->clk = devm_clk_get_enabled(&adev->dev, NULL);
>  	if (IS_ERR(pl022->clk)) {
>  		status = PTR_ERR(pl022->clk);
>  		dev_err(&adev->dev, "could not retrieve SSP/SPI bus clock\n");
>  		goto err_no_clk;
>  	}
>  
> -	status = clk_prepare_enable(pl022->clk);
> -	if (status) {
> -		dev_err(&adev->dev, "could not enable SSP/SPI bus clock\n");
> -		goto err_no_clk_en;
> -	}
> -
>  	/* Initialize transfer pump */
>  	tasklet_init(&pl022->pump_transfers, pump_transfers,
>  		     (unsigned long)pl022);
> @@ -2236,16 +2230,14 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	return 0;
>  
> - err_spi_register:
> +err_spi_register:
>  	if (platform_info->enable_dma)
>  		pl022_dma_remove(pl022);
> - err_no_irq:
> -	clk_disable_unprepare(pl022->clk);
> - err_no_clk_en:
> - err_no_clk:
> - err_no_ioremap:
> +err_no_irq:
> +err_no_clk:
> +err_no_ioremap:
>  	amba_release_regions(adev);
> - err_no_ioregion:
> +err_no_ioregion:
>  	spi_master_put(master);
>  	return status;
>  }
> @@ -2268,7 +2260,6 @@ pl022_remove(struct amba_device *adev)
>  	if (pl022->master_info->enable_dma)
>  		pl022_dma_remove(pl022);
>  
> -	clk_disable_unprepare(pl022->clk);
>  	amba_release_regions(adev);
>  	tasklet_disable(&pl022->pump_transfers);
>  }

