Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD11E3543
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2020 04:11:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WvTD33vWzDqPQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2020 12:11:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=crapouillou.net (client-ip=89.234.176.41; helo=crapouillou.net;
 envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=ph4Oq3FA; 
 dkim-atps=neutral
X-Greylist: delayed 767 seconds by postgrey-1.36 at bilbo;
 Wed, 27 May 2020 10:41:45 AEST
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WsTj4Mp8zDqJ1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 May 2020 10:41:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590539329; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eNQy+HfaYgDqYPYkxNUOBbsWhF12apm1sawTSRbUxM=;
 b=ph4Oq3FAxEZc30cpk4hReFsdFhqADMQEK74TqMUgoTpR8GLEmCzAm+554fKqssFp5Hgy3a
 KAnTbBiLswq+G2wB2Q9Fo1F98CE+Ad5C1tAFCZJ6V5XjuWp94dkxvgbz1mkv09J6Ed/82J
 iinOdsAP5CSOEgoKN5MtiqCiEy6N7sU=
Date: Wed, 27 May 2020 02:28:31 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 09/21] drm/ingenic: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <JZRYAQ.1QIOMTT6TPVS1@crapouillou.net>
In-Reply-To: <20200522135246.10134-10-tzimmermann@suse.de>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 May 2020 12:11:04 +1000
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
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, sam@ravnborg.org, alexandre.torgue@st.com,
 marex@denx.de, festevam@gmail.com, abrodkin@synopsys.com,
 ludovic.desroches@microchip.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, james.qian.wang@arm.com,
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

Le ven. 22 mai 2020 =E0 15:52, Thomas Zimmermann <tzimmermann@suse.de> a=20
=E9crit :
> The ingenic driver uses the default implementation for CMA functions.=20
> The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct=20
> drm_driver.
> All remaining operations are provided by CMA GEM object functions.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Tested-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index eff57a1f70fb0..1c1cee367b752 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -519,18 +519,7 @@ static struct drm_driver ingenic_drm_driver_data=20
> =3D {
>  	.patchlevel		=3D 0,
>=20
>  	.fops			=3D &ingenic_drm_fops,
> -
> -	.dumb_create		=3D drm_gem_cma_dumb_create,
> -	.gem_free_object_unlocked =3D drm_gem_cma_free_object,
> -	.gem_vm_ops		=3D &drm_gem_cma_vm_ops,
> -
> -	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	=3D drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		=3D drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	=3D drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap,
> +	DRM_GEM_CMA_DRIVER_OPS,
>=20
>  	.irq_handler		=3D ingenic_drm_irq_handler,
>  };
> --
> 2.26.2
>=20


