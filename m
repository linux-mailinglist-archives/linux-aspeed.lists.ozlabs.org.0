Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7563583A1
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 14:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGLhK32QXz30Kb
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 22:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vvSgQJ10;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vvSgQJ10; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGLhH4tNJz2yym
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 22:50:07 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id r20so2113137ljk.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ue62b/nOsWagddlxWSHgZE+xJ7jpEp33uT3hApzk61s=;
 b=vvSgQJ10J71/hJsIWwLP3XbsOekOzbhwMvBACn4AWfAGleRLrUNzHNNK5uzeLyioMB
 oXIl0KjQfY0cc+zIdEytIHzN42/OjUgsVSyQzPNF7LHyemG4aoQzWGjp1kQcgyP994UF
 PBZBxmSiF5r5UO7u4g9kPbjUHVxyNNgYMU5Knd5mi7CHQ+mjXkXFxyyxdoyhMqiKcHh7
 KD6xoCCNSIaQ7e7UvoyagNDB6CPkDalEXBqyL+CK5Z+carCsx1vQWABrVJ+/Y/1Z2juI
 00Ab6erVT5dMmK0+1wheunsMvAYIodPt4qdrCvcG+ZzapbmUF0rbOlXfcBEE0hLDekJq
 R2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ue62b/nOsWagddlxWSHgZE+xJ7jpEp33uT3hApzk61s=;
 b=bttE/WGazmFw8eJcHBA21u601z1Vjg6C+AVtnJGG43ss5EFAnacq6qaxQt79XWHwAz
 ZpOSgW8OjQbUFlrT0YjADxiraS2jF6t+DFP7mtKfKTMt6zlTjCMhUl1cq6ZR9f7cgZoq
 JU3uh0vWiL+3QANBHNWrtPBGiiJ6eTruuj6G8OZUeEVHcrz6JsF9iZQ7QfvG+JV1HR0U
 cigEykzSreJKb5i65j3qkZvH4rWNZuuXIoajcBjOV+toP3AF3Z2CeOYnoOYAPjT0yYKU
 +e40Z0sG8IwAOstq/qPI/iQkWcbw8tk7wrIBnZPOtdhGTG66xNr0OiI8V1fKWzP72qPz
 I8kg==
X-Gm-Message-State: AOAM530RM1MXKYcMjt0+ISoQEdByK04Doqjbg0Jj+DhEQKhgStn4M088
 +bkj5PWKY6d/mf5KN+nc6KckRZQxUknYUPua51OnuQ==
X-Google-Smtp-Source: ABdhPJzHwP6BmbIRqU1HYc3FQkCjshHvviqMY3IIos9nhT5ENCEad5QCJ7O5xWMp2CMbQh00KOeiYn4d7d9pP/p57KM=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr5550860ljc.200.1617886202537; 
 Thu, 08 Apr 2021 05:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
In-Reply-To: <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Apr 2021 14:49:51 +0200
Message-ID: <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:

> > This is something you could do using a hidden helper symbol like
> >
> > config DRMA_ASPEED_GFX
> >         bool "Aspeed display driver"
> >         select DRM_WANT_CMA
> >
> > config DRM_WANT_CMA
> >         bool
> >         help
> >            Select this from any driver that benefits from CMA being enabled
> >
> > config DMA_CMA
> >         bool "Use CMA helpers for DRM"
> >         default DRM_WANT_CMA
> >
> >           Arnd
> >
>
> That's precisely what I had first, with an additional "WANT_CMA" --  but
> looking at the number of such existing options (I was able to spot 1 !)

If you do this it probably makes sense to fix a few other drivers
Kconfig in the process. It's not just a problem with your driver.
"my" drivers:

drivers/gpu/drm/mcde/Kconfig
drivers/gpu/drm/pl111/Kconfig
drivers/gpu/drm/tve200/Kconfig

certainly needs this as well, and pretty much anything that is
selecting DRM_KMS_CMA_HELPER or
DRM_GEM_CMA_HELPER "wants" DMA_CMA.

Yours,
Linus Walleij
