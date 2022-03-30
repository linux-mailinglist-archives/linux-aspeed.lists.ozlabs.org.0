Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B134ECD86
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 21:49:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTH8B56nhz301v
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 06:49:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=UoJPVuBN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.249; helo=lelv0142.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=UoJPVuBN; 
 dkim-atps=neutral
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTH864bp2z2yhD
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 06:49:42 +1100 (AEDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UJnIgw086057;
 Wed, 30 Mar 2022 14:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648669758;
 bh=Wxy1IwTpIUIfVJGOAq2NOfEI+2cbw3VlSeZRH56rW8M=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=UoJPVuBNI8m/ixKDfQugawBpaOyrVQYZLFWOFD03gjpDJlBPH8cKwO37t+M19l5Yl
 Gmw6vNhEwLZqW4oe0dd9YnxdBahdOAzLBgLXZP/Xak8DUjosIBS0Nskfe3kmxhzSgx
 E7banJMetcx2zpdREZKEf30l5/Vzffhy9CIelmNE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UJnIw9062750
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Mar 2022 14:49:18 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 14:49:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 14:49:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UJnHrB010599;
 Wed, 30 Mar 2022 14:49:17 -0500
Date: Thu, 31 Mar 2022 01:19:16 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 11/11] mtd: spi-nor: aspeed: set the decoding size to
 at least 2MB for AST2600
Message-ID: <20220330194916.olffkctxjhfqksvf@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-12-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325100849.2019209-12-clg@kaod.org>
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Potin Lai <potin.lai@quantatw.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


> Subject: [PATCH v4 11/11] mtd: spi-nor: aspeed: set the decoding size to at least 2MB for AST2600

Nitpick: s/mtd: spi-nor: aspeed:/spi: aspeed:/

On 25/03/22 11:08AM, Cédric Le Goater wrote:
> From: Potin Lai <potin.lai@quantatw.com>
> 
> In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
> address offset is set to the acctual offset - 1MB. If the flash only has
> 1MB, the end address will has same value as start address, which will
> causing unexpected errors.
> 
> This patch set the decoding size to at least 2MB to avoid decoding errors.
> 
> Tested:
> root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
> [   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST2600 Decoding)
> [   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200000 ] 2MB
> root@bletchley:~# devmem 0x1e631030
> 0x00100000
> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> [ clg : Ported on new spi-mem driver ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 660451667a39..227797e13997 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -466,6 +466,8 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi,
>   *   is correct.
>   */
>  static const struct aspeed_spi_data ast2500_spi_data;
> +static const struct aspeed_spi_data ast2600_spi_data;
> +static const struct aspeed_spi_data ast2600_fmc_data;
>  
>  static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
>  					 u32 local_offset, u32 size)
> @@ -489,6 +491,17 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
>  			 chip->cs, size >> 20);
>  	}
>  
> +	/*
> +	 * The decoding size of AST2600 SPI controller should set at
> +	 * least 2MB.
> +	 */
> +	if ((aspi->data == &ast2600_spi_data || aspi->data == &ast2600_fmc_data) &&
> +	    size < SZ_2M) {
> +		size = SZ_2M;
> +		dev_info(aspi->dev, "CE%d window resized to %dMB (AST2600 Decoding)",
> +			 chip->cs, size >> 20);
> +	}
> +
>  	aspeed_spi_get_windows(aspi, windows);
>  
>  	/* Adjust this chip window */
> -- 
> 2.34.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
