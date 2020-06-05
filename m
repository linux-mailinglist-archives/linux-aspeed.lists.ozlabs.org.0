Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C111F2B3E
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:17:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49grKv6vQhzDqSB
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:17:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e43;
 helo=mail-vs1-xe43.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i/zJbAE3; dkim-atps=neutral
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dn466wB6zDqHL
 for <linux-aspeed@lists.ozlabs.org>; Sat,  6 Jun 2020 01:43:34 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id g129so5853859vsc.4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 05 Jun 2020 08:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DaW399j0+D4Xs4eLuSFZIWJCp5uF7FjJvuMOF1CdS3Y=;
 b=i/zJbAE3NTHr49faEOZ7ZTHaYM7oUsJamCx6nbaX2UCDODIsmWrg+aqIFKnVge6CBF
 wwHYqMAdZpdr6OqiNA3aLJqJm6ov9hIfBJqXiQX9HZlDErwMKiO6UkbuJscfEnKONPqv
 GSCVChfRAiND595Toqa2q9wswFZ5gyJyayy+8BYc/vfMNd+Qrp+5FjnUj7+NiV8c7mOA
 xXQ0VZ7PbQbRLB3AN6DghTdJa2U0D6BS4Dvx4PRgKZ89RJWjYwPGDIHbcfMIkykKNUm6
 pzIwLueLW0R8fi3LomqTTgvsvJDJTD5dIzeFfihfvVojfObFi6vT3toqEVF5paJUKlqU
 dfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DaW399j0+D4Xs4eLuSFZIWJCp5uF7FjJvuMOF1CdS3Y=;
 b=O5p82aGfXMje7f5uNeJ4mvqCqasQX02o5l4rSb4zOt08RGTFpbRafn8xHOXs3apA7q
 QecTgD70iNkAEKPLIBQsxp+Cj+A9vouOajBmpvytmETMq9Pey3oaaH+SAhS6URF2+CA5
 2YutNl4TVr5Q78MMf1ZlegQA9QrpO9bfVHabKTBGmR98+mJe4shNjUqp5SiiJ8dEl8J7
 AO+i5kiG0tBXRhWR1mJqYqKUPz9uktQU0PMFjqbF3tK7YeunmJsMFnLk5ugG1Adxjdcx
 +5k0Ca/xF5QR/W5IVugXW9y0Ytmb6Q9K1qpFkgOeEjqbjyPm6YhzDlFOT0VcBy0+EHgp
 easg==
X-Gm-Message-State: AOAM531fzWIpp+gOWenG0fnxzerwlOuSIYfuFpCvocxJbHCkTvQIrdiy
 VipQvea0qGAu+fCwmLhgMHbvzfg/S/S6Sbjnqkg=
X-Google-Smtp-Source: ABdhPJxeKLY63wzlnnXqjrGE1JM6FGhy2Qm1G31LDK7A50GrY+xaSvvt+Lka3vuuxrfsliwVnK3NAwnwuIHsjVYUAtw=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr7469670vsj.186.1591371809904; 
 Fri, 05 Jun 2020 08:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200605073247.4057-1-tzimmermann@suse.de>
In-Reply-To: <20200605073247.4057-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 5 Jun 2020 16:40:07 +0100
Message-ID: <CACvgo501LS_pcuiM_=BonJTnWEkcjC4m5yueEeJyv_c9Q8MAvQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/43] Convert most CMA-based drivers to GEM object
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:37 +1000
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

On Fri, 5 Jun 2020 at 08:33, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Most of the CMA-based drivers use the default implementation for the
> callbacks in struct drm_driver. With this patch, these interfaces are
> initialized with a common helper macro and GEM object functions replace
> several deprecated interfaces.
>
> To address Laurent's comment on the amount of changes per patch, I re-
> organized the series.
>
>  1) There are now DRIVER_OPS macros for drivers that require a virtual
>     address on imported buffers, and macros for drivers that don't. Therefore,
>     drivers don't switch to drm_gem_cma_prime_import_sg_table_vmap()
>     implicitly when they begin using the DRIVER_OPS macro.
>
>  2) I split each driver's patch into two: the first converts the driver to
>     GEM CMA object functions, the second introduces the DRIVER_OPS macro.
>     Neither patch should result in a functional change. I kept existing R-b
>     and A-b tags on both patches. Existing Tested-by tags are only on the
>     final patch, as that's closest to what has been tested.
>
>  3) I dropped the conversion to drm_gem_prime_mmap() from the patchset. As
>     part of this change, the CMA object functions could provide an mmap
>     function, which is worth it's own series. The patch for aspeed requires
>     drm_gem_prime_mmap(), so I removed it from the series.
>
> Patches 1 to 3 update the existing macro and helper to similar naming as with
> SHMEM, add a new DRIVER_OPS macro, and add helpers for drivers that override
> the default implementation for .dumb_create(). The remaining patches up to
> the final one convert the drivers. The kirin driver also changes to the
> default dumb_create function. The final patch deletes .gem_print_info from
> struct drm_driver.
>
> I don't have much of the hardware, so it's only compile-tested on aarch64,
> arm and x86-64 only. Several patches have Tested-by tags.
>

For the whole updated series:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
