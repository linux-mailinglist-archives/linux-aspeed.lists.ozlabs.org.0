Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FB58388D
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgPv58x9z3bXR
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lpbls6BPwz3byL
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 01:17:27 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8036B23A;
	Thu, 21 Jul 2022 08:16:55 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347213F70D;
	Thu, 21 Jul 2022 08:16:49 -0700 (PDT)
Date: Thu, 21 Jul 2022 16:16:46 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 0/6] ARM: defconfig cleanups
Message-ID: <20220721151646.3xnptk72qhgnrwqw@bogus>
References: <20220721141325.2413920-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721141325.2413920-1-arnd@kernel.org>
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
 .com, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 21, 2022 at 04:13:19PM +0200, Arnd Bergmann wrote:
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
>       Arnd
> 
> Arnd Bergmann (6):
>   ARM: refresh defconfig files
>   ARM: defconfig: remove irda remnants
>   ARM: defconfig: remove stale CONFIG_ZBOOT_ROM entries
>   ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
>   ARM: defconfig: remove broken CONFIG_THUMB disables
>   ARM: defconfig: kill remnants of CONFIG_LEDS
> 

[...]

>  arch/arm/configs/vexpress_defconfig       |   8 +-

For vexpress,

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
