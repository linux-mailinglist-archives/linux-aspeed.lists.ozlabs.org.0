Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 093281E198A
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:37:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ601kSyzDqDF
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:37:44 +1000 (AEST)
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
 header.s=google header.b=msWwjW/E; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vw622bRxzDqKs
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 May 2020 21:36:20 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id l15so20046696lje.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 May 2020 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nKDCC31lVplkCK9g+FgDQZQbnR6/ibgQuMUIxivqeoI=;
 b=msWwjW/EFiYBpSB1PMKiHwxcanxFSHxlR+3X0sHZByPfiC2QSV4DoNmvT7O4dbXu9F
 0K9bv7UZXa2eMUBajN3+R926ssZDXZ/4HqHbV8XeovREkArzpsrSFXx4a7ext/EPVRHd
 fNmAsa+iZWRC9ex0j5yE9PYDrl3Og7MEYQY37N/hfOaWiX9xGaYly5dZ4I98mLJjwXQF
 pK2D04P8rIQ9akxA9woZ7kvew1MGPneHOQP6WnWKuTsLLGi2RWhM25v0qJsepXTtL83y
 V42s9XMFgLa6fDTWooh4pDl/GhkQlDJWBFwiXH2oKeNezpg6QfpaMxHtGt0u43VuLTjJ
 JMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nKDCC31lVplkCK9g+FgDQZQbnR6/ibgQuMUIxivqeoI=;
 b=M08XINqX9REsgyJYbC9k/UwfN/kcXXXhR8cGV3ckZdk7GrOG/qvF5Y+NAjRQrXWNZj
 7eowzbDS6l6V7s1TfTPvnmUt3WpMKmNdGUSXX695otV8IZQMI9S8In65rntbwTpAB1DI
 u0jS9NZ0yAN1ekyEPPxCwUoBDjIaCYI0mrVD/D1SPKEmRj/MYxm29VoLBElJ6iC5aTYC
 DjZ0X+c7KHrVqSwC7caxqbJ/nCqitE26diKqGP0A1zC8ML9eg1GcsbfqnIdlMwjAGev3
 cgPvNwLoIaKqaq0lBmOH38hcbGq3wlRvedAHSH9/E8Zq/DTHfqljhvMYvZ5gBWBWxMFL
 SeBg==
X-Gm-Message-State: AOAM5334rfjNGAWZafd8HpeH5O7X+cmY+E55R7mHgvz4rA6HRQwUTNZq
 9urvPAJr06V/SXxuHKLzfP7jr3W8xpRw06GScrErCA==
X-Google-Smtp-Source: ABdhPJyELBoCVpB94Iplz8KFaMRF/2lEgaAQXHjW8SGV8kykGm10bWXxaZ0x4DeivUuVphyNfbaVhr6s3rgjDJpmrME=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr13365004ljc.104.1590406577281; 
 Mon, 25 May 2020 04:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-13-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-13-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 13:36:06 +0200
Message-ID: <CACRpkdaHuRHiNjisai2d-karW6y11M2qsPkx5Hn0sfc8T6B_qQ@mail.gmail.com>
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

On Fri, May 22, 2020 at 3:52 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> The mcde driver uses the default implementation for CMA functions. The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
> All remaining operations are provided by CMA GEM object functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
