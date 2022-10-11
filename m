Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096D5FB137
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 13:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtR56dQPz2xZf
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Oct 2022 22:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4RiRWBUe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::e34; helo=mail-vs1-xe34.google.com; envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4RiRWBUe;
	dkim-atps=neutral
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmn420Kqwz3bZY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Oct 2022 18:10:24 +1100 (AEDT)
Received: by mail-vs1-xe34.google.com with SMTP id 126so13362203vsi.10
        for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Oct 2022 00:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hR10MCfKc0ztXjq47GD8zFditl1Aj/34QtnbEQxfSWk=;
        b=4RiRWBUeekVItBZL5lSfz4vYKqusTUXhLGqZVHfzXFKDBy9uQ/d4Xx9PRZ9SQ46mVH
         IllsaBYuBLWfolYDUsvd8WUq0ne7lOofs8y9bcpDOHmNbECpLVAI3P8bGaDErRktQ16D
         37NP3ZIcDYdhQdi3Y6HBZGzIgLdfOAdDZPvxHx53/i/6SxiilxCbUlD+RyVd0hE1wZs9
         t6j4ZpsGZbtXQuwQE5M9KIRwO2J6uH5IJGhVFlm888/JWYDwEMFIwLSTvJQOSzGWsRVj
         6S3KidvGKROoMwkxEyqX5t/0vIC6AaOKHceFQYhp32SR5vJAG0xspYqsWBTjnQ5MgJKB
         nkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hR10MCfKc0ztXjq47GD8zFditl1Aj/34QtnbEQxfSWk=;
        b=Yc+TVipo/atPBAaviaRlHQypFV4rBtoI69dJB6lhQ6IuWat7sq5tizEPfpxkGgpaCg
         V20QRXRpr+6sTsS5syh9VBe6SGl1z3bIlEAUTL/8IZLkZCGzbkN+Z7LN02SREGVi3TIe
         ixD9ioKkkRH2wA1LPMjjyfEQ5D24BRvZJBkMyVDyLS1yU+0tEtAmIAWJhSdCvciPlndR
         KJzsre6l4sT9aihwi0yUgqZLZkWMfXjuwlP+OHbo9hjl9N+bmlKb6bDAaNWwGQQHSEHh
         As4FL+MSMieY4GUByjUPHU38fB1Eu0VtIQsFPAhRG1PbZ2pV/tt8K1Q4PlHAEUK0h8Ia
         7BCA==
X-Gm-Message-State: ACrzQf0q4xfdjU4Am/24FprVIltTdIAlFBrUVoRX8/C+usUJE7My1uOW
	tO1MZOEzzKJZknNgFSauBI1jsd5uBIojeE3YpDKl3w==
X-Google-Smtp-Source: AMsMyM7PsJIx7KvJSKcR5Sm5jYifTUaAFKZwO5sWELV0U7Xneak+ug0yvZCAf5s54XIznfiPvGDEs36hK4GxmtQ5LSQ=
X-Received: by 2002:a05:6102:5788:b0:3a6:764d:1382 with SMTP id
 dh8-20020a056102578800b003a6764d1382mr11441112vsb.13.1665472218413; Tue, 11
 Oct 2022 00:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Oct 2022 09:10:07 +0200
Message-ID: <CAMRc=Mc5t=R2pJYfHUntJj_UA3sL=sKGOQDL-Kf5=dfNJEKyvg@mail.gmail.com>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
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
 x Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-rpi-kernel@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Alexand
 re Belloni <alexandre.belloni@bootlin.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org, Marc 
 Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Currently the header inclusion inside the pinctrl headers seems more arbitrary
> than logical. This series is basically out of two parts:
> - add missed headers to the pin control drivers / users
> - clean up the headers of pin control subsystem
>
> The idea is to have this series to be pulled after -rc1 by the GPIO and
> pin control subsystems, so all new drivers will utilize cleaned up headers
> of the pin control.
>
> Please, review and comment.
>
> Changelog v2:
> - added preparatory patches: all, but last (LKP)
> - added missed forward declaration to the last patch (LKP)
>

Thanks for doing this. Did you use any kind of automation for
detecting for which symbols the headers are missing?

Bart
