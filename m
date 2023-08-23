Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34A785A44
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 16:20:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VWsAu4zc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW7fV00yvz3c5f
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Aug 2023 00:20:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VWsAu4zc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW7fK3tKJz3bvd;
	Thu, 24 Aug 2023 00:20:24 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ff8cf11b90so8925022e87.1;
        Wed, 23 Aug 2023 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692800417; x=1693405217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhfwjT4tlvrzpnKCjflm2Sl+ahwu3aFmaWxJvLIkO98=;
        b=VWsAu4zctYB4Hj/BaIyGIeHN/WvcmeJ/TP2QJwdpFBduBe0n2TqhZyfZtLBY5a19IU
         JJbacgfTX7UUbBIvmR5AM/98hrPGlJh5mNQjrhPJzkNuDJqRuLHpSXJpmGfSNMtSqoXQ
         tWNAHKYmpkPTfZuBWQsIMmFPP4gpVQm1jWNtcL/NCJ+KdhkAEV+3NHCXnyKFuQi4Jb9b
         G9PQEMPPEZeG9A/gduv2m7TC8UG4POhqqRy1ecmOu6wcIEUVChopMYhCWugbOa/IzEKL
         rHQs3bfRDGRKIHmpIdxO3aJ20/h0c2cNzM/nTl8hd/hBAfXmxyh5lYQcnAvvfcL8Hlle
         ZSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692800417; x=1693405217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhfwjT4tlvrzpnKCjflm2Sl+ahwu3aFmaWxJvLIkO98=;
        b=cTONqSNnFycfJ0g4HeD6jKqLS9DAgr+/xUUI2lbPyU9NetSRAgWlJaoBGW8svZEb93
         0H4oIfB9S+I9sTUbuVK3aQdDjj3wwKrUtVOJ3dZpdQ6AsIXdD2qaQZFQiutpj/xbMxcE
         2d76v/fZdFMzLCZJj/+7kbAEwBoKm1NQEF2Xz8IV1SFKm50NcR8bdRPTXOlopP/JAeAi
         sS3ftJ7erwBBKYO9RfFmaZa3t8cLGaSYY/OcC3MLCAmL0JxKqUWcAV05m35KxSmhdoN6
         1P7UC2f1vX2UtpbkXIEP3eFHNcZ+nEDyXbrmxlUNtHwp/n1k4AIkdMcY6jvxuDSQM09r
         TZaw==
X-Gm-Message-State: AOJu0YzL4E9XhK7jc6xW9u5U2e4W8apeEPKyFO6ixte6kJArYmpbmIH5
	4Ai+9OfQ9ShdNog/GCHPdfo=
X-Google-Smtp-Source: AGHT+IEGS4rOzzVhq/5nNxTOyLpTJO6FicNda11SZK9keATWBdGhEq2mwTZDRVciIV7jhQm6tMni+w==
X-Received: by 2002:a05:6512:312b:b0:4fd:c884:51fc with SMTP id p11-20020a056512312b00b004fdc88451fcmr8129845lfd.58.1692800416942;
        Wed, 23 Aug 2023 07:20:16 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id w15-20020ac254af000000b004f85d80ca64sm1551281lfk.221.2023.08.23.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:20:16 -0700 (PDT)
Date: Wed, 23 Aug 2023 17:20:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next v2 12/25] spi: dw-mmio: Use helper function
 devm_clk_get_*()
Message-ID: <pflv2canelmm3ea7zpqgxrzj3s7cl56crpdbupkgqlabfnasjj@dkfyiubao2gj>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
 <20230823133938.1359106-13-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823133938.1359106-13-lizetao1@huawei.com>
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
Cc: heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, yuenn@google.com, khilman@baylibre.com, tmaimon77@gmail.com, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, venture@google.com, linux-spi@vger.kernel.org, daire.mcnamara@microchip.com, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 23, 2023 at 09:39:25PM +0800, Li Zetao wrote:
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
> ---
> v1 -> v2: Return directly instead of calling reset_control_deassert()
> before the reset control handler has been requested. And use the
> "out_reset" label instead of "out" before calling pm_runtime_enable().

LGTM. Thanks!
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
>  drivers/spi/spi-dw-mmio.c | 31 +++++++++----------------------
>  1 file changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 805264c9c65c..46801189a651 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -340,29 +340,20 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
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
> -	if (IS_ERR(dwsmmio->pclk)) {
> -		ret = PTR_ERR(dwsmmio->pclk);
> -		goto out_clk;
> -	}
> -	ret = clk_prepare_enable(dwsmmio->pclk);
> -	if (ret)
> -		goto out_clk;
> +	dwsmmio->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(dwsmmio->pclk))
> +		return PTR_ERR(dwsmmio->pclk);
>  
>  	/* find an optional reset controller */
>  	dwsmmio->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, "spi");
> -	if (IS_ERR(dwsmmio->rstc)) {
> -		ret = PTR_ERR(dwsmmio->rstc);
> -		goto out_clk;
> -	}
> +	if (IS_ERR(dwsmmio->rstc))
> +		return PTR_ERR(dwsmmio->rstc);
> +
>  	reset_control_deassert(dwsmmio->rstc);
>  
>  	dws->bus_num = pdev->id;
> @@ -383,7 +374,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
>  	if (init_func) {
>  		ret = init_func(pdev, dwsmmio);
>  		if (ret)
> -			goto out;
> +			goto out_reset;
>  	}
>  
>  	pm_runtime_enable(&pdev->dev);
> @@ -397,9 +388,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
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
> @@ -411,8 +400,6 @@ static void dw_spi_mmio_remove(struct platform_device *pdev)
>  
>  	dw_spi_remove_host(&dwsmmio->dws);
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dwsmmio->pclk);
> -	clk_disable_unprepare(dwsmmio->clk);
>  	reset_control_assert(dwsmmio->rstc);
>  }
>  
> -- 
> 2.34.1
> 
