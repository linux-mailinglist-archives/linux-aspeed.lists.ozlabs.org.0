Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AC58388C
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgPs2xtyz2xJ6
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NmgQ5Wvu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NmgQ5Wvu;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpbSQ3d9Fz3bsK
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 01:04:05 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id mf4so3688305ejc.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZY3t0NZGuTXsMWoX5QYWqWMtkxGTr+i/nc1XlDM8Y4=;
        b=NmgQ5WvuD8XqtCLLQuc6YUtqO0ImP9P0gljqHUyvnWjzwyFODmpUxqKyeGPpAc9cXC
         Yb5y2d5LWhWPIY4F/+7CH4r/8gGB/HM9GVwBsWsXHyE5jms4sSkSwE6lyuCaWSF450WD
         EdCxSH0zb68yesikhcpmtdXjhpdpLSBGyP279WP5/CHD9tXIayCrsVAhuKP82sP6NI2x
         pEOVEKiAcq+YN6aQUgOICVdp+1bTikZF7+UVgAOGVZBpqK3tAztbVluyVm0RM9YIkym6
         cb1zde7IGcSvaL0JptydfsA2H/6GyOikZZwFVu8Qr8DeJ+FoT5FmPShXTQ+PQnyaTjaU
         QbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZY3t0NZGuTXsMWoX5QYWqWMtkxGTr+i/nc1XlDM8Y4=;
        b=po2QT6qSSp1vKLDxhJD4vfzdlXBaEYeMSHO+MlvCVonOYU7rhIfp07tAFsVsUO4hAD
         K+GD+DvrQ6UpIBMPxALj1lsdL/oH9MkmvhAXjClKTqOySgtPIQP2U1Li4ka8Zz+kAuvY
         HPGqMhg6ntsdUfobxhlEMTO5yMl/JTjtDoIc6Lp9nsAhThMr1GrD8070mHCFhFiTo1IZ
         5I1J2DDX01qHzZKrE7H6aYpDqkBpxhKizhQOr9QaXxkheUBLE7zpNgXe7PtoLqbir9CA
         iK5k3TKSAaAR/P/y7WOqhQFLEhE2zoQ2cUiMqelXQM7xMv6XiWPFu5mcU045HWsYjw60
         jAPQ==
X-Gm-Message-State: AJIora+nuDn+NFMaba398S35LYSrVI9eqU/UhvMheyQQYzQbxkXILWNq
	QHhlQrvZZZNQn/NnGg3R9ng=
X-Google-Smtp-Source: AGRyM1tx4qgDiPlw73OnGDJULo2qk1SNBkaYXmyBBcKtmntG8pWEIhoIv9VtYkaGcyjuJQmc48QmDQ==
X-Received: by 2002:a17:907:75ce:b0:72b:305f:5985 with SMTP id jl14-20020a17090775ce00b0072b305f5985mr40127216ejc.527.1658415841341;
        Thu, 21 Jul 2022 08:04:01 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-13-89.dynamic.telemach.net. [86.58.13.89])
        by smtp.gmail.com with ESMTPSA id w17-20020a056402071100b0043aa17dc199sm1097785edx.90.2022.07.21.08.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:04:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
Date: Thu, 21 Jul 2022 17:03:56 +0200
Message-ID: <2073800.OBFZWjSADL@jernej-laptop>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
References: <20220721141325.2413920-1-arnd@kernel.org> <20220721141325.2413920-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>, l
 inux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Dne =C4=8Detrtek, 21. julij 2022 ob 16:13:20 CEST je Arnd Bergmann napisal(=
a):
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
>=20
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
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
>  arch/arm/configs/orion5x_defconfig        |  32 +++---
>  arch/arm/configs/oxnas_v6_defconfig       |  14 +--
>  arch/arm/configs/palmz72_defconfig        |  14 +--
>  arch/arm/configs/pcm027_defconfig         |  22 ++--
>  arch/arm/configs/pleb_defconfig           |   6 +-
>  arch/arm/configs/pxa168_defconfig         |  18 ++--
>  arch/arm/configs/pxa255-idp_defconfig     |  10 +-
>  arch/arm/configs/pxa3xx_defconfig         |  18 ++--
>  arch/arm/configs/pxa910_defconfig         |  22 ++--
>  arch/arm/configs/pxa_defconfig            | 126 +++++++++++-----------
>  arch/arm/configs/qcom_defconfig           |  60 +++++------
>  arch/arm/configs/realview_defconfig       |   8 +-
>  arch/arm/configs/rpc_defconfig            |  18 ++--
>  arch/arm/configs/s3c2410_defconfig        |   8 +-
>  arch/arm/configs/s3c6400_defconfig        |   2 +-
>  arch/arm/configs/s5pv210_defconfig        |   4 +-
>  arch/arm/configs/sama5_defconfig          |   8 +-
>  arch/arm/configs/sama7_defconfig          |   8 +-
>  arch/arm/configs/shannon_defconfig        |   8 +-
>  arch/arm/configs/simpad_defconfig         |  18 ++--
>  arch/arm/configs/socfpga_defconfig        |   4 +-
>  arch/arm/configs/spear13xx_defconfig      |  16 +--
>  arch/arm/configs/spear3xx_defconfig       |  10 +-
>  arch/arm/configs/spear6xx_defconfig       |   8 +-
>  arch/arm/configs/spitz_defconfig          |  44 ++++----
>  arch/arm/configs/stm32_defconfig          |  14 +--
>  arch/arm/configs/sunxi_defconfig          |   2 +-

=46or sunxi:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  arch/arm/configs/tct_hammer_defconfig     |  12 +--
>  arch/arm/configs/tegra_defconfig          |  18 ++--
>  arch/arm/configs/trizeps4_defconfig       |  58 +++++-----
>  arch/arm/configs/u8500_defconfig          |   2 +-
>  arch/arm/configs/versatile_defconfig      |   4 +-
>  arch/arm/configs/vexpress_defconfig       |   4 +-
>  arch/arm/configs/vf610m4_defconfig        |   2 +-
>  arch/arm/configs/viper_defconfig          |  28 ++---
>  arch/arm/configs/vt8500_v6_v7_defconfig   |   2 +-
>  arch/arm/configs/xcep_defconfig           |  30 +++---
>  arch/arm/configs/zeus_defconfig           |  26 ++---



