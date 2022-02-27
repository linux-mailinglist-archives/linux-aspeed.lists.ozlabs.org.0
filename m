Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7304C5AB2
	for <lists+linux-aspeed@lfdr.de>; Sun, 27 Feb 2022 12:42:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K61pl3gVjz30hR
	for <lists+linux-aspeed@lfdr.de>; Sun, 27 Feb 2022 22:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nMMzAIUG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=jic23@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nMMzAIUG; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K61pc51Lyz2yQ9
 for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Feb 2022 22:42:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E03D4B80B4B;
 Sun, 27 Feb 2022 11:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC6BC340E9;
 Sun, 27 Feb 2022 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645962162;
 bh=2GZAa88jl8nwc/hfdhteF303XDxGjwubhEYfJOwbaqQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nMMzAIUGv35rsu8OipfLeJFxbKcKWV73XzPuf+i6arMdEuZmI7TKrmNekoDu4Hs44
 377pGHtab86XXGGKsN0QqpbkH+GFOwWrwqpS9jX0JLVWw95AUxOXDBDZRe7QGnBJhE
 t8kj9gNcjnJMu+HKIh43cYkWdcLSkZZe1AKgrO/0A4reL9QFXoGrGoYa91nr6IMPOt
 QNWw9HCaB0TvGIIiz9sV7wy3tK6tFw2knx/KvVgnkA2hA329lpTM5d4ZQ5KD7Kr8es
 IsTjOyRgjZqeHIjlfe0hIxoKhcijSpGAShcrAo97PIrKrJb12oM056MaO9pXqv5s7L
 fIyd5oiXRTLnA==
Date: Sun, 27 Feb 2022 11:49:44 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2] iio: adc: aspeed: Add divider flag to fix incorrect
 voltage reading.
Message-ID: <20220227114944.4706bea1@jic23-huawei>
In-Reply-To: <CACPK8XdsRorJvMjUMNYGAYNLGLzhYJEZSQMTk1ZywwY+SyqDbQ@mail.gmail.com>
References: <20220221012705.22008-1-billy_tsai@aspeedtech.com>
 <CACPK8XdsRorJvMjUMNYGAYNLGLzhYJEZSQMTk1ZywwY+SyqDbQ@mail.gmail.com>
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
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio@vger.kernel.org, Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 Colin King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 21 Feb 2022 05:45:16 +0000
Joel Stanley <joel@jms.id.au> wrote:

> On Mon, 21 Feb 2022 at 01:26, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> >
> > The formula for the ADC sampling period in ast2400/ast2500 is:
> > ADC clock period = PCLK * 2 * (ADC0C[31:17] + 1) * (ADC0C[9:0])
> > When ADC0C[9:0] is set to 0 the sampling voltage will be lower than
> > expected, because the hardware may not have enough time to
> > charge/discharge to a stable voltage. This patch use the flag
> > CLK_DIVIDER_ONE_BASED which will use the raw value read from the
> > register, with the value of zero considered invalid to conform to the
> > corrected formula.  
> 
> (to answer my own question)
> 
> ..and this is okay on the 2600, because we do not set need_prescaler =
> true on that platform.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to the fixes-togreg branch of iio.git.

Depending on how timing works out in the coming week I might just pull
all the fixes in for the next merge window rather than doing a separate
pull request.

Thanks,

Jonathan

> 
> >
> > Fixes: 573803234e72 ("iio: Aspeed ADC")
> > Reported-by: Konstantin Klubnichkin <kitsok@yandex-team.ru>
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---
> >  drivers/iio/adc/aspeed_adc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> > index a957cad1bfab..ffae64f39221 100644
> > --- a/drivers/iio/adc/aspeed_adc.c
> > +++ b/drivers/iio/adc/aspeed_adc.c
> > @@ -539,7 +539,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
> >         data->clk_scaler = devm_clk_hw_register_divider(
> >                 &pdev->dev, clk_name, clk_parent_name, scaler_flags,
> >                 data->base + ASPEED_REG_CLOCK_CONTROL, 0,
> > -               data->model_data->scaler_bit_width, 0, &data->clk_lock);
> > +               data->model_data->scaler_bit_width,
> > +               data->model_data->need_prescaler ? CLK_DIVIDER_ONE_BASED : 0,
> > +               &data->clk_lock);
> >         if (IS_ERR(data->clk_scaler))
> >                 return PTR_ERR(data->clk_scaler);
> >
> > --
> > 2.25.1
> >  

