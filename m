Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F3583897
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQX3Lc8z2xHj
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NkTiTfrr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NkTiTfrr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lpl0L3qR8z2xkZ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 06:43:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40905B8267F
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 20:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC680C341D1
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658436220;
	bh=IXAnQ6GemUSS9XzXU96zGBYCowAVAOwBRn59x35Rp2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NkTiTfrrxj1iU+b+r0b0ntp39t/E1hEi2Xj50vKZ6wptqB0NSuEUpNXGr2KjPG7Q4
	 1irccpqlKdKeRDrOuI0QeuJBWKWaTWYrA8FKMLdlqg5+LadBNKjYslU9SvljhG9O6G
	 v0chW+z+igz4p0c6pHxFDQpH8gJnA/o1+WnIaUkyztEi0cNY5L69WREyQfaUW7j9aZ
	 vn9fz6HMXYPol0rC8GWbkwJOKEc8+FYNjD7VS1JWUS1nmzsq6LHgvIqrz83gSGP3vD
	 BGL5JPXkpHPmDmSQjofNfUIyTidrNqQlWMfGhnwvYRDVY3y142pFzvxVKOfElvYZl8
	 0BopXP0GcsHvg==
Received: by mail-yb1-f176.google.com with SMTP id b143so3566992yba.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 13:43:40 -0700 (PDT)
X-Gm-Message-State: AJIora9rI8FET/UPEAfWlA47V2YXIJWHkUq0f/lp1hal8pYcKQHdzZf4
	1W9xDG1Yyg+SOAs/LGnkzyQgSHJ0cF+9TEMOjL8=
X-Google-Smtp-Source: AGRyM1seo9DqPLT2Y67c1F9GPoLfoH/Dg7y5rc4GhGQoQDEAaUTYumu5ZH8+R/xhfkBTlrUa8ZxdgCiDlkpRaThuTk0=
X-Received: by 2002:a81:6dce:0:b0:31e:5a3b:d3a2 with SMTP id
 i197-20020a816dce000000b0031e5a3bd3a2mr305661ywc.495.1658436209315; Thu, 21
 Jul 2022 13:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220721141325.2413920-1-arnd@kernel.org> <20220721141325.2413920-5-arnd@kernel.org>
 <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
In-Reply-To: <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Jul 2022 22:43:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
Message-ID: <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Linux-sh list <linux-sh@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen
 -Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel
  Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 21, 2022 at 5:42 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/07/2022 16:13, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
> > explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> > DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.
> >
> > This was actually not what I had in mind when I suggested making
> > it a 'choice' statement, but it's too late to change again now,
> > and the Kconfig logic is more sensible in the new form.
> >
> > Change any defconfig file that had CONFIG_DEBUG_INFO enabled
> > but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
> > default.
>
> I think this should be split - into remove DEBUG_INFO (noop) and into
> selecting CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT (a fix).

I'd rather keep them together: while removing the DEBUG_INFO is
now a NOP, keeping the two changes together explains much better
why this is done and is atomically needed based on the single patch
that caused the change.

It's the same with the LEDS patch that replaces the CONFIG_LEDS
option with CONFIG_NEW_LEDS.

       Arnd
