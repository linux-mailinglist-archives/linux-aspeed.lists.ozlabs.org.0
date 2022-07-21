Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DB58388B
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgPp1dMgz2xJH
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:15:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.24; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpZsJ2R6fz3bc1
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 00:37:07 +1000 (AEST)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MdNTy-1nfTWo0ezQ-00ZMBK for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul
 2022 16:37:02 +0200
Received: by mail-yb1-f172.google.com with SMTP id 6so3074863ybc.8
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 07:37:01 -0700 (PDT)
X-Gm-Message-State: AJIora/J/Y1C7I7hYBCQrqYXf/VoewyP1myXCeiv4C027d0XL7ggB+0y
	smUrjfIzFiTKFFpxgbHeD+R+OOQKuaTrY20ydHM=
X-Google-Smtp-Source: AGRyM1sipmxaJDGQ/BXJ6IogC7daDCl2+j4F9uhSVcXz89KYHnAMaLqcK10XehN8TJ/WBsHB+lO9Dw0DiPklmfIK8Mk=
X-Received: by 2002:a81:493:0:b0:31e:6ab9:99a5 with SMTP id
 141-20020a810493000000b0031e6ab999a5mr8799929ywe.209.1658414210293; Thu, 21
 Jul 2022 07:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220721141325.2413920-1-arnd@kernel.org> <20220721141325.2413920-2-arnd@kernel.org>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Jul 2022 16:36:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2X7unsa2N5ynkUdk6H1=GZiWTyKBiLrDjQirAc9nfKhg@mail.gmail.com>
Message-ID: <CAK8P3a2X7unsa2N5ynkUdk6H1=GZiWTyKBiLrDjQirAc9nfKhg@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
To: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:oj1ihBOhA+XGrlIRMZyAckjCzeU2+N1WtCMvE3/E4dq1n4Ssp6I
 6Rt8lam9YezpQn3ipv21OMpP/uxjJ2C/trCDrGghl6LL3qWn8weiLFGzMNAlqJBxgFd4V0z
 G+ki58COR8REXKoBuL2V+1STqrMuzTSD2sZ5nVku6WfbfIrCQiTX47P5zye6zZz8BXLUw2E
 MojraMN1n5HUwBsE1gIdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jadX+ctNUgw=:/fdDz3wzxf+gPZV5fRnzCr
 gWNehjyrDfAExp0yLX9L4LWUjqzW3cO7m3MjLie8Wkul19yVg8ko1uzLKO2Hci2ifBIxkWU5t
 f+hoiwge/TYXZSaWLsnAURrrnvupiHjc8UorCbY4rLIZPZL15Vk7wUMv4t03HcA73ckxqRzHv
 CSv+AsUh+uygKdJS6teciMwQLJ/o0FCp3Or7EMlhHUQvrYrNscjWonHiwXl29RxrU/7eUojS8
 WJATvdIasQ94WgqiCtpMjwTgZARAuIeczcq5acE2TUgKqBl69QtlfVAlSR7RKUJ0QkJDoweuR
 s5MA1NidHOJ7wLSXQi5GRalfSMh4qaBuBz0VgJVxJdHECuRwCGmgfD/fq5UtcJoDpurpY3+qO
 znfdhBKHT8tV6O04NYvCm3ZbmYXi02xkRI6SZ0M4PsOTC9kk3URoNqsRbv0o+1GVeZirR/TFp
 qe8tPOgUIrCJugUU7H8lZKaMvNivEVoYFbjGxQNwE7sZLFBP0i8fzbz4oAh6spUbuq8aqxEIi
 +ESEHRt00WOysxHmKP0S9oQBFMe6L0SR0/S1/EOWh4i7S1r3NYK54R82xF534Txd+RaO8U9wf
 QOLREtDx/Pwap7jJCsvkkOWiogN6MEh4S1Pcl4SsU2+cH969gG+HoehOXSqXdjuXuYQv7OzUK
 b+IBdd21jSp69WZ/lF1qjvN3p6iLUeicRSXfAq0JwAzYFThS6nPoxaw0FfVtyGJzYX3xbijJK
 bLm76uqmqLlccTjBkON+Z/jrgS54Jj7zqoZ99ElIsE18x/erIFj5oTlT7ytykx6mcimS3Z88t
 w5eEgul/+kvCM4NRuhnDIHcune32YlvPUImx4HbqGm5yX9rKSJabZthOplOAvjZh5mMxk40YI
 Atn/gEIcD3yFhZCz4mWhzVwQRcGcmEEdA4sP7ZJzs=
X-Mailman-Approved-At: Thu, 28 Jul 2022 16:15:35 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Linux-sh list <linux-sh@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen
 -Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Ke
 rnel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 21, 2022 at 4:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
>
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Apparently this patch got a little large and was rejected by some of
the mailing lists, in case someone wonders what happened.
Fortunately the contents  don't actually matter here, as I'm just
reordering the lines as seen in the diffstat.

        Arnd

> ---
>  arch/arm/configs/am200epdkit_defconfig    |  26 ++---
>  arch/arm/configs/aspeed_g4_defconfig      |  16 +--
>  arch/arm/configs/aspeed_g5_defconfig      |  16 +--
>  arch/arm/configs/assabet_defconfig        |   8 +-
>  arch/arm/configs/at91_dt_defconfig        |  10 +-
>  arch/arm/configs/axm55xx_defconfig        |  22 ++--
>  arch/arm/configs/badge4_defconfig         |   8 +-
>  arch/arm/configs/bcm2835_defconfig        |  36 +++----
>  arch/arm/configs/cerfcube_defconfig       |  16 +--
>  arch/arm/configs/clps711x_defconfig       |   2 +-
>  arch/arm/configs/cm_x300_defconfig        |  26 ++---
>  arch/arm/configs/cns3420vb_defconfig      |  18 ++--
>  arch/arm/configs/colibri_pxa270_defconfig |  32 +++---
>  arch/arm/configs/colibri_pxa300_defconfig |  10 +-
>  arch/arm/configs/collie_defconfig         |  20 ++--
>  arch/arm/configs/corgi_defconfig          |  44 ++++----
>  arch/arm/configs/davinci_all_defconfig    |  26 ++---
>  arch/arm/configs/dove_defconfig           |  28 ++---
>  arch/arm/configs/ep93xx_defconfig         |  16 +--
>  arch/arm/configs/eseries_pxa_defconfig    |  26 ++---
>  arch/arm/configs/exynos_defconfig         |  20 ++--
>  arch/arm/configs/ezx_defconfig            |  72 ++++++-------
>  arch/arm/configs/footbridge_defconfig     |  14 +--
>  arch/arm/configs/h3600_defconfig          |  10 +-
>  arch/arm/configs/h5000_defconfig          |  18 ++--
>  arch/arm/configs/hackkit_defconfig        |   4 +-
>  arch/arm/configs/hisi_defconfig           |  24 ++---
>  arch/arm/configs/imx_v4_v5_defconfig      |   8 +-
>  arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
>  arch/arm/configs/integrator_defconfig     |   2 +-
>  arch/arm/configs/iop32x_defconfig         |  20 ++--
>  arch/arm/configs/jornada720_defconfig     |  10 +-
>  arch/arm/configs/keystone_defconfig       |  62 +++++------
>  arch/arm/configs/lart_defconfig           |   6 +-
>  arch/arm/configs/lpc18xx_defconfig        |  12 +--
>  arch/arm/configs/lpc32xx_defconfig        |   8 +-
>  arch/arm/configs/lpd270_defconfig         |   6 +-
>  arch/arm/configs/lubbock_defconfig        |  10 +-
>  arch/arm/configs/magician_defconfig       |  30 +++---
>  arch/arm/configs/mainstone_defconfig      |   4 +-
>  arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
>  arch/arm/configs/mini2440_defconfig       |   6 +-
>  arch/arm/configs/mmp2_defconfig           |  28 ++---
>  arch/arm/configs/moxart_defconfig         |  18 ++--
>  arch/arm/configs/mps2_defconfig           |  14 +--
>  arch/arm/configs/multi_v4t_defconfig      |   4 +-
>  arch/arm/configs/multi_v5_defconfig       |  12 +--
>  arch/arm/configs/multi_v7_defconfig       |  62 +++++------
>  arch/arm/configs/mv78xx0_defconfig        |  32 +++---
>  arch/arm/configs/mvebu_v5_defconfig       |  28 ++---
>  arch/arm/configs/mvebu_v7_defconfig       |   2 +-
>  arch/arm/configs/mxs_defconfig            |   4 +-
>  arch/arm/configs/neponset_defconfig       |  24 ++---
>  arch/arm/configs/netwinder_defconfig      |  10 +-
>  arch/arm/configs/nhk8815_defconfig        |   6 +-
>  arch/arm/configs/omap1_defconfig          |  74 ++++++-------
>  arch/arm/configs/omap2plus_defconfig      |  16 +--
