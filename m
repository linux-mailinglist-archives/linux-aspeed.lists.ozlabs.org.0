Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48514601C00
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 00:04:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrrcP0ZBpz3drZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 09:04:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G4XBw7Ot;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G4XBw7Ot;
	dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrbZV4nTVz3c4Q;
	Mon, 17 Oct 2022 23:16:32 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id g11so7525728qts.1;
        Mon, 17 Oct 2022 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
        b=G4XBw7OtjlEVYhvq3ujakfFtUjrlMIkd5uVVPI4L3fSHgn9r2dYLTBKR1DSk55qy8/
         vjDDH2t4lQErUrsZ81N0WmnCPAq1TAG4psbIGjoQRhntN5Cmq1aF/T5qp0/euyInLZPZ
         /K8bnHyxQYrmvZCrh75klmy5Bz15Y/XvsM73Xs3LGuMo2izmCHPf5UYpUMbW37BEsOEV
         sVucDgXlyB1YZt4pqPGa9U7E85eMuIK9JN+tGTbAMfTNB3gqhaNnxWOxBOHdWu8HWlhw
         4OAFcfWlF4Cka/k2IMLMYdJ1w8Emhfeq9FKglqB57GbZ26ff4iD6Qp74edFo/4+10u7I
         pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
        b=2oDj8A/HOEW/M1QVx3Fsei9+f96rmp6wK05XXaZLwAJ9w0652s8PRPGMcBum0OBdLm
         MxeJiscDiGQPOhBugsu7lPkGiGUQTiO5KIs7oMWTHOb8zfQJWUVb4pe3uKRBV5xK6hZm
         D/nV0+4HkqNaiombLhwvecL5n2IOiYJgDoEtx5mSL7yL3ZcpXu5FBZaGPnVb1NE5lunh
         TF9XB1MG/q7IPKcKDKjzNwX76c9Z9Yjld31vG1V6DCizTSxYXnyCwxNanFc5ICVRhzna
         MPhobMZ7d9zT7T3/4IvQ4FrfX+pKmytHneBvQW7tkHNWRTj0i9mKyE8IGC4yS8rg6Wu5
         0u9w==
X-Gm-Message-State: ACrzQf35/Pga46V/1HtV75xCZ7MnOO7VCI0zvclY2Xrncw5ETWlHthlw
	p5a5vkgxaHsAdVvrnwMEUj3vkYpon3brwRavHUc=
X-Google-Smtp-Source: AMsMyM5ONAbRwJ0mRV8lFkFN/+yOIGgrHcLBILWbhUW8XaqfnSolfxdkiScuiVdMZUaqcXP+J2a9nYR4SqM8sa8eRyQ=
X-Received: by 2002:a05:622a:1045:b0:39c:e2e1:dc59 with SMTP id
 f5-20020a05622a104500b0039ce2e1dc59mr7379719qte.195.1666008987610; Mon, 17
 Oct 2022 05:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com> <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
In-Reply-To: <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Oct 2022 15:15:51 +0300
Message-ID: <CAHp75VftkwPB-+jhCrhCdPRN0hLm5DLADMyAO45eBTRFfxiNuQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] gpiolib: tegra186: Add missed header(s)
To: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Oct 2022 09:01:13 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Horatiu Vultur <horatiu.vultur@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutroni
 x Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-rpi-kernel@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Alexand
 re Belloni <alexandre.belloni@bootlin.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org, Marc 
 Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 17, 2022 at 12:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Oct 17, 2022 at 10:52 AM Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>>=C2=B7On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Do not imply that some of the generic headers may be always included.
> > > Instead, include explicitly what we are direct user of.
> > >
> > > While at it, sort headers alphabetically.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Andy: are you going to send it together with the corresponding pinctrl
> changes in a separate PR?

Yes, this is the plan, but I want first to push it to Linux Next (via
my tree) for a couple of days, so we will be sure there are no
compilation issues.

--=20
With Best Regards,
Andy Shevchenko
