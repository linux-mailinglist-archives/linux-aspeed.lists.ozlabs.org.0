Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2D260D80
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 10:23:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blyps6tFJzDqRW
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 18:23:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::941;
 helo=mail-ua1-x941.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kEHPy/5o; dkim-atps=neutral
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlPZl0dV2zDqJs
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Sep 2020 20:26:15 +1000 (AEST)
Received: by mail-ua1-x941.google.com with SMTP id v5so3801395uau.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Sep 2020 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AozzJXZUL22h+sKQZ059ls1ZeGArDktRdLkmygb6j+U=;
 b=kEHPy/5oC15OKB88KwjomCTjGDXuVbdoHHp/KjnfUHNjixAmkPO5iain7J/VCcsTKn
 x1BOYRDI2axsEtQT5hcb5Jw6PkthrUgHM0SY5DvRThY2DcsYpMRaQQk0ds9lja9NkzRY
 PH2XMfkdc4Bhwxg0iKrwXGI0b5PhLtPOvScQsPfeIbMW1EyxAkv8H/XglABmMObHphcH
 n7AlFcUa0ax6PkigvFLs3sPUtqdElHOR06iruiCM6S+cVuAtm283ysqv3MRZsEWp/6SN
 S8c5letuiGaNQOeCt+Ave+K6jWIy6JHorfDkw8YacPDr+MXogIUIhwWXZ0BjD9nTTSsp
 zB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AozzJXZUL22h+sKQZ059ls1ZeGArDktRdLkmygb6j+U=;
 b=Go3ClAIZMeK+bKl9aI2cInQg66M8kpKgiW//1Y5Lq/kuwDqRkBF4Qz8FtdXChrid4f
 jHoRDIdMFluh6+GQYgEcj+u+GagHAa309dnhgC0sTiP1UEJ28i/v0DXsrk6iZCCUwrDo
 olVWsS6fO/cgh/gNWod7YLm7jjrv4Gm4obZertkoFMSolT5Rf4Qnfj87sOwBE95nA2mY
 4vorZAAUeg31AiwONynOFpBusGupzXRuvX2fx3jj95JbqfV+rDaQ8xUlgjp4T04ktKNI
 Du3lJ7POBLY1uNqL4KmvM36P2JagMq4rDA9tjlksPJssk/mnJWR1RHZDIh9naqxcwR1L
 ZBvg==
X-Gm-Message-State: AOAM530qNnJ7s6UR+jDTe6EUA3sOXWDn/Ll7JWmVw8nmbqHTA2VL7I4j
 scFFej1sAFa+iep/59AGHhARj0Ze15ciRt17kXXX6A==
X-Google-Smtp-Source: ABdhPJy1eBqbsXfbOgOTKaIKV9d6z9pG4PRO7SQC+FwnjmOkT4mzyQi7YatfsHO8E9fzkaZ+4lehXIpuaB9Y6rBFcIo=
X-Received: by 2002:ab0:6f91:: with SMTP id f17mr10608318uav.129.1599474367924; 
 Mon, 07 Sep 2020 03:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
 <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
 <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
 <CAGb2v67dPaV9tP4piV9MHe9QeJAq0RyvOO3ypJ3ZBW1-ffpjKA@mail.gmail.com>
In-Reply-To: <CAGb2v67dPaV9tP4piV9MHe9QeJAq0RyvOO3ypJ3ZBW1-ffpjKA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 12:25:31 +0200
Message-ID: <CAPDyKFoNFEa4ssv3TXbj4KM0UGjJgcp3dtypwicxJ-bExBL28A@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Chen-Yu Tsai <wens@kernel.org>, Anand Moon <linux.amoon@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
 "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra <linux-tegra@vger.kernel.org>,
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Hu Ziji <huziji@marvell.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>, Pierre Ossman <pierre@ossman.eu>,
 Saiyam Doshi <saiyamdoshi.in@gmail.com>, Maxime Ripard <mripard@kernel.org>,
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
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
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

On Mon, 7 Sep 2020 at 06:08, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> (Resent from kernel.org)
>
> On Mon, Sep 7, 2020 at 11:57 AM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Hi Martin.
> >
> > On Sat, 5 Sep 2020 at 03:24, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > Hi Douglas,
> > >
> > > On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > As per discussion [1], it seems like it should be quite safe to turn
> > > > on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> > > > give it a shot.  For some discussion about this flag, see the commit
> > > > message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> > > > probe").
> > > can this somehow change the order in which the MMC drivers end up loading?
> > > on Amlogic SoCs we have up to three MMC controllers, some SoCs even
> > > use two different MMC controller IPs (and therefore two different
> > > drivers).
> > > so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
> > > can that change with this patch?
> > >

Consistency has never been guaranteed. Just imagine one of the mmc
host drivers ending up lacking some of its resources during ->probe()
and returning -EPROBE_DEFER.

UUID/PARTID has been the only way.

> >
> > We could resolve this by setting up aliases for mmc nodes in the dts.

Yes, this is now possible due to the recently [1] applied patches for
supporting mmc aliases.

>
> Right now, only the dw_mmc driver family supports aliases for mmc nodes.

That's "mshc" specific (related to the old multiple slot support I
think), but not affecting the mmc aliases, which the mmc core now is
supporting.

So the mmc aliases are common for all mmc hosts. Please have a look at
the new OF parsing in mmc_alloc_host().

[...]

Kind regards
Uffe

[1]
https://patchwork.kernel.org/patch/11747669/
https://patchwork.kernel.org/patch/11747671/
