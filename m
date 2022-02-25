Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F422E4C3F4B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Feb 2022 08:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4hlr0MwRz3bYq
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Feb 2022 18:50:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=H6LMFX+Q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=H6LMFX+Q; 
 dkim-atps=neutral
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4hlm1GY9z30Ld
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Feb 2022 18:50:42 +1100 (AEDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21P7oArn092127;
 Fri, 25 Feb 2022 01:50:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645775410;
 bh=EE1HknnGs341fweb74p5Qo4hBGv3hC8wo+SMvmEQFYk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=H6LMFX+QWdtSUd9VvRoMYXp26qbIWJ9Tggb5Zbkp7PLFAQKbI0xYk2cEzbkKNE651
 FLs/Vx3F5JAB5l+hTbumoFTuxAYP+T5CQ+rBxUiCsZbNcfpRkib5z9/AQK6mwJdEVG
 qz4KCVtYvxXIQDVkaL8TYT4lfSxkAFQE9h6xF8sk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21P7o9pQ032657
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Feb 2022 01:50:10 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 01:50:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 01:50:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21P7o7Ew043530;
 Fri, 25 Feb 2022 01:50:08 -0600
Date: Fri, 25 Feb 2022 13:20:07 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 03/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Message-ID: <20220225075007.73xypamm3zbjnkg6@ti.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220214094231.3753686-4-clg@kaod.org>
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
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 14/02/22 10:42AM, Cédric Le Goater wrote:
> This SPI driver adds support for the Aspeed static memory controllers
> of the AST2600, AST2500 and AST2400 SoCs using the spi-mem interface.
> 
>  * AST2600 Firmware SPI Memory Controller (FMC)
>    . BMC firmware
>    . 3 chip select pins (CE0 ~ CE2)
>    . Only supports SPI type flash memory
>    . different segment register interface
>    . single, dual and quad mode.
> 
>  * AST2600 SPI Flash Controller (SPI1 and SPI2)
>    . host firmware
>    . 2 chip select pins (CE0 ~ CE1)
>    . different segment register interface
>    . single, dual and quad mode.
> 
>  * AST2500 Firmware SPI Memory Controller (FMC)
>    . BMC firmware
>    . 3 chip select pins (CE0 ~ CE2)
>    . supports SPI type flash memory (CE0-CE1)
>    . CE2 can be of NOR type flash but this is not supported by the driver
>    . single, dual mode.
> 
>  * AST2500 SPI Flash Controller (SPI1 and SPI2)
>    . host firmware
>    . 2 chip select pins (CE0 ~ CE1)
>    . single, dual mode.
> 
>  * AST2400 New Static Memory Controller (also referred as FMC)
>    . BMC firmware
>    . New register set
>    . 5 chip select pins (CE0 ∼ CE4)
>    . supports NOR flash, NAND flash and SPI flash memory.
>    . single, dual and quad mode.
> 
> Each controller has a memory range on which flash devices contents are
> mapped. Each device is assigned a window that can be changed at bootime
> with the Segment Address Registers.
> 
> Each SPI flash device can then be accessed in two modes: Command and
> User. When in User mode, SPI transfers are initiated with accesses to
> the memory segment of a device. When in Command mode, memory
> operations on the memory segment of a device generate SPI commands
> automatically using a Control Register for the settings.
> 
> This initial patch adds support for User mode. Command mode needs a little
> more work to check that the memory window on the AHB bus fits the device
> size. It will come later when support for direct mapping is added.
> 
> Single and dual mode RX transfers are supported. Other types than SPI
> are not supported.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c            | 766 ++++++++++++++++++++++++
>  drivers/mtd/spi-nor/controllers/Kconfig |   2 +-
>  drivers/spi/Kconfig                     |  11 +
>  drivers/spi/Makefile                    |   1 +
>  4 files changed, 779 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/spi/spi-aspeed-smc.c
> 
[...]
> +
> +/* support for 1-1-1, 1-1-2 or 1-1-4 */
> +static bool aspeed_spi_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +	if (op->cmd.buswidth > 1)
> +		return false;
> +
> +	if (op->addr.nbytes != 0) {
> +		if (op->addr.buswidth > 1 || op->addr.nbytes > 4)
> +			return false;
> +	}
> +
> +	if (op->dummy.nbytes != 0) {
> +		if (op->dummy.buswidth > 1 || op->dummy.nbytes > 7)
> +			return false;
> +	}
> +
> +	if (op->data.nbytes != 0 && op->data.buswidth > 4)
> +		return false;
> +
> +	if (!spi_mem_default_supports_op(mem, op))
> +		return false;
> +
> +	return true;

Nitpick: You can just do return spi_mem_default_supports_op(mem, op);

> +}
> +
[...]
> +
> +static int aspeed_spi_init_devices(struct platform_device *pdev, struct aspeed_spi *aspi)
> +{
> +	struct device_node *np;
> +	unsigned int cs;
> +	int ret;
> +
> +	for_each_available_child_of_node(aspi->dev->of_node, np) {
> +		struct aspeed_spi_chip *chip;
> +
> +		if (!of_device_is_compatible(np, "jedec,spi-nor"))
> +			continue;
> +
> +		ret = of_property_read_u32(np, "reg", &cs);
> +		if (ret) {
> +			dev_err(aspi->dev, "Couldn't not read chip select.\n");
> +			of_node_put(np);
> +			return ret;
> +		}
> +
> +		if (cs > aspi->data->max_cs) {
> +			dev_err(aspi->dev, "Chip select %d out of range.\n", cs);
> +			of_node_put(np);
> +			return -ERANGE;
> +		}
> +
> +		chip = &aspi->chips[cs];
> +		chip->aspi = aspi;
> +		chip->cs = cs;
> +
> +		ret = aspeed_spi_chip_init(chip);
> +		if (ret) {
> +			of_node_put(np);
> +			return ret;
> +		}
> +
> +		if (of_property_read_u32(np, "spi-max-frequency", &chip->clk_freq))
> +			chip->clk_freq = ASPEED_SPI_DEFAULT_FREQ;
> +
> +		aspi->num_cs++;
> +	}

SPI MEM already gives you all this information. Get it from there, don't 
parse it yourself.

You can get Chip Select via spi_mem->spi->chip_select.
You can get clock frequency via spi_mem->spi->max_speed_hz.

With these comments fixed,

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> +
> +	return 0;
> +}
> +
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
