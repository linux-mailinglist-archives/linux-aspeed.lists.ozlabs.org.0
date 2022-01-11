Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DF48AD50
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Jan 2022 13:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY8ZF3tnPz30DX
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Jan 2022 23:07:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.a=rsa-sha256 header.s=ds202112 header.b=mT2tFt8A;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tronnes.org (client-ip=2a01:5b40:0:3005::1;
 helo=smtp.domeneshop.no; envelope-from=noralf@tronnes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tronnes.org header.i=@tronnes.org header.a=rsa-sha256
 header.s=ds202112 header.b=mT2tFt8A; dkim-atps=neutral
X-Greylist: delayed 231 seconds by postgrey-1.36 at boromir;
 Tue, 11 Jan 2022 23:06:55 AEDT
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY8Z75hXpz2yPL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Jan 2022 23:06:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jyL93/6BnSzZVNk0d+pZVStpOnNWGIWV0cp232YBOgI=; b=mT2tFt8Aj6L1bsweeK606aleQA
 0q/CwoWO+evMQh6GF50pJ9PCCCJyuXmOhrRYLTjQTDKpOhN5D1TYzPaDFKoepp28vQrmdjWG6wUW8
 LGlw4YnNeBeXX7pKtIYZ3/rLRKgUBssnd7als6RGu0CxyV46XVwUK4IDmmPFA3ITABbriBLqZUyX7
 UWENmSQBWStSeVvtNjuAYCql48TE2QdR6owbFy1pu34zh7hD38mCeIMvQV128RgQ14GVHI+BlaVUf
 s1SRoWZUU6eUnGUkYz/h6+kwWvf5T6XHSBuiDwqgK/Ebb/WdPwu+Hoa2GmokqiDnSf/G5RdV5o7Ly
 1/sUx6RQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50898
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1n7Frc-0003rr-1p; Tue, 11 Jan 2022 13:02:56 +0100
Message-ID: <a9e2d66e-1a85-b61f-ee3b-ca7032e0516f@tronnes.org>
Date: Tue, 11 Jan 2022 13:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
To: tzimmermann@suse.de
References: <20211106193509.17472-2-tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] drm/mipi-dbi: Remove dependency on GEM CMA helper
 library
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20211106193509.17472-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: mripard@kernel.org, linux-aspeed@lists.ozlabs.org, airlied@linux.ie,
 daniel.vetter@ffwll.ch, naresh.kamboju@linaro.org,
 maarten.lankhorst@linux.intel.com, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, noralf@tronnes.org, marcel@ziswiler.com,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> The MIPI DBI helpers access struct drm_gem_cma_object.vaddr in a
> few places. Replace all instances with the correct generic GEM
> functions. Use drm_gem_fb_vmap() for mapping a framebuffer's GEM
> objects and drm_gem_fb_vunmap() for unmapping them. This removes
> the dependency on CMA helpers within MIPI DBI.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c
b/drivers/gpu/drm/drm_mipi_dbi.c
> index 71b646c4131f..f80fd6c0ccf8 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -15,9 +15,10 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modes.h>
> @@ -200,13 +201,19 @@ int mipi_dbi_buf_copy(void *dst, struct
drm_framebuffer *fb,
>  		      struct drm_rect *clip, bool swap)
>  {
>  	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
> -	void *src = cma_obj->vaddr;
> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> +	void *src;
>  	int ret;
>
>  	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>  	if (ret)
>  		return ret;
> +	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */

This assignment should be after the _vmap() call. The MIPI DBI drivers
are currently broken because of this.

Noralf.

> +
> +	ret = drm_gem_fb_vmap(fb, map, data);
> +	if (ret)
> +		goto out_drm_gem_fb_end_cpu_access;
>
>  	switch (fb->format->format) {
>  	case DRM_FORMAT_RGB565:
> @@ -221,9 +228,11 @@ int mipi_dbi_buf_copy(void *dst, struct
drm_framebuffer *fb,
>  	default:
>  		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
>  			     &fb->format->format);
> -		return -EINVAL;
> +		ret = -EINVAL;
>  	}
>
> +	drm_gem_fb_vunmap(fb, map);
> +out_drm_gem_fb_end_cpu_access:
>  	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>
>  	return ret;
>
