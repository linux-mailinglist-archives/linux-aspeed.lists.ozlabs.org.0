Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 794F71E1995
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:38:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ7762DXzDqNL
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:38:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ideasonboard.com (client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=si2Eq1aD; 
 dkim-atps=neutral
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WH4W528XzDqLb
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 May 2020 11:51:20 +1000 (AEST)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F070562;
 Tue, 26 May 2020 03:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590457872;
 bh=9X9ArXnx8hFwWFeqCnT63615tcvexXkgxNm5baZhsOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=si2Eq1aDVjEOeRiTZkSK9iRelsaJrjXihUJ27gi4ri/xg4vfftP92kyqaGk9uXlQY
 sRslg/6UT6dhzU5n3SugpoH6S7codUzF9f59XFlBSvpJkqoy4ovVDN4tCmQZZuffoh
 VFjtY/BePPnOotg86agq1q9OAc4jwrIya4Bdglo0=
Date: Tue, 26 May 2020 04:50:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 15/21] drm/rcar-du: Use GEM CMA object functions
Message-ID: <20200526015059.GC6179@pendragon.ideasonboard.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-16-tzimmermann@suse.de>
 <20200522201240.GE5824@pendragon.ideasonboard.com>
 <816a8a0e-bb98-ea6c-5016-94b18e045fb5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <816a8a0e-bb98-ea6c-5016-94b18e045fb5@suse.de>
X-Mailman-Approved-At: Tue, 26 May 2020 12:34:04 +1000
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
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 paul@crapouillou.net, mihail.atanassov@arm.com, sam@ravnborg.org,
 marex@denx.de, khilman@baylibre.com, abrodkin@synopsys.com,
 kong.kongxinwei@hisilicon.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, alexandre.torgue@st.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, philippe.cornu@st.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, kernel@pengutronix.de,
 zourongrong@gmail.com, shawnguo@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Mon, May 25, 2020 at 02:49:46PM +0200, Thomas Zimmermann wrote:
> Am 22.05.20 um 22:12 schrieb Laurent Pinchart:
> > On Fri, May 22, 2020 at 03:52:40PM +0200, Thomas Zimmermann wrote:
> >> The rcar-du driver uses the default implementation for CMA functions;
> >> except for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro
> >> now sets these defaults and .dumb_create in struct drm_driver. All
> >> remaining operations are provided by CMA GEM object functions.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 11 +----------
> >>  1 file changed, 1 insertion(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> index 3e67cf70f0402..3728038cec1d1 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> @@ -476,16 +476,7 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
> >>  
> >>  static struct drm_driver rcar_du_driver = {
> >>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> >> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> >> -	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> >> -	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> >> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
> >> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> >> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> >> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
> >> -	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
> >> -	.dumb_create		= rcar_du_dumb_create,
> >> +	__DRM_GEM_CMA_DRIVER_OPS(rcar_du_dumb_create),
> > 
> > Your __DRM_GEM_CMA_DRIVER_OPS is defined as
> > 
> > #define __DRM_GEM_CMA_DRIVER_OPS(__dumb_create) \
> >         .gem_create_object      = drm_cma_gem_create_object_default_funcs, \
> >         .dumb_create            = (__dumb_create), \
> >         .prime_handle_to_fd     = drm_gem_prime_handle_to_fd, \
> >         .prime_fd_to_handle     = drm_gem_prime_fd_to_handle, \
> >         .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table_vmap, \
> >         .gem_prime_mmap         = drm_gem_prime_mmap
> > 
> > The patch thus introduces several changes:
> > 
> > - drm_gem_cma_prime_import_sg_table_vmap() is used instead of
> >   drm_gem_cma_prime_import_sg_table() combined with .gem_prime_vmap()
> >   and .gem_prime_vunmap(). I believe that's fine, but splitting that
> >   change in a separate commit, or at the very least explaining it in
> >   details in the commit message, would make review easier.
> > 
> > - .gem_create_object() is now set. That seems to be OK, but I'm not sure
> >   to grasp all the implications. This should also be explained in the
> >   commit message, and ideally split to a separate patch.
> 
> That's relevant during object creation and sets the object functions.
> See one of my other replies for how this can go away after all CMA
> drivers have been updated to GEM object functions.

I don't dispute that's fine, but I think it should really be explained
in the commit message, and ideally split to a separate patch.

> > - drm_gem_cma_prime_mmap() is replaced with drm_gem_prime_mmap(). Same
> >   comments :-)
> 
> I relied on the aspeed driver to be correct. After Sam's comment on
> that, I read the code once again several times. The original
> implementation clears VM_PFNMAP. And I cannot find that code any longer.
> Going back to the original function might be better.
> 
> > This patch hides way too many changes in what is documented as just
> > innocent refactoring. It seems other drivers are affected too.
> 
> Could you test the patchset? I don't have the HW.

Kieran has beaten me to it :-)

> >>  	.fops			= &rcar_du_fops,
> >>  	.name			= "rcar-du",
> >>  	.desc			= "Renesas R-Car Display Unit",

-- 
Regards,

Laurent Pinchart
