Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7751F2B0D
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:16:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49grJW57YfzDqCG
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:16:27 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail header.b=ttG10UHq; 
 dkim-atps=neutral
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dbFW6rZLzDqKW
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jun 2020 18:21:03 +1000 (AEST)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB9727C;
 Fri,  5 Jun 2020 10:20:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591345260;
 bh=0cyIgC4IjixPMi3lMu+OWHjlihDlgkF27Lc4nUgZHG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ttG10UHqRtqI4l7rdt8oKRF/ytPrZ0J0CE2+xY6UcJel9kj8yux9qYLRWlR7SExUU
 8ZBxUuf/3NaOGton7EWaXEQvQGfdF7B/R0DhuFZCWakywJ93E1EBGpqtQdWU7RLxKF
 GpURVRU0hpQOD0ndUC+7AsLwzx0RlMXP/bX+gB+M=
Date: Fri, 5 Jun 2020 11:20:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 31/43] drm/shmobile: Use GEM CMA object functions
Message-ID: <20200605082040.GB9325@pendragon.ideasonboard.com>
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-32-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200605073247.4057-32-tzimmermann@suse.de>
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:40 +1000
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

On Fri, Jun 05, 2020 at 09:32:35AM +0200, Thomas Zimmermann wrote:
> Create GEM objects with drm_gem_cma_create_object_default_funcs(), which
> allocates the object and sets CMA's default object functions. Corresponding
> callbacks in struct drm_driver are cleared. No functional changes are made.
> 
> Driver and object-function instances use the same callback functions, with
> the exception of vunmap. The implementation of vunmap is empty and left out
> in CMA's default object functions.
> 
> v3:
> 	* convert to DRIVER_OPS macro in a separate patch
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Emil Velikov <emil.velikov@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index ae9d6b8d3ca87..e209610d4b8a1 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -131,14 +131,10 @@ DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
>  static struct drm_driver shmob_drm_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
>  	.irq_handler		= shmob_drm_irq,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> +	.gem_create_object	= drm_gem_cma_create_object_default_funcs,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
>  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
>  	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
>  	.dumb_create		= drm_gem_cma_dumb_create,
>  	.fops			= &shmob_drm_fops,
> -- 
> 2.26.2
> 

-- 
Regards,

Laurent Pinchart
