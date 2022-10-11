Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2905FB134
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtQr0WdNz3c4K
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BMj8f33/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=warthog618@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BMj8f33/;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmbYn6d4rz3dtJ;
	Tue, 11 Oct 2022 11:02:04 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id b5so11473683pgb.6;
        Mon, 10 Oct 2022 17:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDvDPLCLAPPvF5TVvL+FWbJtEqmbYVODvwDkJg3SqIo=;
        b=BMj8f33/fyuY4YUgfzIsC8MB079NtlG/lc5y1lSPpCGAsz+jvSYZCTpuRzKVZGf2GY
         nZi6ZRgOudbzROz6pHhHElsWmoKQQy847SVQHPP6Lzs+V2eA/brEnXLuDstKnq7MW7Ih
         TzHZfV7XKs3PD0GAaAkJAXCvXBlxf5lB+KS3lhnFICm9Tq4yaQhhQQax921FRXOWW/if
         /toe/pDvQON4HdgY5CGmbYgif/tTyjDjkjRdKQFAulnURnCwp8NMFdEBa3NYmPI0A+fB
         fhamlfjudZxMTaB+1mSMxDuObe1ocZe7cQbErJKQBTAEur2a0QkUbRoT5VJEglEdMX1y
         d2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDvDPLCLAPPvF5TVvL+FWbJtEqmbYVODvwDkJg3SqIo=;
        b=V0gUnFf+ZUVuw8viTNruY7yRBkiGfY1SfomCjRYb4Lpf8gigz1GwnEzwz07jjRs33k
         q+PilcWEc3M/KJx5OLb2fYMXnjXgB8ITWXagY3HLh8jd+gEBoBajUlmzOipQV2okyqbj
         dAOSIYnS4mHdBvHKFfAM0LgmrNJW4CTUfQ5qiBamvanihlLz8tR7C9+9atfwnj23vptl
         pyZfQqqwODkdDd4m0mifiRvD4RoLEvqCL/g44i8vsgyOnKkgMvbe8yfKMj+PgfshSxE7
         XjUkK+zAhY1A48QIk5r2BY6X9v6dRNhdkRk2ARG/P2UQdv5jCutf7Fbf1LHkXrIfg1Et
         +f7A==
X-Gm-Message-State: ACrzQf1qFlDMVO/dJnhSKjNrBZ5oj1g+DA+zSC29Ky16mFc64t+7H8CV
	c6nVeCHuonSOcIqTN5/AVDQ=
X-Google-Smtp-Source: AMsMyM7Y6pAnL5W1EJS9G7oSUu8S6FVrr9k2c5r6QKOELR9o0pNGH3yk7s3YJUqb5vMyZxDtzUjxCg==
X-Received: by 2002:a63:4949:0:b0:442:b733:2fae with SMTP id y9-20020a634949000000b00442b7332faemr18227721pgk.424.1665446520354;
        Mon, 10 Oct 2022 17:02:00 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id v29-20020aa799dd000000b0056258a3606csm7454081pfi.215.2022.10.10.17.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 17:01:59 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:01:27 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0SyVwjDl7NGfTPn@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Horatiu Vultur <horatiu.vultur@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de
 >, Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-rpi-kernel@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Alexandre Belloni <alexandre.belloni@bootli
 n.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, openbmc@
 lists.ozlabs.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f8041d4898d1..60a60e2d60c5 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -10,8 +10,9 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/file.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio.h>
> +#include <linux/hte.h>

Ok with the hte re-order.

But moving the gpio subsystem header after the gpio/driver is not
alphabetical ('.' precedes '/') and it read better and made more sense
to me the way it was.

>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
>  #include <linux/kernel.h>
> @@ -20,11 +21,12 @@
>  #include <linux/mutex.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/poll.h>
> +#include <linux/seq_file.h>

I wasn't aware that we use anything from seq_file.
What am I missing?

Cheers,
Kent.

>  #include <linux/spinlock.h>
>  #include <linux/timekeeping.h>
>  #include <linux/uaccess.h>
>  #include <linux/workqueue.h>
> -#include <linux/hte.h>
> +
>  #include <uapi/linux/gpio.h>
>  
>  #include "gpiolib.h"
> -- 
> 2.35.1
> 
