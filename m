Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 334BA1E198B
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:37:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ643cPdzDqLp
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:37:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VkCGlEZw; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vw6d3m5vzDq6K
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 May 2020 21:36:57 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id k5so20371908lji.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 May 2020 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cboEB9A0EUD0Sv3wBdqVD29b2uLspYFAQ/E57S2GG8=;
 b=VkCGlEZwMw5lm6CNbpgySDuYqUdWf+cRkRKofFCWXFvRVKpc6Vsc5vQ/8F/4GsExxJ
 lhCHCI+zivKuTs5e6l8Szn1UBKGCbE6jvRGQ7W8YfblN9kpWDmIf3dhMphgvz2k5dhp6
 ZS7uvP/BM9bde4ruwDkjNN1euNy2Nzus59C02FYxzlDmREU7LJFoYM35eJMHpryViVta
 s1IuqJQZfpFaple5z0DuvY7g74aqEGQt/7bnwozuTwLJbU6LVJnLa/qi610rTIysaY9d
 o1F7PCaJgwh7uWOqGgMvTqdAmS9DqBTP3RKlpWiwD5VnjVXCHl3F1nwGlIJK4TcVmTG4
 f8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cboEB9A0EUD0Sv3wBdqVD29b2uLspYFAQ/E57S2GG8=;
 b=F1HwpCmwPVk5IlQ58R+w2Guf3AxKyBjcqVaXoSnkggS60b4HRxNt49FSh8gsHMBhxU
 /hYIK2oIeBmMGvX9ZMw4qTNTxu0GjcBjHdYrzuslq4sajn+Tva5NxxDOYBApoadAztlQ
 MfzsoS+aWFQgx05ek8nzFlo+w5qAqvbX0OD/PZH2e9ALx/jOsLIWU05FVwrV+WPGrB/c
 hM5o04ri5awFxgavOHNZr1zEixpB3ihYJLs5B/iS5z7d9/GdKzLAja0NclzLeYuMtUrw
 TxQfBMaBboFMuuukHnW6IAWyvHldo6kXDWfy2hqfn1Qn55TL/HtP0I1q8SClzC4GJgnY
 iiMw==
X-Gm-Message-State: AOAM5335Ph7cD4LSffP83nfk0FaGrvEQdBSyQbs7BXI7CnxOx0VU+WcX
 uAXr+4z05Vlem8QgOV7q+FvlJHJPrPqkrzSXf0z70w==
X-Google-Smtp-Source: ABdhPJzgI/S59SwkD29DsR9IgbvO+abZQXZ3sBQEMZnc5AXKk35gsnIKyiA5MxieXb4auAQ3g79w+lr1xZl/NNQBAoU=
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr1252357ljn.100.1590406614483; 
 Mon, 25 May 2020 04:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-21-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-21-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 13:36:43 +0200
Message-ID: <CACRpkdacQd71UqyU5QcnSemfR7M+fA9hf-tahzTtyKgK4wV9Sg@mail.gmail.com>
Subject: Re: [PATCH 20/21] drm/tv200: Use GEM CMA object functions
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

On Fri, May 22, 2020 at 3:53 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> The tve200 driver uses the default implementation for CMA functions. The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
> All remaining operations are provided by CMA GEM object functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
