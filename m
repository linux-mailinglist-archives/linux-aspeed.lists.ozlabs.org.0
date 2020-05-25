Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8891E1992
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:38:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ6q67f6zDqCB
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:38:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jUoM4eZ9; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vy8T6DKqzDqMh
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 May 2020 23:08:40 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id a4so10454209lfh.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 May 2020 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WvvHGwLY6WlxeHfaDpvlPLhtKpGlM6SauV4sJLLHIzE=;
 b=jUoM4eZ9q1Me5iHo51ZEk5cNDXkjtqvC74gimSJ1Gv2/JEkc7miWdDX2y6Bt3Pw7wL
 ecy2be+BJGxDcfTWfCYLPVzIOSMc3qi1zsP8sGGhq+EOFDiyL2/uoKqQfSoC3GVXlUtd
 iP8IHqbOyAuuyALxmjoPYMzoSCyCF8BQJrCnY/Ba/dSwdAs5sFj9/8RdF65MNnZ5k4VR
 7QPQxh2+NhZ6xuPVfpsnrwumHLx036IyZDQM7VnD6z5EamObcE3JCNp3KvOunDrJXYjE
 fTS42pMOdLvyrjcBj5I285TbidtrC6WT8rdoB7FjquKlOl8C1O685AcMnMaoPnVcRObc
 CG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvvHGwLY6WlxeHfaDpvlPLhtKpGlM6SauV4sJLLHIzE=;
 b=mlhwS0iMF3LiMq8XS/AoZm0tDlcU8d1is5GhgB08ubyc8xxBH5Y1mvt2DFTZQ1foZp
 5KMGikYCfNObBGceUS8Y2FF72AqZsObvvmeU6UN8+f8WDsd91x3SoMa36ZrbAQWC2+om
 KkeJw4BhrPaq8hgey5Nk3DH3mD589K+AOYLnpBPNhx7DVudUU2G0et6/H/6AluPy36Fq
 Z4v9Hol0iVkBSZ4EGsYV+w7NMrzseXMrvNCoLOwQC9T5MBoam4u+oeoyOXgXC5marFEL
 7R1x+EbW78eOv2TB6bdtqa9VEY+vKaAudEln23Sm8f/pLevoaukFmYMjEbfKW4jSnDPC
 JfIA==
X-Gm-Message-State: AOAM5335pwIJpA3ZuLvmUfWBD0yCiikIEBV6+6qAO7cLVwdyNzOEkDOl
 qiclDYr61/32eniwhjHGcKetD3n/oWEWdVKnbksLSA==
X-Google-Smtp-Source: ABdhPJzwr6YwueJ1MfLBnSadbaGpNl8oMrkUPmXWw+j9Iwbimy6Xfz92o6Qb8bIrDXn/hwWGzk89ShzwL/xztxiFHuc=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr13456032lfq.4.1590412113648; 
 Mon, 25 May 2020 06:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-13-tzimmermann@suse.de>
 <CACRpkdaHuRHiNjisai2d-karW6y11M2qsPkx5Hn0sfc8T6B_qQ@mail.gmail.com>
 <402b57b6-0827-2659-b676-dc633bf6c444@suse.de>
In-Reply-To: <402b57b6-0827-2659-b676-dc633bf6c444@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 15:08:22 +0200
Message-ID: <CACRpkdZVgbqLmqzvZBAzKvEkYmT=be=d2UxyRMwRXjYDp1mx3g@mail.gmail.com>
Subject: Re: [PATCH 12/21] drm/mcde: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 May 2020 12:34:07 +1000
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Stefan Agner <stefan@agner.ch>,
 Philippe Cornu <philippe.cornu@st.com>, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Marek Vasut <marex@denx.de>,
 Fabio Estevam <festevam@gmail.com>, abrodkin@synopsys.com,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 k00278426 <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, james.qian.wang@arm.com,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Jyri Sarha <jsarha@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Vincent Abriou <vincent.abriou@st.com>, Sascha Hauer <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Rongrong Zou <zourongrong@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Brian Starkey <brian.starkey@arm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, May 25, 2020 at 2:51 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 25.05.20 um 13:36 schrieb Linus Walleij:
> > On Fri, May 22, 2020 at 3:52 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> >> The mcde driver uses the default implementation for CMA functions. The
> >> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
> >> All remaining operations are provided by CMA GEM object functions.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Could you boot-test with the patchset applied?

Yes, if you have a git branch I can just build and boot I can
do it quickly!

I have no idea what this patch set is based on so it could be
hard to figure out the dependencies otherwise. Also many
patches.

Yours,
Linus Walleij
