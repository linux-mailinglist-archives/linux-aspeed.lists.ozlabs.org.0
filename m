Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D1583896
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQT62j2z2xkj
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20210112.gappssmtp.com header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jhIuTJl9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=narmstrong@baylibre.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20210112.gappssmtp.com header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jhIuTJl9;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lpg3Y5pjBz3c4B
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 03:46:13 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id b21-20020a05600c4e1500b003a32bc8612fso1215095wmq.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=9Iej/WYKS186ZTIm2THeqOrl8G6w6VDAXbCGSBDKlsE=;
        b=jhIuTJl9aRW4WFl89NsrDCv9dQz8pHZl66IFjsHxjMixSgJz9lLzwOibDGwkTLJ5Fl
         wVnDPPZXZ/6A1pdSNH1QWJYY18xMINsbi9WAFTw1CUL7cPTsfkMatT/UzAEKp7D0PksG
         IZr2IsuDM3wSECNoZThbVAiWRWaD9AWu6MTysK80x5u3wZc5DLKOVTUWcRAQkCuafTjv
         p//5F4a+apzUzcuX7muRFACjMzOJWy9lpTf2vd8/d7c3wrPr9O2Fqq8XPEjkHuMQK9ol
         QBCsreSSVCeHMb2/E7Hib2C7nzIXnGBpJiVuH13CdD8TeKW1N/pRh2bBvH1Ju0uQw604
         0euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=9Iej/WYKS186ZTIm2THeqOrl8G6w6VDAXbCGSBDKlsE=;
        b=5Tywqg/3FAN6BRItmIomudduVAZaYonXvtLE8irUCH5L5AkfsNp/qf+tZlKIv1fcr0
         ZUVMgluNbjtgPDCCQxhg1sP/Ob3VKoJ6JcjnvorZTsLSdQWviA3DLPMY2tUV75V7qqLq
         J/+eK5dQcBXtkQOUghL85qetPZWxrFKGRaZ2eQzYAqviVC3w+3b/ql5ohnjFno4jTB4g
         UQH+9HpzsEEqxGIiB4wRHvGxjLqeCotgweDqH1JOCr3BxOW5CSCK9oRUsieFBY17Toeu
         2qcv9+zXMLp/ymM7Yj6zOwRZlbUHVPPWPFX9+yzxGZ5I/CN5pPwtoP5+/k0s/3T+sAkt
         0R8A==
X-Gm-Message-State: AJIora/LagHY/X8oKN2q6ljKiMdJFDgRrr/TeoeMvhReVLFhQjkrlwYH
	5SSEstmCPLkPPIRDMrCUBWqAtw==
X-Google-Smtp-Source: AGRyM1vYT9HsyJDiMumeq6ZP0TTedC8+wfXcbSJqkoMKwtzqP0FEzOCEjPe89DYK0yAP9uR4EEYY/A==
X-Received: by 2002:a05:600c:3849:b0:3a2:e7fd:e084 with SMTP id s9-20020a05600c384900b003a2e7fde084mr8936796wmr.15.1658425567088;
        Thu, 21 Jul 2022 10:46:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4c23:a5d2:f5f6:4cd7? ([2a01:e0a:982:cbb0:4c23:a5d2:f5f6:4cd7])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b0039db31f6372sm3714925wmq.2.2022.07.21.10.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 10:46:05 -0700 (PDT)
Message-ID: <f6a9757f-7212-d5e2-be30-e2068066339c@baylibre.com>
Date: Thu, 21 Jul 2022 19:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] ARM: defconfig cleanups
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220721141325.2413920-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>, 
 linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In the process of deprecating board files, I had to modify some defconfig
> files and ran into the same problem as everyone else that a lot of
> them are rather outdated. With some scripting, I managed to split out
> a preparation patch that puts all lines into the expected order without
> actually changing the contents.
> 
> This helped doing the cleanup separately per Kconfig option that needed
> to be addressed. I only did a small portion of the follow-up changes
> to get to the point of being able to rebase my board changes on top,
> but I did manage to address some bugs that have crept in.
> 
> If there are no objections, I'd apply this set to the arm/defconfig
> branch of the soc tree directly.
> 
>        Arnd
> 
> Arnd Bergmann (6):
>    ARM: refresh defconfig files
>    ARM: defconfig: remove irda remnants
>    ARM: defconfig: remove stale CONFIG_ZBOOT_ROM entries
>    ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
>    ARM: defconfig: remove broken CONFIG_THUMB disables
>    ARM: defconfig: kill remnants of CONFIG_LEDS
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Alexander Shiyan <shc_work@mail.ru>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
> Cc: Takao Orito <orito.takao@socionext.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-oxnas@groups.io
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> 
>   arch/arm/configs/am200epdkit_defconfig    |  28 ++---
>   arch/arm/configs/aspeed_g4_defconfig      |  17 ++-
>   arch/arm/configs/aspeed_g5_defconfig      |  17 ++-
>   arch/arm/configs/assabet_defconfig        |  19 ++-
>   arch/arm/configs/at91_dt_defconfig        |  10 +-
>   arch/arm/configs/axm55xx_defconfig        |  26 ++--
>   arch/arm/configs/badge4_defconfig         |  17 +--
>   arch/arm/configs/bcm2835_defconfig        |  38 +++---
>   arch/arm/configs/cerfcube_defconfig       |  24 ++--
>   arch/arm/configs/clps711x_defconfig       |   6 +-
>   arch/arm/configs/cm_x300_defconfig        |  28 ++---
>   arch/arm/configs/cns3420vb_defconfig      |  20 ++--
>   arch/arm/configs/colibri_pxa270_defconfig |  41 +++----
>   arch/arm/configs/colibri_pxa300_defconfig |  12 +-
>   arch/arm/configs/collie_defconfig         |  22 ++--
>   arch/arm/configs/corgi_defconfig          |  51 ++++----
>   arch/arm/configs/davinci_all_defconfig    |  28 ++---
>   arch/arm/configs/dove_defconfig           |  32 +++--
>   arch/arm/configs/ep93xx_defconfig         |  18 ++-
>   arch/arm/configs/eseries_pxa_defconfig    |  36 ++----
>   arch/arm/configs/exynos_defconfig         |  24 ++--
>   arch/arm/configs/ezx_defconfig            |  74 ++++++------
>   arch/arm/configs/footbridge_defconfig     |  31 ++---
>   arch/arm/configs/h3600_defconfig          |  16 +--
>   arch/arm/configs/h5000_defconfig          |  20 ++--
>   arch/arm/configs/hackkit_defconfig        |  12 +-
>   arch/arm/configs/hisi_defconfig           |  24 ++--
>   arch/arm/configs/imx_v4_v5_defconfig      |  10 +-
>   arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
>   arch/arm/configs/integrator_defconfig     |   2 +-
>   arch/arm/configs/iop32x_defconfig         |  23 ++--
>   arch/arm/configs/ixp4xx_defconfig         |   1 -
>   arch/arm/configs/jornada720_defconfig     |  16 +--
>   arch/arm/configs/keystone_defconfig       |  64 +++++-----
>   arch/arm/configs/lart_defconfig           |  21 ++--
>   arch/arm/configs/lpc18xx_defconfig        |  16 ++-
>   arch/arm/configs/lpc32xx_defconfig        |  12 +-
>   arch/arm/configs/lpd270_defconfig         |  11 +-
>   arch/arm/configs/lubbock_defconfig        |  21 ++--
>   arch/arm/configs/magician_defconfig       |  41 +++----
>   arch/arm/configs/mainstone_defconfig      |  15 ++-
>   arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
>   arch/arm/configs/mini2440_defconfig       |   8 +-
>   arch/arm/configs/mmp2_defconfig           |  32 +++--
>   arch/arm/configs/moxart_defconfig         |  20 ++--
>   arch/arm/configs/mps2_defconfig           |  18 ++-
>   arch/arm/configs/multi_v4t_defconfig      |   6 +-
>   arch/arm/configs/multi_v5_defconfig       |  14 +--
>   arch/arm/configs/multi_v7_defconfig       |  62 +++++-----
>   arch/arm/configs/mv78xx0_defconfig        |  36 +++---
>   arch/arm/configs/mvebu_v5_defconfig       |  32 +++--
>   arch/arm/configs/mvebu_v7_defconfig       |   4 +-
>   arch/arm/configs/mxs_defconfig            |   6 +-
>   arch/arm/configs/neponset_defconfig       |  30 ++---
>   arch/arm/configs/netwinder_defconfig      |  18 +--
>   arch/arm/configs/nhk8815_defconfig        |   8 +-
>   arch/arm/configs/omap1_defconfig          |  80 ++++++-------
>   arch/arm/configs/omap2plus_defconfig      |  17 ++-
>   arch/arm/configs/orion5x_defconfig        |  36 +++---
>   arch/arm/configs/oxnas_v6_defconfig       |  14 +--
>   arch/arm/configs/palmz72_defconfig        |  16 ++-
>   arch/arm/configs/pcm027_defconfig         |  24 ++--
>   arch/arm/configs/pleb_defconfig           |   8 +-
>   arch/arm/configs/pxa168_defconfig         |  22 ++--
>   arch/arm/configs/pxa255-idp_defconfig     |  21 ++--
>   arch/arm/configs/pxa3xx_defconfig         |  20 ++--
>   arch/arm/configs/pxa910_defconfig         |  26 ++--
>   arch/arm/configs/pxa_defconfig            | 140 ++++++++++------------
>   arch/arm/configs/qcom_defconfig           |  62 +++++-----
>   arch/arm/configs/realview_defconfig       |   8 +-
>   arch/arm/configs/rpc_defconfig            |  20 ++--
>   arch/arm/configs/s3c2410_defconfig        |  12 +-
>   arch/arm/configs/s3c6400_defconfig        |   4 +-
>   arch/arm/configs/s5pv210_defconfig        |   6 +-
>   arch/arm/configs/sama5_defconfig          |   8 +-
>   arch/arm/configs/sama7_defconfig          |   8 +-
>   arch/arm/configs/shannon_defconfig        |  10 +-
>   arch/arm/configs/simpad_defconfig         |  29 ++---
>   arch/arm/configs/socfpga_defconfig        |   8 +-
>   arch/arm/configs/spear13xx_defconfig      |  18 +--
>   arch/arm/configs/spear3xx_defconfig       |  12 +-
>   arch/arm/configs/spear6xx_defconfig       |  10 +-
>   arch/arm/configs/spitz_defconfig          |  51 ++++----
>   arch/arm/configs/stm32_defconfig          |  18 ++-
>   arch/arm/configs/sunxi_defconfig          |   2 +-
>   arch/arm/configs/tct_hammer_defconfig     |  14 +--
>   arch/arm/configs/tegra_defconfig          |  20 ++--
>   arch/arm/configs/trizeps4_defconfig       |  66 +++++-----
>   arch/arm/configs/u8500_defconfig          |   2 +-
>   arch/arm/configs/versatile_defconfig      |   4 +-
>   arch/arm/configs/vexpress_defconfig       |   8 +-
>   arch/arm/configs/vf610m4_defconfig        |   2 +-
>   arch/arm/configs/viper_defconfig          |  30 +++--
>   arch/arm/configs/vt8500_v6_v7_defconfig   |   2 +-
>   arch/arm/configs/xcep_defconfig           |  32 +++--
>   arch/arm/configs/zeus_defconfig           |  28 ++---
>   arch/arm64/configs/defconfig              |   2 +-
>   arch/sh/configs/ecovec24_defconfig        |   2 -
>   100 files changed, 989 insertions(+), 1189 deletions(-)
> 

For oxnas:

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
