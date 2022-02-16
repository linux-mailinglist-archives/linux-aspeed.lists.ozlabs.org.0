Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A46184B80E2
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 08:02:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz86B5Rg9z3c79
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 18:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DEQtO8Re;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=DEQtO8Re; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz86553Qqz2xYQ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Feb 2022 18:02:19 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id r14so1273831qtt.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 23:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tQsez3rBBuWL5P/PS1iF/3TVpjfzLMW/EONt+f9CiMQ=;
 b=DEQtO8Rec0/pciyxC16dz5iaxsu3WmlWt3NyB5nPzDtrs1WiDLQmd6+hlVBLEnqVpu
 1mebox8SJRxbZTV/O6jAS12dOueg+4F90FldQTblOj89+hrNeAHr+LIeLNdAliI56beR
 pJC3N2/CeNgNv8Gka5T210xTzD/ClYHwqrGc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tQsez3rBBuWL5P/PS1iF/3TVpjfzLMW/EONt+f9CiMQ=;
 b=HEvSja4wZp2qDQFT1RysfwzDPC4fB19p7v98KNUWdq8QeGkIRd1DWBFGbAFw07apXa
 x+fwA3D2hD5a401o6BGOyDIVEGzOpYfWEbMO/6m9WuMvmFbNVafAjtYwnArCDJWoG2zC
 FWGIBTkQ6/4dcWgC3BaPmwHtw6UWd+A0XK3bkqiaN+Phh0GWBHi5+wQFFw6xsgWB+opX
 JL4sv+y9T8etS0r7vd2Cr6pBkIgovWTaJ5hG8K45jMgAHaNm6hfvZjLYe6SbHCHNJjAO
 LP+BxLMdSXFpbtk0FkO8YjqykGFT6D+hx/rhDHzrkVb3GWutdZWrQUZzLPtXSs2sYX/0
 sMOQ==
X-Gm-Message-State: AOAM533SxbnGcbkeedAp5Ud5zAX8wOzX3nNPv42Lh66BAYGGTYXelPqr
 GCyvph4J8Qd3OQ43Ahd4yjKlOpU/eWINMKzJJkc=
X-Google-Smtp-Source: ABdhPJxUrxTCwzi7Yj2+ExwwwoGmToAHQYb+adCONcmAx/DnApNmNJjP3jevLGycqiKtwihstXuDC7FCB3cmNTkPoqU=
X-Received: by 2002:a05:622a:116:b0:2cd:5be1:3838 with SMTP id
 u22-20020a05622a011600b002cd5be13838mr1054529qtw.494.1644994936320; Tue, 15
 Feb 2022 23:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-11-clg@kaod.org>
In-Reply-To: <20220214094231.3753686-11-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Feb 2022 07:02:04 +0000
Message-ID: <CACPK8XdvczyZ1QHtFm7JJAC7AY+QmWSx0MarUwLjUyOtC9DnSQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] spi: aspeed: Activate new spi-mem driver
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

On Mon, 14 Feb 2022 at 09:43, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The previous driver using the MTD SPI NOR interface is kept in case we
> find some issues but we should remove it quickly once the new driver
> using the spi-mem interface has been sufficiently exposed.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

I suggest we drop the defconfig changes from both this patch and the
first. This way we'll always have the new driver being built, with
less churn.

If you strongly prefer the way you've done it then that's fine too.

> ---
>  arch/arm/configs/aspeed_g4_defconfig | 2 +-
>  arch/arm/configs/aspeed_g5_defconfig | 2 +-
>  arch/arm/configs/multi_v5_defconfig  | 2 +-
>  arch/arm/configs/multi_v7_defconfig  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspe=
ed_g4_defconfig
> index 964536444cd7..b4a1b2ed1a17 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -64,7 +64,7 @@ CONFIG_MTD_BLOCK=3Dy
>  CONFIG_MTD_PARTITIONED_MASTER=3Dy
>  CONFIG_MTD_SPI_NOR=3Dy
>  # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dy
> +CONFIG_SPI_ASPEED_SMC=3Dy
>  CONFIG_MTD_UBI=3Dy
>  CONFIG_MTD_UBI_FASTMAP=3Dy
>  CONFIG_MTD_UBI_BLOCK=3Dy
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
> index e809236ca88b..ccc4240ee4b5 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -103,7 +103,7 @@ CONFIG_MTD_BLOCK=3Dy
>  CONFIG_MTD_PARTITIONED_MASTER=3Dy
>  CONFIG_MTD_SPI_NOR=3Dy
>  # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dy
> +CONFIG_SPI_ASPEED_SMC=3Dy
>  CONFIG_MTD_UBI=3Dy
>  CONFIG_MTD_UBI_FASTMAP=3Dy
>  CONFIG_MTD_UBI_BLOCK=3Dy
> diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi=
_v5_defconfig
> index 49083ef05fb0..80a3ae02d759 100644
> --- a/arch/arm/configs/multi_v5_defconfig
> +++ b/arch/arm/configs/multi_v5_defconfig
> @@ -103,7 +103,7 @@ CONFIG_MTD_RAW_NAND=3Dy
>  CONFIG_MTD_NAND_ATMEL=3Dy
>  CONFIG_MTD_NAND_ORION=3Dy
>  CONFIG_MTD_SPI_NOR=3Dy
> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dy
> +CONFIG_SPI_ASPEED_SMC=3Dy
>  CONFIG_MTD_UBI=3Dy
>  CONFIG_BLK_DEV_LOOP=3Dy
>  CONFIG_ATMEL_SSC=3Dm
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi=
_v7_defconfig
> index fc1b69256b64..33572998dbbe 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -217,7 +217,7 @@ CONFIG_MTD_NAND_DAVINCI=3Dy
>  CONFIG_MTD_NAND_STM32_FMC2=3Dy
>  CONFIG_MTD_NAND_PL35X=3Dy
>  CONFIG_MTD_SPI_NOR=3Dy
> -CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR=3Dm
> +CONFIG_SPI_ASPEED_SMC=3Dm
>  CONFIG_MTD_UBI=3Dy
>  CONFIG_BLK_DEV_LOOP=3Dy
>  CONFIG_BLK_DEV_RAM=3Dy
> --
> 2.34.1
>
