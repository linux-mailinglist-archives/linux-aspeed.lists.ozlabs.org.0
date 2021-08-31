Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB73FC38A
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Aug 2021 09:51:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzKCH73K7z2yJl
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Aug 2021 17:51:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzKCD3nKRz2yHR
 for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Aug 2021 17:51:51 +1000 (AEST)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mKyYK-0005uf-BA; Tue, 31 Aug 2021 09:51:28 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mKyYF-0002yy-JK; Tue, 31 Aug 2021 09:51:23 +0200
Message-ID: <4bc2bf196efd540933e6a781a44af20142e3d5d3.camel@pengutronix.de>
Subject: Re: [v5 09/15] iio: adc: aspeed: Use devm_add_action_or_reset.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Billy Tsai <billy_tsai@aspeedtech.com>, jic23@kernel.org,
 lars@metafoo.de,  pmeerw@pmeerw.net, robh+dt@kernel.org, joel@jms.id.au,
 andrew@aj.id.au,  lgirdwood@gmail.com, broonie@kernel.org,
 linux-iio@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Tue, 31 Aug 2021 09:51:23 +0200
In-Reply-To: <20210831071458.2334-10-billy_tsai@aspeedtech.com>
References: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
 <20210831071458.2334-10-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Tue, 2021-08-31 at 15:14 +0800, Billy Tsai wrote:
> This patch use devm_add_action_or_reset to handle the error in probe
> phase.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/iio/adc/aspeed_adc.c | 112 +++++++++++++++++++++--------------
>  1 file changed, 66 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index e53d1541ad1d..af00d9752c1e 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
[...]
> @@ -242,6 +271,11 @@ static int aspeed_adc_probe(struct platform_device *=
pdev)
>  			&data->clk_lock);
>  		if (IS_ERR(data->clk_prescaler))
>  			return PTR_ERR(data->clk_prescaler);
> +		ret =3D devm_add_action_or_reset(data->dev,
> +					       aspeed_adc_unregister_divider,
> +					       data->clk_prescaler);
> +		if (ret)
> +			return ret;

I think here you could switch to devm_clk_hw_register_divider() instead.


>  		snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name),
>  			 clk_name);
>  		scaler_flags =3D CLK_SET_RATE_PARENT;
> @@ -256,23 +290,30 @@ static int aspeed_adc_probe(struct platform_device =
*pdev)
>  		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
>  		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
>  		data->model_data->scaler_bit_width, 0, &data->clk_lock);
> -	if (IS_ERR(data->clk_scaler)) {
> -		ret =3D PTR_ERR(data->clk_scaler);
> -		goto scaler_error;
> -	}
> +	if (IS_ERR(data->clk_scaler))
> +		return PTR_ERR(data->clk_scaler);
> +
> +	ret =3D devm_add_action_or_reset(data->dev, aspeed_adc_unregister_divid=
er,
> +				       data->clk_scaler);
> +	if (ret)
> +		return ret;

Same as above.

[...]
> @@ -281,6 +322,10 @@ static int aspeed_adc_probe(struct platform_device *=
pdev)
>  			       ASPEED_ADC_ENGINE_ENABLE,
>  		       data->base + ASPEED_REG_ENGINE_CONTROL);
> =20
> +		ret =3D devm_add_action_or_reset(data->dev, aspeed_adc_power_down,
> +					       data);
> +		if (ret)
> +			return ret;
>  		/* Wait for initial sequence complete. */
>  		ret =3D readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
>  					 adc_engine_control_reg_val,
[...]
> @@ -303,6 +354,11 @@ static int aspeed_adc_probe(struct platform_device *=
pdev)
>  		ASPEED_ADC_ENGINE_ENABLE;
>  	writel(adc_engine_control_reg_val,
>  	       data->base + ASPEED_REG_ENGINE_CONTROL);
> +	ret =3D devm_add_action_or_reset(data->dev,
> +				       aspeed_adc_power_down,
> +				       data);
> +	if (ret)
> +		return ret;

Should this be if (!model_dta->wait_init_sequence) ? Otherwise it looks
like you've already registered the same aspeed_adc_power_down action
above.

regards
Philipp
