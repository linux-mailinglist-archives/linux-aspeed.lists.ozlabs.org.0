Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB091F28EC
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:03:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr0x5CdfzDqKW
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:02:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e44;
 helo=mail-vs1-xe44.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CbKCD5fV; dkim-atps=neutral
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xqzq5cFpzDqGY
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 May 2020 00:37:42 +1000 (AEST)
Received: by mail-vs1-xe44.google.com with SMTP id r10so3472850vsa.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 May 2020 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhjLeGnnSiMQRUUbdYfOMsIgW1q+H/0EWlHfLoiEMtE=;
 b=CbKCD5fVpYp1aySqZdKnzqK4Q2fgUNjrKce3em6AzjVDLz8s0NG0/V1jiEgII88EV6
 QE9gxRgIdBssjKzN8c9Zg/T88CncTWrDZjjHBURYmyRPX3qJgA5b5hIQZhg/jJU2e7rL
 Rbpdph3yfrYbRsQOvvH4FOvDjbvKauAU44w1rX4VbhcA8W+FSRYO/FBCTsuKp70ynmwv
 j4fnZ5f1/o5nphKz37BhmxIDH1v5xxz0MpLIjCSwp43846om7e/5adWroCwymmxTsb0k
 v6+dHcr8BGLmT+hTMeokGnwbWps5BfsssA7hPevfqdN3VyvbTWkFjWwcYyCFD5TLU6c6
 +7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhjLeGnnSiMQRUUbdYfOMsIgW1q+H/0EWlHfLoiEMtE=;
 b=XqyNOzycw3rTVsWED6zxZVsH45s7DMLO5Ej8+ORbeHG7GvDNWixL6fjGqrF3ifexQA
 9BOv8XZzW3S1bfvKhIO3oWQ6vTPF2xSIy076ZLbzBa1nP24AKAsIPJBpKOwqq/2QP6Mc
 iFMY5dtQ/kcRYpWfcyOaDdCcznDkWC7Yeq1UgmMpRuiqpAcuKyl+PklDvngRgYBl36Y9
 90cvWplVAhly0PeKTzX31XJlFcSgEeEaKqHJtQ7/qUL7rik/Sql5ojZmO+PWvWHPmpVm
 TrudogLZlWWQfJ9zyhxGKcVVS3GasjFjqxhjAaxVaVvethpRWYAMc6eqtBqvFf8tFxOn
 H1bg==
X-Gm-Message-State: AOAM532ZcLWP0eJq9nPkRCURwotni87O0+F4VVNEmvRicMBDZ4bRWDJM
 jhTrDGVllZVF/LJI531sfij7IxDXNLV+a0u8rXo=
X-Google-Smtp-Source: ABdhPJxf/Xvp0FffRYRAO2YMcSmKjuft134y0VUyAxlVwQruDsfuEhriUCGMVWXQHGRus78KTihyjqzAINdicC/TUO4=
X-Received: by 2002:a67:be19:: with SMTP id x25mr2244123vsq.37.1590676658056; 
 Thu, 28 May 2020 07:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-8-tzimmermann@suse.de>
 <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>
 <ccee78e2-8930-2de6-0b7c-0f1ad1e636f8@suse.de>
In-Reply-To: <ccee78e2-8930-2de6-0b7c-0f1ad1e636f8@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 15:34:30 +0100
Message-ID: <CACvgo52de8opoX98Kchp00gfDa7iGyezumNZPeNaOeLpYjETEQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/hisilicon/kirin: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:32 +1000
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
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, nicolas.ferre@microchip.com,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, khilman@baylibre.com,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, ludovic.desroches@microchip.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Jyri Sarha <jsarha@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Vincent Abriou <vincent.abriou@st.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sascha Hauer <kernel@pengutronix.de>, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 25 May 2020 at 13:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Emil
>
> Am 22.05.20 um 20:11 schrieb Emil Velikov:
> > Hi Thomas,
> >
> > On Fri, 22 May 2020 at 14:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> The kirin driver uses the default implementation for CMA functions; except
> >> for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro now sets
> >> these defaults and .dumb_create in struct drm_driver. All remaining
> >> operations are provided by CMA GEM object functions.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 12 +-----------
> >>  1 file changed, 1 insertion(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> >> index c339e632522a9..b1ffd7d43e562 100644
> >> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> >> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> >> @@ -921,17 +921,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
> >>  static struct drm_driver ade_driver = {
> >>         .driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> >>         .fops = &ade_fops,
> >> -       .gem_free_object_unlocked = drm_gem_cma_free_object,
> >> -       .gem_vm_ops = &drm_gem_cma_vm_ops,
> >> -       .dumb_create = drm_gem_cma_dumb_create_internal,
> >
> > This doesn't seem right. The _internal documentation explicitly says
> > that this should _not_ be used as .dumb_create. Instead drivers should
> > use it to implement their callback.
> >
> > Since it yields the same result as drm_gem_cma_dumb_create we can use
> > the default macro below.
>
> I noticed this and thought that the driver authors probably had their
> reasons. Changing the driver to the default macro is probably still a
> good idea.
>
To be on the _extra_ safe side might want to keep that separate patch
explicitly CC-ing the author/reviewers of the offending commit.
Although as said before - it's your call, I'm fine either way.

HTH
Emil
