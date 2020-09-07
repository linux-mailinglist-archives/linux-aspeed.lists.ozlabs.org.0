Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851D260D7F
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 10:23:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blypn2vSRzDqLY
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 18:23:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.194;
 helo=mail-lj1-f194.google.com; envelope-from=wens213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csie.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlFJ04l1jzDqRK
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Sep 2020 14:13:01 +1000 (AEST)
Received: by mail-lj1-f194.google.com with SMTP id s205so14433348lja.7
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Sep 2020 21:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVTRnwHT0ZnDLhJu0EOE7eABaLeVlG6E4x1hUJwJd80=;
 b=pYl3M3MRn7oMiSGzEIau9M89ZRvf5vMze7oqlPUKRFcL9qxkL+QynN5XiYSY7jEZNa
 yM9XTQPya2eTdmhv7wDKwuHgX/yhgUwl5IoVLag0ktDDiPBJp3p+SKUXko+NpIuI5MYR
 odoncWiDk4M54nii4KJlc+X40NQ0wGa7BQOCgZ7LOcI0sKYaawXNmnzXPItJWkJkiD2Y
 0i7L7c0EyafmWoMUdfEJQR9GT0WaeQ+3SpdrT6e7ToR47mq6EANl83fJnHd4TT+c+dr3
 gCLnORKFRq299XXQ7zny7vtcLZqj/WcNjxw9qwuAt1vsXBrYE3TSALy7tBtmj8PZYFPk
 C2qw==
X-Gm-Message-State: AOAM531C9b6ZTnskiS++dHcnRXxssPw7nAshqTlzbphQ1IhUjf3lLG7n
 pHGCqCgTP9xbvdgaC4OPOZ+8a22uc5Ymr4mm
X-Google-Smtp-Source: ABdhPJwXgp56gPSpGP3aVyDmlnVjOTctouxztidE8qIjxHO/MTQuhI1RxHTMFsE5GbZFpHqSb5nozA==
X-Received: by 2002:a2e:4942:: with SMTP id b2mr9165458ljd.382.1599451976880; 
 Sun, 06 Sep 2020 21:12:56 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id v10sm4991523lji.128.2020.09.06.21.12.56
 for <linux-aspeed@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Sep 2020 21:12:56 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id q8so6776999lfb.6
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Sep 2020 21:12:56 -0700 (PDT)
X-Received: by 2002:a2e:83cf:: with SMTP id s15mr9643337ljh.47.1599451506843; 
 Sun, 06 Sep 2020 21:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
 <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
 <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
In-Reply-To: <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Sep 2020 12:04:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66URSyd4WPkM6bJ9wTeZdT-GwS+-R5UymywNxa7HW8pfg@mail.gmail.com>
Message-ID: <CAGb2v66URSyd4WPkM6bJ9wTeZdT-GwS+-R5UymywNxa7HW8pfg@mail.gmail.com>
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
