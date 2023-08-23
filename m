Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15615785E5A
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 19:13:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCVT6XpCz3cHd
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Aug 2023 03:13:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWCVQ2gtyz3bYc;
	Thu, 24 Aug 2023 03:13:50 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RWCTW26MVz6HJh9;
	Thu, 24 Aug 2023 01:13:03 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 18:13:45 +0100
Date: Wed, 23 Aug 2023 18:13:44 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH -next v2 11/25] spi: dw-bt1: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230823181344.000026bd@Huawei.com>
In-Reply-To: <xxosi2ymo7otqyfbmjlubezzedqw6ulwwhdmbdjbto7yaqw673@q673weupq67y>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
	<20230823133938.1359106-1-lizetao1@huawei.com>
	<20230823133938.1359106-12-lizetao1@huawei.com>
	<xxosi2ymo7otqyfbmjlubezzedqw6ulwwhdmbdjbto7yaqw673@q673weupq67y>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
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
Cc: heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, Li Zetao <lizetao1@huawei.com>, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, yuenn@google.com, khilman@baylibre.com, tmaimon77@gmail.com, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, venture@google.com, linux-spi@vger.kernel.org, daire.mcnamara@microchip.com, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 23 Aug 2023 17:35:35 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Wed, Aug 23, 2023 at 09:39:24PM +0800, Li Zetao wrote:
> > Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> > and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> > replaced by devm_clk_get_enabled() when driver enables (and possibly
> > prepares) the clocks for the whole lifetime of the device. Moreover, it is
> > no longer necessary to unprepare and disable the clocks explicitly.
> >   
> 
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Acked-by: Serge Semin <fancer.lancer@gmail.com>
> > Signed-off-by: Li Zetao <lizetao1@huawei.com>  
> 
> Just for the record, the tags order is normally supposed to reflect a
> patch route. Even though AFAICS it's explicitly defined for the Sob
> tags only (see Documentation/process/submitting-patches.rst), but
> almost all kernel developers apply that rule to all the tags. See the
> kernel git log as the brightest example. So your Sob tag should have
> been kept first, then either my Ab or Jonathan' Rb tags.

There have been far too many discussions about this over the years.
There is an argument (I'm not saying I agree with it) that tags given
on an earlier version than the one posted should be before the SoB of
the author on basis that the SoB is occurring later (as it's on the new
version).  That is a slightly stronger argument if there are changes
to the patch, but then things get inconsistent between patches with minor
changes and those without. *sigh*

So this pattern is fairly common if a bit weird in my view :)

Jonathan

> 
> -Serge(y)
> 
> > ---
> > v1 -> v2: None
> > 
> >  drivers/spi/spi-dw-bt1.c | 23 +++++------------------
> >  1 file changed, 5 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
> > index 5e1c01822967..5391bcac305c 100644
> > --- a/drivers/spi/spi-dw-bt1.c
> > +++ b/drivers/spi/spi-dw-bt1.c
> > @@ -269,43 +269,32 @@ static int dw_spi_bt1_probe(struct platform_device *pdev)
> >  
> >  	dws->paddr = mem->start;
> >  
> > -	dwsbt1->clk = devm_clk_get(&pdev->dev, NULL);
> > +	dwsbt1->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> >  	if (IS_ERR(dwsbt1->clk))
> >  		return PTR_ERR(dwsbt1->clk);
> >  
> > -	ret = clk_prepare_enable(dwsbt1->clk);
> > -	if (ret)
> > -		return ret;
> > -
> >  	dws->bus_num = pdev->id;
> >  	dws->reg_io_width = 4;
> >  	dws->max_freq = clk_get_rate(dwsbt1->clk);
> > -	if (!dws->max_freq) {
> > -		ret = -EINVAL;
> > -		goto err_disable_clk;
> > -	}
> > +	if (!dws->max_freq)
> > +		return -EINVAL;
> >  
> >  	init_func = device_get_match_data(&pdev->dev);
> >  	ret = init_func(pdev, dwsbt1);
> >  	if (ret)
> > -		goto err_disable_clk;
> > +		return ret;
> >  
> >  	pm_runtime_enable(&pdev->dev);
> >  
> >  	ret = dw_spi_add_host(&pdev->dev, dws);
> >  	if (ret) {
> >  		pm_runtime_disable(&pdev->dev);
> > -		goto err_disable_clk;
> > +		return ret;
> >  	}
> >  
> >  	platform_set_drvdata(pdev, dwsbt1);
> >  
> >  	return 0;
> > -
> > -err_disable_clk:
> > -	clk_disable_unprepare(dwsbt1->clk);
> > -
> > -	return ret;
> >  }
> >  
> >  static void dw_spi_bt1_remove(struct platform_device *pdev)
> > @@ -315,8 +304,6 @@ static void dw_spi_bt1_remove(struct platform_device *pdev)
> >  	dw_spi_remove_host(&dwsbt1->dws);
> >  
> >  	pm_runtime_disable(&pdev->dev);
> > -
> > -	clk_disable_unprepare(dwsbt1->clk);
> >  }
> >  
> >  static const struct of_device_id dw_spi_bt1_of_match[] = {
> > -- 
> > 2.34.1
> >   

