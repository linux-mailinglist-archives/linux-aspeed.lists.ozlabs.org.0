Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E25260D56
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 10:18:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlyhH3wDzzDq7j
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 18:18:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dianders@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=io3XEfuy; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjH391ZY1zDqvv
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Sep 2020 09:25:04 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id v15so3338036pgh.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Sep 2020 16:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7bCjZ17rrssUWD1s9Actl4XKGz8CJPPkZoB8VrWyPY=;
 b=io3XEfuyAYQoZQ9TXQIpFhLwVhOjImI42C9gKY74x7/3fKnO66e7EB6TFNSieZSnzg
 WFa7Ra160IV6IshsgJvBoQ67+jkOHhdg/zRmGyKWppIUiIZ6Nr4+v9ua0DrgHCrrV84Z
 AdnxpxAhlCAoGPrAdEXN+8W/S6appdKPmNsNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7bCjZ17rrssUWD1s9Actl4XKGz8CJPPkZoB8VrWyPY=;
 b=f0L7MDIvNVluqqYmRhintMYp53KCZf8EZmCdQCIYeOg3zfBlxD0cCU7C+64Ju6NzT6
 8JQGEJDV0H9g9B+vgIo6yRCfEjpya6YWb9qvg/1Iy16/SG3Wq74qEOlfBRAewWm5t/Qm
 /9QiBXptsOEQjUG7yY5hmL6ZeeG5aTBIF83CdcIhzmIWJwmN2+5Uf+baQHhLWCUdskdn
 XUihHcawEPKznOyDzaNQkpK7rrcdP7hE/2yFRwQw23tun5gHdJx+vZ9HPBKpcsVkRUC6
 czcw8q/leC2J7e8SlbI8LmM0CSJoeNSdSpjqQ4l2Ml8hT4/yr9Nbc3YwRQYxYa3lPP89
 QKPg==
X-Gm-Message-State: AOAM533hZTiy9XNAGqFwh8wrZyHXFrC06FzaHwrSOnxFHcW3KKRf56am
 n+QxC7XPxsCm/4XqrOb0J7WMuA==
X-Google-Smtp-Source: ABdhPJykLK0R3y6ZX5+5h9yGOD1JsS8MF6/gXrE6nqqJCGkLR9OTZUQAdhtthXcKK+3zLwzrSw/hHw==
X-Received: by 2002:a63:d449:: with SMTP id i9mr4632930pgj.83.1599175501895;
 Thu, 03 Sep 2020 16:25:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q7sm3614459pgg.10.2020.09.03.16.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host drivers
Date: Thu,  3 Sep 2020 16:24:35 -0700
Message-Id: <20200903232441.2694866-1-dianders@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 linux-samsung-soc@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, swboyd@chromium.org,
 Lars Persson <lars.persson@axis.com>, linux-omap@vger.kernel.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Yangtao Li <tiny.windzz@gmail.com>,
 Hu Ziji <huziji@marvell.com>, Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 Pierre Ossman <pierre@ossman.eu>, Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Douglas Anderson <dianders@chromium.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ricky Wu <ricky_wu@realtek.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>,
 Anson Huang <Anson.Huang@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>, Vinod Koul <vkoul@kernel.org>,
 Robert Richter <rrichter@marvell.com>, Viresh Kumar <vireshk@kernel.org>,
 Jun Nie <jun.nie@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

As per discussion [1], it seems like it should be quite safe to turn
on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
give it a shot.  For some discussion about this flag, see the commit
message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
probe").

I've broken this series into chunks based on LTS kernel releases to
attempt to make it easier if someone wanted to cherry-pick it to an
older kernel.  While these cherry-picks won't be conflict free, there
should only be trivial context conflicts and no problems with drivers
that are totally missing.  This is a bit of a compromise between a
1-big patch and a many-part patch series.

I have only tested this on a rk3399-kevin (sdhci-of-arasan) and a
rk3288-veyron (dw_mmc-rockchip) device and only lightly.  If this
patch causes anyone problems those drivers should be marked with
PROBE_FORCE_SYNCHRONOUS, debugged, and then go back to prefer
asynchronous.  Any problems are likely just a hidden bug that has been
exposed by this change.

NOTE: in theory, it'd be nice if there was a KConfig option that we
could flip that would turn on async probe everywhere (except for those
that opt out by adding PROBE_FORCE_SYNCHRONOUS).  My hope is that by
adding this flag in more places it will become clear that this flag is
working reliably and easier to move over when we're ready.

While coccinelle is too difficult for my feeble brain, I managed to
whip up a pretty terrible python script to help with this.  For your
edification:

import os
import sys
import re

for filename in os.listdir("."):
    found_plat = False
    found_driver = False
    output = []
    for line in open(filename, "r").readlines():
        output.append(line)

        if "struct platform_driver" in line:
            found_plat = True
        if found_plat and re.search(r"\t\.driver\s*=\s*{", line):
            found_driver = True
            found_plat = False
        mo = re.search(r"(\s*)\.name(\s*)=", line)
        if found_driver and mo:
            if mo.group(2) == " ":
                space = " "
            elif mo.group(2) == "\t":
                # Best we can do
                space = " "
            elif mo.group(2).startswith("\t"):
                # Guess that removing one tab is right
                space = mo.group(2)[1:]
            else:
                # Guess it's all spaces
                space = mo.group(2)[7:] + " "

            output.append("%s.probe_type%s= PROBE_PREFER_ASYNCHRONOUS,\n" % (mo.group(1), space))
            found_driver = False

    open(filename, "w").write("".join(output))

[1] https://lore.kernel.org/r/CAPDyKFq31bucJhP9hp1HSqh-qM2uNGHgDoyQpmbJf00nEf_T4Q@mail.gmail.com/


Douglas Anderson (6):
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.9
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.19
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v5.4
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that are newer than 5.4

 drivers/mmc/host/alcor.c                      | 1 +
 drivers/mmc/host/android-goldfish.c           | 1 +
 drivers/mmc/host/atmel-mci.c                  | 1 +
 drivers/mmc/host/au1xmmc.c                    | 1 +
 drivers/mmc/host/bcm2835.c                    | 1 +
 drivers/mmc/host/cavium-octeon.c              | 1 +
 drivers/mmc/host/davinci_mmc.c                | 1 +
 drivers/mmc/host/dw_mmc-bluefield.c           | 1 +
 drivers/mmc/host/dw_mmc-exynos.c              | 1 +
 drivers/mmc/host/dw_mmc-hi3798cv200.c         | 1 +
 drivers/mmc/host/dw_mmc-k3.c                  | 1 +
 drivers/mmc/host/dw_mmc-pltfm.c               | 1 +
 drivers/mmc/host/dw_mmc-rockchip.c            | 1 +
 drivers/mmc/host/dw_mmc-zx.c                  | 1 +
 drivers/mmc/host/jz4740_mmc.c                 | 1 +
 drivers/mmc/host/meson-gx-mmc.c               | 1 +
 drivers/mmc/host/meson-mx-sdhc-mmc.c          | 1 +
 drivers/mmc/host/meson-mx-sdio.c              | 1 +
 drivers/mmc/host/moxart-mmc.c                 | 1 +
 drivers/mmc/host/mtk-sd.c                     | 1 +
 drivers/mmc/host/mvsdio.c                     | 1 +
 drivers/mmc/host/mxcmmc.c                     | 1 +
 drivers/mmc/host/mxs-mmc.c                    | 1 +
 drivers/mmc/host/omap.c                       | 1 +
 drivers/mmc/host/omap_hsmmc.c                 | 1 +
 drivers/mmc/host/owl-mmc.c                    | 1 +
 drivers/mmc/host/pxamci.c                     | 1 +
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 +
 drivers/mmc/host/rtsx_pci_sdmmc.c             | 1 +
 drivers/mmc/host/rtsx_usb_sdmmc.c             | 1 +
 drivers/mmc/host/s3cmci.c                     | 1 +
 drivers/mmc/host/sdhci-acpi.c                 | 1 +
 drivers/mmc/host/sdhci-bcm-kona.c             | 1 +
 drivers/mmc/host/sdhci-brcmstb.c              | 1 +
 drivers/mmc/host/sdhci-cadence.c              | 1 +
 drivers/mmc/host/sdhci-cns3xxx.c              | 1 +
 drivers/mmc/host/sdhci-dove.c                 | 1 +
 drivers/mmc/host/sdhci-esdhc-imx.c            | 1 +
 drivers/mmc/host/sdhci-esdhc-mcf.c            | 1 +
 drivers/mmc/host/sdhci-iproc.c                | 1 +
 drivers/mmc/host/sdhci-milbeaut.c             | 1 +
 drivers/mmc/host/sdhci-of-arasan.c            | 1 +
 drivers/mmc/host/sdhci-of-aspeed.c            | 2 ++
 drivers/mmc/host/sdhci-of-at91.c              | 1 +
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 1 +
 drivers/mmc/host/sdhci-of-esdhc.c             | 1 +
 drivers/mmc/host/sdhci-of-hlwd.c              | 1 +
 drivers/mmc/host/sdhci-of-sparx5.c            | 1 +
 drivers/mmc/host/sdhci-omap.c                 | 1 +
 drivers/mmc/host/sdhci-pic32.c                | 1 +
 drivers/mmc/host/sdhci-pxav2.c                | 1 +
 drivers/mmc/host/sdhci-pxav3.c                | 1 +
 drivers/mmc/host/sdhci-s3c.c                  | 1 +
 drivers/mmc/host/sdhci-sirf.c                 | 1 +
 drivers/mmc/host/sdhci-spear.c                | 1 +
 drivers/mmc/host/sdhci-sprd.c                 | 1 +
 drivers/mmc/host/sdhci-st.c                   | 1 +
 drivers/mmc/host/sdhci-tegra.c                | 1 +
 drivers/mmc/host/sdhci-xenon.c                | 1 +
 drivers/mmc/host/sdhci_am654.c                | 1 +
 drivers/mmc/host/sdhci_f_sdh30.c              | 1 +
 drivers/mmc/host/sh_mmcif.c                   | 1 +
 drivers/mmc/host/sunxi-mmc.c                  | 1 +
 drivers/mmc/host/tmio_mmc.c                   | 1 +
 drivers/mmc/host/uniphier-sd.c                | 1 +
 drivers/mmc/host/usdhi6rol0.c                 | 1 +
 drivers/mmc/host/wbsd.c                       | 1 +
 drivers/mmc/host/wmt-sdmmc.c                  | 1 +
 69 files changed, 70 insertions(+)

-- 
2.28.0.526.ge36021eeef-goog

