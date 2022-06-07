Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DE53F9C5
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 11:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHQ6k5hpRz3bm6
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 19:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=Vpt6++21;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com; envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=Vpt6++21;
	dkim-atps=neutral
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHQ6c36Shz307F
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 19:29:26 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2579SvHT126954;
	Tue, 7 Jun 2022 04:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654594137;
	bh=Nyq1TKZIJGCjqSBfilV1ispV0YrXu83a8Dkd9vgWxVQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Vpt6++216SyMW8110zf+/0xnsrVnAN1wv/+pjnDzkKWxJzLYzazUaoyvO7NLf4nb9
	 PaJI2XU3SRsSeKDDPvl4u6wd+PIwbCHOHiTsywvksnD4HY8AZW7LGzBbex7Tdh01FQ
	 Ij9mbtl57BCvsfQvDvSfY086nI26vhfv/dIt1PpU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2579Svuq007627
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jun 2022 04:28:57 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 04:28:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 04:28:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2579Sufl051892;
	Tue, 7 Jun 2022 04:28:57 -0500
Date: Tue, 7 Jun 2022 14:58:56 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 02/14] mtd: spi-nor: aspeed-smc: Make
 aspeed_smc_unregister() return void
Message-ID: <20220607092856.jh7jj4snlobx2kae@ti.com>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
 <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Uwe,

On 03/06/22 11:07PM, Uwe Kleine-König wrote:
> The function returns zero unconditionally, so simplify to make it
> obvious there is no error to handle in the callers.
> 
> This is a preparation for making platform remove callbacks return void.

Cedric recently ported the driver to SPI MEM and it has now hit the 
linux-next tree [0]. This driver is planned to be removed. Can you 
please check if the new driver has this issue, and fix it there?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=9c63b846e6df43e5b3d31263f7db545f32deeda3

> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> index acfe010f9dd7..bd149104533a 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -399,7 +399,7 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
>  	return len;
>  }
>  
> -static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
> +static void aspeed_smc_unregister(struct aspeed_smc_controller *controller)
>  {
>  	struct aspeed_smc_chip *chip;
>  	int n;
> @@ -409,13 +409,13 @@ static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
>  		if (chip)
>  			mtd_device_unregister(&chip->nor.mtd);
>  	}
> -
> -	return 0;
>  }
>  
>  static int aspeed_smc_remove(struct platform_device *dev)
>  {
> -	return aspeed_smc_unregister(platform_get_drvdata(dev));
> +	aspeed_smc_unregister(platform_get_drvdata(dev));
> +
> +	return 0;
>  }
>  
>  static const struct of_device_id aspeed_smc_matches[] = {
> -- 
> 2.36.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
