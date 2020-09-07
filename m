Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD1260D7D
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 10:23:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlypZ6VDnzDqC5
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 18:23:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=linux.amoon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iaW7gHqW; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlDyX6zKdzDqQS
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Sep 2020 13:57:51 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id y2so11342792ilp.7
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Sep 2020 20:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XryGHQO6eD+7cC1Y9cwOygjqKqm4eiixaACN/ogwZBw=;
 b=iaW7gHqWz2WpvCChxCdF73ymFxpKnYsvhLso+G/K+Xzvat4tBWmRqHvy4H+XRq+xcC
 GzNXQNHpL8asaEQpdBokN+92R+dXlDCsH2F1LF/7yoKSXdL0nkrW5+A+2VDPzO74hnfA
 jNtVhWXZsJoQ6VCqMUVSnL4OPdBMou/wsUmogf4xyaGOmq6+JpUf5j6Z5rsEksDTo2eG
 z83CaAElLwGG7BIvenlmDYM2ID/CUvi7QsXxm8L9JQ4cmBhBPtV+TNo6INMymTC1Ffpl
 JBeDHB7g5mZxkPFr6XtyqbpzrttmTbI0jo5rWXPDAqjCA27rzu6n3yeoCkW/Eff5K4Xx
 ut5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XryGHQO6eD+7cC1Y9cwOygjqKqm4eiixaACN/ogwZBw=;
 b=g74MQR9dtvBbFq3EopwvsaGwkyFShb4+H4HHYIuSFAq3KxMJp6g6VxCaIr5cd4Snas
 NroRPCX3NWrl7mODJyEoSdS5vVsXnj8Evhu1zy3Aai7HnWfc7+vmvtuyaXelLqh/B/1s
 5xop6R71wEtRopKleynv5uU/YIv/jEK2TQfzo7C31YutWwnBTBmjDwpQmFhVTmY5tbsK
 nGOiEpuLSnf7BijTukI76dl35nsGbcstWUeb/d9rX0xl9tUn0oZUMYtchQWg9zf8+r7E
 HL+XgQ0s2SJR/+d/iAKjtz45Nr8n2LPYzkBLtRoI1b5+YJzUUyZfiUrpp7p4JzU+TjdW
 NNVQ==
X-Gm-Message-State: AOAM531T1kZiUlmE/XBorheHdSqJ6VmM4D9qlLBQyFVDEdP3qZcrkD1R
 O62LZT2ohyYrgf74fH28QUp3RV7c3LFlo6KfLdA=
X-Google-Smtp-Source: ABdhPJz1j6fgFvZpCoqcXn+9m88ozc3Ql8RWA8t8El+lYPuH47iO0JlrV3Be9/8IIqCI+qgjymaiLIvmnlR3DB+JLUQ=
X-Received: by 2002:a92:4184:: with SMTP id o126mr18480584ila.6.1599451067513; 
 Sun, 06 Sep 2020 20:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
 <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
In-Reply-To: <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Sep 2020 09:27:36 +0530
Message-ID: <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Lars Persson <lars.persson@axis.com>, linux-omap@vger.kernel.org,
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
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 Pierre Ossman <pierre@ossman.eu>, Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
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
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Anson Huang <Anson.Huang@nxp.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Robert Richter <rrichter@marvell.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, swboyd@chromium.org,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>, Patrice Chotard <patrice.chotard@st.com>,
 Viresh Kumar <vireshk@kernel.org>, Jun Nie <jun.nie@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Martin.

On Sat, 5 Sep 2020 at 03:24, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Douglas,
>
> On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > As per discussion [1], it seems like it should be quite safe to turn
> > on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> > give it a shot.  For some discussion about this flag, see the commit
> > message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> > probe").
> can this somehow change the order in which the MMC drivers end up loading?
> on Amlogic SoCs we have up to three MMC controllers, some SoCs even
> use two different MMC controller IPs (and therefore two different
> drivers).
> so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
> can that change with this patch?
>

We could resolve this by setting up aliases for mmc nodes in the dts.

> apologies if this has been discussed and answered anywhere
>
>
> Best regards,
> Martin

Best regards
-Anand
