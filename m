Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4132884EF
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 10:09:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C71266nH8zDqcG
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 19:09:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=m9JlPjRe; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C70zW1TM0zDqVC
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 19:07:12 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id ev17so4388916qvb.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Oct 2020 01:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=anDE3OzBfi9c3DjEH727rzqrAKHguaHrZb4aycnyOMQ=;
 b=m9JlPjReV33QF/YTMIBE6RSGQpYNVw/FkT8KoGq9/TqOW9mQDGlp7g1QptpJ3IBNSO
 4TXJc/PaxGfWGOyJlEwodoX4mNEBrz4MDHmqi2A86W52k6003Zo6463fMagAeoAb8Vw6
 N9Y8MUFEUhH0kgDJwaMrLiWUcDPPlhcqqRcpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=anDE3OzBfi9c3DjEH727rzqrAKHguaHrZb4aycnyOMQ=;
 b=sqvUoIaeKGShP9eEVxXNUYoP3LS8fsDf45ba5GHmSNCN1iMshDS7I6R8ifYx+cdMnY
 QmgeVz2fYgOOaTNF2ubpZkmjkazxfgIzOdU14CfS2R5lg8Bt51JraMrbwOmFFiY9V0L+
 Ovfw7NsDZsLT8r7UNjGCbAwVe/FT8LAUflQ3vYHDvPyLqoJ9YBAY+NMsR4H+lRhbHRPn
 2SOqNJpUcAoZwme66VpSuhZ/y+bh1Wy12RTLm/wN3NqwHw/diA8iFCKKgBX2hBQQg+9J
 FObFKWMUuqmb0HkETXYEyuJjpdWw+XL+mbUF7NYwJFeeAu/D4SW5Nrkr8UKCYVtdEcKQ
 bv3Q==
X-Gm-Message-State: AOAM533XjEEcLAqAq7tqlcjnOy6NIb/F+igNja8vmjJ1Gu28RB1Q1uV0
 pzGRMNQT4svI0pO/zV3xwQpPLx7/ug/THX4Iduo=
X-Google-Smtp-Source: ABdhPJyPZSbhAWqc05LdGImBf/wI8me5jGWT76bTq5thTtMDg1/ai9eCSeYFMMmjPR52Zu8dJ1L68BtJOtx9O83ZURY=
X-Received: by 2002:ad4:5387:: with SMTP id i7mr11623850qvv.43.1602230828216; 
 Fri, 09 Oct 2020 01:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
 <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
In-Reply-To: <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 08:06:55 +0000
Message-ID: <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 9 Oct 2020 at 08:01, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 09.10.20 um 09:54 schrieb Joel Stanley:
> > On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> >>
> >> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
> >> to their defaults. No functional changes are made.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > I just found this in my inbox. I assume it has not been applied as you
> > were after a review.
>
> The patchset as a whole got an A-b and was merged a while ago.

I'm a bit confused, I couldn't see it in any tree. The aspeed one
seemed to have been skipped when applying the series.

I looked at today's linux-next and drm-misc-next.

> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Nevertheless thanks for taking a look at the patch.
>
> Best regards
> Thomas
>
> >
> > I will apply it to drm-misc-next.
> >
> > Cheers,
> >
> > Joel
> >
> >> ---
> >>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 7 +------
> >>  1 file changed, 1 insertion(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm=
/aspeed/aspeed_gfx_drv.c
> >> index 6b27242b9ee3c..1167ff78e24a3 100644
> >> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> >> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> >> @@ -188,12 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
> >>
> >>  static struct drm_driver aspeed_gfx_driver =3D {
> >>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIV=
ER_ATOMIC,
> >> -       .gem_create_object      =3D drm_cma_gem_create_object_default_=
funcs,
> >> -       .dumb_create            =3D drm_gem_cma_dumb_create,
> >> -       .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
> >> -       .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> >> -       .gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_tab=
le,
> >> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
> >> +       DRM_GEM_CMA_DRIVER_OPS,
> >>         .fops =3D &fops,
> >>         .name =3D "aspeed-gfx-drm",
> >>         .desc =3D "ASPEED GFX DRM",
> >> --
> >> 2.26.2
> >>
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
