Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E61601BF7
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 00:03:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mrrbd2B8zz3drl
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 09:03:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=frJwpnQ1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com; envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=frJwpnQ1;
	dkim-atps=neutral
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrX0h3jBXz3dxd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Oct 2022 20:35:31 +1100 (AEDT)
Received: by mail-vk1-xa29.google.com with SMTP id s185so5079696vkb.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Oct 2022 02:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/piL+Cl5bNZ+cdgdtRq8tdPhqA168X72rjKGIcj1h4=;
        b=frJwpnQ1m5aYZphVeeBe7Gk3obDQDvbUlm04wfHh9QiSL/PMF9tB/Oqsh+0kEGhfNO
         IO0xDniqeVyzfdD+JQ/zRq4D21vh7ik7Um8ee3cn8CBCOToSaQ1ZGpd/a2Gve9yyVF34
         ITfWo51grHozApCr0PrB6Bwe0SOYlzp6onCsTl/dTI9MCc6vgY4Nu541uAo++YYBs5A4
         a0vKPtblJ4z5wLnNbmGOx+MINPdJQQEqi1diMlwjfz7XnWKZTtJr/JKwgIM6sTm2WKvz
         GFI/MxIIypmMB3ZgmlItW4/UaPbdgeUgb5Ga5LgkDThgRnOzk/BQFLxn/5jf7fmdM9uK
         /Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/piL+Cl5bNZ+cdgdtRq8tdPhqA168X72rjKGIcj1h4=;
        b=1aeDxQC4TUqZN0nkUWuXZjO5wD1xtT450LOTqBbmZJwozDIW4qY/LMTvjMePTOZxRv
         DlXbsKLhWO6XXm31x3HTw8PrftBk3fZNshr+rnNyAm8qMuwOZM+D764JCQw+81s0qD2A
         MimecDAQjA/CQq80DjiXYYaVOx5PlABxSgPUb32LJu6GNnzXyZ+wtJ2dZUbatxSTDCjW
         eKY/lelnCS7dXU56JrhRlY+wCEyMeOkuZu84jPCu5Ep7X4PZ6YkXrAnB6G3Gb5n6q+M/
         FfQcwl9lS/XcJrUi93tXm5CGvGXGYJ1LGAr9Gr5OtDHc266rOHtCq3UaELDbUcw8T+um
         I9ZQ==
X-Gm-Message-State: ACrzQf13JXwjAk8Q7gqnra+/62rM2wfGoz34MrCyuLCW3y4NVrWYxcrr
	wsiil2hCykHTUgrL6RzItRD21z+eAMBzURMshGemsg==
X-Google-Smtp-Source: AMsMyM6Q6nrL8lOCi83NdWMY6wKW/FytxI2676zCB6+Z2xX8cVC67C12vEdkRnmssQAcscBm4uxHwhyfQkZ6/acn8wI=
X-Received: by 2002:a1f:4843:0:b0:3ae:c4a3:d653 with SMTP id
 v64-20020a1f4843000000b003aec4a3d653mr3536302vka.1.1665999328063; Mon, 17 Oct
 2022 02:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-2-andriy.shevchenko@linux.intel.com> <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com>
In-Reply-To: <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Oct 2022 11:35:16 +0200
Message-ID: <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] gpiolib: tegra186: Add missed header(s)
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Horatiu Vultur <horatiu.vultur@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Cla
 udiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-rpi-kernel@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
 , Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, openbmc@lists.oz
 labs.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 17, 2022 at 10:52 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > Do not imply that some of the generic headers may be always included.
> > Instead, include explicitly what we are direct user of.
> >
> > While at it, sort headers alphabetically.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Andy: are you going to send it together with the corresponding pinctrl
changes in a separate PR?

Bart
