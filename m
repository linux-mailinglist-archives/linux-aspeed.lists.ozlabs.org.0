Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5647784258
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 15:49:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r3O0lTrs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVW0g4kYVz3bwJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 23:49:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r3O0lTrs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVW0Y58PBz2xnK;
	Tue, 22 Aug 2023 23:49:01 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so30496081fa.1;
        Tue, 22 Aug 2023 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692712137; x=1693316937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VNjqlZSCnM+mXT6XhXZc25PujLvyxaAxxA/29D6t0s4=;
        b=r3O0lTrs/KF6oORMGhJW5zWh1M/62kCIBSY5Z6aAefdvq5klJwZfIsn1qaOMh+1Vj/
         GZQ0PGKIc2afwD1FYgzJitUuUEEtc1TYQAbEqMwWsV7ky+RwewBra9WlPN8+1ZGts7tG
         I5OHkCWg3b9yKseq2IMq3s0J+U6ZWHZq9NZlfYyvO9pwesPQV1SI1GK5WSVfhcGVyUmB
         R7pVhbxwCCSjahJmpLKdc5nkniYYw/QYLodxF6GscBzgvmk1racMwEDvLZuHeFphpT28
         VNknmCBjlYwcVryQX2bR05VtM3LiDKeYhz6nt51g3MTZ9kKexziuiO5fO+8VVmmwp00h
         sJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692712137; x=1693316937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNjqlZSCnM+mXT6XhXZc25PujLvyxaAxxA/29D6t0s4=;
        b=k5v8Qulwg63wfmaPUFPJ/dsnSOu941rOH6mhRjSNSYGzs4wTKb1hifuBzGmqG502Nv
         h6P3HuHlWsqSJVnbHgUCehl/rPwSLrMy1ZbN2rjPtRFgGeCpND/3CaOweTBbzHm+ZHLO
         eWayqMmN8VocxGCKV9lK1GT7Hgr6fBB3WWcT9M5N9UzoS6FDpJjOQN7tg9EAaP16fvkn
         DWHFHnuO52JVn3B0IbgAuUKs9kTyJW0bUSYFV/q0bYb/bxu/CZi9hRYWtBiCPi+AeOeS
         qQ1o8+E3K7WYPZlLDOB882nvqSYwiQWP2pDVeoIwYmB4EZ6xHsSJNlUFCTGPuP/Sp+ep
         FvoA==
X-Gm-Message-State: AOJu0YyQFWWwAhEYHP8IWq57LjNRVdrmrSuZsBMeMlrbyIsUvAQFAxfW
	5+HduscGMyEkHH/KfruDK2c=
X-Google-Smtp-Source: AGHT+IFihF3LNptCC53uVWoB/jzGuMUDG0z8kyH5P7DgnkKOe5f0uDFLvmrkswwLW8XSS39t+jRvkg==
X-Received: by 2002:a2e:8091:0:b0:2b9:55c9:c228 with SMTP id i17-20020a2e8091000000b002b955c9c228mr6800491ljg.27.1692712136740;
        Tue, 22 Aug 2023 06:48:56 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e8410000000b002b9cd2d0d39sm2740953ljg.28.2023.08.22.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 06:48:56 -0700 (PDT)
Date: Tue, 22 Aug 2023 16:48:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next 11/25] spi: dw-bt1: Use helper function
 devm_clk_get_enabled()
Message-ID: <i2bjbilyzg22xas2zpuumnsb4rolv2tkb4vhx2kyryizf2775b@764f3gk56ttn>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230822131237.1022815-12-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822131237.1022815-12-lizetao1@huawei.com>
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

On Tue, Aug 22, 2023 at 09:12:23PM +0800, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

LGTM. Thanks!
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
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
