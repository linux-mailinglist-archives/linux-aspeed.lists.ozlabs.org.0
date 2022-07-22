Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED6583898
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 08:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgQb45FYz2xk5
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jul 2022 16:16:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=csPHM7UU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=csPHM7UU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq0kZ2z5Hz2ywV
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 17:02:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 448CCB8275E
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 07:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF59C341CA
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658473361;
	bh=iotqH2KQue2AiSu+Cjadhr0GvbjJVQjBtGSTWOoab/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=csPHM7UUPMgnnpmrq0eP44ROWe289Uv5gBIMKr5JRPFWBo/Nlr8ILbmJ4f36eKG6r
	 v8AVC73hwjVUIPp9uj1mz1As8NUsg744UdB6qUex0JzEz06jgX7LpYrfL9rvkq4+A5
	 naNl6uOSzXDwWQEHvDIQQsOyei+sqoIzDGi9Opl8UjIrf9oDgJcC/3NTv/vRQ6cfM+
	 Z/PzFJlnsjWMgQLbf4qLR5eTZftn+1VsBoC9wo3UicxwRa/yOI8wgGXeA2ENwq/fGm
	 Xn2J/7pJUVPlPf9P7tWmVKyESIZzZLmOArA7Pe3goLljTMT38XkANiwZMf2RCJ0dnk
	 e8b8nBE6pnVWQ==
Received: by mail-yb1-f171.google.com with SMTP id k85so6591163ybk.7
        for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 00:02:41 -0700 (PDT)
X-Gm-Message-State: AJIora/yqOiTXWo20LvoIGeO7Z4LQaB8KmncnewmnuTUDuG1NuvNJpzh
	6sbH81Hgnsg3dmL2soEkU4dds9a6zSKymo3ixeg=
X-Google-Smtp-Source: AGRyM1tWrEXcUTSnTrmZZLEQML12zznS5gM3uAMpW8cF4DVN1GJxIS8qAIorEs3cjMnhQmpiC3ITqi37eiY9KARJUac=
X-Received: by 2002:a25:3841:0:b0:670:a1b9:f18e with SMTP id
 f62-20020a253841000000b00670a1b9f18emr1789926yba.480.1658473349878; Fri, 22
 Jul 2022 00:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220721141325.2413920-1-arnd@kernel.org> <20220721141325.2413920-2-arnd@kernel.org>
 <9321ce6c-7565-a7eb-2bfe-dac144ab7733@broadcom.com> <9e872a00-966a-aaf8-7bb9-6627fcb0cf83@linaro.org>
In-Reply-To: <9e872a00-966a-aaf8-7bb9-6627fcb0cf83@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jul 2022 09:02:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jF=7atLkWKwrvgYLcZuEObbMF79cbj0XaFEiVw40Piw@mail.gmail.com>
Message-ID: <CAK8P3a3jF=7atLkWKwrvgYLcZuEObbMF79cbj0XaFEiVw40Piw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
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
 -Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <scott.branden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguy
 en <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 21, 2022 at 5:36 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/07/2022 17:33, Scott Branden wrote:
> > Hi Arnd,
> >
> > On 2022-07-21 07:13, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> A lot of Kconfig options have changed over the years, and we tend
> >> to not do a blind 'make defconfig' to refresh the files, to ensure
> >> we catch options that should not have gone away.
> >>
> >> I used some a bit of scripting to only rework the bits where an
> >> option moved around in any of the defconfig files, without also
> >> dropping any of the other lines, to make it clearer which options
> >> we no longer have.
> > Resync is fine.  But, it would be great if the defconfig files were kept
> > in sync. Almost every kernel version kconfig options change which affect
> > these files. Could we put in place a defconfig refresh per kernel
> > version to keep them all in sync going forward?
> >
>
> Not entirely, because some Kconfig changes are causing symbols to
> disappear. Also defconfig is expected to include user-visible options,
> even if savedefconfig would drop them.
>
> This is why blind savedefconfig is not acceptable.

Right. I mostly scripted the changes to move the options around, but
had to do a few files manually so I can't fully automate this, and
the removed options always need manual inspection. There are still
around 400 lines in the defconfig files that go away after a
savedefconfig, and it's a lot of work to go through those.

I might do a few more of these, but if anyone wants to help, these
are the most common lines that get dropped, sorted by frequency:

     34 -# CONFIG_VGA_CONSOLE is not set
     32 -CONFIG_NET_ETHERNET=y
     26 -CONFIG_NFS_V3=y
     22 -# CONFIG_CRYPTO_ANSI_CPRNG is not set
     20 -CONFIG_PM=y
     18 -CONFIG_FPE_NWFPE=y
     18 -# CONFIG_INET_XFRM_MODE_TUNNEL is not set
     18 -# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
     18 -# CONFIG_INET_XFRM_MODE_BEET is not set
     15 -CONFIG_SYSFS_DEPRECATED_V2=y
     15 -CONFIG_DEBUG_KERNEL=y
     15 -# CONFIG_BLK_DEV_BSG is not set
     14 -# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
     14 -# CONFIG_INPUT_MOUSEDEV is not set
     12 -CONFIG_LEDS=y
     12 -CONFIG_AEABI=y
     11 -CONFIG_NET_PCMCIA=y
     11 -CONFIG_GPIO_SYSFS=y
     10 -# CONFIG_ENABLE_MUST_CHECK is not set
      9 -CONFIG_LEDS_CPU=y
      9 -# CONFIG_EXT3_FS_XATTR is not set
      8 -CONFIG_CRYPTO_SHA512=m
      8 -CONFIG_BINFMT_AOUT=y
      8 -# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
      7 -CONFIG_SND_PCM_OSS=m
      7 -CONFIG_SND_MIXER_OSS=m
      7 -CONFIG_SMB_FS=m
      7 -CONFIG_MTD_M25P80=y
      6 -CONFIG_NET_PCI=y
      6 -CONFIG_CRYPTO_ECB=m
      5 -CONFIG_SECCOMP=y
      5 -CONFIG_MEDIA_CAMERA_SUPPORT=y
      5 -CONFIG_IPV6=y
      5 -CONFIG_CRYPTO_TEA=m
      5 -CONFIG_CRYPTO_SHA256=m
      5 -CONFIG_CRYPTO_KHAZAD=m
      5 -CONFIG_CRYPTO_ARC4=m
      5 -CONFIG_BACKLIGHT_PWM=y
      5 -# CONFIG_NET_CADENCE is not set

The majority of these lines are options that no longer exist and are
not needed, or things that dropped off because they get selected by
something else.

The interesting ones we need to catch are the ones that should be
enabled but are either renamed to something else or gained a
dependency that now also needs to be turned on.

           Arnd
