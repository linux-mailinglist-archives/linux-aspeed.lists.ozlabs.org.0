Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9F95FB13D
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:12:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtRZ6258z2xyB
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:12:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.42; helo=mail-qv1-f42.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmqCT6DHkz2xYy;
	Tue, 11 Oct 2022 19:47:01 +1100 (AEDT)
Received: by mail-qv1-f42.google.com with SMTP id h10so8532463qvq.7;
        Tue, 11 Oct 2022 01:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG7je/SPkrUeGbyJflxBun3+ZBOYqWehWXWhY9Ywba0=;
        b=rxz/SYpsDFeDMrFDvDhxYdrhU3z/sXvAzgvW4GO0jjOqkiPzoRIZt+B7oqI1RaJuBW
         GXURNXIVN87F+408snIbmYz+eBHgX2pd9CFelKXV+4e6BeXGBVtHeX6+ZW1aBwyO/ETB
         HrVo/fLccwYCUgWN/0QzRaE/uJ3K4x4zesN/FFwVsdNs64bWZ+P97CMSL3E2L2gK6s2A
         N6LSiPvvgyimp1bgj5rUBo+JjBVrXPH0gJXQVcSrdGNV5uP2fGfVZ1JqKSeSKViLCQ9c
         2ROLj5siYbINJszyU7+AGYzhr1IgMgo6LSVcrsKSZH9FGKXxOnBKjGH+uF7ytm7xHEmW
         8WFg==
X-Gm-Message-State: ACrzQf285kycb+6ngMN604r9i14sEHymyDx0FvqyCBqFlhWLG0d12nAp
	PB00F2Z++GCFo7nf+1GTrfdNWxCPHjS3wJHx
X-Google-Smtp-Source: AMsMyM4ax+YltLAFB/vxORMgjFIsXBKYiTb77i7gjCojDzd1RiLVE9Ro4lBBxGaowvfNyVYSe9RFoA==
X-Received: by 2002:a0c:f20f:0:b0:4b1:b8f0:d1bb with SMTP id h15-20020a0cf20f000000b004b1b8f0d1bbmr17623283qvk.30.1665478018108;
        Tue, 11 Oct 2022 01:46:58 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id m8-20020ac84448000000b0039a1146e0e1sm4360737qtn.33.2022.10.11.01.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 01:46:57 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-354c7abf786so121487557b3.0;
        Tue, 11 Oct 2022 01:46:56 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr20151543ywe.283.1665478004869; Tue, 11
 Oct 2022 01:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com> <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
In-Reply-To: <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Oct 2022 10:46:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
Subject: Re: [PATCH v2 36/36] pinctrl: Clean up headers
To: Basavaraj Natikar <bnatikar@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Horatiu Vultur <horatiu.vultur@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutroni
 x Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-rpi-kernel@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Nat
 ikar@amd.com>, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org, Marc 
 Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 9:31 AM Basavaraj Natikar <bnatikar@amd.com> wrote:
> On 10/11/2022 1:44 AM, Andy Shevchenko wrote:
> > There is a few things done:
> > - include only the headers we are direct user of
> > - when pointer is in use, provide a forward declaration
> > - add missed headers
> > - group generic headers and subsystem headers
> > - sort each group alphabetically
> >
> > While at it, fix some awkward indentations.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/pinctrl/core.c                  | 19 ++++++++-------
> >  drivers/pinctrl/core.h                  | 12 +++++++++-
> >  drivers/pinctrl/devicetree.h            |  6 +++++
> >  drivers/pinctrl/pinconf.h               | 10 ++++++++
> >  drivers/pinctrl/pinctrl-utils.h         |  5 ++++
> >  drivers/pinctrl/pinmux.c                | 17 ++++++++------
> >  drivers/pinctrl/pinmux.h                | 11 +++++++++
> >  include/linux/pinctrl/consumer.h        | 31 +++++++++++--------------
> >  include/linux/pinctrl/devinfo.h         |  6 +++--
> >  include/linux/pinctrl/machine.h         |  8 ++++---
> >  include/linux/pinctrl/pinconf-generic.h | 23 ++++++++++--------
> >  include/linux/pinctrl/pinctrl.h         | 18 +++++++-------
> >  include/linux/pinctrl/pinmux.h          |  5 ++--
> >  13 files changed, 110 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> > index 9e57f4c62e60..655f9502e73f 100644
> > --- a/drivers/pinctrl/core.c
> > +++ b/drivers/pinctrl/core.c
> > @@ -12,19 +12,21 @@
> >   */
> >  #define pr_fmt(fmt) "pinctrl core: " fmt
> >
> > -#include <linux/kernel.h>
> > -#include <linux/kref.h>
> > -#include <linux/export.h>
> > -#include <linux/init.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/device.h>
> > -#include <linux/slab.h>
> >  #include <linux/err.h>
> > +#include <linux/export.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/kref.h>
> >  #include <linux/list.h>
> > -#include <linux/debugfs.h>
> >  #include <linux/seq_file.h>
> > +#include <linux/slab.h>
> > +
> >  #include <linux/pinctrl/consumer.h>
> > -#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/devinfo.h>
> >  #include <linux/pinctrl/machine.h>
> > +#include <linux/pinctrl/pinctrl.h>
> >
> >  #ifdef CONFIG_GPIOLIB
> >  #include "../gpio/gpiolib.h"
> > @@ -33,9 +35,8 @@
> >
> >  #include "core.h"
> >  #include "devicetree.h"
> > -#include "pinmux.h"
> >  #include "pinconf.h"
> > -
> > +#include "pinmux.h"
> >
> >  static bool pinctrl_dummy_state;
> >
> > diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> > index 840103c40c14..4d0bdb9fb99b 100644
> > --- a/drivers/pinctrl/core.h
> > +++ b/drivers/pinctrl/core.h
> > @@ -9,12 +9,22 @@
> >   */
> >
> >  #include <linux/kref.h>
> > +#include <linux/list.h>
> >  #include <linux/mutex.h>
> >  #include <linux/radix-tree.h>
> > -#include <linux/pinctrl/pinconf.h>
>
> Removing pinconf.h from the core.h may cause build failure in other files
> because where-ever core.h is included to use =E2=80=9Cstruct pinconf_ops=
=E2=80=9D, there
> is a need to include pinconf.h.

I can confirm adding

    #include <linux/pinctrl/pinconf.h>

to drivers/pinctrl/renesas/pinctrl-rzn1.c and drivers/pinctrl/pinctrl-singl=
e.c
fixes the issues I was seeing with shmobile_defconfig and (out-of-tree)
renesas_defconfig.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
