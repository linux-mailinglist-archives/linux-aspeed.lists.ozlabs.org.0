Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3FDE12F
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 01:30:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xGGw4qdNzDqR6
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 10:30:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=collabora.com
 (client-ip=46.235.227.227; helo=bhuna.collabora.co.uk;
 envelope-from=boris.brezillon@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pj4W1BL1zDq9m
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 18:14:03 +1100 (AEDT)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 979B1290767;
 Thu, 10 Oct 2019 08:13:59 +0100 (BST)
Date: Thu, 10 Oct 2019 09:13:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 05/22] mtd: spi-nor: Rework read_sr()
Message-ID: <20191010091356.5d9a4e44@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190924074533.6618-6-tudor.ambarus@microchip.com>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
 <20190924074533.6618-6-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 21 Oct 2019 10:30:06 +1100
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
Cc: linux-arm-kernel@lists.infradead.org, vigneshr@ti.com,
 geert+renesas@glider.be, richard@nod.at, linux-kernel@vger.kernel.org,
 vz@mleia.com, marek.vasut@gmail.com, jonas@norrbonn.se,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 24 Sep 2019 07:46:08 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> static int read_sr(struct spi_nor *nor)
> becomes
> static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> 
> The new function returns 0 on success and -errno otherwise.
> We let the callers pass the pointer to the buffer where the
> value of the Status Register will be written. This way we avoid
> the casts between int and u8, which can be confusing.
> 
> Prepend spi_nor_ to the function name, all functions should begin
> with that.
> 
> S/pr_err/dev_err and drop duplicated dev_err in callers, in case the
> function returns error.

Too many things done in a single patch, can you split that please?

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 131 +++++++++++++++++++++---------------------
>  1 file changed, 65 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 7d0c1b598250..a23783641146 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -388,12 +388,14 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  	return nor->controller_ops->write(nor, to, len, buf);
>  }
>  
> -/*
> - * Read the status register, returning its value in the location
> - * Return the status register value.
> - * Returns negative if error occurred.
> +/**
> + * spi_nor_read_sr() - Read the Status Register.
> + * @nor:        pointer to 'struct spi_nor'
> + * @sr:		buffer where the value of the Status Register will be written.

You should definitely mention that this sr pointer has to be DMA-safe.

> + *
> + * Return: 0 on success, -errno otherwise.
>   */
> -static int read_sr(struct spi_nor *nor)
> +static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  {
>  	int ret;
>  
> @@ -402,20 +404,17 @@ static int read_sr(struct spi_nor *nor)
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 1),
>  				   SPI_MEM_OP_NO_ADDR,
>  				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> +				   SPI_MEM_OP_DATA_IN(1, sr, 1));
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> -		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> -						    nor->bouncebuf, 1);
> +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR, sr, 1);
>  	}
>  
> -	if (ret < 0) {
> -		pr_err("error %d reading SR\n", (int) ret);
> -		return ret;
> -	}
> +	if (ret)
> +		dev_err(nor->dev, "error %d reading SR\n", ret);
>  
> -	return nor->bouncebuf[0];
> +	return ret;
>  }

