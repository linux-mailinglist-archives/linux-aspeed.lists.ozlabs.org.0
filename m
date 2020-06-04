Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7191F2A0E
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:08:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr6t24dyzDqNC
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:08:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=irv4suQS; 
 dkim-atps=neutral
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49crB83NV0zDqVQ
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Jun 2020 13:00:30 +1000 (AEST)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 699CA29B;
 Thu,  4 Jun 2020 05:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591239621;
 bh=V6sWc2OmZvKnvF6NTuPSNLOIX5/q4zUwgTDOnEviFQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=irv4suQSfhNVReunvv93w24ogJjfIQrwf+k/o7zuzbVVwApBTvJs7cp92kXVPDwYp
 Vn/kJulYbla5IGBcphLaVhiB4OLS85vYwYfRRbHY72QDtdUIOYOGIk4JMarP8NLlPr
 +k1BejXukPwLzpvsBCvS95m44Dkr0RpHFFNLw8jE=
Date: Thu, 4 Jun 2020 06:00:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 16/23] drm/rcar-du: Use GEM CMA object functions
Message-ID: <20200604030005.GM27695@pendragon.ideasonboard.com>
References: <20200603083132.4610-1-tzimmermann@suse.de>
 <20200603083132.4610-17-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200603083132.4610-17-tzimmermann@suse.de>
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:39 +1000
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, linus.walleij@linaro.org,
 liviu.dudau@arm.com, stefan@agner.ch, philippe.cornu@st.com,
 paul@crapouillou.net, benjamin.gaignard@linaro.org, mihail.atanassov@arm.com,
 sam@ravnborg.org, alexandre.torgue@st.com, marex@denx.de, festevam@gmail.com,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, Emil Velikov <emil.velikov@collabora.com>,
 linux-imx@nxp.com, p.zabel@pengutronix.de, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, john.stultz@linaro.org, jsarha@ti.com, wens@csie.org,
 vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 noralf@tronnes.org, bbrezillon@kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch, khilman@baylibre.com,
 zourongrong@gmail.com, shawnguo@kernel.org, brian.starkey@arm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Thomas,

Thank you for the patch.

On Wed, Jun 03, 2020 at 10:31:25AM +0200, Thomas Zimmermann wrote:
> The rcar-du driver uses the default implementation for CMA functions; except
> for the .dumb_create callback. The DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE()
> macro now sets these defaults and .dumb_create in struct drm_driver.
> 
> By using DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() the driver now
> sets .gem_create_object to drm_cma_gem_create_object_default_funcs(),
> which sets CMA GEM object functions. GEM object functions implement the
> rsp operations where possible. Corresponding interfaces in struct drm_driver
> are cleared. Prime import now uses drm_gem_cma_prime_import_sg_table_vmap(),
> which maps the imported buffer upon import. Mmap operations are performed
> by drm_gem_prime_mmap(), which goes through GEM file operations. These
> changes have been part of the aspeed driver for some time.

How is the aspeed driver related to this patch ?

> 
> v2:
> 	* update for DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE

As explained in the review of v1, this combines multiple changes in a
single patch. Some of those changes are not straightforward to review.
It would be easier if they were split in separate patches.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 3e67cf70f0402..f53b0ec710850 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -476,16 +476,7 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
>  
>  static struct drm_driver rcar_du_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> -	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
> -	.dumb_create		= rcar_du_dumb_create,
> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(rcar_du_dumb_create),
>  	.fops			= &rcar_du_fops,
>  	.name			= "rcar-du",
>  	.desc			= "Renesas R-Car Display Unit",

-- 
Regards,

Laurent Pinchart
