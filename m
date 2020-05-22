Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9B1E197F
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 04:37:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ565bdKzDqCB
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 May 2020 12:36:58 +1000 (AEST)
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
 header.s=20161025 header.b=iJwzC0nG; dkim-atps=neutral
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TFGR4j6tzDqbp
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 May 2020 04:22:55 +1000 (AEST)
Received: by mail-vs1-xe44.google.com with SMTP id v26so6606533vsa.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 May 2020 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRpc3FlkyJfZ3AzDx1k4B+KYooU7hfXK0+bh5YWQUT8=;
 b=iJwzC0nGRrdpqM+uYBus1lZJmLTJ1WZjAPapj+B5sXJDiBWTikY1mNrK8yss/i8Uoz
 k90pcgPWg4KhOEP8Xk/wB9+iKrnTlqXIKHFIF/ypG8qzXbRqxDo9EUkqRTSov/W/VHcE
 sSKvs4Qu7xLc8mc+Ynq48xyLS9RrMy6v/P+GSXeHZL0PEHfgW5Z9DiGzh3bYKGDs62qN
 glPHp6BDdsL/vloqirQjgXV44Nw7pQTtq1/6JMYfdO5Lt0a5tqlkXoAuEc25ITuChk8/
 E4Z6Kou23M2+Qytdfv6N+9AwHoJQrU5puF/g1MDYi0emOTpm0GjhJgbZAS0b83tXIzgB
 V2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRpc3FlkyJfZ3AzDx1k4B+KYooU7hfXK0+bh5YWQUT8=;
 b=JIkKnIQAYpHCpyeBJE1tjgrTdTlDheG6MmNtzvW7N8oFqiBpoo6FeEfTQ+mD69pCV5
 1Ow9Gn4DvV+im6oMIWdH0VRYWE5QorwwBDVeQYGtBwPcsKAjzpVfgD/mrAUormh7QPKE
 Ow3anVfZtDYDyxqb4BdCEyfidjbGb4RN9KjvlCzUYYysmYO+VJI0Uf8VR2KlxKknm6eo
 ZDhk+ciXZjAH+m39WiXhs5JMTsGR92q9FSJU2ASC/bhy48wSTE7syxIv8wnoRMRRn9P8
 0aCZgzK7kohCEhZGeF0Ecvj6lyD8h3esrAb0NmwyXuukpGjLJalzKLqvMEYV9vXEUGNe
 0ezA==
X-Gm-Message-State: AOAM530E/64Xmq4b1UamEKe6+e5IZApF2A3GyRWFqAMuR5GHZDUMxaWC
 C2Vva4H0hGKTM+hwM7Tz5Mkf1mmwCugJtmqe6bc=
X-Google-Smtp-Source: ABdhPJxh45CBDmh48ZBOgWFO+wRiOCUEhrYJEhN/uqv09qF9jDsFxcGYbY0km9LUl9jjYIytYOfzBsf3J51ZExfC9Aw=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr12554064vsk.138.1590171771367; 
 Fri, 22 May 2020 11:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 22 May 2020 19:19:53 +0100
Message-ID: <CACvgo52ajrBxHoyVZKf08GkNSa77NWkufDPXcB=dcWmvMQZuKw@mail.gmail.com>
Subject: Re: [PATCH 00/21] drm: Convert most CMA-based drivers to GEM object
 functions
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

>  32 files changed, 52 insertions(+), 226 deletions(-)
>
We need more diffstat like this. With this series the .gem_print_info
is no longer set.
Feel free to follow-up and nuke it, alongside the glue in drm_gem.c.

There's a small comment in the kirin patch - with that resolved the series is:
Acked-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
