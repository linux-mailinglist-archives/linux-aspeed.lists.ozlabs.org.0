Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89335902E
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcW04c0Cz3bms
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KZ/oVYIM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KZ/oVYIM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGGqj74Nmz301X
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 19:56:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF61761157;
 Thu,  8 Apr 2021 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617875774;
 bh=qJxRS7vx1sXE6xcXQMcJdpuIhDNb8doWc5nvVib8CKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZ/oVYIMYnAgYH6QJVktZeIA6/aSYiWme3mBgwnkCxayRdrH5xziAm66YyvKrRth7
 7v9gmEr4vet9wOPetc8R4/QVlcGIuJddziUeRsFMPVcGZa22P9mvPmv43q1B6aD+Js
 Z0e/fme4iIuOE27WCM3w3jK+/81p4DNorwJ+lgUEckK3vbax8fc4dOwWS9QFQ50bHB
 QomrNySbhnrnJqtGC3+M/ApvRrBBJ3ceKHuJulDCYWyiIvtQy3nj4mRUzMnqnyL+hH
 vDqGLXtnBvDVuKNFVaO2Flj0rH/To18bMy5Xeu6DijPGj4p0ZU4/aKk0Y4ceO01yyY
 OTrdegR9Enwbw==
Date: Thu, 8 Apr 2021 12:56:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] drivers/video/fbdev: don't select DMA_CMA
Message-ID: <YG7TMt0cgGucCPUX@kernel.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408092011.52763-2-david@redhat.com>
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

On Thu, Apr 08, 2021 at 11:20:10AM +0200, David Hildenbrand wrote:
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> dependencies and manual overrides.
> 
> "This is similar to "select" as it enforces a lower limit on another
>  symbol except that the "implied" symbol's value may still be set to n
>  from a direct dependency or with a visible prompt."
> 
> Implying DRM_CMA should be sufficient, as that depends on CMA.

	  ^ DMA_CMA ?

> Note: If this is a real dependency, we should use "depends on DMA_CMA"
> instead -  but I assume the driver can work without CMA just fine --
> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS or CMA right now.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/video/fbdev/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 4f02db65dede..d37cd5341e1b 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2186,7 +2186,7 @@ config FB_HYPERV
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
>  	select FB_DEFERRED_IO
> -	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
> +	imply DMA_CMA
>  	help
>  	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
>  
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
