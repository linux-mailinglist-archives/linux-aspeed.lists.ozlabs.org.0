Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6844CB255
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:30:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K882c3Dh4z3bcg
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:30:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VD19IUJb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VD19IUJb; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K882T4vkPz30J7
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:30:23 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id gm1so2708543qvb.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ML24VFxrXfMfqzwDIQgpfFTM0/emw2jp9VMO0/xXk6E=;
 b=VD19IUJbn22IqGQs1TEnEdJ37rFzmLayB1HYyyMoWx7NVuIy7o5mYADHLr1b8cOxcb
 3Qpv3FDvdxxZnrp4UQLLp+15C+GY2NT4O8omYxlurZrzNO470WmltkCPDLJFc8dKNvQB
 KMM1JcMP2ZTm/PqIEJmdQXjsYEoiz1nngw/kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ML24VFxrXfMfqzwDIQgpfFTM0/emw2jp9VMO0/xXk6E=;
 b=aKdEGVU7uS2NXji7XJBTTT0Qph6hT6bRemdMyHkmnv57zryO24dzuk5MIClSGK0WoT
 uQ4MKGdBy5sEUIlSY0By/Nbli7hcpPPayhrfBmSE2m+1Tznh+d+y/3ro05j4C5V24C2A
 fH0IwUTPsA9oB5RyqMf388oh8F5gQWMm4/4F1MFx3bTXQAsduPlW7DraVJSrWUjB0xf0
 +5vyURneegZqQyqfBW/tJQPHzz+/F+l1QGvRGIbjeK0sTzGzSTID7i9jy1Vs3DoI7a/a
 zh4dYYhxCSvI77tgA3RiP1ZKlSerEQn3lxtIkAYAf1ZhjQCR2eHOHM/dDjCZMshwMfRb
 ygBw==
X-Gm-Message-State: AOAM532Drj3/2u/C96D1ftOR70WwQiBDY/KR5qBoA1fpRSu6ua8WMSo/
 UIgBgwdM/M0MlAKs7VE4DiQF4nFTf2Mm7jSK+dk=
X-Google-Smtp-Source: ABdhPJzJtD+iy3qA83qK2b0/uPlG0vWYsMm4HqktSZgOxSO0FWDUN9MgnYNyp1h+Wqy5l3jmjQa5X2HV+/qsLwLVQrA=
X-Received: by 2002:ad4:4347:0:b0:432:a1f0:f5aa with SMTP id
 q7-20020ad44347000000b00432a1f0f5aamr21695306qvs.49.1646260220663; Wed, 02
 Mar 2022 14:30:20 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-8-clg@kaod.org>
In-Reply-To: <20220302173114.927476-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:30:08 +0000
Message-ID: <CACPK8Xesu-3cfH+fPvNGW=JfntTarTSv1njb1FBZ7pD2-TMbMA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] spi: aspeed: Workaround AST2500 limitations
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
> It is not possible to configure a full 128MB window for a chip of the
> same size on the AST2500 SPI controller. For his case, the maximum

typo: this

> window size is restricted to 120MB for CE0.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-aspeed-smc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 974ab215ec34..e133984d3c95 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -445,6 +445,8 @@ static int aspeed_spi_set_window(struct aspeed_spi *a=
spi,
>   * - ioremap each window, not strictly necessary since the overall windo=
w
>   *   is correct.
>   */
> +static const struct aspeed_spi_data ast2500_spi_data;
> +
>  static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
>                                          u32 local_offset, u32 size)
>  {
> @@ -453,6 +455,16 @@ static int aspeed_spi_chip_adjust_window(struct aspe=
ed_spi_chip *chip,
>         struct aspeed_spi_window *win =3D &windows[chip->cs];
>         int ret;
>
> +       /*
> +        * Due to an HW issue on the AST2500 SPI controller, the CE0
> +        * window size should be smaller than the maximum 128MB.
> +        */
> +       if (aspi->data =3D=3D &ast2500_spi_data && chip->cs =3D=3D 0 && s=
ize =3D=3D SZ_128M) {
> +               size =3D 120 << 20;
> +               dev_info(aspi->dev, "CE%d window resized to %dMB (AST2500=
 HW quirk)",
> +                        chip->cs, size >> 20);
> +       }
> +
>         aspeed_spi_get_windows(aspi, windows);
>
>         /* Adjust this chip window */
> --
> 2.34.1
>
