Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF765FB13C
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtRW3crZz3c16
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:12:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=GEpv88zd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=emil.renner.berthing@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=GEpv88zd;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmptJ1Cf1z2xHw
	for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Oct 2022 19:32:06 +1100 (AEDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1237F3F55D
	for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Oct 2022 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1665477122;
	bh=suNkJ2gh7pPN1oyqI64kbmW+brydF4+SF1qphpgiy1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=GEpv88zdDeOxPK3xTuo13M9BSOFkq1Rtmpzx5WqlaPf28UiHsb41SCsUiyDRNfdSM
	 FPL9FQDmv/RvlmOAJm/G9kLBqjKRJoDexQyomsaNetIL4KyoIOHk49zgQ/xBVKUMVT
	 vBjc+9plY0bx3dnoo8VElZJffLZZv9HKZ8WoSf+qzw5Fkrosbebxz3mBoL6BkW/wuc
	 DZPAb3z8w8ll0b+w81vBHvDNh9SukhneWGpcMOffIpWHs7lEyP47SPTIgYux/kccZf
	 gZRUpwF8VBHoC9gemblMZ2VZFxkhA5OB+L6OAQnu7fkbLzGGe1mbXbNL+MBwxU+3NF
	 GFpOnhjIdMVTw==
Received: by mail-io1-f72.google.com with SMTP id a15-20020a6b660f000000b006a0d0794ad1so8734775ioc.6
        for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Oct 2022 01:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suNkJ2gh7pPN1oyqI64kbmW+brydF4+SF1qphpgiy1g=;
        b=lctJL0i+0so6ynC3yQz65fO0S0EcDxJqRWNbDn/35kVvsFK9tUF8rZOgBpo73Cbp0y
         PnOY8f4YfKxc/pHqnpEt3SAAD6O/aTfoLhSqe7WEupuuN8leD//eqvmnAiztAcIqpCgp
         5lyz5OkIuYVAzHlcjX1UTGVh6ohDbjiI3lG734Ndxpwi9oDT4tnbl07mpBYtG+GoGOdj
         3ahTADEzeXES4VK2jgtnuDhdNsRPd51ewnQZuyXnZG1NbPFD7ehgFnHNTQyVOVfmQq5i
         9KatAA8fUrka56tGmdt6ZGkzWc9hgVbFt4292UbMv6CypmbIN7RZPyvnEvJaiF3WV/oI
         GUGQ==
X-Gm-Message-State: ACrzQf32of5AlFgDFqz7w6ac2Vmt9ncRM4WnaWT4BwhjJBBSt3e5/Y70
	7SHZIYq/4KgI0pTazQ07aXyqNmZcoPdwwzplm02dkWmzhiwuyxdiMSzx2oPje5LR3ePPWLPMZgq
	x2MtXTGwW9masiVopvZJxdvFrN/DMAz8qZU5pfvDoMHNk7oXKS3cIyIiNLxM=
X-Received: by 2002:a05:620a:410f:b0:6cf:c34b:3c64 with SMTP id j15-20020a05620a410f00b006cfc34b3c64mr15570295qko.52.1665477109331;
        Tue, 11 Oct 2022 01:31:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DFTDHgNX/wrj8IAoSXEmta8ySJnv0knkcfflaxkZri8xCwukQw9Ji8irmUndHqkaXm0MlF8+pHua64xb11kk=
X-Received: by 2002:a05:620a:410f:b0:6cf:c34b:3c64 with SMTP id
 j15-20020a05620a410f00b006cfc34b3c64mr15570191qko.52.1665477109055; Tue, 11
 Oct 2022 01:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com> <20221010201453.77401-26-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-26-andriy.shevchenko@linux.intel.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 11 Oct 2022 10:31:33 +0200
Message-ID: <CAJM55Z_ApPowttZrjn_0dUs81H4FfByDfv=fbhvmHquipULANg@mail.gmail.com>
Subject: Re: [PATCH v2 25/36] pinctrl: starfive: Add missed header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Horatiu Vultur <horatiu.vultur@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutroni
 x Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-rpi-kernel@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Nat
 ikar@amd.com>, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org, Marc 
 Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 10 Oct 2022 at 22:26, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, sort headers alphabetically.

The patch is fine, but I don't see any sorting other than just adding
the headers at the appropriate place.
In any case

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 5b544fb7f3d8..6a8a9cfe8965 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -15,8 +15,10 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> +#include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
>
> --
> 2.35.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
