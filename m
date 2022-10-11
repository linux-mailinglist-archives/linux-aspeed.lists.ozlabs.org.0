Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FB5FB139
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:12:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtRH4rfjz2xHw
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:12:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aFDkaZ06;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aFDkaZ06;
	dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmp843PtSz2xk6;
	Tue, 11 Oct 2022 18:58:59 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id z30so8007013qkz.13;
        Tue, 11 Oct 2022 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jtn0EbueANzZWmHhe026bL4j5UVXLCdEUZ6RI8X4Iek=;
        b=aFDkaZ06eZIgNFDxYionyNjY54l3Jb8vc7xn8wqjYQg1G9prm3n/2iXgEXWGBySUYj
         pUlP9IplzOTLfdLVRJz2t64MEmWecbibwULcfH1pwRAhbzCUT0Qx8U3TYW66eGI4q6/c
         sBvA0JvIhzc4RrdJL1sC9mPLjvy5VKqBEtTknHO0sMPYsfXsHYgIFaeCifqn0QnJJCl8
         OtBD3hPGMvPap0eZdfXpScnJLFNtPJhYwQFzne+QiOxyRp0IMpjBBfzOvlF4jI3+xG4z
         TUQ5g3ho7KFLZehSEHD2JDhbDLF2SiZoJYtH+PqXJlhKnSGV+QNcPoRddxhrYbCrFF/w
         G1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtn0EbueANzZWmHhe026bL4j5UVXLCdEUZ6RI8X4Iek=;
        b=ldcCw8NKBfw1RMVIptJDA60RSRUUjrHMF/ocRBXm0N+vQy4poGW6tAnq3GJlATtLCQ
         VH4ojPTV3JvxiEZmE7EmCeb5+Soez6B2YuBI82lpx8mH/DHAZJ6gZ4zC428K6+LlE9ed
         6UF1tohtlL8OJt1k217bJxI3vDl1I0s8cttxcerDdRVP+Ep9C5CgVv9FknFMbWxaKx2C
         VFLQ81bMgG9ntMQuArYMEezxBDEhz7ULLecTNy1MukjM8KZFIjMY/zScPBklykZSJk6+
         PA/PnYiQfF4Wn1iYoXJGdJMleqtYDWfHYujwloiU8zRCToXDPlzCeVtxPnnGR8SXH9n5
         gd0Q==
X-Gm-Message-State: ACrzQf3LuiN70F1QXBhh6GmvglR3Mym0hXFZdp7MpP2DlXbt28tnxm+v
	TkIRxtGt5VMGKpSE+oxm3lx8PXaW4VIQggbi92E=
X-Google-Smtp-Source: AMsMyM58o2OPTuU9XUs+E07S0aK+hkv1wCI8/ogPlxh2cys3d+2tzM6MqnusgKv+Ub7ymEh97egvoHmX2MHd+yvD55U=
X-Received: by 2002:a05:620a:d58:b0:6df:ba25:4f5e with SMTP id
 o24-20020a05620a0d5800b006dfba254f5emr15325513qkl.320.1665475135994; Tue, 11
 Oct 2022 00:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-13-andriy.shevchenko@linux.intel.com> <4630d457-2d3b-6f66-7be5-54c84bdf80b4@wdc.com>
In-Reply-To: <4630d457-2d3b-6f66-7be5-54c84bdf80b4@wdc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Oct 2022 10:58:19 +0300
Message-ID: <CAHp75VcghxT6nS1kLjYbj5N3EBj2CukJ3zGKvFSb-Z1paj3-ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/36] pinctrl: k210: Add missed header(s)
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 11 Oct 2022 22:08:23 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Horatiu Vultur <horatiu.vultur@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Phil Edworthy <phil.edworthy@renesas.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm
 32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, "linux-rpi-
 kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dong Aisheng <aisheng.dong@nxp.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishm
 an <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Andy Shevchenko <andr
 iy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, Sean Wang <sean.wang@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 1:33 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2022/10/11 5:15, Andy Shevchenko wrote:
> > Do not imply that some of the generic headers may be always included.
> > Instead, include explicitly what we are direct user of.
> >
> > While at it, sort headers alphabetically.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Looks OK to me, but the patch title should be:
>
> pinctrl: k210: Add missing header(s)
>
> Same remark for the entire series. You need s/missed/missing in all patch titles.

Oh, the missing word 'missing' :-) I will replace it locally (I won't
resend it because of that).

> With that fixed,
>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko
