Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6241F2A10
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:08:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr7D5By1zDqSx
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:08:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=john.stultz@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MO5dE3Kx; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cvxQ5f2MzDqjg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Jun 2020 15:49:45 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id m2so3837585otr.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Jun 2020 22:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqE9XL7eLOP6VB2UAD3Y6E2HkrlmXmVJB3VWo1bq1oI=;
 b=MO5dE3Kx5mjbbliZCC3Gq5PDpWA7a4nuo502DQJrzpCLIvVdxVrbSrhn74AyABYIoe
 lPCMdk1MiPSMBUJxStAfD2Su3qCsvH+iKP1NSA01m8nK3q/DVksrqqgSCWEylPM4Lo1J
 DvKD4hPGE7nIB6NWD+ZthQokSHEdGis3ScNwkMkisKvt8Cb6ttOjq+zpZOfiWse/jeLN
 zJJ/yBzFvL9cHvN+W8MTHmf2Ya3i9bg663uKHwXJ0mF6bymN33x+Wu91is148k50hiPr
 6/41J7NSxZwfGsh5uWd1z2SbPWNMvEGi5QlrzZ0gGX+TxgBKXXguGWSzfIZeyoRkCBsQ
 Ulag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqE9XL7eLOP6VB2UAD3Y6E2HkrlmXmVJB3VWo1bq1oI=;
 b=JlGon1Jw2wijWPwIM7cKB0ji7BHIhgj0b82bsUo9gBo1ad2WeGmzD2i6GE1OE+j2fb
 iXf1C+bfhRSFZEr3aLOHfIPC/w3WFLg8bE/V4lBIdSOqT8Xf9jBrHbGIhTsKmFVg3Md9
 xoXSU36Acb0milAKzZifKvRsGSkCvKrTyLrd10bhA1aYBOfizf8aSWk52+2eV2BACj0e
 imLuSFIsnRPD3inYCeG54Z/ma9nv+8SAvp89HCQYige8XNu2Efc0AI+MQjr8XhezWWvx
 eLl40sGnHCgS3L+i5mk7C4veyrikTCEy6wLF3EhvKQsZZAUyWH9xGVuAFwzeEeaJpEHM
 XZow==
X-Gm-Message-State: AOAM532wbD2Mbzr7p8mS7VACC3BijCIeVnpsG9OT94bDg2eZDwT8wpYi
 NEgIFJVdh1qBR0xqalIk/ZHsPqcHagNc19deT5hcjg==
X-Google-Smtp-Source: ABdhPJwFoZcJcGd1oTntB+jTXRYWvHT8WC7Bu9Lm72cHxLY7c0uxSsBeE0QpIpftyseCEEqnkhlM5eJ1pCAOFhWaj6M=
X-Received: by 2002:a05:6830:2439:: with SMTP id
 k25mr2447692ots.352.1591249783290; 
 Wed, 03 Jun 2020 22:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200603083132.4610-1-tzimmermann@suse.de>
 <20200603083132.4610-9-tzimmermann@suse.de>
In-Reply-To: <20200603083132.4610-9-tzimmermann@suse.de>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 3 Jun 2020 22:49:31 -0700
Message-ID: <CALAqxLWnxsv8wuMjAWw=MAcf+2oyFLH2M=Av7owZCMgUpQexNw@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] drm/hisilicon/kirin: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:39 +1000
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
> The kirin driver uses the default implementation for CMA functions. The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
>
> Using DRM_GEM_CMA_DRIVER_OPS introduces several changes: the driver now
> sets .gem_create_object to drm_cma_gem_create_object_default_funcs(),
> which sets CMA GEM object functions. GEM object functions implement the
> rsp operations where possible. Corresponding interfaces in struct drm_driver
> are cleared. Prime import now uses drm_gem_cma_prime_import_sg_table_vmap(),
> which maps the imported buffer upon import. Mmap operations are performed
> by drm_gem_prime_mmap(), which goes through GEM file operations. These
> changes have been part of the aspeed driver for some time.
>
> v2:
>         * use DRM_GEM_CMA_DRIVER_OPS
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
