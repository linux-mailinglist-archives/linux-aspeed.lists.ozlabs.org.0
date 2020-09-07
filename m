Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832025F755
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Sep 2020 12:08:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlP9y6HfNzDqPc
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Sep 2020 20:08:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e43;
 helo=mail-vs1-xe43.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O2L0eLGd; dkim-atps=neutral
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlP9l39JgzDqDq
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Sep 2020 20:08:10 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id b16so7091790vsl.6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Sep 2020 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZ0cXtIu18O1k22F/ZDQa/bXyptLZb81gkafcnjYNcM=;
 b=O2L0eLGdR+6+ZhRzQIz42SKnDGT0lu7O6LKXrLLcRyWaY3A4BOwdgSFgeWg0bN/Efh
 Fak+f85L/g4Qpl1UXC9ta/tPAic75s2ru0IsLhvDD2XT0lreXQnG2ksFAt+N7DJC4PPi
 wFXZ9JNFr9qbD8MbzUBRhihO6wvFInG8xlAksZhYEBTIuKx37atFH1d1LsgK4GPU86nj
 ntwGoA9ZTlttMtr4Shq+5qxC2Je3wJUNjtyK4S35317lToJbFRdKk5QfAkZfAFYxeGNP
 dLMfjTTk1zo1FLQYxPqUOg6XydIgz4lUKW6utGB7GnMK2FNEU3y6QkiZCiXYZSJ4NHbq
 cTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZ0cXtIu18O1k22F/ZDQa/bXyptLZb81gkafcnjYNcM=;
 b=Htj5GZWnbVUPJgA/uGQ6ngfaisrrx+d0lOXXytKp9KftcEPzNkKp7PJPSBAsNTFKQH
 YNZqXBSW95XXlkhTSk0yIZEMQ8IMUMeqrVU3GHpFtyBuOmIK3C9qq700z0jHbL8jTGO6
 2B812hCDoOmBSNolcNcaIFb6dmC8wmHlFigORN0UdbmdHMykl0vyEobpTdicLXQJaLmd
 3Um+V6w9H035h14C5XprPiNXyCWmevm7cC3FrBeoj6AFwqyBuaqQwTQITkuT6R7QlTkZ
 1j/hUyfrZ8M+99oDfRNJWTltQsjJ6rw01yWDjSObwrg1OqXMGvIoTPDwFkFjdBHoZ63l
 uvzw==
X-Gm-Message-State: AOAM532JYJk+JefvcWewYKB6UT0g3yN9SLlcrNd2RrIqGJPiqTJZ3cBe
 hgd8EDHA+QEX4UdChf7+RT9YKkAizXQXjm3hIb/D4w==
X-Google-Smtp-Source: ABdhPJzK8imxVzFICBf5slUvnoT+nIGcFmxhDDZ+N5lgeyXxY/MWgnT4W+c7RvwPtr/PAV7TEjJg1KFBqInVadg+qOY=
X-Received: by 2002:a67:308c:: with SMTP id w134mr10855802vsw.8.1599473287226; 
 Mon, 07 Sep 2020 03:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200904164315.24618-1-krzk@kernel.org>
 <20200904164315.24618-2-krzk@kernel.org>
In-Reply-To: <20200904164315.24618-2-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 12:07:30 +0200
Message-ID: <CAPDyKFo2Kqcpjb7QmsNgyD_kji2vXt3G2SqdDp9DUnvotKyojA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: host: Enable compile testing of multiple
 drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@axis.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Manjunath M B <manjumb@synopsys.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Manuel Lauss <manuel.lauss@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 4 Sep 2020 at 18:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Multiple MMC host controller driver can be compile tested as they do not
> depend on architecture specific headers.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I tried to apply this, but there was a conflict around the SDHCI_S3C.
Can you please rebase.

Kind regards
Uffe


>
> ---
>
> Changes since v1:
> 1. Add COMMON_CLK dependency to MESON_GX to fix errors like:
>    ERROR: modpost: "devm_clk_register" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ---
>  drivers/mmc/host/Kconfig | 41 +++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index eea01fde0591..93db789cf8ec 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -178,7 +178,7 @@ config MMC_SDHCI_OF_AT91
>  config MMC_SDHCI_OF_ESDHC
>         tristate "SDHCI OF support for the Freescale eSDHC controller"
>         depends on MMC_SDHCI_PLTFM
> -       depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE
> +       depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
>         select MMC_SDHCI_IO_ACCESSORS
>         select FSL_GUTS
>         help
> @@ -216,7 +216,7 @@ config MMC_SDHCI_OF_DWCMSHC
>  config MMC_SDHCI_OF_SPARX5
>         tristate "SDHCI OF support for the MCHP Sparx5 SoC"
>         depends on MMC_SDHCI_PLTFM
> -       depends on ARCH_SPARX5
> +       depends on ARCH_SPARX5 || COMPILE_TEST
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
>           found in the MCHP Sparx5 SoC.
> @@ -238,7 +238,7 @@ config MMC_SDHCI_CADENCE
>
>  config MMC_SDHCI_CNS3XXX
>         tristate "SDHCI support on the Cavium Networks CNS3xxx SoC"
> -       depends on ARCH_CNS3XXX
> +       depends on ARCH_CNS3XXX || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         help
>           This selects the SDHCI support for CNS3xxx System-on-Chip devices.
> @@ -262,7 +262,7 @@ config MMC_SDHCI_ESDHC_MCF
>
>  config MMC_SDHCI_ESDHC_IMX
>         tristate "SDHCI support for the Freescale eSDHC/uSDHC i.MX controller"
> -       depends on ARCH_MXC
> +       depends on ARCH_MXC || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
> @@ -276,7 +276,7 @@ config MMC_SDHCI_ESDHC_IMX
>
>  config MMC_SDHCI_DOVE
>         tristate "SDHCI support on Marvell's Dove SoC"
> -       depends on ARCH_DOVE || MACH_DOVE
> +       depends on ARCH_DOVE || MACH_DOVE || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         help
> @@ -289,7 +289,7 @@ config MMC_SDHCI_DOVE
>
>  config MMC_SDHCI_TEGRA
>         tristate "SDHCI platform support for the Tegra SD/MMC Controller"
> -       depends on ARCH_TEGRA
> +       depends on ARCH_TEGRA || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
> @@ -301,7 +301,8 @@ config MMC_SDHCI_TEGRA
>
>  config MMC_SDHCI_S3C
>         tristate "SDHCI support on Samsung S3C SoC"
> -       depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
> +       depends on MMC_SDHCI
> +       depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
>           often referrered to as the HSMMC block in some of the Samsung S3C
> @@ -313,7 +314,7 @@ config MMC_SDHCI_S3C
>
>  config MMC_SDHCI_SIRF
>         tristate "SDHCI support on CSR SiRFprimaII and SiRFmarco SoCs"
> -       depends on ARCH_SIRF
> +       depends on ARCH_SIRF || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         help
> @@ -351,7 +352,8 @@ config MMC_SDHCI_PXAV2
>
>  config MMC_SDHCI_SPEAR
>         tristate "SDHCI support on ST SPEAr platform"
> -       depends on MMC_SDHCI && PLAT_SPEAR
> +       depends on MMC_SDHCI
> +       depends on PLAT_SPEAR || COMPILE_TEST
>         depends on OF
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
> @@ -374,7 +376,7 @@ config MMC_SDHCI_S3C_DMA
>
>  config MMC_SDHCI_BCM_KONA
>         tristate "SDHCI support on Broadcom KONA platform"
> -       depends on ARCH_BCM_MOBILE
> +       depends on ARCH_BCM_MOBILE || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         help
>           This selects the Broadcom Kona Secure Digital Host Controller
> @@ -422,7 +424,8 @@ config MMC_SDHCI_IPROC
>
>  config MMC_MESON_GX
>         tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
> -       depends on ARCH_MESON
> +       depends on ARCH_MESON || COMPILE_TEST
> +       depends on COMMON_CLK
>         help
>           This selects support for the Amlogic SD/MMC Host Controller
>           found on the S905/GX*/AXG family of SoCs.  This controller is
> @@ -458,7 +461,7 @@ config MMC_MESON_MX_SDIO
>
>  config MMC_MOXART
>         tristate "MOXART SD/MMC Host Controller support"
> -       depends on ARCH_MOXART
> +       depends on ARCH_MOXART || COMPILE_TEST
>         help
>           This selects support for the MOXART SD/MMC Host Controller.
>           MOXA provides one multi-functional card reader which can
> @@ -467,7 +470,7 @@ config MMC_MOXART
>
>  config MMC_SDHCI_ST
>         tristate "SDHCI support on STMicroelectronics SoC"
> -       depends on ARCH_STI || FSP2
> +       depends on ARCH_STI || FSP2 || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         help
> @@ -587,7 +590,7 @@ config MMC_TIFM_SD
>
>  config MMC_MVSDIO
>         tristate "Marvell MMC/SD/SDIO host driver"
> -       depends on PLAT_ORION
> +       depends on PLAT_ORION || (COMPILE_TEST && ARM)
>         depends on OF
>         help
>           This selects the Marvell SDIO host driver.
> @@ -599,7 +602,7 @@ config MMC_MVSDIO
>
>  config MMC_DAVINCI
>         tristate "TI DAVINCI Multimedia Card Interface support"
> -       depends on ARCH_DAVINCI
> +       depends on ARCH_DAVINCI || COMPILE_TEST
>         help
>           This selects the TI DAVINCI Multimedia card Interface.
>           If you have an DAVINCI board with a Multimedia Card slot,
> @@ -628,7 +631,7 @@ config MMC_SPI
>
>  config MMC_S3C
>         tristate "Samsung S3C SD/MMC Card Interface support"
> -       depends on ARCH_S3C24XX
> +       depends on ARCH_S3C24XX || COMPILE_TEST
>         depends on S3C24XX_DMAC
>         help
>           This selects a driver for the MCI interface found in
> @@ -681,7 +684,7 @@ config MMC_SDRICOH_CS
>
>  config MMC_SDHCI_SPRD
>         tristate "Spreadtrum SDIO host Controller"
> -       depends on ARCH_SPRD
> +       depends on ARCH_SPRD || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_HSQ
> @@ -698,7 +701,7 @@ config MMC_TMIO_CORE
>
>  config MMC_TMIO
>         tristate "Toshiba Mobile IO Controller (TMIO) MMC/SD function support"
> -       depends on MFD_TMIO || MFD_ASIC3
> +       depends on MFD_TMIO || MFD_ASIC3 || COMPILE_TEST
>         select MMC_TMIO_CORE
>         help
>           This provides support for the SD/MMC cell found in TC6393XB,
> @@ -971,7 +974,7 @@ config MMC_REALTEK_USB
>
>  config MMC_SUNXI
>         tristate "Allwinner sunxi SD/MMC Host Controller support"
> -       depends on ARCH_SUNXI
> +       depends on ARCH_SUNXI || COMPILE_TEST
>         help
>           This selects support for the SD/MMC Host Controller on
>           Allwinner sunxi SoCs.
> --
> 2.17.1
>
