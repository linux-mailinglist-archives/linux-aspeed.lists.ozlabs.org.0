Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5D260D7E
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 10:23:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blyph3QNjzDqLj
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 18:23:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wens@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1bWvQSaW; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlFBQ0CXjzDqMf
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Sep 2020 14:08:13 +1000 (AEST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B11421919
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Sep 2020 04:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599451690;
 bh=ONkeX70fx/wV703g/+Q6baBO4TgEFwMz42jO1XVwCZo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1bWvQSaWfpKlcYQlO+XrpTc00HDPouuMSl1An6o1ylGHBvykomJwms/cqDw95mbld
 xp9QRogvK5q1JLcJTw0ChaQZo+F/32zwIJTfttKp0L9AbEi/0MhY5wI5bDyOqES2zU
 b356iWL1Px+VUUeP8h2OAUmMPwfJBzoZWSnN209I=
Received: by mail-ej1-f48.google.com with SMTP id lo4so16336574ejb.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Sep 2020 21:08:10 -0700 (PDT)
X-Gm-Message-State: AOAM5304UGsuTtwjRXeGH3uF4L0ZkWru5Elecpabb2B3cWRNMT4qTm4Q
 N7BqFcEYMWzfVg0NVyJYQBpGbpku6H8/7b2YJHg=
X-Google-Smtp-Source: ABdhPJxxd2BogwYi+hnmteCVzWiY87kx0dBQtNlTmTb01SAJQcu/UlZfk3j6QtUx+mA1R0RzQuwv5PUSfbz7UnXRWvU=
X-Received: by 2002:ac2:5398:: with SMTP id g24mr2917539lfh.7.1599451688702;
 Sun, 06 Sep 2020 21:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
 <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
 <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
In-Reply-To: <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 7 Sep 2020 12:07:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v67dPaV9tP4piV9MHe9QeJAq0RyvOO3ypJ3ZBW1-ffpjKA@mail.gmail.com>
Message-ID: <CAGb2v67dPaV9tP4piV9MHe9QeJAq0RyvOO3ypJ3ZBW1-ffpjKA@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:49:01 +1000
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
 "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Lars Persson <lars.persson@axis.com>,
 "open list:OMAP2+ SUPPORT" <linux-omap@vger.kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Yangtao Li <tiny.windzz@gmail.com>,
 Hu Ziji <huziji@marvell.com>, Thierry Reding <thierry.reding@gmail.com>,
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
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Douglas Anderson <dianders@chromium.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ricky Wu <ricky_wu@realtek.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Al Cooper <alcooperx@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 "open list:BROADCOM BCM281XX..." <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Anson Huang <Anson.Huang@nxp.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Robert Richter <rrichter@marvell.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>, Patrice Chotard <patrice.chotard@st.com>,
 Viresh Kumar <vireshk@kernel.org>, Jun Nie <jun.nie@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

(Resent from kernel.org)

On Mon, Sep 7, 2020 at 11:57 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin.
>
> On Sat, 5 Sep 2020 at 03:24, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Douglas,
> >
> > On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > As per discussion [1], it seems like it should be quite safe to turn
> > > on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> > > give it a shot.  For some discussion about this flag, see the commit
> > > message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> > > probe").
> > can this somehow change the order in which the MMC drivers end up loading?
> > on Amlogic SoCs we have up to three MMC controllers, some SoCs even
> > use two different MMC controller IPs (and therefore two different
> > drivers).
> > so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
> > can that change with this patch?
> >
>
> We could resolve this by setting up aliases for mmc nodes in the dts.

Right now, only the dw_mmc driver family supports aliases for mmc nodes.

> > apologies if this has been discussed and answered anywhere
> >
> >
> > Best regards,
> > Martin
>
> Best regards
> -Anand
