Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851C784251
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 15:46:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XZskPA9E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVVxv1QKRz3byy
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 23:46:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XZskPA9E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVVxk4X3Cz2xps;
	Tue, 22 Aug 2023 23:46:32 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5007616b756so4140700e87.3;
        Tue, 22 Aug 2023 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692711986; x=1693316786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTGaJ7rfll5+TIoKtD8rQ17fpoQZKTBj+qXginUUSCc=;
        b=XZskPA9EraSErL3a6U3IDF3H2KOml/Nf3Q2jHk6HiWtI7gzyVa6JaQEQVBloRXdKJn
         BiG64jlHMWWgjO5hNPJlqTP0TzRDti00DmymO7S4098ZreW2DATJCrKzHC0chLRBEfoU
         EtYeAr/bkpT+PlhKzYFCM/ESb7aHC8yknuqialAurtctVPctAi0yNOfpfeOWrJPjgdqw
         p/3jQuN1FSFM6/a33fpCs0dwfs6lEE9n4OJWChFJ9X2R4NGGBfX+N5mVQXeeRbYnfaiM
         yAjO5NPNnx74hAhqpR5TLZfdbonNcJqgB5o6H6OFZ9EJV8/q2J9LQ96T90m+HAjTEG0g
         8fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692711986; x=1693316786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTGaJ7rfll5+TIoKtD8rQ17fpoQZKTBj+qXginUUSCc=;
        b=KwLVHUji6iSwx9tOaejWI0P/DEe4kmlL9SSep/mfwE21HYK+oxLjgM2KHbZ5j8GrS7
         9jiUsxIgx+rigIP6KtjRzTxEAYke+ridSNSvcYi+Hfwako/tNQHWgOT1tXWgsWlKyLyZ
         fgBl/dzvz8qjVN9tXM7Wa0+NDxTtW3KOHIeEKHA7lj7HK6oRkl6TAl1kjNzHTRvMG+21
         D/equ3JtwqZY6nHKARoeDnff5Xv9tKxRuqq/58KJV86htxjADWJz3xu0Pcv0opTMFsnI
         M42QAYr2zS2/RcVrOly0MuNuTySfoPqCBjOvUN+y/sXpDfepXdmGS0PWo5nvnhsgOOpn
         zSUQ==
X-Gm-Message-State: AOJu0Ywl1IKSxR3XUh/sxaXRo9d7x+PXM/RkLdsqvGtlkHX4KIWV7iFY
	1yGAyAJEKDC+JbsQpldx1A8=
X-Google-Smtp-Source: AGHT+IGZh43r6SDx8uUzyiBo7MHeEoyEfWUuOYkCXmiQnhEjEt46jydpFe6tldtmYn3HhlQHDRvF1w==
X-Received: by 2002:a19:651d:0:b0:4ff:8fdd:4be4 with SMTP id z29-20020a19651d000000b004ff8fdd4be4mr7038959lfb.29.1692711985687;
        Tue, 22 Aug 2023 06:46:25 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id o10-20020ac2434a000000b004fe1c9ce61bsm349066lfl.116.2023.08.22.06.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 06:46:25 -0700 (PDT)
Date: Tue, 22 Aug 2023 16:46:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next 12/25] spi: dw-mmio: Use helper function
 devm_clk_get_*()
Message-ID: <6x3xkim6wn3wfxuopis7w3sp2yz2ufjdvg6xqofloveesa3wtr@rbc2sazrr2gx>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230822131237.1022815-13-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822131237.1022815-13-lizetao1@huawei.com>
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, linux-rockchip@lists.infradead.org, khilman@baylibre.com, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, daire.mcnamara@microchip.com, venture@google.com, heiko@sntech.de, linux-spi@vger.kernel.org, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Li

On Tue, Aug 22, 2023 at 09:12:24PM +0800, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly. Also,
> devm_clk_get_optional() and clk_prepare_enable() can now be replaced by
> devm_clk_get_optional_enabled(). Moreover, the lable "out_clk" no longer
> makes sense, rename it to "out_reset".
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Several nitpicks below please since you are touching the code anyway.

> ---
>  drivers/spi/spi-dw-mmio.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 805264c9c65c..6d9f64ecbfd6 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -340,28 +340,22 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
>  	if (dws->irq < 0)
>  		return dws->irq; /* -ENXIO */
>  
> -	dwsmmio->clk = devm_clk_get(&pdev->dev, NULL);
> +	dwsmmio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(dwsmmio->clk))
>  		return PTR_ERR(dwsmmio->clk);
> -	ret = clk_prepare_enable(dwsmmio->clk);
> -	if (ret)
> -		return ret;
>  
>  	/* Optional clock needed to access the registers */
> -	dwsmmio->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> +	dwsmmio->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");

>  	if (IS_ERR(dwsmmio->pclk)) {
>  		ret = PTR_ERR(dwsmmio->pclk);
> -		goto out_clk;
> +		goto out_reset;
>  	}

Just return from here please. There is no point in calling
reset_control_deassert() on error because the reset control handler
hasn't been requested yet. So the argument will be NULL and considered
as optional reset-control.

> -	ret = clk_prepare_enable(dwsmmio->pclk);
> -	if (ret)
> -		goto out_clk;
>  
>  	/* find an optional reset controller */
>  	dwsmmio->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, "spi");

>  	if (IS_ERR(dwsmmio->rstc)) {
>  		ret = PTR_ERR(dwsmmio->rstc);
> -		goto out_clk;
> +		goto out_reset;
>  	}

ditto


Please use the "out_reset" label in the next part of the code:
	init_func = device_get_match_data(&pdev->dev);
	if (init_func) {
		ret = init_func(pdev, dwsmmio);
		if (ret)
-			goto out;
+			goto out_reset;
	}

I know this changes the cleanup-on-error path logic. But since you are
touching exactly that code anyway it would be good to have it properly
fixed.

>  	reset_control_deassert(dwsmmio->rstc);
>  
> @@ -397,9 +391,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
>  
>  out:
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dwsmmio->pclk);
> -out_clk:
> -	clk_disable_unprepare(dwsmmio->clk);
> +out_reset:
>  	reset_control_assert(dwsmmio->rstc);
>  
>  	return ret;
> @@ -411,8 +403,6 @@ static void dw_spi_mmio_remove(struct platform_device *pdev)
>  

>  	dw_spi_remove_host(&dwsmmio->dws);
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dwsmmio->pclk);
> -	clk_disable_unprepare(dwsmmio->clk);
>  	reset_control_assert(dwsmmio->rstc);

The order here isn't correct too. But I guess we can live with it.
It isn't that important.

-Serge(y)

>  }
>  
> -- 
> 2.34.1
> 
