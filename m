Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB60785ACA
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 16:35:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RVzW2IYk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW8096Ll4z3c43
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Aug 2023 00:35:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RVzW2IYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW8006nBlz3c2f;
	Thu, 24 Aug 2023 00:35:44 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50078eba7afso5994548e87.0;
        Wed, 23 Aug 2023 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692801340; x=1693406140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k2TgiqCmPSnILANt5GZ18rswgB/K69rSR8VLR5YONDs=;
        b=RVzW2IYkj05E1QurcVWCK8Xr7hoWpAOpq6CNlM5mHjUNjLSfNyKWHfrrFTfD9jQ3sy
         eDWbgQ442RcyjicydLE6/q60tWpJdy6owEAJS82xvbIcbBMG5mL58fFkQ2ll1I6CDNZk
         sy57Jl1xt9HL9jEtz8CEZQj7WMl/hyN2A+zsuaCdZqYXcjp81CxeZbRcdAYxDsGZ/QXS
         kSenj8ixe68J2WE8rMsSlvpz33p80M3zhzSMOE/X5uDBSnWHA9seXSpGOUV4gvZnTFxZ
         Yv0Aegrg6xvVhrq6m+Gl4RABhOtV9dWhz9ongXNlT9GqtGbxTGyhdc9vo0S9nFxBcNYJ
         nYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801340; x=1693406140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2TgiqCmPSnILANt5GZ18rswgB/K69rSR8VLR5YONDs=;
        b=S0n3r4hIvcwIrnjcoZ8snXV+jG73Owv+MtyR5eEusoYTK4UTUX4pjV1YoD0udYAdob
         LZbMxacVOqlKpk7g4v/pEnEPh1RdY/iMcnVc+IQXRozBliBBut+jw4nHykdtD1SBH170
         i9F7ImXBF2msfYzdEcubA9mmenySBiz+m7eDJ1xVnksw89P4mAnGCF0nEDmhWwpe5Dw+
         JlbW32mCQ9bV4vMoVH1zpo64jN9I7RByEzFJ0sEI9BLtvnOXTzix/NkDG6Lr1SxVNfWN
         s+9XKQfHJyKJwKRLj6bKicbTIfk6kDmVJpp1TH1wIZugQFpHktBMq0KKVhFFjCAuKyX7
         8vzg==
X-Gm-Message-State: AOJu0Yycm6ajiida8Y0WNMaeZ7jjoKy6q/qHi5QZ4srrX6My+CkNEIME
	4GC9yNiVXc61Ip6VpOvKUTs=
X-Google-Smtp-Source: AGHT+IFj+DCY0sY2R0WBzy7d65Q9hoRnlsbk7tAiZi/tGbFHUyZQZNNjWy+pVOAk7a3V21jYp3uHGg==
X-Received: by 2002:ac2:5f6a:0:b0:4fd:d517:fbd8 with SMTP id c10-20020ac25f6a000000b004fdd517fbd8mr8210729lfc.9.1692801340064;
        Wed, 23 Aug 2023 07:35:40 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id d11-20020ac244cb000000b005009b4d5c14sm59710lfm.265.2023.08.23.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:35:39 -0700 (PDT)
Date: Wed, 23 Aug 2023 17:35:35 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next v2 11/25] spi: dw-bt1: Use helper function
 devm_clk_get_enabled()
Message-ID: <xxosi2ymo7otqyfbmjlubezzedqw6ulwwhdmbdjbto7yaqw673@q673weupq67y>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
 <20230823133938.1359106-12-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823133938.1359106-12-lizetao1@huawei.com>
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
Cc: heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, yuenn@google.com, khilman@baylibre.com, tmaimon77@gmail.com, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, venture@google.com, linux-spi@vger.kernel.org, daire.mcnamara@microchip.com, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 23, 2023 at 09:39:24PM +0800, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly.
> 

> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Just for the record, the tags order is normally supposed to reflect a
patch route. Even though AFAICS it's explicitly defined for the Sob
tags only (see Documentation/process/submitting-patches.rst), but
almost all kernel developers apply that rule to all the tags. See the
kernel git log as the brightest example. So your Sob tag should have
been kept first, then either my Ab or Jonathan' Rb tags.

-Serge(y)

> ---
> v1 -> v2: None
> 
>  drivers/spi/spi-dw-bt1.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
> index 5e1c01822967..5391bcac305c 100644
> --- a/drivers/spi/spi-dw-bt1.c
> +++ b/drivers/spi/spi-dw-bt1.c
> @@ -269,43 +269,32 @@ static int dw_spi_bt1_probe(struct platform_device *pdev)
>  
>  	dws->paddr = mem->start;
>  
> -	dwsbt1->clk = devm_clk_get(&pdev->dev, NULL);
> +	dwsbt1->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(dwsbt1->clk))
>  		return PTR_ERR(dwsbt1->clk);
>  
> -	ret = clk_prepare_enable(dwsbt1->clk);
> -	if (ret)
> -		return ret;
> -
>  	dws->bus_num = pdev->id;
>  	dws->reg_io_width = 4;
>  	dws->max_freq = clk_get_rate(dwsbt1->clk);
> -	if (!dws->max_freq) {
> -		ret = -EINVAL;
> -		goto err_disable_clk;
> -	}
> +	if (!dws->max_freq)
> +		return -EINVAL;
>  
>  	init_func = device_get_match_data(&pdev->dev);
>  	ret = init_func(pdev, dwsbt1);
>  	if (ret)
> -		goto err_disable_clk;
> +		return ret;
>  
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = dw_spi_add_host(&pdev->dev, dws);
>  	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
> -		goto err_disable_clk;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, dwsbt1);
>  
>  	return 0;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(dwsbt1->clk);
> -
> -	return ret;
>  }
>  
>  static void dw_spi_bt1_remove(struct platform_device *pdev)
> @@ -315,8 +304,6 @@ static void dw_spi_bt1_remove(struct platform_device *pdev)
>  	dw_spi_remove_host(&dwsbt1->dws);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	clk_disable_unprepare(dwsbt1->clk);
>  }
>  
>  static const struct of_device_id dw_spi_bt1_of_match[] = {
> -- 
> 2.34.1
> 
