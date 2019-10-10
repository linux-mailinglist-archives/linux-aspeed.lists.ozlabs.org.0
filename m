Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF5DE12D
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 01:30:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xGGk0khKzDqRZ
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 10:30:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=collabora.com
 (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3; helo=bhuna.collabora.co.uk;
 envelope-from=boris.brezillon@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46phf95pnQzDqvR
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 17:54:41 +1100 (AEDT)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 111722905BC;
 Thu, 10 Oct 2019 07:54:38 +0100 (BST)
Date: Thu, 10 Oct 2019 08:54:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 03/22] mtd: spi-nor: cadence-quadspi: Fix
 cqspi_command_read() definition
Message-ID: <20191010085435.67b08ab5@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190924074533.6618-4-tudor.ambarus@microchip.com>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
 <20190924074533.6618-4-tudor.ambarus@microchip.com>
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

On Tue, 24 Sep 2019 07:45:58 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> n_tx was never used, drop it. Replace 'const u8 *txbuf' with 'u8 opcode',
> to comply with the SPI NOR int (*read_reg)() method. The 'const'
> qualifier has no meaning for parameters passed by value, drop it.
> Going furher, the opcode was passed to cqspi_calc_rdreg() and never used,
> drop it.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index ebda612641a4..22008fecd326 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -285,7 +285,7 @@ static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> -static unsigned int cqspi_calc_rdreg(struct spi_nor *nor, const u8 opcode)
> +static unsigned int cqspi_calc_rdreg(struct spi_nor *nor)
>  {
>  	struct cqspi_flash_pdata *f_pdata = nor->priv;
>  	u32 rdreg = 0;
> @@ -354,8 +354,7 @@ static int cqspi_exec_flash_cmd(struct cqspi_st *cqspi, unsigned int reg)
>  	return cqspi_wait_idle(cqspi);
>  }
>  
> -static int cqspi_command_read(struct spi_nor *nor,
> -			      const u8 *txbuf, const unsigned n_tx,
> +static int cqspi_command_read(struct spi_nor *nor, u8 opcode,
>  			      u8 *rxbuf, size_t n_rx)
>  {
>  	struct cqspi_flash_pdata *f_pdata = nor->priv;
> @@ -373,9 +372,9 @@ static int cqspi_command_read(struct spi_nor *nor,
>  		return -EINVAL;
>  	}
>  
> -	reg = txbuf[0] << CQSPI_REG_CMDCTRL_OPCODE_LSB;
> +	reg = opcode << CQSPI_REG_CMDCTRL_OPCODE_LSB;
>  
> -	rdreg = cqspi_calc_rdreg(nor, txbuf[0]);
> +	rdreg = cqspi_calc_rdreg(nor);
>  	writel(rdreg, reg_base + CQSPI_REG_RD_INSTR);
>  
>  	reg |= (0x1 << CQSPI_REG_CMDCTRL_RD_EN_LSB);
> @@ -471,7 +470,7 @@ static int cqspi_read_setup(struct spi_nor *nor)
>  	unsigned int reg;
>  
>  	reg = nor->read_opcode << CQSPI_REG_RD_INSTR_OPCODE_LSB;
> -	reg |= cqspi_calc_rdreg(nor, nor->read_opcode);
> +	reg |= cqspi_calc_rdreg(nor);
>  
>  	/* Setup dummy clock cycles */
>  	dummy_clk = nor->read_dummy;
> @@ -604,7 +603,7 @@ static int cqspi_write_setup(struct spi_nor *nor)
>  	/* Set opcode. */
>  	reg = nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
>  	writel(reg, reg_base + CQSPI_REG_WR_INSTR);
> -	reg = cqspi_calc_rdreg(nor, nor->program_opcode);
> +	reg = cqspi_calc_rdreg(nor);
>  	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
>  
>  	reg = readl(reg_base + CQSPI_REG_SIZE);
> @@ -1087,7 +1086,7 @@ static int cqspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, size_t len)
>  
>  	ret = cqspi_set_protocol(nor, 0);
>  	if (!ret)
> -		ret = cqspi_command_read(nor, &opcode, 1, buf, len);
> +		ret = cqspi_command_read(nor, opcode, buf, len);
>  
>  	return ret;
>  }

