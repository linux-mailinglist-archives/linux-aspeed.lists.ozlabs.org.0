Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D566D055
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Jan 2023 21:43:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwkWY21qfz3c9Q
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Jan 2023 07:43:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=oNj8qiOf;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=2ykuu+6M;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay4-1.pub.mailoutpod2-cph3.one.com (client-ip=46.30.211.179; helo=mailrelay4-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=oNj8qiOf;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=2ykuu+6M;
	dkim-atps=neutral
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwkWR1tbdz3bWC
	for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 07:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=U6Ag7c7NdZCMU3zYe0zGoudpAKYkP6dwFAin/8jJBMo=;
	b=oNj8qiOf1lrWzsz6KUDFWXXnNwXYbURvC0zUEYYDp3q/8wsv+KLHJvTkctv3NQ2vjAXehbJWn+KGO
	 poG6BENvqtqLoYlMAEljEDng1Z3J66/tGKYWWcYCeF+BE+W0YTivvHyVtqYN+qMRDBl+jvIVp6H5bV
	 M+6sVKdA0t6NiI/OcLn72gkHvd1UyQq4249nlQ460+4dcIyGTfFqoEBefbZwDrEYTcRKFncz4UZH5y
	 kM83slAZqlNdKdaKPjOEm3YUtp4xNrWIFDm7XLK12vfRY7jmBF7dcFlifrQ4X71Wyy2/D4JnhObQcM
	 AdBNwIeSeFySTXXItiqoyfrqrhkrTFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=U6Ag7c7NdZCMU3zYe0zGoudpAKYkP6dwFAin/8jJBMo=;
	b=2ykuu+6MFi70+L+AeqMtfIxINz9CczWoB44YxRNe+mrUMT4GDb5GtxnY6k1MB439QnFan+F0Oqp0L
	 ueln40ZDw==
X-HalOne-ID: 2988dd34-95dc-11ed-88e6-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4 (Halon) with ESMTPSA
	id 2988dd34-95dc-11ed-88e6-87783a957ad9;
	Mon, 16 Jan 2023 20:27:16 +0000 (UTC)
Date: Mon, 16 Jan 2023 21:27:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/22] drm/aspeed: Remove unnecessary include statements
 for drm_crtc_helper.h
Message-ID: <Y8WzI8LNLHAbcUzl@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-6-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 02:12:18PM +0100, Thomas Zimmermann wrote:
> Several source files include drm_crtc_helper.h without needing it or
> only to get its transitive include statements; leading to unnecessary
> compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible.

Nitpicking... The above is the standard text you use.
But in many cases, like this case, the patch just drop the wrong use of
the header and do not include any required headers.

If you want to rephrase for future changelog diggers or leave it as is,
is up to you.

	Sam

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_out.c  | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index 55a3444a51d8..7877a57b8e26 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -5,7 +5,6 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_fourcc.h>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 718119e168a6..ecfb060d2557 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -14,7 +14,6 @@
>  #include <linux/reset.h>
>  
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_gem_dma_helper.h>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> index 4f2187025a21..78775e0c853f 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> @@ -3,7 +3,6 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_connector.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  
> -- 
> 2.39.0
