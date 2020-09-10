Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AADA0263B50
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 05:22:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn41l5Y1SzDqb1
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 13:22:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aVrMkYlo; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn41h01S3zDqYb
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 13:21:59 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id gr14so6584751ejb.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Sep 2020 20:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A79j38TeGo0FTeKhZJ6Z5HVKC+rNAm+2XLbIiEuCKUY=;
 b=aVrMkYlo/d+zmyouXTJxSqtB33bFfF1/mNixCVCCODQPmxJhhUiurbpS/1nRAOrm6o
 M8pON54OhrBwxLNcItuOcyfQnJK26edZu8Do4NxxPQoqMoGIeDFGaWwG3ADZCs9fUq1m
 8zuZ4YYIv1t1KKfwfaGw+isSSyNpgR6Cm4ZpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A79j38TeGo0FTeKhZJ6Z5HVKC+rNAm+2XLbIiEuCKUY=;
 b=U++XN3HgVZytb4okoBZsIJQSe6g7zK3CIlHHbHMOnU4XJWsLwEK4gTThjcPGjP8KCQ
 eaRio/LP4G9rbWRMYcZjcx01R+Ojfym3FaGbSkKeWcqxDWjSOgfysqQLpJs3D2MR+0kS
 SjuZbUirLdm/q9eYU1Eqiej8H7nXtQwC7ZTfWsjK3z671kDv/nzoGwcAf3Vbra8xPviF
 RUnyaX2eBSq+OVu6zWTU+GYZ3utMJakMIbEyePNovClykwC0OC/FcLD8+EyV58QW9W5v
 3a4x7O1dFu4dELQIx0uOYHl/jmHHYWbENbHM8Gr3bsQXrga8eGSvWMe9X/ZFUGhZcbNC
 CXdA==
X-Gm-Message-State: AOAM533yWK88hcpQz9Mfn8nkkD8Z2sIUdp80VdrUNkM4pZdRynWd/4Xr
 c9+iT/mCXLFPO5kTn62ipA76Z9qUkOKpM9KWlMA=
X-Google-Smtp-Source: ABdhPJyKppctq6u7ic9iz13bTUlMW2PIg2/iotUNWAl8CNxSQjvLXnJMdPO7f/onda7kLt48QCQ9ONhY4jV5TO6/oKg=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr7092918ejw.108.1599708116944; 
 Wed, 09 Sep 2020 20:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200826071916.3081953-1-joel@jms.id.au>
In-Reply-To: <20200826071916.3081953-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 03:21:43 +0000
Message-ID: <CACPK8XcNc=O99Fuup=OnFacJJnRHd0bt0BiuSrYUCTSVs_shuw@mail.gmail.com>
Subject: Re: [PATCH] ARM: config: aspeed: Fix selection of media drivers
To: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Tony Lindgren <tony@atomide.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 26 Aug 2020 at 07:19, Joel Stanley <joel@jms.id.au> wrote:
>
> In the 5.7 merge window the media kconfig was restructued. For most
> platforms these changes set CONFIG_MEDIA_SUPPORT_FILTER=y which keeps
> unwanted drivers disabled.
>
> The exception is if a config sets EMBEDDED or EXPERT (see b0cd4fb27665).
> In that case the filter is set to =n, causing a bunch of DVB tuner drivers
> (MEDIA_TUNER_*) to be accidentally enabled. This was noticed as it blew
> out the build time for the Aspeed defconfigs.
>
> Enabling the filter means the Aspeed config also needs to set
> CONFIG_MEDIA_PLATFORM_SUPPORT=y in order to have the CONFIG_VIDEO_ASPEED
> driver enabled.
>
> Fixes: 06b93644f4d1 ("media: Kconfig: add an option to filter in/out platform drivers")
> Fixes: b0cd4fb27665 ("media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering")
> Cc: stable@vger.kernel.org
> CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>
> Another solution would be to revert b0cd4fb27665 ("media: Kconfig: on
> !EMBEDDED && !EXPERT, enable driver filtering"). I assume this was done
> to be helpful, but in practice it has enabled the TUNER drivers (and
> others) for the following configs that didn't have them before:

Mauro, did you have any thoughts here?

Otherwise I'll merge the fix for the aspeed configs for 5.10.

Cheers,

Joel

>
> $ git grep -lE "(CONFIG_EXPERT|CONFIG_EMBEDDED)"  arch/*/configs/ | xargs grep -l MEDIA_SUPPORT
> arch/arm/configs/aspeed_g4_defconfig
> arch/arm/configs/aspeed_g5_defconfig
> arch/arm/configs/at91_dt_defconfig
> arch/arm/configs/bcm2835_defconfig
> arch/arm/configs/davinci_all_defconfig
> arch/arm/configs/ezx_defconfig
> arch/arm/configs/imote2_defconfig
> arch/arm/configs/imx_v4_v5_defconfig
> arch/arm/configs/imx_v6_v7_defconfig
> arch/arm/configs/milbeaut_m10v_defconfig
> arch/arm/configs/multi_v7_defconfig
> arch/arm/configs/omap2plus_defconfig
> arch/arm/configs/pxa_defconfig
> arch/arm/configs/qcom_defconfig
> arch/arm/configs/sama5_defconfig
> arch/arm/configs/tegra_defconfig
> arch/mips/configs/ci20_defconfig
> arch/mips/configs/lemote2f_defconfig
> arch/mips/configs/loongson3_defconfig
> arch/mips/configs/pistachio_defconfig
>
> I've cc'd the maintainers of these defconfigs so they are aware.
>
> ---
>  arch/arm/configs/aspeed_g4_defconfig | 3 ++-
>  arch/arm/configs/aspeed_g5_defconfig | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
> index 303f75a3baec..58d293b63581 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -160,7 +160,8 @@ CONFIG_SENSORS_TMP421=y
>  CONFIG_SENSORS_W83773G=y
>  CONFIG_WATCHDOG_SYSFS=y
>  CONFIG_MEDIA_SUPPORT=y
> -CONFIG_MEDIA_CAMERA_SUPPORT=y
> +CONFIG_MEDIA_SUPPORT_FILTER=y
> +CONFIG_MEDIA_PLATFORM_SUPPORT=y
>  CONFIG_V4L_PLATFORM_DRIVERS=y
>  CONFIG_VIDEO_ASPEED=y
>  CONFIG_DRM=y
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index b0d056d49abe..cc2449ed6e6d 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -175,7 +175,8 @@ CONFIG_SENSORS_TMP421=y
>  CONFIG_SENSORS_W83773G=y
>  CONFIG_WATCHDOG_SYSFS=y
>  CONFIG_MEDIA_SUPPORT=y
> -CONFIG_MEDIA_CAMERA_SUPPORT=y
> +CONFIG_MEDIA_SUPPORT_FILTER=y
> +CONFIG_MEDIA_PLATFORM_SUPPORT=y
>  CONFIG_V4L_PLATFORM_DRIVERS=y
>  CONFIG_VIDEO_ASPEED=y
>  CONFIG_DRM=y
> --
> 2.28.0
>
