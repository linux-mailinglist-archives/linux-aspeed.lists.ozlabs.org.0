Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A84CB287
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K88R84Bj0z3bd6
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:48:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WLBMwCy6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WLBMwCy6; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K88R35GTfz2xsc
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:48:15 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id d84so2578962qke.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U7HKj6OXNpn8w0FHPBjThBjt7E+v6QRWEFLnATeT8R8=;
 b=WLBMwCy66RwK5pcbN9MO2NlCO4R1IBn7Qs7xVB0w98jILthSuRoLP8XafWWl4uPv1O
 hVR0NCzTtmbukMx4/j2QaOu2Gjj2iacZYdj2peE2rq+d3x+v8oVqOqlqLMUnGuYW9n+9
 SZfkcjilAsboHEAwkHUUMgr9870oCc6/lY6vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U7HKj6OXNpn8w0FHPBjThBjt7E+v6QRWEFLnATeT8R8=;
 b=qVFYktgGvFnzP/w0AeP1o3MGrpRCB7kolzbwVfaJ3DobSGNNIPGK0ZCeAJf0ASY2yZ
 RaLgwN5DZCWwHZqGt+aitOkHeHNT463/eMPhIlPd/5B68UCOhV5FVORmyFgIjarR15Vn
 NO76sZhhJPyoizFSi5mZtw5ADH/ZetL2kL6VBwNoMtFKtBQG1euR5Bx5mGJJf8d9yRXQ
 Cf+89za7CYqCFfCAOKuLuQ63qD73dfk7b0xA57ju0Dn3jld+9JG6qQTXOv0JPdinry3K
 FkCvagZfItF4VxNB9asUp7CTwVnM6PpiT6wNdyCtsg7Fi5w4Nw+syGaOViyhKgLc5K73
 aywA==
X-Gm-Message-State: AOAM532PFiPPO07ZEk59ShjHy6pRfAA5tWeCutGAZWjhn2ds3vRdq82d
 s4XlVrtmV/3MHV0alBdNRUxegOpcwfVMjmH/fjc=
X-Google-Smtp-Source: ABdhPJzOFpiKj2VhwTJ2xSllMVTELkSQmErEMVEuwhCU2F9Xv/VGI8RLN1xrDdWpjiIaIt7xtwDcqhD/+5tidY8BtQQ=
X-Received: by 2002:a37:a147:0:b0:47a:be0e:4a0c with SMTP id
 k68-20020a37a147000000b0047abe0e4a0cmr16940793qke.165.1646261292872; Wed, 02
 Mar 2022 14:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-6-clg@kaod.org>
In-Reply-To: <20220302173114.927476-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:48:00 +0000
Message-ID: <CACPK8Xfm+-6mELg4W0aybEzY76tyYe6jQc_nEwmy4tfRWzHbvw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] spi: aspeed: Add support for direct mapping
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 17:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Use direct mapping to read the flash device contents. This operation
> mode is called "Command mode" on Aspeed SoC SMC controllers. It uses a
> Control Register for the settings to apply when a memory operation is
> performed on the flash device mapping window.
>
> If the window is not big enough, fall back to the "User mode" to
> perform the read.
>
> Since direct mapping now handles all reads of the flash device
> contents, also use memcpy_fromio for other address spaces, such as
> SFDP.
>
> Direct mapping for writes will come later when validated.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-aspeed-smc.c | 67 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 688f9472e0d7..b4854b521477 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -324,8 +324,8 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem,=
 const struct spi_mem_op *o
>                 if (!op->addr.nbytes)
>                         ret =3D aspeed_spi_read_reg(chip, op);
>                 else
> -                       ret =3D aspeed_spi_read_user(chip, op, op->addr.v=
al,
> -                                                  op->data.nbytes, op->d=
ata.buf.in);
> +                       memcpy_fromio(op->data.buf.in, chip->ahb_base + o=
p->addr.val,
> +                                     op->data.nbytes);
>         } else {
>                 if (!op->addr.nbytes)
>                         ret =3D aspeed_spi_write_reg(chip, op);
> @@ -405,10 +405,73 @@ static int aspeed_spi_chip_set_default_window(struc=
t aspeed_spi_chip *chip)
>         return chip->ahb_window_size ? 0 : -1;
>  }
>
> +static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
> +{
> +       struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem-=
>spi->master);
> +       struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chi=
p_select];
> +       struct spi_mem_op *op =3D &desc->info.op_tmpl;
> +       u32 ctl_val;
> +       int ret =3D 0;
> +
> +       chip->clk_freq =3D desc->mem->spi->max_speed_hz;
> +
> +       /* Only for reads */
> +       if (op->data.dir !=3D SPI_MEM_DATA_IN)
> +               return -EOPNOTSUPP;
> +
> +       if (desc->info.length > chip->ahb_window_size)
> +               dev_warn(aspi->dev, "CE%d window (%dMB) too small for map=
ping",
> +                        chip->cs, chip->ahb_window_size >> 20);
> +
> +       /* Define the default IO read settings */
> +       ctl_val =3D readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
> +       ctl_val |=3D aspeed_spi_get_io_mode(op) |
> +               op->cmd.opcode << CTRL_COMMAND_SHIFT |
> +               CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) =
|
> +               CTRL_IO_MODE_READ;
> +
> +       /* Tune 4BYTE address mode */
> +       if (op->addr.nbytes) {
> +               u32 addr_mode =3D readl(aspi->regs + CE_CTRL_REG);
> +
> +               if (op->addr.nbytes =3D=3D 4)
> +                       addr_mode |=3D (0x11 << chip->cs);
> +               else
> +                       addr_mode &=3D ~(0x11 << chip->cs);
> +               writel(addr_mode, aspi->regs + CE_CTRL_REG);
> +       }
> +
> +       /* READ mode is the controller default setting */
> +       chip->ctl_val[ASPEED_SPI_READ] =3D ctl_val;
> +       writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
> +
> +       dev_info(aspi->dev, "CE%d read buswidth:%d [0x%08x]\n",
> +                chip->cs, op->data.buswidth, chip->ctl_val[ASPEED_SPI_RE=
AD]);
> +
> +       return ret;
> +}
> +
> +static int aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *desc,
> +                                 u64 offset, size_t len, void *buf)
> +{
> +       struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem-=
>spi->master);
> +       struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chi=
p_select];
> +
> +       /* Switch to USER command mode if mapping window is too small */
> +       if (chip->ahb_window_size < offset + len)
> +               aspeed_spi_read_user(chip, &desc->info.op_tmpl, offset, l=
en, buf);
> +       else
> +               memcpy_fromio(buf, chip->ahb_base + offset, len);
> +
> +       return len;
> +}
> +
>  static const struct spi_controller_mem_ops aspeed_spi_mem_ops =3D {
>         .supports_op =3D aspeed_spi_supports_op,
>         .exec_op =3D aspeed_spi_exec_op,
>         .get_name =3D aspeed_spi_get_name,
> +       .dirmap_create =3D aspeed_spi_dirmap_create,
> +       .dirmap_read =3D aspeed_spi_dirmap_read,
>  };
>
>  static void aspeed_spi_chip_set_type(struct aspeed_spi *aspi, unsigned i=
nt cs, int type)
> --
> 2.34.1
>
