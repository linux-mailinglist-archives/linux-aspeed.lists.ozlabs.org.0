Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54994CB256
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K884c51Xcz3bd6
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:32:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VL8GKslk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VL8GKslk; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K884X625bz306m
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:32:12 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id e2so3032167qte.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5wkcZfN4pZ3a3l+3rbDL3hrP2CqpjYo6641YbuD1Z7Y=;
 b=VL8GKslkQfyhvjQaT0mMN7BaIwmwFq6sacRCmQHljoQBA+THJ2vLpspjYcX9md1xBh
 7Lx71zUGLAqELrHktKtYMZ6c5rddsL/B6uzoCbrYu+ZgogUpnaN090340zyTGohsd7uf
 8kWEeBScAb+bXOLZWfG7EA2lSEpJzE2Vs4WjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5wkcZfN4pZ3a3l+3rbDL3hrP2CqpjYo6641YbuD1Z7Y=;
 b=p88RNXMis13BSbh6SKJxRWxZEuqKO8xpPvhXzfHFvD36PCfBeU/24SlvpNF8gq7IzF
 w/3qKs4wJirSEWgSSnDnE9Gx3w6i/Gu+oQc9aO+o6PM6dzhldqR3ElvgCd/p2b394EBb
 zM0UkokR0SrkUIxGLtNttuWDkKtWkOMkIVNn3bxBLR2b+wZ5m+BpuZlA1Q7opyQumXPF
 nfithp9MskTT4Wg1Zzhi8KUeIO6/Wocxr16GuhIBxkQBBzjcKxp256+werA1B/yTRsx/
 sCtBdxMtDpE9Wu1FcW+xEMID9ptqWXswa/jRZvugplgOrjXJujmQT6W8rTanAX/x7fpL
 O1aw==
X-Gm-Message-State: AOAM533iqN+RcqAffeTDj3AfdgHa1JfVUAzPC0KHV/Lm27SVpjkkg0E2
 vUJGRCjEpnAQJZVRMqic9jcXIBWdzzq99LCe5SY=
X-Google-Smtp-Source: ABdhPJzK4E9ZGkEhZzJG/1AYJMAeIbckwug2MSrPNlKv7JtSbd1wBW8lAKw6pABzthZinle3fGhjVs7GZ4i+xiYUEws=
X-Received: by 2002:ac8:5d89:0:b0:2df:f357:c681 with SMTP id
 d9-20020ac85d89000000b002dff357c681mr18831790qtx.475.1646260329845; Wed, 02
 Mar 2022 14:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-7-clg@kaod.org>
In-Reply-To: <20220302173114.927476-7-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:31:57 +0000
Message-ID: <CACPK8XcAaQWdNqEJ3f2ko0wCuAwxptkY2EncV7A2TouWzd8cWA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] spi: aspeed: Adjust direct mapping to device size
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
> The segment registers of the FMC/SPI controllers provide a way to
> configure the mapping window of the flash device contents on the AHB
> bus. Adjust this window to the size of the spi-mem mapping.
>
> Things get more complex with multiple devices. The driver needs to
> also adjust the window of the next device to make sure that there is
> no overlap, even if there is no available device. The proposal below
> is not perfect but it is covering all the cases we have seen on
> different boards with one and two devices on the same bus.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-aspeed-smc.c | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index b4854b521477..974ab215ec34 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -405,6 +405,92 @@ static int aspeed_spi_chip_set_default_window(struct=
 aspeed_spi_chip *chip)
>         return chip->ahb_window_size ? 0 : -1;
>  }
>
> +static int aspeed_spi_set_window(struct aspeed_spi *aspi,
> +                                const struct aspeed_spi_window *win)
> +{
> +       u32 start =3D aspi->ahb_base_phy + win->offset;
> +       u32 end =3D start + win->size;
> +       void __iomem *seg_reg =3D aspi->regs + CE0_SEGMENT_ADDR_REG + win=
->cs * 4;
> +       u32 seg_val_backup =3D readl(seg_reg);
> +       u32 seg_val =3D aspi->data->segment_reg(aspi, start, end);
> +
> +       if (seg_val =3D=3D seg_val_backup)
> +               return 0;
> +
> +       writel(seg_val, seg_reg);
> +
> +       /*
> +        * Restore initial value if something goes wrong else we could
> +        * loose access to the chip.
> +        */
> +       if (seg_val !=3D readl(seg_reg)) {
> +               dev_err(aspi->dev, "CE%d invalid window [ 0x%.8x - 0x%.8x=
 ] %dMB",
> +                       win->cs, start, end - 1, win->size >> 20);
> +               writel(seg_val_backup, seg_reg);
> +               return -EIO;
> +       }
> +
> +       if (win->size)
> +               dev_dbg(aspi->dev, "CE%d new window [ 0x%.8x - 0x%.8x ] %=
dMB",
> +                       win->cs, start, end - 1,  win->size >> 20);
> +       else
> +               dev_dbg(aspi->dev, "CE%d window closed", win->cs);
> +
> +       return 0;
> +}
> +
> +/*
> + * Yet to be done when possible :
> + * - Align mappings on flash size (we don't have the info)
> + * - ioremap each window, not strictly necessary since the overall windo=
w
> + *   is correct.
> + */
> +static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
> +                                        u32 local_offset, u32 size)
> +{
> +       struct aspeed_spi *aspi =3D chip->aspi;
> +       struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] =3D { 0 }=
;
> +       struct aspeed_spi_window *win =3D &windows[chip->cs];
> +       int ret;
> +
> +       aspeed_spi_get_windows(aspi, windows);
> +
> +       /* Adjust this chip window */
> +       win->offset +=3D local_offset;
> +       win->size =3D size;
> +
> +       if (win->offset + win->size > aspi->ahb_window_size) {
> +               win->size =3D aspi->ahb_window_size - win->offset;
> +               dev_warn(aspi->dev, "CE%d window resized to %dMB", chip->=
cs, win->size >> 20);
> +       }
> +
> +       ret =3D aspeed_spi_set_window(aspi, win);
> +       if (ret)
> +               return ret;
> +
> +       /* Update chip mapping info */
> +       chip->ahb_base =3D aspi->ahb_base + win->offset;
> +       chip->ahb_window_size =3D win->size;
> +
> +       /*
> +        * Also adjust next chip window to make sure that it does not
> +        * overlap with the current window.
> +        */
> +       if (chip->cs < aspi->data->max_cs - 1) {
> +               struct aspeed_spi_window *next =3D &windows[chip->cs + 1]=
;
> +
> +               /* Change offset and size to keep the same end address */
> +               if ((next->offset + next->size) > (win->offset + win->siz=
e))
> +                       next->size =3D (next->offset + next->size) - (win=
->offset + win->size);
> +               else
> +                       next->size =3D 0;
> +               next->offset =3D win->offset + win->size;
> +
> +               aspeed_spi_set_window(aspi, next);
> +       }
> +       return 0;
> +}
> +
>  static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  {
>         struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem-=
>spi->master);
> @@ -419,6 +505,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_di=
rmap_desc *desc)
>         if (op->data.dir !=3D SPI_MEM_DATA_IN)
>                 return -EOPNOTSUPP;
>
> +       aspeed_spi_chip_adjust_window(chip, desc->info.offset, desc->info=
.length);
> +
>         if (desc->info.length > chip->ahb_window_size)
>                 dev_warn(aspi->dev, "CE%d window (%dMB) too small for map=
ping",
>                          chip->cs, chip->ahb_window_size >> 20);
> --
> 2.34.1
>
