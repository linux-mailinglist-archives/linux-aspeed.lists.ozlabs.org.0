Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F214D1F2B19
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:17:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49grKc0M9FzDqGJ
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:17:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=109.247.116.15; helo=asavdk4.altibox.net;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ravnborg.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dlJh3r3wzDr0p
 for <linux-aspeed@lists.ozlabs.org>; Sat,  6 Jun 2020 00:24:17 +1000 (AEST)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5255A80511;
 Fri,  5 Jun 2020 16:23:53 +0200 (CEST)
Date: Fri, 5 Jun 2020 16:23:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/43] drm/cma-helper: Rename symbols from
 drm_cma_gem_ to drm_gem_cma_
Message-ID: <20200605142351.GA204352@ravnborg.org>
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-2-tzimmermann@suse.de>
 <20200605084026.GB11426@pendragon.ideasonboard.com>
 <8e2e8394-4110-9fb6-e99e-0495cf9f7218@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e2e8394-4110-9fb6-e99e-0495cf9f7218@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=zqeJn9o-U7iyyRRzNl8A:9 a=wPNLvfGTeEIA:10
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:42:14 +1000
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
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin.gaignard@linaro.org, mihail.atanassov@arm.com, festevam@gmail.com,
 alexandre.torgue@st.com, marex@denx.de, khilman@baylibre.com,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, john.stultz@linaro.org,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 noralf@tronnes.org, bbrezillon@kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 zourongrong@gmail.com, shawnguo@kernel.org, brian.starkey@arm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 05, 2020 at 04:15:46PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.06.20 um 10:40 schrieb Laurent Pinchart:
> > Hi Thomas,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Jun 05, 2020 at 09:32:05AM +0200, Thomas Zimmermann wrote:
> >> This fixes the naming of several symbols within CMA helpers. No functional
> >> changes are made.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > Thank you for the patch.
> > 
> > Speaking of naming, I wish we could rename drm_gem_cma_* to something
> > else, as those helpers don't use CMA directly (and may not use it at
> > all), but I think that would be too much intrusive changes for too
> > little gain :-(
> 
> I agree. Calling them GEM DMA helpers would be more precise. But I don't
> really see an easy solution without either a big patch that touches
> everything, or a lot of small patches with ugly intermediate states.
> 
> IMHO the best option would probably be an additional header file
> drm_gem_dma_helper.h that defines a dma name for each cma name. Drivers
> could then be converted individually with a single per-driver patch.

From todo.rst:

"
Rename CMA helpers to DMA helpers
---------------------------------

CMA (standing for contiguous memory allocator) is really a bit an accident of
what these were used for first, a much better name would be DMA helpers. In the
text these should even be called coherent DMA memory helpers (so maybe CDM, but
no one knows what that means) since underneath they just use dma_alloc_coherent.

Contact: Laurent Pinchart, Daniel Vetter

Level: Intermediate (mostly because it is a huge tasks without good partial
milestones, not technically itself that challenging)
"

The same?

	Sam

> 
> Best regards
> Thomas
> 
> > 
> >> ---
> >>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  2 +-
> >>  drivers/gpu/drm/drm_gem_cma_helper.c    | 10 +++++-----
> >>  include/drm/drm_gem_cma_helper.h        |  4 ++--
> >>  3 files changed, 8 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> >> index 6b27242b9ee3c..5e7ea0459d018 100644
> >> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> >> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> >> @@ -188,7 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
> >>  
> >>  static struct drm_driver aspeed_gfx_driver = {
> >>  	.driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >> -	.gem_create_object	= drm_cma_gem_create_object_default_funcs,
> >> +	.gem_create_object	= drm_gem_cma_create_object_default_funcs,
> >>  	.dumb_create		= drm_gem_cma_dumb_create,
> >>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> >>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> >> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> >> index b3db3ca7bd7a7..842e2fa332354 100644
> >> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> >> @@ -572,7 +572,7 @@ void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> >>  }
> >>  EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vunmap);
> >>  
> >> -static const struct drm_gem_object_funcs drm_cma_gem_default_funcs = {
> >> +static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
> >>  	.free = drm_gem_cma_free_object,
> >>  	.print_info = drm_gem_cma_print_info,
> >>  	.get_sg_table = drm_gem_cma_prime_get_sg_table,
> >> @@ -581,7 +581,7 @@ static const struct drm_gem_object_funcs drm_cma_gem_default_funcs = {
> >>  };
> >>  
> >>  /**
> >> - * drm_cma_gem_create_object_default_funcs - Create a CMA GEM object with a
> >> + * drm_gem_cma_create_object_default_funcs - Create a CMA GEM object with a
> >>   *                                           default function table
> >>   * @dev: DRM device
> >>   * @size: Size of the object to allocate
> >> @@ -593,7 +593,7 @@ static const struct drm_gem_object_funcs drm_cma_gem_default_funcs = {
> >>   * A pointer to a allocated GEM object or an error pointer on failure.
> >>   */
> >>  struct drm_gem_object *
> >> -drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size)
> >> +drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size)
> >>  {
> >>  	struct drm_gem_cma_object *cma_obj;
> >>  
> >> @@ -601,11 +601,11 @@ drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size)
> >>  	if (!cma_obj)
> >>  		return NULL;
> >>  
> >> -	cma_obj->base.funcs = &drm_cma_gem_default_funcs;
> >> +	cma_obj->base.funcs = &drm_gem_cma_default_funcs;
> >>  
> >>  	return &cma_obj->base;
> >>  }
> >> -EXPORT_SYMBOL(drm_cma_gem_create_object_default_funcs);
> >> +EXPORT_SYMBOL(drm_gem_cma_create_object_default_funcs);
> >>  
> >>  /**
> >>   * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driver's
> >> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> >> index 947ac95eb24a9..64b7e9d42129a 100644
> >> --- a/include/drm/drm_gem_cma_helper.h
> >> +++ b/include/drm/drm_gem_cma_helper.h
> >> @@ -107,7 +107,7 @@ void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
> >>  void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> >>  
> >>  struct drm_gem_object *
> >> -drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size);
> >> +drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
> >>  
> >>  /**
> >>   * DRM_GEM_CMA_VMAP_DRIVER_OPS - CMA GEM driver operations ensuring a virtual
> >> @@ -118,7 +118,7 @@ drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size);
> >>   * imported buffers.
> >>   */
> >>  #define DRM_GEM_CMA_VMAP_DRIVER_OPS \
> >> -	.gem_create_object	= drm_cma_gem_create_object_default_funcs, \
> >> +	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
> >>  	.dumb_create		= drm_gem_cma_dumb_create, \
> >>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
> >>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 



