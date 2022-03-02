Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93EF4CB263
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:33:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K885r5mDGz3bd6
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:33:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RKeNmy3F;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RKeNmy3F; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K885m0Wyyz2yph
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:33:15 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id t21so2558952qkg.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MH2CJfGKAeTvDpXrtXLMMm+AC8F6kORH3TEKSbCrNfI=;
 b=RKeNmy3FgK0W71enFNR21BoAMLPgQXHsfgsQCPyNwyuvfc7MZfNodSByaq0Xp2JeOP
 tf5cFIpBZ6//AkroEjrR/w9M87A3MtinzkU6NksETqZj3V63/skTEg0IrWKa/DdihjUM
 A2ac1oIm9AhN8QgbHXUX9hs/Ta4d9tz0s/WAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MH2CJfGKAeTvDpXrtXLMMm+AC8F6kORH3TEKSbCrNfI=;
 b=i1f9L7GBQhE01A+aV09o/kDY5uawdvTzazAzLzyvOa62tlHnzuTalxPZC4TZE1D2am
 enwUKg+KnbFZvkbSPPQ+MxgsP93vwCM8bt0/EgUYNH3iQOc9psy6uxpfJUNAaK3ZdMyT
 kfbVYzLzNyTKrQE1Gw6vLoLWcfEbNM2K9bUB1hDUiqbcERsVfF0i8yGM1AyvLx16qJX6
 QxKehoEuQiNNfpx9C4D+czIQvQdoWSusDYxBJ8CJd3J4xy4N5BFh3EVhwPdGv/i7I/O2
 eMCoGs5mOxdxFK7s+btHyvhndaA2MnHXCaS4xu2NH8IFfw+t9dj7g8UpOOaCzfPQfzCm
 0viA==
X-Gm-Message-State: AOAM532ENwPQRaKeSo7gE9utkwPCFYIkeNEKAFiAVnqpi8RotERvlop6
 286+bAO/1QaVk4Xf4Ph1Vuc3B13+YGarwi0gF6E=
X-Google-Smtp-Source: ABdhPJyEPtu3slh8282TJBc0g7ayy9DHHSl7hyRSC0WrVkNRJQUeSH83zE/yVMt2TqYx5LcoPN0nxADhKTQ6LJ7k4ss=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr17319869qkj.666.1646260393417; Wed, 02
 Mar 2022 14:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-9-clg@kaod.org>
In-Reply-To: <20220302173114.927476-9-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:33:00 +0000
Message-ID: <CACPK8XeA9MUg-Ai4XMTRDDEK52UFHupAFcBTCN7ZhSHZOfTaBg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] spi: aspeed: Add support for the AST2400 SPI
 controller
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
> Extend the driver for the AST2400 SPI Flash Controller (SPI). This
> controller has a slightly different interface which requires
> adaptation of the 4B handling. Summary of features :
>
>    . host Firmware
>    . 1 chip select pin (CE0)
>    . slightly different register set, between AST2500 and the legacy
>      controller
>    . no segment registers
>    . single, dual mode.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-aspeed-smc.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index e133984d3c95..8c6d7f79d97f 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -32,6 +32,7 @@
>  #define   CTRL_IO_DUAL_DATA            BIT(29)
>  #define   CTRL_IO_QUAD_DATA            BIT(30)
>  #define   CTRL_COMMAND_SHIFT           16
> +#define   CTRL_IO_ADDRESS_4B           BIT(13) /* AST2400 SPI only */
>  #define   CTRL_IO_DUMMY_SET(dummy)                                     \
>         (((((dummy) >> 2) & 0x1) << 14) | (((dummy) & 0x3) << 6))
>  #define   CTRL_CE_STOP_ACTIVE          BIT(2)
> @@ -272,6 +273,8 @@ static bool aspeed_spi_supports_op(struct spi_mem *me=
m, const struct spi_mem_op
>         return spi_mem_default_supports_op(mem, op);
>  }
>
> +static const struct aspeed_spi_data ast2400_spi_data;
> +
>  static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_m=
em_op *op)
>  {
>         struct aspeed_spi *aspi =3D spi_controller_get_devdata(mem->spi->=
master);
> @@ -301,6 +304,9 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem,=
 const struct spi_mem_op *o
>                         addr_mode |=3D (0x11 << chip->cs);
>                 else
>                         addr_mode &=3D ~(0x11 << chip->cs);
> +
> +               if (op->addr.nbytes =3D=3D 4 && chip->aspi->data =3D=3D &=
ast2400_spi_data)
> +                       ctl_val |=3D CTRL_IO_ADDRESS_4B;
>         }
>
>         if (op->dummy.buswidth && op->dummy.nbytes)
> @@ -392,7 +398,13 @@ static int aspeed_spi_chip_set_default_window(struct=
 aspeed_spi_chip *chip)
>         struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] =3D { 0 }=
;
>         struct aspeed_spi_window *win =3D &windows[chip->cs];
>
> -       aspeed_spi_get_windows(aspi, windows);
> +       /* No segment registers for the AST2400 SPI controller */
> +       if (aspi->data =3D=3D &ast2400_spi_data) {
> +               win->offset =3D 0;
> +               win->size =3D aspi->ahb_window_size;
> +       } else {
> +               aspeed_spi_get_windows(aspi, windows);
> +       }
>
>         chip->ahb_base =3D aspi->ahb_base + win->offset;
>         chip->ahb_window_size =3D win->size;
> @@ -455,6 +467,10 @@ static int aspeed_spi_chip_adjust_window(struct aspe=
ed_spi_chip *chip,
>         struct aspeed_spi_window *win =3D &windows[chip->cs];
>         int ret;
>
> +       /* No segment registers for the AST2400 SPI controller */
> +       if (aspi->data =3D=3D &ast2400_spi_data)
> +               return 0;
> +
>         /*
>          * Due to an HW issue on the AST2500 SPI controller, the CE0
>          * window size should be smaller than the maximum 128MB.
> @@ -539,6 +555,12 @@ static int aspeed_spi_dirmap_create(struct spi_mem_d=
irmap_desc *desc)
>                 else
>                         addr_mode &=3D ~(0x11 << chip->cs);
>                 writel(addr_mode, aspi->regs + CE_CTRL_REG);
> +
> +               /* AST2400 SPI controller sets 4BYTE address mode in
> +                * CE0 Control Register
> +                */
> +               if (op->addr.nbytes =3D=3D 4 && chip->aspi->data =3D=3D &=
ast2400_spi_data)
> +                       ctl_val |=3D CTRL_IO_ADDRESS_4B;
>         }
>
>         /* READ mode is the controller default setting */
> @@ -805,6 +827,14 @@ static const struct aspeed_spi_data ast2400_fmc_data=
 =3D {
>         .segment_reg   =3D aspeed_spi_segment_reg,
>  };
>
> +static const struct aspeed_spi_data ast2400_spi_data =3D {
> +       .max_cs        =3D 1,
> +       .hastype       =3D false,
> +       .we0           =3D 0,
> +       .ctl0          =3D 0x04,
> +       /* No segment registers */
> +};
> +
>  static const struct aspeed_spi_data ast2500_fmc_data =3D {
>         .max_cs        =3D 3,
>         .hastype       =3D true,
> @@ -849,6 +879,7 @@ static const struct aspeed_spi_data ast2600_spi_data =
=3D {
>
>  static const struct of_device_id aspeed_spi_matches[] =3D {
>         { .compatible =3D "aspeed,ast2400-fmc", .data =3D &ast2400_fmc_da=
ta },
> +       { .compatible =3D "aspeed,ast2400-spi", .data =3D &ast2400_spi_da=
ta },
>         { .compatible =3D "aspeed,ast2500-fmc", .data =3D &ast2500_fmc_da=
ta },
>         { .compatible =3D "aspeed,ast2500-spi", .data =3D &ast2500_spi_da=
ta },
>         { .compatible =3D "aspeed,ast2600-fmc", .data =3D &ast2600_fmc_da=
ta },
> --
> 2.34.1
>
