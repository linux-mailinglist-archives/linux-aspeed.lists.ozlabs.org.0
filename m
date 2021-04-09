Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9611359EE9
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 14:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGyKp4t5qz3bTw
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 22:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tD/+WsHQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tD/+WsHQ; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGyKm23yfz30Qk
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 22:36:09 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id l14so3378426ljb.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Apr 2021 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tg6sgY5o6KJ5S57CRLT5oBYc675XGvjvO0a75IDhy4M=;
 b=tD/+WsHQQWYusIiNpWcK7bwWVSNKlMLnyRF8CoJ3CZhMIHxMdvtXVATkH2bY6CsvV6
 4EeqLJcMu8Lx6dXjIGijM9Z71Ysw7FoPhIt4pVwzFK6l7vQQG0p8gmVQcZtmvl5D6mmc
 vnQ4vXPZDk4T7ERYAIs5HJIK9/rMwsb/PGlIkgHlPxrLJNQV9qOSD2eFT+qGhgN9rW/v
 i+5TnZ7zezyrlf0LjEA3nkURPCbcKV3D0THgJHWfMYiU94A6/Dnr2CLqYXHUaZSeUV9C
 jYnvEDTnSyDvM2CCXvtBaB8N7OxfbX9Umv48J+Clvg4cWNbqEuv5MYIvFfkzoLNaHZdC
 sk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tg6sgY5o6KJ5S57CRLT5oBYc675XGvjvO0a75IDhy4M=;
 b=QMs/MgZlDTi5o6+WOk5nOdjqb2PB/1RV1W2v1vY9AvaerDqvnTGLa6xargpxc9oRoe
 eYPZtg3hunXxQohUfRczIacOuR3q/yDnEWj9WHsioL8kZGinIOybhEdztM3cLxEqRXvR
 gea33MFedlleTPqxR4vgB4aW6E/zynemJjQBJjvrF/BdWiE+an0sjVfY0Quxpr6MSfVa
 HcjLRHBoHwr+4Xz++SxgElyXe8dWQKEZ8uFvqWPa07DUIBRnB9dzoMPVTFkVSBCk6+FH
 CGzDWJcqC8ZW745CqJ07QnaQrpzBvD/p9l8/dMFfEHpb05AWU9Cl5OPtcXegzH94i7vx
 Divw==
X-Gm-Message-State: AOAM530a44qYsvgEjSBppG0zmiGzr52d4APftnqZDSEj6fINcTbGITBa
 UZie9XojrbZk2+5dmk1xWmPZJc0BS3li4YzUw0pvJQ==
X-Google-Smtp-Source: ABdhPJxh1RNVQiQp5bCHRakekzyhAZR4aqS7papfBzgGL0DdgK61i7YYHDZZLT+jLT3UuH+d/zlCtwSkkzSHByUlUhw=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr9682701ljw.74.1617971763963;
 Fri, 09 Apr 2021 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409112035.27221-1-david@redhat.com>
In-Reply-To: <20210409112035.27221-1-david@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Apr 2021 14:35:52 +0200
Message-ID: <CACRpkdb_eQrcCFV9Q9uho8E6HO4X0dRJp1qAdJBcT82=sZ1v7A@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Eric Anholt <eric@anholt.net>, Suman Anna <s-anna@ti.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 9, 2021 at 1:20 PM David Hildenbrand <david@redhat.com> wrote:

> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
> which depends on CMA, if possible; however, these drivers also have to
> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
> driver cannot do it's job properly in some configurations.

Looks good to me. At least a lot better than what we have.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Let's see if this approach is better for soft dependencies (and if we
> actually have some hard dependencies in there). This is the follow-up
> of
>   https://lkml.kernel.org/r/20210408092011.52763-1-david@redhat.com
>   https://lkml.kernel.org/r/20210408100523.63356-1-david@redhat.com

You can just add these to the commit message with Link:
when applying so people can easily find the discussion from the
commit.

> I was wondering if it would make sense in some drivers to warn if either
> CONFIG_DMA_CMA is not available or if DRM_CMA has not been configured
> properly - just to give people a heads up that something might more likely
> go wrong; that would, however, be future work.

I think the frameworks  (DRM_*_CMA_HELPER)
should pr_info something about it so the individual drivers
don't have to sanity check their entire world.

Yours,
Linus Walleij
