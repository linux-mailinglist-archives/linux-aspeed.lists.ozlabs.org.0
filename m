Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA28B1E1961
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:34:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ2P2BRbzDqMy
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:34:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e42;
 helo=mail-vs1-xe42.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t/xBBcZ6; dkim-atps=neutral
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TF920GxLzDqvg
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 May 2020 04:18:11 +1000 (AEST)
Received: by mail-vs1-xe42.google.com with SMTP id b28so4523765vsa.5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 May 2020 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwXQ16I6Cp2tgFwIySqzt/G64hlPbh8xuNdm4rchjh4=;
 b=t/xBBcZ6O5/2xUet4xFV+IUG27uwEk7PUYFcckf192Tp2MyuY8B0DXdr96rOA13B0j
 /U0mcz2QsJq6wEyD+jG/VLOxi1JxIAjvbLaLGK3hfLWFMtNaGFdEnyhbRN5Yewnf7qHy
 maVP/Xh2HPoAegbriQFlRSP4oSIY4+Z01Hsoq3UPyKO9nSsuQT2/14nHEUAOqqUNglGu
 TQqf3dJf+wgdtg7oGqztDuNqFoXnub8XqcMVClftHonMR76pAFMJY2OI/kOnQFeLQvSZ
 UKIqM8eDIePrh+GAK4WtRGHgFV+7/ChPCy05Mz5s1SjfdyrKdgQzYx9n66CVjZzlduCW
 kRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwXQ16I6Cp2tgFwIySqzt/G64hlPbh8xuNdm4rchjh4=;
 b=GhMFQqrhtppa4ELkDaleNMaxEY/Pm4H6IzhBqCAfetDkz1OJsQ9/Q2YIcCGpK4ZAc8
 eCijGmnK+L36Pxg/kZZdnmZVhRtCB8gl5nwJpnEiqZoNoD2Ilb53sTts2946fNWsvjoX
 Ic/R7sSmuVIQo9ELB5ZvldMUfkIHL10T8mERiniItR5pDS6ddDYh4FgeveMkPAinCeTt
 4kX7GxE+rAyAypsitC0/7ZOFYlsd7TpgBfKQc5pXyj9MCiFNuzywciK4ktvbwY1UnlyI
 wTwyyADpOjFIPM8EbrOY1mSR5JsRg3+Qcc6Pq/RJS3uGGOD1gNQn4H1xHOC5Jb9we9mk
 KOng==
X-Gm-Message-State: AOAM532vams5D521F5GOw9Fte3pkcgQ9niwTBuas6OeAUzusnzW78hpv
 /QryeRCaH+OsyZPnBW30uIyKVE5QI2V+k4SJSnQ=
X-Google-Smtp-Source: ABdhPJwVcoOuyG4xj6v7doBPjWJI5CgDAYK+frvnQUSyH9g309h6bcUom+gOtv4klrPgAnir7w1wtRTnZaAYYLLrXeE=
X-Received: by 2002:a67:71c2:: with SMTP id
 m185mr12122722vsc.186.1590171488867; 
 Fri, 22 May 2020 11:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-2-tzimmermann@suse.de>
 <20200522174835.GA1087580@ravnborg.org>
In-Reply-To: <20200522174835.GA1087580@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 22 May 2020 19:15:10 +0100
Message-ID: <CACvgo53YDOD1t4KYOWKiO-q8T639jNbMrZuyTXcbe1FBAfxP+Q@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS
 macro
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
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
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, nicolas.ferre@microchip.com,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
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
 Sascha Hauer <kernel@pengutronix.de>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 22 May 2020 at 18:48, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Thomas.
>
> On Fri, May 22, 2020 at 03:52:26PM +0200, Thomas Zimmermann wrote:
> > Rename the macro to DRM_GEM_CMA_DRIVER_OPS to align with SHMEM
> > helpers.
> This part is fine, I like that the naming is somehow consistent.
>
> > An internal version is provided for drivers that override
> > the default .dumb_create callback. Adapt drivers to the changes.
> I loathe anything named __foo or __FOO. This __ signals to me
> that the author was clueless in naming - or some sort.
> I know that __ is used in some lib headers - but thats not the case
> here.
>
> But I love that we have a variant that takes a create function.
> So we do not have to escape from the nice macro.
> The macro is another way to tell me as rewiewer that this
> drivers uses all the default helpers for this.
>
Fwiw I share the sentiment, although I fear we're a little late. __
prefixed functions are widely common in core drm and it's helpers.

>
> So critizising the name I better suggest something that
> I personally like better:
>
> DRM_GEM_CMA_DRIVER_OPS_CREATE()
>
> It would look like this:
>         /* GEM Operations */
> -       DRM_GEM_CMA_VMAP_DRIVER_OPS,
> -       .dumb_create            = drm_sun4i_gem_dumb_create,
> +       DRM_GEM_CMA_DRIVER_OPS_CREATE(drm_sun4i_gem_dumb_create),
>
>
>
> Please fix zte/zx_drm_drv.c which also uses DRM_GEM_CMA_VMAP_DRIVER_OPS.
>
Isn't DRM_GEM_CMA_VMAP_DRIVER_OPS introduced to zte with the last
patch in the series?

-Emil
