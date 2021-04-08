Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56435902F
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcW26Hc9z30JL
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FTkpQBgo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FTkpQBgo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGGrg3GQnz2yjS
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 19:57:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4033D61157;
 Thu,  8 Apr 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617875825;
 bh=B9VmDawrhjCMWY2yGvON7ogRQ50zM9AwDtPYvXCem5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FTkpQBgo9w1COX/6jC/2u6P6RPCFA3tl6nGA5eG1RXJ+BaGjbmejJvvhO2Wn4ubvY
 rectMFGrHL2U66R4DbeV9l+9RMlorb8xZTWUEO7XYTlIoG78fJ/zcvyr6GoIcFgUzV
 1RI22L8vsHQobVRIPzTSH9jw6UreGs04bFWxoADonEXJATx0A5LVon+uNz1KpcI+GC
 CeThnXDwU1DqxG8dcatSuycQeCk91qekdglfyahw14UVVPYSYkvt43sh40htngiecU
 O4BYaHTbk5u+7OXjoV+cnzy0Jb49t3KY9TppRDBLCZXL6YC1s5Z9Nzwrnc69D0FS9k
 IU18T2Ns6ybSQ==
Date: Thu, 8 Apr 2021 12:56:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Message-ID: <YG7TZa8VP458QS5y@kernel.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408092011.52763-3-david@redhat.com>
X-Mailman-Approved-At: Fri, 09 Apr 2021 09:12:53 +1000
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, linux-mm@kvack.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 11:20:11AM +0200, David Hildenbrand wrote:
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> dependencies and manual overrides.
> 
> "This is similar to "select" as it enforces a lower limit on another
>  symbol except that the "implied" symbol's value may still be set to n
>  from a direct dependency or with a visible prompt."
> 
> Implying DRM_CMA should be sufficient, as that depends on CMA.

          ^ DMA_CMA
> 
> Note: If this is a real dependency, we should use "depends on DMA_CMA"
> instead -  but I assume the driver can work without CMA just fine --
> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/gpu/drm/aspeed/Kconfig  | 3 +--
>  drivers/gpu/drm/etnaviv/Kconfig | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
> index 5e95bcea43e9..a055f763d230 100644
> --- a/drivers/gpu/drm/aspeed/Kconfig
> +++ b/drivers/gpu/drm/aspeed/Kconfig
> @@ -6,9 +6,8 @@ config DRM_ASPEED_GFX
>  	depends on MMU
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
> -	select DMA_CMA if HAVE_DMA_CONTIGUOUS
> -	select CMA if HAVE_DMA_CONTIGUOUS
>  	select MFD_SYSCON
> +	imply DRM_CMA

Ditto

>  	help
>  	  Chose this option if you have an ASPEED AST2500 SOC Display
>  	  Controller (aka GFX).
> diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
> index faa7fc68b009..5f5576b7221a 100644
> --- a/drivers/gpu/drm/etnaviv/Kconfig
> +++ b/drivers/gpu/drm/etnaviv/Kconfig
> @@ -9,9 +9,8 @@ config DRM_ETNAVIV
>  	select THERMAL if DRM_ETNAVIV_THERMAL
>  	select TMPFS
>  	select WANT_DEV_COREDUMP
> -	select CMA if HAVE_DMA_CONTIGUOUS
> -	select DMA_CMA if HAVE_DMA_CONTIGUOUS
>  	select DRM_SCHED
> +	imply DMA_CMA
>  	help
>  	  DRM driver for Vivante GPUs.
>  
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
