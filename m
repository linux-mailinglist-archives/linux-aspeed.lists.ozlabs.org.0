Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5102D4BD572
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 06:45:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2B9L53thz3bcy
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 16:45:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RZY5wviD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RZY5wviD; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2B9B5tBnz2xsS
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Feb 2022 16:45:32 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id o5so29424181qvm.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Feb 2022 21:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7iWv0TIz5zfKcN40ggMRpAwMAzLJY7hcWbLoCDV8jBE=;
 b=RZY5wviDdsYmF6+0n46ur2sAoi5BDlJ652riNsbryFTtB2XRo3b4XN0FA4XmzJqwiV
 Zx8HNdM77a1FGgP9MTDh6hZZwcXdD0pfvaEx+IMv/kJSH5mYToWhl/LI5pv3Q17sgUI0
 Uwq+uJShduNM1Yl4kRfpaGGM1ZdxMdiTS6ALQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7iWv0TIz5zfKcN40ggMRpAwMAzLJY7hcWbLoCDV8jBE=;
 b=f6vassbzYspTy4fJeMi3PKdiPw0ah0XQyaBwA8A8nTX+7PQWcbdoPefLt5QPM1hLsN
 QjCI5lYHtYgMEREEofuBYIMajkELWOa7OucCnI9xpaUJCXyvsyDwskxFEKITXbNSA+81
 6EKJRNgCDM3bI2nD7athrFDCjTjLWfroxZDblE1/8kdIhnGJZEYdpsLlExmxQ9+NItuF
 7QldoLHz3H8a09rHUJ31riqb/qdxhXZi44C3e9VqeEKug9D9sGpXt/LQHvl+3TJvegSk
 Uq/USYoGwL/9Dyxr2+69ut+yaugE9I0vh86Fx5UIkftvuTqQMkcg4zn/+dwNdgQ9q/at
 3FhQ==
X-Gm-Message-State: AOAM5310ELsbCt0PyFecWdmhRiv1LYDy6w4BkMV5ZNCKBLfUp7UsO/Pr
 0AsF4/hMqnoeJfeQ2JIkG4e+yxmEDjz8RdXe1/M=
X-Google-Smtp-Source: ABdhPJwZ3cez5RRZ8JANQhauH1ZC98MKYhcjjQCwKLDq49sTcKbnNdbemiCR1mN2fgoBnk06bhQx9ruHolhircEkRbk=
X-Received: by 2002:a05:622a:1b8d:b0:2c6:59a9:360e with SMTP id
 bp13-20020a05622a1b8d00b002c659a9360emr16137525qtb.678.1645422328203; Sun, 20
 Feb 2022 21:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20220221012705.22008-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20220221012705.22008-1-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 05:45:16 +0000
Message-ID: <CACPK8XdsRorJvMjUMNYGAYNLGLzhYJEZSQMTk1ZywwY+SyqDbQ@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: aspeed: Add divider flag to fix incorrect
 voltage reading.
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 Lars-Peter Clausen <lars@metafoo.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Colin King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 21 Feb 2022 at 01:26, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> The formula for the ADC sampling period in ast2400/ast2500 is:
> ADC clock period = PCLK * 2 * (ADC0C[31:17] + 1) * (ADC0C[9:0])
> When ADC0C[9:0] is set to 0 the sampling voltage will be lower than
> expected, because the hardware may not have enough time to
> charge/discharge to a stable voltage. This patch use the flag
> CLK_DIVIDER_ONE_BASED which will use the raw value read from the
> register, with the value of zero considered invalid to conform to the
> corrected formula.

(to answer my own question)

..and this is okay on the 2600, because we do not set need_prescaler =
true on that platform.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Fixes: 573803234e72 ("iio: Aspeed ADC")
> Reported-by: Konstantin Klubnichkin <kitsok@yandex-team.ru>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/iio/adc/aspeed_adc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index a957cad1bfab..ffae64f39221 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -539,7 +539,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
>         data->clk_scaler = devm_clk_hw_register_divider(
>                 &pdev->dev, clk_name, clk_parent_name, scaler_flags,
>                 data->base + ASPEED_REG_CLOCK_CONTROL, 0,
> -               data->model_data->scaler_bit_width, 0, &data->clk_lock);
> +               data->model_data->scaler_bit_width,
> +               data->model_data->need_prescaler ? CLK_DIVIDER_ONE_BASED : 0,
> +               &data->clk_lock);
>         if (IS_ERR(data->clk_scaler))
>                 return PTR_ERR(data->clk_scaler);
>
> --
> 2.25.1
>
