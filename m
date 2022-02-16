Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E44294B8147
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 08:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz8X73Jhnz3c7S
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 18:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nqq/1QEd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nqq/1QEd; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz8X10QbPz2xBL
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 18:21:18 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id b5so1270378qtq.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 23:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pOcJAEz2qU41PX9tifsFjG0wojUZW1SvJzugMZiYuC0=;
 b=nqq/1QEdzD/5W/nv2zTp9XXZj9GEXhlgKtfxNAWzCJpuPUnCuJDSykqaLEkUu73Eee
 bpXiXJ2uphU0Cix+zo+9i2ba1WtVKzy4o7JqsKHE9ClIbqu0kFBMDG+Q5jLFF5yisf+P
 DgWLheZ+6e0nB1COWgkhri2ulmv9D5ph51brU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pOcJAEz2qU41PX9tifsFjG0wojUZW1SvJzugMZiYuC0=;
 b=W/p9caE+e1YT1SpMyEyt4NOiRg8mOy9MUgqkRPyrZhF04jp0E8mErlkfD8UACho67b
 cAU0X/LESaKC6dlCn/n8yuFXnL27qCTfyc8hekt8ZSkIrlAXqtx5SZRD7xt97aqc6w8a
 Vo+MwT6YqwVm5CoVuh3EauH+KOkYs3oraWIk23RwiPQnocu6y3SFkJYtwAYEpvHofcKY
 HEXQo9OFUjTJzu+CH1YjFmcfvIynaxycKnsqgszxl/Wao5jBTytaEUYBUmIFxG7OTIXh
 Hzce5zMDgNYik0J1u/C1ldQwgMAFKgn8PwqbHe9eiDSmz/JVEYoepMKFJdZmqt5YJJZZ
 NAOA==
X-Gm-Message-State: AOAM532KKSpBR7B12ThuppssM9Q/ewqQSSPR1O2IRH0h0w9ngviHB1x/
 Rt6GwM7Z0JnsNFY1g5F6eJzQLQwzo+bz0Qp7GPE=
X-Google-Smtp-Source: ABdhPJzW11flgp0zEGjBDsbZmQaNh3HD4dBznYiqY29J473H7ttZH/tN26OSjf6pOvHePn5DcqbqrSr9Ss1Ny09UdS4=
X-Received: by 2002:ac8:5b91:0:b0:2db:acb7:2412 with SMTP id
 a17-20020ac85b91000000b002dbacb72412mr1055351qta.475.1644996075867; Tue, 15
 Feb 2022 23:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Feb 2022 07:21:04 +0000
Message-ID: <CACPK8Xe5_opc8W-00DZF1URcb2-OYSU6acjJg+c+aAoDxGBboA@mail.gmail.com>
Subject: Re: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
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

On Mon, 14 Feb 2022 at 09:42, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hi,
>
> This series adds a new SPI driver using the spi-mem interface for the
> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> SoCs.
>
>  * AST2600 Firmware SPI Memory Controller (FMC)
>  * AST2600 SPI Flash Controller (SPI1 and SPI2)
>  * AST2500 Firmware SPI Memory Controller (FMC)
>  * AST2500 SPI Flash Controller (SPI1 and SPI2)
>  * AST2400 New Static Memory Controller (also referred as FMC)
>  * AST2400 SPI Flash Controller (SPI)
>
> It is based on the current OpenBMC kernel driver [1], using directly
> the MTD SPI-NOR interface and on a patchset [2] previously proposed
> adding support for the AST2600 only. This driver takes a slightly
> different approach to cover all 6 controllers.
>
> It does not make use of the controller register disabling Address and
> Data byte lanes because is not available on the AST2400 SoC. We could
> introduce a specific handler for new features available on recent SoCs
> if needed. As there is not much difference on performance, the driver
> chooses the common denominator: "User mode" which has been heavily
> tested in [1]. "User mode" is also used as a fall back method when
> flash device mapping window is too small.
>
> Problems to address with spi-mem were the configuration of the mapping
> windows and the calibration of the read timings. The driver handles
> them in the direct mapping handler when some knowledge on the size of
> the flash device is know. It is not perfect but not incorrect either.
> The algorithm is one from [1] because it doesn't require the DMA
> registers which are not available on all controllers.
>
> Direct mapping for writes is not supported (yet). I have seen some
> corruption with writes and I preferred to use the safer and proven
> method of the initial driver [1]. We can improve that later.
>
> The driver supports Quad SPI RX transfers on the AST2600 SoC but it
> didn't have the expected results. Therefore it is not activated yet.
> This needs more tests.
>
> The series does not remove the current Aspeed SMC driver but prepares
> ground for its removal by changing its CONFIG option. This last step
> can be addressed as a followup when the new driver using the spi-mem
> interface has been sufficiently exposed.
>
> Tested on:
>
>  * OpenPOWER Palmetto (AST2400)
>  * Evaluation board (AST2500)
>  * OpenPOWER Witherspoon (AST2500)
>  * Evaluation board (AST2600 A0)
>  * Rainier board (AST2600)

Looks great! Thanks for doing this work C=C3=A9dric.

I reviewed all of the patches. The device tree and defconfig ones,
which we will send via my aspeed tree, are good to go.

The others look good too, to the best of my knowledge.

I'll do some more testing of your v2 when you send it out.

Cheers,

Joel

>
> [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/co=
ntrollers/aspeed-smc.c
> [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D2123=
94
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (10):
>   mtd: spi-nor: aspeed: Rename Kconfig option
>   dt-bindings: spi: Add Aspeed SMC controllers device tree binding
>   spi: spi-mem: Add driver for Aspeed SMC controllers
>   spi: aspeed: Add support for direct mapping
>   spi: aspeed: Adjust direct mapping to device size
>   spi: aspeed: Workaround AST2500 limitations
>   spi: aspeed: Add support for the AST2400 SPI controller
>   spi: aspeed: Calibrate read timings
>   ARM: dts: aspeed: Enable Dual SPI RX transfers
>   spi: aspeed: Activate new spi-mem driver
>
>  drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
>  arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
>  arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
>  arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
>  drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
>  drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
>  drivers/spi/Kconfig                           |   11 +
>  drivers/spi/Makefile                          |    1 +
>  9 files changed, 1369 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/spi/spi-aspeed-smc.c
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-=
fmc.yaml
>
> --
> 2.34.1
>
