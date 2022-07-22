Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1158389A
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQk0r7Cz2xkr
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TOvvu0ql;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=dinguyen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TOvvu0ql;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqCc13rTrz2xkC
	for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Jul 2022 01:12:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3E43BB828C1;
	Fri, 22 Jul 2022 15:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E56C341C6;
	Fri, 22 Jul 2022 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658502762;
	bh=QNDA1Wl/P9Tdabb9er+hcjmLg+ZWPQYKQjQn31syPZs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TOvvu0qlyhr+tmgrzFarODSHy2nmwd/vZkaOfw7UOlCrWttzwGKU19rg8AV7A8T7i
	 IfjgWg0t2g4Ij3/wDGk0CzmXgSTPXgE3n1u2iwGUjmleTogf4uINMSXjxmVGVqzSDf
	 NdnzljfzlPJdmijyVLMwEzZZ53euLLK3T+7lg1++pTTDKLDbOWkoP2Kq2RUZ3s84P6
	 FBICts7HV/wapVFQ1AVuS+EXg97CVEyaQ8kbfAxQREHvjUc07BdPWl0gXMD41NG9LD
	 308lnEB6RcxuafVaPDXSt3EJNt5k6THt96Bq2WKrP+Lj0X4kKIL9pRDDVTaN2puF9b
	 HBK7vSUuswD+Q==
Message-ID: <8430301c-3682-fde0-4bf3-033450563be3@kernel.org>
Date: Fri, 22 Jul 2022 10:12:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom
 .com, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 7/21/22 09:13, Arnd Bergmann wrote:
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
> ---
>   arch/arm/configs/am200epdkit_defconfig    |  26 ++---
>   arch/arm/configs/aspeed_g4_defconfig      |  16 +--
>   arch/arm/configs/aspeed_g5_defconfig      |  16 +--
>   arch/arm/configs/assabet_defconfig        |   8 +-
>   arch/arm/configs/at91_dt_defconfig        |  10 +-
>   arch/arm/configs/axm55xx_defconfig        |  22 ++--
>   arch/arm/configs/badge4_defconfig         |   8 +-
>   arch/arm/configs/bcm2835_defconfig        |  36 +++----
>   arch/arm/configs/cerfcube_defconfig       |  16 +--
>   arch/arm/configs/clps711x_defconfig       |   2 +-
>   arch/arm/configs/cm_x300_defconfig        |  26 ++---
>   arch/arm/configs/cns3420vb_defconfig      |  18 ++--
>   arch/arm/configs/colibri_pxa270_defconfig |  32 +++---
>   arch/arm/configs/colibri_pxa300_defconfig |  10 +-
>   arch/arm/configs/collie_defconfig         |  20 ++--
>   arch/arm/configs/corgi_defconfig          |  44 ++++----
>   arch/arm/configs/davinci_all_defconfig    |  26 ++---
>   arch/arm/configs/dove_defconfig           |  28 ++---
>   arch/arm/configs/ep93xx_defconfig         |  16 +--
>   arch/arm/configs/eseries_pxa_defconfig    |  26 ++---
>   arch/arm/configs/exynos_defconfig         |  20 ++--
>   arch/arm/configs/ezx_defconfig            |  72 ++++++-------
>   arch/arm/configs/footbridge_defconfig     |  14 +--
>   arch/arm/configs/h3600_defconfig          |  10 +-
>   arch/arm/configs/h5000_defconfig          |  18 ++--
>   arch/arm/configs/hackkit_defconfig        |   4 +-
>   arch/arm/configs/hisi_defconfig           |  24 ++---
>   arch/arm/configs/imx_v4_v5_defconfig      |   8 +-
>   arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
>   arch/arm/configs/integrator_defconfig     |   2 +-
>   arch/arm/configs/iop32x_defconfig         |  20 ++--
>   arch/arm/configs/jornada720_defconfig     |  10 +-
>   arch/arm/configs/keystone_defconfig       |  62 +++++------
>   arch/arm/configs/lart_defconfig           |   6 +-
>   arch/arm/configs/lpc18xx_defconfig        |  12 +--
>   arch/arm/configs/lpc32xx_defconfig        |   8 +-
>   arch/arm/configs/lpd270_defconfig         |   6 +-
>   arch/arm/configs/lubbock_defconfig        |  10 +-
>   arch/arm/configs/magician_defconfig       |  30 +++---
>   arch/arm/configs/mainstone_defconfig      |   4 +-
>   arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
>   arch/arm/configs/mini2440_defconfig       |   6 +-
>   arch/arm/configs/mmp2_defconfig           |  28 ++---
>   arch/arm/configs/moxart_defconfig         |  18 ++--
>   arch/arm/configs/mps2_defconfig           |  14 +--
>   arch/arm/configs/multi_v4t_defconfig      |   4 +-
>   arch/arm/configs/multi_v5_defconfig       |  12 +--
>   arch/arm/configs/multi_v7_defconfig       |  62 +++++------
>   arch/arm/configs/mv78xx0_defconfig        |  32 +++---
>   arch/arm/configs/mvebu_v5_defconfig       |  28 ++---
>   arch/arm/configs/mvebu_v7_defconfig       |   2 +-
>   arch/arm/configs/mxs_defconfig            |   4 +-
>   arch/arm/configs/neponset_defconfig       |  24 ++---
>   arch/arm/configs/netwinder_defconfig      |  10 +-
>   arch/arm/configs/nhk8815_defconfig        |   6 +-
>   arch/arm/configs/omap1_defconfig          |  74 ++++++-------
>   arch/arm/configs/omap2plus_defconfig      |  16 +--
>   arch/arm/configs/orion5x_defconfig        |  32 +++---
>   arch/arm/configs/oxnas_v6_defconfig       |  14 +--
>   arch/arm/configs/palmz72_defconfig        |  14 +--
>   arch/arm/configs/pcm027_defconfig         |  22 ++--
>   arch/arm/configs/pleb_defconfig           |   6 +-
>   arch/arm/configs/pxa168_defconfig         |  18 ++--
>   arch/arm/configs/pxa255-idp_defconfig     |  10 +-
>   arch/arm/configs/pxa3xx_defconfig         |  18 ++--
>   arch/arm/configs/pxa910_defconfig         |  22 ++--
>   arch/arm/configs/pxa_defconfig            | 126 +++++++++++-----------
>   arch/arm/configs/qcom_defconfig           |  60 +++++------
>   arch/arm/configs/realview_defconfig       |   8 +-
>   arch/arm/configs/rpc_defconfig            |  18 ++--
>   arch/arm/configs/s3c2410_defconfig        |   8 +-
>   arch/arm/configs/s3c6400_defconfig        |   2 +-
>   arch/arm/configs/s5pv210_defconfig        |   4 +-
>   arch/arm/configs/sama5_defconfig          |   8 +-
>   arch/arm/configs/sama7_defconfig          |   8 +-
>   arch/arm/configs/shannon_defconfig        |   8 +-
>   arch/arm/configs/simpad_defconfig         |  18 ++--
>   arch/arm/configs/socfpga_defconfig        |   4 +-

for socfpga

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
