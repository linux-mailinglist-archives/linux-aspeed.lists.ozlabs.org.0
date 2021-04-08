Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C79358E61
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 22:29:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGXtZ0sdbz3bTC
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 06:29:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGXtW650Gz30J5
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 06:29:38 +1000 (AEST)
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MdeKd-1m3eut0WX3-00ZfBo for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr
 2021 22:29:34 +0200
Received: by mail-ot1-f41.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so3578525otr.9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 13:29:33 -0700 (PDT)
X-Gm-Message-State: AOAM530uS9HCal+OQ10PuDXrRRPss2iW7DBlFcfZ3/AwAND48sR/M3ZP
 Clkl4oON4HWkI1yopTWF2AXswNQU9QbBCcx4B+c=
X-Google-Smtp-Source: ABdhPJyfPECLeLOF/Bs3NvQ2GDzKFAUyLZwtkCfbxO3pPqunDWbqv1JOjJ/RM4Y98JdJ7lIhjCGjr/ZYV8r3IjuTvvw=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr9613770otq.251.1617913771943; 
 Thu, 08 Apr 2021 13:29:31 -0700 (PDT)
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
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 22:29:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3sqZBo8-zye1yiZuD2uMUr0oE_q_QfaK9K54TEgd1Cdw@mail.gmail.com>
Message-ID: <CAK8P3a3sqZBo8-zye1yiZuD2uMUr0oE_q_QfaK9K54TEgd1Cdw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nDzRLQmlqFTo7wZc3cJ5E/8chUcYHnpgyrMwYJjEup4QFNzYcgh
 jfs2FIYhbFBnNN4HFDxyBS2cbroDx+9PQmvWZHvePSueokQkKViRayQKF3tK419umoBZVGH
 51IIGua6iMdbc/PIKvUWg+DR5/z4SxtlHo+7lyp7ufR9cV79dUMA6ePaOMH/G1lmLvpYd83
 W5j7nV0XgWGqcF8o6fwAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zVS/gclCRzo=:uBnrUCD7nulEq2NMiM8uEa
 J4EG0gUTG5x3DhAnXMwawPKlOy4qUpIPTnkr0xfmTRBn+Qxy0br+ftLEijvZ9jiO2p2ZskgqN
 ajejRr+EDYZJ1skh1gcKl7kg41EZoMkiqscIctyivCrg6KLbnWGDzd+6vz7o/9oloLSiJPUED
 59BGNnzS0XZ/VH8Yp27MHDDNZepJWD84L1VdqJS6l8z/JOpmkb8Gk9n4kFvEr+CswNy42Ra+4
 HBfIqDX0Cd07TExh+OOG7c2y+nTE2hsCCWMhG6DI3MV2A+ZmUAJKPjJBCoRCWeLmBQy4HJIJr
 2+aJQWicfZAsXJYnxIlQ+GZZHokydj5m3IbR4rpjbbMplTQGxvBE9TaAueHE26PncXR0CNW8M
 Ev7DptyhEFPVYRI+MP0wouiLxE4HLW0LRBdyu/2rmAFYJ64OGZ+RiNcw2Z6tYgzZBrIXAlHWG
 rZjgoj82Bt2JdUumERpXAELASsFff/niFjALnR9VuB49KEYdLA/R7cVvlZNqqWi3UQu+wqD1e
 xPTe8oYA3z4jQNQ9BEiLNNXRX+YB6wibsK0D4nrlMpVzTKSLcRFaWiq7zOXJy65T3gyid9o9s
 K3Lr3Xvqgr2p0y4NYo66mixNK75oj3UNEX
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 6:45 PM David Hildenbrand <david@redhat.com> wrote:
> On 08.04.21 14:49, Linus Walleij wrote:
> > On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:
> >
> >>> This is something you could do using a hidden helper symbol like
> >>>
> >>> config DRMA_ASPEED_GFX
> >>>          bool "Aspeed display driver"
> >>>          select DRM_WANT_CMA
> >>>
> >>> config DRM_WANT_CMA
> >>>          bool
> >>>          help
> >>>             Select this from any driver that benefits from CMA being enabled
> >>>
> >>> config DMA_CMA
> >>>          bool "Use CMA helpers for DRM"
> >>>          default DRM_WANT_CMA
> >>>
> >>>            Arnd
> >>>
> >>
> >> That's precisely what I had first, with an additional "WANT_CMA" --  but
> >> looking at the number of such existing options (I was able to spot 1 !)
> >
> > If you do this it probably makes sense to fix a few other drivers
> > Kconfig in the process. It's not just a problem with your driver.
> > "my" drivers:
> >
>
> :) I actually wanted to convert them to "depends on DMA_CMA" but ran
> into recursive dependencies ...
>
> > drivers/gpu/drm/mcde/Kconfig
> > drivers/gpu/drm/pl111/Kconfig
> > drivers/gpu/drm/tve200/Kconfig

Right, this is the main problem caused by using 'select' to
force-enable symbols that other drivers depend on.

Usually, the answer is to be consistent about the use of 'select'
and 'depends on', using the former only to enable symbols that
are hidden, while using 'depends on' for anything that is an
actual build time dependency.

> I was assuming these are "real" dependencies. Will it also work without
> DMA_CMA?

I think in this case, it is fairly likely to work without DMA_CMA when the
probe function gets called during a fresh boot, but fairly likely to fail if
it gets called after the system has run for long enough to fragment the
free memory.

The point of DMA_CMA is to make it work reliably.

      Arnd
