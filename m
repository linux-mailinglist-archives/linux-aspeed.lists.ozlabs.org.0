Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3167747F
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bJK61X1z3Wtr
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:32:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T2T2vnT1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T2T2vnT1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzhsH0qCYz3cDR;
	Sun, 22 Jan 2023 03:39:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5626360B47;
	Sat, 21 Jan 2023 16:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBD0C433D2;
	Sat, 21 Jan 2023 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674319150;
	bh=gT/5AvVpeDrgKjkh47OXtzrBPwHm9WVXPk88PeHkYdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T2T2vnT1Xs4tW5V/oTrCVF/YscJHiNq+7HTjvmQMO07kIVdALzUWUY/Lg7jgN8oeV
	 wDH/jrinV14zyuMq2EWtvqw0MJqCVYQkQmSM97I02rGKmkJT8mWnP+XySroZ4rplWG
	 RlAswjzAZLSIUe5xREEi1xk7mpGRJ+el+yXQps4AW3OLVqJhTAobryzkTKQ7IcmeFR
	 gz9n7eY4kKn03iiqGBkjRAI/u36bgFn5jBskRGSmm4cNBL/uaGM08TtLTQYXpHtqxx
	 meoZpovFIIHToxzFIsTk068dsFlMtc5YJ3ropDVVqr5LoNdkRAl4Bqac9L/I3U7BVM
	 lonUWh/lOpEIw==
Date: Sat, 21 Jan 2023 16:52:35 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v2 04/13] iio: imu: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <20230121165235.13da9db2@jic23-huawei>
In-Reply-To: <20230119185342.2093323-5-amit.kumar-mahapatra@amd.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
	<20230119185342.2093323-5-amit.kumar-mahapatra@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 23 Jan 2023 14:29:55 +1100
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
Cc: heiko@sntech.de, linus.walleij@linaro.org, dri-devel@lists.freedesktop.org, alim.akhtar@samsung.com, miquel.raynal@bootlin.com, sumit.semwal@linaro.org, stefan@datenfreihafen.org, tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org, khilman@baylibre.com, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, l.stelmach@samsung.com, sanju.mehta@amd.com, elder@kernel.org, sbranden@broadcom.com, gregkh@linuxfoundation.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc, skomatineni@nvidia.com, kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org, linux-wireless@vger.kernel.org, edumazet@google.com, thierry.reding@gmail.com, lars@metafoo.de, vireshk@kernel.org, jonathanh@nvidia.com, linux-rockchip@lists.infr
 adead.org, jbrunet@baylibre.com, linux-media@vger.kernel.org, andi@etezian.org, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com, jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, libertas-dev@lists.infradead.org, davem@davemloft.net, mcoquelin.stm32@gmail.com, pratyush@kernel.org, linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com, linux-iio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, masahisa.kojima@linaro.org, festevam@gmail.com, git@amd.com, f.fainelli@gmail.com, linux-staging@lists.linux.dev, jernej.skrabec@gmail.com, yuenn@google.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com, pabeni@redhat.com, amitrkcian2002@gmail.com, rjui@broadcom.com, john.garry@huawei.com, j.neuschaefer@gmx.net, rostedt@goodmis.org, broo
 nie@kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, ldewangan@nvidia.com, netdev@vger.kernel.org, shawnguo@kernel.org, christian.koenig@amd.com, alex.aring@gmail.com, vigneshr@ti.com, konrad.dybcio@somainline.org, alexandre.torgue@foss.st.com, bjorn.andersson@linaro.org, linux-riscv@lists.infradead.org, robert.jarzmik@free.fr, kdasu.kdev@gmail.com, richard@nod.at, agross@kernel.org, kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org, johan@kernel.org, rmfrfs@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, han.xu@nxp.com, venture@google.com, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, openbmc@lists.ozlabs.org, daniel@zonque.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 20 Jan 2023 00:23:33 +0530
Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com> wrote:

> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/imu/adis16400.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
> index c02fc35dceb4..3eda32e12a53 100644
> --- a/drivers/iio/imu/adis16400.c
> +++ b/drivers/iio/imu/adis16400.c
> @@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
>  
>  		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
>  			indio_dev->name, prod_id,
> -			st->adis.spi->chip_select, st->adis.spi->irq);
> +			spi_get_chipselect(st->adis.spi, 0), st->adis.spi->irq);
>  	}
>  	/* use high spi speed if possible */
>  	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {

