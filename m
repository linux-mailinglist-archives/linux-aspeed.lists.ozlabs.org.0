Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF051E1960
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:34:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ2J130fzDqLx
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:34:32 +1000 (AEST)
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
 header.s=20161025 header.b=Z/VXBNCr; dkim-atps=neutral
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TF4L5C74zDqtG
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 May 2020 04:14:10 +1000 (AEST)
Received: by mail-vs1-xe42.google.com with SMTP id u7so6564602vsp.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 May 2020 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wk1gbg+bM/GmwTo+ErImdJXdcBRK1O8Y6ClkW84B2gk=;
 b=Z/VXBNCrQukwB/grZDpR4JRrrIFVDGnXPVQGzoZdFZSY9+lsS7zBSg3/y4yKjgfGGY
 Hlj5ggTwWFhM4Iu+lrCmvA/kpLeGMAEh9IBnukVKYeQ8XAlipwDOSWtp/zxdlarZe0Ab
 KvXgH4mWD1TMWCfzlY+BRVaZhSueDefG7JQ044dDwB4FuVwzuDfMKV4biTRnF4wmMIVF
 0PIelwwEPF7vEwG9a+xjdmbaEJYqeCTRbseyqHHRd32tKMngQOFIoy6wi8U41id/FPlT
 xKNkFeRVWoORZy8tZs1IuTypjJJhRKlaDx+UHqOEQNGDW+9x3RIdi/uKd2jmGF7NS5Ox
 g+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wk1gbg+bM/GmwTo+ErImdJXdcBRK1O8Y6ClkW84B2gk=;
 b=MlDeU13J886djEW3tIQCXo6QxMRdzJH2sJxfkqb5V1OyznJ8jT+9Hu4nUxV0qJehXf
 QoNR5kaUeRzLa4V2pJ4a0OZCdZCHuBLdFZ8ddeykrHH/ptuBL/yTCDTCgymNErInL72S
 KjyswO3FlabMqfy54DsX9KPTd19NVUXOv9NzId6nbY8kzW07JLWqvjnmvlwJcXG0OxCB
 HG1p/mEF5F+GtknSlE1rk3H7NqZQ1xBjRAP5HvLc2R/SX8CE7NpGhKETODjuNRTR9WDA
 M5FeO5HhA8pSmPrf6JHweI6sNxKf16Qgxkrjj07bk5pJGSgu6KyMlxTx+Y3VGYDrTp6P
 mtQg==
X-Gm-Message-State: AOAM532dIG+cn4Q7EBLllYSiPtoT9G4UR8+kMFhomiatN6rtJ/yuQm+1
 wQpn1TR+3K1F6CwKES8pq9j258Mor/FyzZH/UvM=
X-Google-Smtp-Source: ABdhPJz+FS0+nkoHuNauP4SBN7HFaoJApeyTujO2QZSYWTwKxkjR6gI9c6cMAPRYKxV76mdsTNNwl7AcQJAkrkUUF7M=
X-Received: by 2002:a67:71c2:: with SMTP id
 m185mr12109967vsc.186.1590171246836; 
 Fri, 22 May 2020 11:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-8-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-8-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 22 May 2020 19:11:09 +0100
Message-ID: <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/hisilicon/kirin: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Stefan Agner <stefan@agner.ch>, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 ludovic.desroches@microchip.com, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Jyri Sarha <jsarha@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Vincent Abriou <vincent.abriou@st.com>, Sascha Hauer <kernel@pengutronix.de>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, bbrezillon@kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>, nicolas.ferre@microchip.com,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, khilman@baylibre.com,
 Rongrong Zou <zourongrong@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Brian Starkey <brian.starkey@arm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Fri, 22 May 2020 at 14:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The kirin driver uses the default implementation for CMA functions; except
> for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro now sets
> these defaults and .dumb_create in struct drm_driver. All remaining
> operations are provided by CMA GEM object functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index c339e632522a9..b1ffd7d43e562 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -921,17 +921,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
>  static struct drm_driver ade_driver = {
>         .driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>         .fops = &ade_fops,
> -       .gem_free_object_unlocked = drm_gem_cma_free_object,
> -       .gem_vm_ops = &drm_gem_cma_vm_ops,
> -       .dumb_create = drm_gem_cma_dumb_create_internal,

This doesn't seem right. The _internal documentation explicitly says
that this should _not_ be used as .dumb_create. Instead drivers should
use it to implement their callback.

Since it yields the same result as drm_gem_cma_dumb_create we can use
the default macro below.

Weather to the .dumb_create in separate patch, or squash it here -
I'll leave to you.
In case of the latter, please mentioned it in the commit message.

-Emil
