Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC941F2A0F
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:08:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr7274ZmzDqSw
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:08:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=john.stultz@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=w8L80Xf8; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cvwy5fXjzDqjg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Jun 2020 15:49:18 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id g7so2762250oti.13
 for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Jun 2020 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JrpK8Y8QAB9MvZ9xumZeQTznRTvQNGD/2K8KcvSfyTk=;
 b=w8L80Xf8lmfERwYk8n1coCJXm+0ErdkgMudQnWhsutMXRpLrhtcUB5IOZAdXvXW7gI
 zF+Zz8u6TcvAxHvvR2oL59q/t4gNz0hDvCN7jRiV9BZ5dkmBOIb/a3UrPMwsC6Du7BCP
 BOc1BLYQoEsoFKgwG3hk8/36f8kQ20GRu/XMop+Gipz55+5whEjgTxmsWAU36YHHsmK5
 VL2LlenUNOptmBHpPGc5VQujTf49oGpd7ksMjUyRhwjG4YWUh1/4ZcJJW8O62pQ4CLjt
 6XKDu553a1stV8Gvq257ojwqPLUalbOrlHOTbNns9pFtIkOs0MlbVrwK6zt0ycRitSL3
 vq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JrpK8Y8QAB9MvZ9xumZeQTznRTvQNGD/2K8KcvSfyTk=;
 b=C6JgZd5oSaA8mAwenr2B5xlslGcfiZ20/t+Nx25zPW3dyeJm5IV/tkO1XNUokBsGcg
 q1vDAUekKeN+65VeJz0gCjOLMr0Q/DQS7xun5lI1rxLrdf/FAAzshVLE34nMKwdHoc0m
 OWNOT9kXV1fd0wc3uutBB+j+X+ztcBTQ32Nwvgqm3SpMxAJapGIGkS+jWFVWAw43xkPk
 aGmVi3OHylwcNNpAxAV5cEY1OWQh68+T2TbJDAXbe+A6eenxi2Rnax4GVzOFrA4Ixunn
 Ts8orn9QOP6iBO0MDkZOqAbd1CXVDz4D59BLPM3lzFxKdhOtG+YJD5jU+0N7kju5V2ik
 o/Ag==
X-Gm-Message-State: AOAM533kDB7IMGkVori33uNNPV2/YVQm/pFpPwlhAQYz9OCdMuQRrg9K
 wKxs2npTJ7OFuMv0S5xCnBQ/RuEa4bf+y2xAEYpe0g==
X-Google-Smtp-Source: ABdhPJx2VgCDOicTZ0mcQ18nPR1dUAvV9shrNs6HBMcETfcU1RtSKRzNootiuRiuHS6q/webDw8kzSyzyfojDp0RYus=
X-Received: by 2002:a9d:b82:: with SMTP id 2mr2410621oth.221.1591249754802;
 Wed, 03 Jun 2020 22:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200603083132.4610-1-tzimmermann@suse.de>
 <20200603083132.4610-8-tzimmermann@suse.de>
In-Reply-To: <20200603083132.4610-8-tzimmermann@suse.de>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 3 Jun 2020 22:49:03 -0700
Message-ID: <CALAqxLWG7XN_A70omeZn03x8zc5aEBrStQDkm8MtUNRxm0sD+w@mail.gmail.com>
Subject: Re: [PATCH v2 07/23] drm/hisilicon/kirin: Set .dumb_create to
 drm_gem_cma_dumb_create()
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, stefan@agner.ch, philippe.cornu@st.com,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, mihail.atanassov@arm.com,
 Sam Ravnborg <sam@ravnborg.org>, alexandre.torgue@st.com, marex@denx.de,
 Xu YiPing <xuyiping@hisilicon.com>, Fabio Estevam <festevam@gmail.com>,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 XinWei Kong <kong.kongxinwei@hisilicon.com>, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, Emil Velikov <emil.velikov@collabora.com>,
 dl-linux-imx <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Feng Chen <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 alison.wang@nxp.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 mripard@kernel.org, jsarha@ti.com, Chen-Yu Tsai <wens@csie.org>,
 vincent.abriou@st.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 mcoquelin.stm32@gmail.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, bbrezillon@kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, nicolas.ferre@microchip.com,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Rongrong Zou <zourongrong@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Brian Starkey <brian.starkey@arm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 3, 2020 at 1:31 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The kirin drivers uses drm_gem_cma_dumb_create_internal() for its
> .dumb_create implementation. The function is meant for internal use
> only by drivers that require additional buffer setup.
>
> Kirin does not do an additional setup, so convert it over to
> drm_gem_cma_dumb_create().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Emil Velikov <emil.velikov@collabora.com>
> Cc: Xu YiPing <xuyiping@hisilicon.com>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>


Thanks for sending this out! Works fine on my HiKey board.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
