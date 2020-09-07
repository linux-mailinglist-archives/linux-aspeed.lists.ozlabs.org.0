Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD91260D82
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 10:23:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blypz27spzDq8x
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 18:23:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::943;
 helo=mail-ua1-x943.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uQQtOtMz; dkim-atps=neutral
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlSJ75L2NzDqM5
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Sep 2020 22:28:53 +1000 (AEST)
Received: by mail-ua1-x943.google.com with SMTP id v24so4107155uaj.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Sep 2020 05:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8iVJ2Y8DEp3E0XkrRL3vpRQ7yO+SYLZGU2xwg3pZn7w=;
 b=uQQtOtMz9h++aYiUpsU46MiJXh7DHCcguAo/zJU+YS89m53bIsw6fdvtT/tTOunUyR
 JJBiFLggFSuqeEl8r29jqfLHoAxfIBpkSm4q4BV1wLUnhcEg5BhKtw4yN9E3KWnlQi5Q
 rCpJseHbu1nV0RKPbba4IW2CSH1ZbVbSELCGxUJCzfawo7q5fo02iJXwGc7JPE8tkB4q
 RNrmFl7UapRVJ4X+zZHU2t2qQDe2KMqFrTt1qU1mQ/xsI6rXnxItRXjcEJnYkUO0DNyF
 eGUgMMDfflC6QbVhVustSwl2/RbNWfSaweZxAisnFopk4/vjCZaqjr03ExUXBskH+JSu
 107Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8iVJ2Y8DEp3E0XkrRL3vpRQ7yO+SYLZGU2xwg3pZn7w=;
 b=h44pUClCqrnqSXcGGuagKs7PGCg60z6RkdFfqJ2fpDsOuXtBRkdpSZWSx4iEKCjQsC
 86rx63e/hx5I9kiGKE9Y2UVecKu03QAG1UTIJ5SqC6mrUSI59WdHZ0yB6pYHo8VtlIJa
 A9IVLrdMA5bQJCvixLOhTPhOke5BQszUOsgrd+WPzdeyIMBbUuzEEfXuoJpLGAyCxoTc
 Dnj+Pu/4SB/TTA1KkO/i2J/zVcxSs6fRLYrXJPrK58rDyFs4J21w/rJpzQUcA7+LurXU
 4IIEb5dYKe500rQDnTOTFTTCl5R3YCbGjaLukhJbOeyCsrjBwS2XioPhrR3E21eCWGcG
 NzPA==
X-Gm-Message-State: AOAM530koL1/9gdlXIpwnboKl/dTGfwQOHu6b9uudIsTkEQrFwx2xcm7
 r+OEzit5dCkBpanWNkhTJhnBYspoyGa5/IfyVI2ErA==
X-Google-Smtp-Source: ABdhPJy6I2uvtSFaZhO3P4JEWmrE8eH+U+1Xn5WxmNVFnMTl2QPXi6bmEQ1vz+4fPNN/0nIdBxJ7hVghl+1FhXG+hRM=
X-Received: by 2002:ab0:4041:: with SMTP id h59mr8011331uad.19.1599481728409; 
 Mon, 07 Sep 2020 05:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 14:28:12 +0200
Message-ID: <CAPDyKFqTjFUaqx6phBGdPuv6hz8dsevsO_UhoOhFT+oOFrhFjA@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:49:00 +1000
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 Lars Persson <lars.persson@axis.com>, linux-omap <linux-omap@vger.kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Hu Ziji <huziji@marvell.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>, Pierre Ossman <pierre@ossman.eu>,
 Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:BROADCOM BCM2835..." <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ricky Wu <ricky_wu@realtek.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Chen-Yu Tsai <wens@csie.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>,
 Anson Huang <Anson.Huang@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>, Vinod Koul <vkoul@kernel.org>,
 Robert Richter <rrichter@marvell.com>, Viresh Kumar <vireshk@kernel.org>,
 Jun Nie <jun.nie@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 4 Sep 2020 at 01:25, Douglas Anderson <dianders@chromium.org> wrote:
>
> As per discussion [1], it seems like it should be quite safe to turn
> on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> give it a shot.  For some discussion about this flag, see the commit
> message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe").
>
> I've broken this series into chunks based on LTS kernel releases to
> attempt to make it easier if someone wanted to cherry-pick it to an
> older kernel.  While these cherry-picks won't be conflict free, there
> should only be trivial context conflicts and no problems with drivers
> that are totally missing.  This is a bit of a compromise between a
> 1-big patch and a many-part patch series.
>
> I have only tested this on a rk3399-kevin (sdhci-of-arasan) and a
> rk3288-veyron (dw_mmc-rockchip) device and only lightly.  If this
> patch causes anyone problems those drivers should be marked with
> PROBE_FORCE_SYNCHRONOUS, debugged, and then go back to prefer
> asynchronous.  Any problems are likely just a hidden bug that has been
> exposed by this change.
>
> NOTE: in theory, it'd be nice if there was a KConfig option that we
> could flip that would turn on async probe everywhere (except for those
> that opt out by adding PROBE_FORCE_SYNCHRONOUS).  My hope is that by
> adding this flag in more places it will become clear that this flag is
> working reliably and easier to move over when we're ready.
>
> While coccinelle is too difficult for my feeble brain, I managed to
> whip up a pretty terrible python script to help with this.  For your
> edification:
>
> import os
> import sys
> import re
>
> for filename in os.listdir("."):
>     found_plat = False
>     found_driver = False
>     output = []
>     for line in open(filename, "r").readlines():
>         output.append(line)
>
>         if "struct platform_driver" in line:
>             found_plat = True
>         if found_plat and re.search(r"\t\.driver\s*=\s*{", line):
>             found_driver = True
>             found_plat = False
>         mo = re.search(r"(\s*)\.name(\s*)=", line)
>         if found_driver and mo:
>             if mo.group(2) == " ":
>                 space = " "
>             elif mo.group(2) == "\t":
>                 # Best we can do
>                 space = " "
>             elif mo.group(2).startswith("\t"):
>                 # Guess that removing one tab is right
>                 space = mo.group(2)[1:]
>             else:
>                 # Guess it's all spaces
>                 space = mo.group(2)[7:] + " "
>
>             output.append("%s.probe_type%s= PROBE_PREFER_ASYNCHRONOUS,\n" % (mo.group(1), space))
>             found_driver = False
>
>     open(filename, "w").write("".join(output))
>
> [1] https://lore.kernel.org/r/CAPDyKFq31bucJhP9hp1HSqh-qM2uNGHgDoyQpmbJf00nEf_T4Q@mail.gmail.com/
>
>
> Douglas Anderson (6):
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.9
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.19
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v5.4
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that are newer than 5.4
>
>  drivers/mmc/host/alcor.c                      | 1 +
>  drivers/mmc/host/android-goldfish.c           | 1 +
>  drivers/mmc/host/atmel-mci.c                  | 1 +
>  drivers/mmc/host/au1xmmc.c                    | 1 +
>  drivers/mmc/host/bcm2835.c                    | 1 +
>  drivers/mmc/host/cavium-octeon.c              | 1 +
>  drivers/mmc/host/davinci_mmc.c                | 1 +
>  drivers/mmc/host/dw_mmc-bluefield.c           | 1 +
>  drivers/mmc/host/dw_mmc-exynos.c              | 1 +
>  drivers/mmc/host/dw_mmc-hi3798cv200.c         | 1 +
>  drivers/mmc/host/dw_mmc-k3.c                  | 1 +
>  drivers/mmc/host/dw_mmc-pltfm.c               | 1 +
>  drivers/mmc/host/dw_mmc-rockchip.c            | 1 +
>  drivers/mmc/host/dw_mmc-zx.c                  | 1 +
>  drivers/mmc/host/jz4740_mmc.c                 | 1 +
>  drivers/mmc/host/meson-gx-mmc.c               | 1 +
>  drivers/mmc/host/meson-mx-sdhc-mmc.c          | 1 +
>  drivers/mmc/host/meson-mx-sdio.c              | 1 +
>  drivers/mmc/host/moxart-mmc.c                 | 1 +
>  drivers/mmc/host/mtk-sd.c                     | 1 +
>  drivers/mmc/host/mvsdio.c                     | 1 +
>  drivers/mmc/host/mxcmmc.c                     | 1 +
>  drivers/mmc/host/mxs-mmc.c                    | 1 +
>  drivers/mmc/host/omap.c                       | 1 +
>  drivers/mmc/host/omap_hsmmc.c                 | 1 +
>  drivers/mmc/host/owl-mmc.c                    | 1 +
>  drivers/mmc/host/pxamci.c                     | 1 +
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 +
>  drivers/mmc/host/rtsx_pci_sdmmc.c             | 1 +
>  drivers/mmc/host/rtsx_usb_sdmmc.c             | 1 +
>  drivers/mmc/host/s3cmci.c                     | 1 +
>  drivers/mmc/host/sdhci-acpi.c                 | 1 +
>  drivers/mmc/host/sdhci-bcm-kona.c             | 1 +
>  drivers/mmc/host/sdhci-brcmstb.c              | 1 +
>  drivers/mmc/host/sdhci-cadence.c              | 1 +
>  drivers/mmc/host/sdhci-cns3xxx.c              | 1 +
>  drivers/mmc/host/sdhci-dove.c                 | 1 +
>  drivers/mmc/host/sdhci-esdhc-imx.c            | 1 +
>  drivers/mmc/host/sdhci-esdhc-mcf.c            | 1 +
>  drivers/mmc/host/sdhci-iproc.c                | 1 +
>  drivers/mmc/host/sdhci-milbeaut.c             | 1 +
>  drivers/mmc/host/sdhci-of-arasan.c            | 1 +
>  drivers/mmc/host/sdhci-of-aspeed.c            | 2 ++
>  drivers/mmc/host/sdhci-of-at91.c              | 1 +
>  drivers/mmc/host/sdhci-of-dwcmshc.c           | 1 +
>  drivers/mmc/host/sdhci-of-esdhc.c             | 1 +
>  drivers/mmc/host/sdhci-of-hlwd.c              | 1 +
>  drivers/mmc/host/sdhci-of-sparx5.c            | 1 +
>  drivers/mmc/host/sdhci-omap.c                 | 1 +
>  drivers/mmc/host/sdhci-pic32.c                | 1 +
>  drivers/mmc/host/sdhci-pxav2.c                | 1 +
>  drivers/mmc/host/sdhci-pxav3.c                | 1 +
>  drivers/mmc/host/sdhci-s3c.c                  | 1 +
>  drivers/mmc/host/sdhci-sirf.c                 | 1 +
>  drivers/mmc/host/sdhci-spear.c                | 1 +
>  drivers/mmc/host/sdhci-sprd.c                 | 1 +
>  drivers/mmc/host/sdhci-st.c                   | 1 +
>  drivers/mmc/host/sdhci-tegra.c                | 1 +
>  drivers/mmc/host/sdhci-xenon.c                | 1 +
>  drivers/mmc/host/sdhci_am654.c                | 1 +
>  drivers/mmc/host/sdhci_f_sdh30.c              | 1 +
>  drivers/mmc/host/sh_mmcif.c                   | 1 +
>  drivers/mmc/host/sunxi-mmc.c                  | 1 +
>  drivers/mmc/host/tmio_mmc.c                   | 1 +
>  drivers/mmc/host/uniphier-sd.c                | 1 +
>  drivers/mmc/host/usdhi6rol0.c                 | 1 +
>  drivers/mmc/host/wbsd.c                       | 1 +
>  drivers/mmc/host/wmt-sdmmc.c                  | 1 +
>  69 files changed, 70 insertions(+)
>
> --
> 2.28.0.526.ge36021eeef-goog
>

An interesting idea about a patch per LTS release. I think it makes
perfect sense in this type of case.

Let's give this a shot in next and see how it goes. So, applied for
next, thanks!

Kind regards
Uffe
