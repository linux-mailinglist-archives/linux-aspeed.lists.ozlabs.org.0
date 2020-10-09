Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C22132884EC
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 10:09:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C711w6K5tzDqcP
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 19:09:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IlnrkyjW; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C70jJ2xQfzDqZq
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 18:54:58 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id w5so4362845qvn.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Oct 2020 00:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nJVCJIrDMcYNbThERkU3I1bvdWzLRwtq/qq14NyZ9S0=;
 b=IlnrkyjWt6lJyj9SN3tFQ2hhVavOsjOPqONXvcHDky4h6z740xEgb787GGmoagXtf5
 vTBKpF8sr9IxjCd3z1ltKIa8ZJxJ5TksDY8TfWbsZTkYdO+ydrVxqkNwhg/LmsLPGwXi
 LAOa2Q3f9g3QMNRLbofNpQ1ZwNFWoHhMlI4J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nJVCJIrDMcYNbThERkU3I1bvdWzLRwtq/qq14NyZ9S0=;
 b=TzjKYatLAfmDmgBmQLtujSLBxVy8k/DCOw8pkpplEhtsRjHRJVCVvHDDrjcS+TONwO
 khtBH0i4zvokS3wXPcFOeVm6QMYw/ung+XRe9cnPOmCr/wAvegOZEbC/OKe++/fT46Ye
 Ii8VnLlmicpw93R/PAApfA4KDeHll7dbt45q8CHyNbIdKakiyzpImWa0wfPO/YYT93SZ
 MKrqtiTZkWjXpg+HK9GzzBWK/Qjouwnr1IgDsewXTsyEwp2nZDWhgWnrkq3WLZOH2Xrk
 EWJHjWiHrcMPmh9ClID/6kff6a5PnSpIkpMwb2e3jlzSslxGF9DZSCkSVhOKBy946vwb
 htWw==
X-Gm-Message-State: AOAM531mtCYUHX6ep7Hygub3kQx4lHxL8dHyhbjpffNdP0Tj958gxg7R
 eFvbM6VZ+CIWuViR//ukv5NbmfcTdvGd6y9qEt4=
X-Google-Smtp-Source: ABdhPJzlDUJipCJ9OYZ3/ltCZjn3+bPAxZxsG/38fXSejf9ukBkyEora6nsNVz8tW4sZA+vE6Kzefaz2zpX3dzHy0WI=
X-Received: by 2002:a0c:90f1:: with SMTP id p104mr11789501qvp.16.1602230094606; 
 Fri, 09 Oct 2020 00:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-5-tzimmermann@suse.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 07:54:42 +0000
Message-ID: <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 09 Oct 2020 19:09:19 +1100
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 liviu.dudau@arm.com, stefan@agner.ch, philippe.cornu@st.com,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin.gaignard@linaro.org, mihail.atanassov@arm.com,
 Sam Ravnborg <sam@ravnborg.org>, alexandre.torgue@st.com,
 Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
 abrodkin@synopsys.com, Ludovic Desroches <ludovic.desroches@microchip.com>,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 john.stultz@linaro.org, jsarha@ti.com, Chen-Yu Tsai <wens@csie.org>,
 vincent.abriou@st.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>, brian.starkey@arm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
> to their defaults. No functional changes are made.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I just found this in my inbox. I assume it has not been applied as you
were after a review.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will apply it to drm-misc-next.

Cheers,

Joel

> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 6b27242b9ee3c..1167ff78e24a3 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -188,12 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>
>  static struct drm_driver aspeed_gfx_driver = {
>         .driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -       .gem_create_object      = drm_cma_gem_create_object_default_funcs,
> -       .dumb_create            = drm_gem_cma_dumb_create,
> -       .prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
> -       .prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
> -       .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -       .gem_prime_mmap         = drm_gem_prime_mmap,
> +       DRM_GEM_CMA_DRIVER_OPS,
>         .fops = &fops,
>         .name = "aspeed-gfx-drm",
>         .desc = "ASPEED GFX DRM",
> --
> 2.26.2
>
