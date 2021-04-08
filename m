Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD06358F6B
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 23:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGZZL5kZtz3bTQ
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 07:45:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Zk2v3nSM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Zk2v3nSM; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGZZJ5yQFz30RJ
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 07:45:41 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id o126so6517377lfa.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MVBTVTbGflc/UsLhIwl2nRzF2EsRH8eZ0QlPXqs5ps=;
 b=Zk2v3nSMdaCm5adH4aHswvLKgEBKklbkCPH2zPgIVKp64w70n2axR/qGDplIQ0OZ0n
 HLegwMCSSCAxIt8LPsDPeA7J+lV2LnPtLiSNhLWjp/m3yDKXUPRvs0hxnHugTRrpsB6U
 uiiThswQsEAPRovlktmLYn49OPrRupsH66VDSzbKlxFr/Wn44w766AsgYLN7vrCHZLyR
 Uur3yAtqGAhF8O/MxSPYa1P5Yxp+6YntEF7We62ytpY0VEX1MNQUtmH/O+iMLbWa2H+y
 yeUIQCjgCMD2v6FVfHm061JaiZ7pmmjnI2REqJ3G0vMQF8z8vVWj0AbKZlNKPI0hg/VG
 eF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MVBTVTbGflc/UsLhIwl2nRzF2EsRH8eZ0QlPXqs5ps=;
 b=jjqvJZo2wTJYYL9xSAo64ATQw8E+df3hBO6DF6/wZ6zeOLMSErAH7Jlvqb82UpG2x1
 QdhCRVyBZXLgpPDMflx5p3SCdwhwErFgvAhRt38/upwwq4vMgg2NfXPx+xl+mqA7fV3k
 rGfSMId3p50RoyE+We4KH8tjYAuSwrIIl12x2DLvqULBetJ4EbwlmBJYTNs4XCoce7N0
 j9DkLhcMS176ZKZx7ISQic3eVbBpSNWiDYtXd7RoNuO/rdiP/cVdSBsZG4fG4Se/cIa6
 YIkqA+DaMA+5pFDvw3QooiU0F1oihGVvOcWxnze/dIsmI9KBgB31aHkpUHQfcltssNc1
 Tljw==
X-Gm-Message-State: AOAM5320x1WxJhusuY8JoWBAuVAnWs9b/7IMRdvKivmClIWjgikTVB9g
 dFjh9o/8DicDLtMjLL8cqESGv+Wc+Fd/a7WDZwN90g==
X-Google-Smtp-Source: ABdhPJwOR1qaBP0hkaYoeDA9UZM861Q2LgMU2bP4wenXDG9wfbiuruw1rThn3wnUQVO3cDtDB82sQHZzPUH6KOtdfMo=
X-Received: by 2002:a19:ef18:: with SMTP id n24mr8062945lfh.291.1617918334556; 
 Thu, 08 Apr 2021 14:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
 <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
 <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
In-Reply-To: <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Apr 2021 23:45:23 +0200
Message-ID: <CACRpkdbMLBzG_Q=-XzjsWvpofHyRv7sdB697mHLaRu4F=+GC-g@mail.gmail.com>
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

On Thu, Apr 8, 2021 at 6:44 PM David Hildenbrand <david@redhat.com> wrote:

> > drivers/gpu/drm/mcde/Kconfig
> > drivers/gpu/drm/pl111/Kconfig
> > drivers/gpu/drm/tve200/Kconfig
>
> I was assuming these are "real" dependencies. Will it also work without
> DMA_CMA?

It will mostly work but that is only because the reservations are
mostly contiguous anyway because they are done early and
are small. The hardware requires contiguous buffers in all
three cases. I'm not sure I always got it right.

> > certainly needs this as well, and pretty much anything that is
> > selecting DRM_KMS_CMA_HELPER or
> > DRM_GEM_CMA_HELPER "wants" DMA_CMA.
>
> "wants" as in "desires to use but can life without" or "wants" as in
> "really needs it". ?

I don't know the exact semantics of using DRM_KMS_CMA*
without actually using DMA_CMA. I suspect small allocations
will be contiguous and big allocations will start to fragment?
but it's just my guess. I guess "really need it"?

Yours,
Linus Walleij
