Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF6260D6B
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 10:20:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlylR3Q08zDqPS
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 18:20:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=googlemail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com;
 envelope-from=martin.blumenstingl@googlemail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20161025 header.b=HLrVQ6tZ; 
 dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjrzQ3FnQzDqgL
 for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Sep 2020 07:53:49 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id m22so10426309eje.10
 for <linux-aspeed@lists.ozlabs.org>; Fri, 04 Sep 2020 14:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kOwVSLuqcLcRrAi0V+2JGPo0oopvFB+z94xUxkMesDk=;
 b=HLrVQ6tZkH1co3Lk465rPx2SlpB/uLObbOIcPvHSfCBwts/RQPF5CgGMNVmaj4MK7Z
 hM8rOxprckSExPV5UPi7iGwtTkKCeM9VcF0yHBShpNJCY60GZi/vbqRtRSXqV1ACMDT8
 DAJBNlz6YQZ9CbDc/ZsqOsrIxoHl0OZTb6+iUz1GGtXvXNWF+7yt1hyGvxryzDo4yD9P
 VogwbEuV/nXAY5Ty008NE1BhuUF/CXyxYxw+Q1Lk38iuluHt+aaRVah6X/m3nqGbew/E
 imoF2TxEmXdyebzAbdOysU/Nm4D4BZ88c4km1sm+ZxUh5los1kSJlEWtNVdMaSmrcoa3
 Iqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kOwVSLuqcLcRrAi0V+2JGPo0oopvFB+z94xUxkMesDk=;
 b=e9KpMqnfstEE7+uNDv8PSvIuQ2IhPmpDLAQsbNYKaaByHSZdcVOEk1iLHke8rbCWXU
 KGclD7sKxiwKDoolI0L4Jq7btfVwAW+Y7U5kq8uUOWaj4KC5YX8WcE16POqWvWWZHvhT
 XBKYOYVMYstejT0sTvvobKzT+/+2bEIs9/zcRoHw5F1H+xF+yL2jqh9m/9zqq4Mo9n9F
 +M9jnv64+s+y/N6Pg/px8wM5d+rI5E6jHswi1ikAO0OplRR7dzpZHm3OOMjgrFyDewAT
 LyjFQgTutlwP0g0s4q0sXKzC8EkMhFzlNY0DOB0A5KBahcGnz4hH04fJsdtFqMxBYMoD
 vqnw==
X-Gm-Message-State: AOAM531KyvEYY0PSesJpW3gCdnK5r71q9E0LqmiLaxk4QYml7st+kfgt
 2smttMwYftt6k5mrHN+YWcYDxkJaZbtG7q5HyfA=
X-Google-Smtp-Source: ABdhPJzvZdR4PefRtIkw7lE/tNoQ9kzV/q7D1Napwk+pHgOuj3FJd4E/vlUR+sMicupDfupaIit4ahWr1LQB95n65bo=
X-Received: by 2002:a17:906:8690:: with SMTP id
 g16mr9400161ejx.187.1599256423525; 
 Fri, 04 Sep 2020 14:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 4 Sep 2020 23:53:32 +0200
Message-ID: <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
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
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Patrice Chotard <patrice.chotard@st.com>,
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
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>,
 Anson Huang <Anson.Huang@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org,
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

Hi Douglas,

On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per discussion [1], it seems like it should be quite safe to turn
> on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> give it a shot.  For some discussion about this flag, see the commit
> message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe").
can this somehow change the order in which the MMC drivers end up loading?
on Amlogic SoCs we have up to three MMC controllers, some SoCs even
use two different MMC controller IPs (and therefore two different
drivers).
so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
can that change with this patch?

apologies if this has been discussed and answered anywhere


Best regards,
Martin
