Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0535811F
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 12:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGJ252Hhsz30L8
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 20:50:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir;
 Thu, 08 Apr 2021 20:50:19 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGJ231d8kz2yxN
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 20:50:18 +1000 (AEST)
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGR3r-1lN2A61XmX-00Gr3w for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr
 2021 12:45:03 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 z24-20020a1cf4180000b029012463a9027fso973993wma.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 03:45:03 -0700 (PDT)
X-Gm-Message-State: AOAM533A5ePiXX0HyyEq3KM3rqYBc04u1sbBswovKTOMcrB5qLFAf1wb
 hUB5LIWMfzfFUDPgZ8muXkxgY3OFzoVNFbDf3RM=
X-Google-Smtp-Source: ABdhPJytz/lV77i5o3bCVeCx28eGBRpFGJa3HAhceDBuu8+SNlIqf7YyHBd9MAcXBsV7ViVqwijCZWLATsW/w+YkaWY=
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr7558571wmf.38.1617878702742; 
 Thu, 08 Apr 2021 03:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
In-Reply-To: <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 12:44:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
Message-ID: <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MyvFjnd94pXSBatEfNKu+uRGJuquxH0JHm6CCogr1JkOudHbU8o
 Fb/MQMHQVJUxt6XT3DUdZszumGXad+SuesyEq88DQTjl5Wa/gsbFv8t+V0fWkKesKfLgdTR
 y82eeLAiZ2mruPEJiFbg2EC6vKRTHhRiQKROPphq0TjMSN26cKiuA0hUH8VGirWnXmenggA
 lfOI+AN7vNSyvu5R09v1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lTSF3U/uk9U=:E1MzEeXOpyj0osbCDoMRBs
 oaoSzYuLX1rH+bVWaHERr0SMS8AqjRN1VAr2By+Uj+04Z65gGXz4GW1Cjzb/pzRxB2DoLg9ey
 tvyuBvhC/vZkxg3PB9pnYoDar8FQm7dV+bV/+C9eZIeOVLFtvbBxQlRlJPU6xjxS4M/oOI0E8
 XFuyht5Jgq/9G/oiWPsbclfeDjnQ8w2WxPMp3QQGXSYsS+MpEe17OqDb7CLrTV5swD5v/x6+y
 oFSTeec/t26liR8kp9fho5b4zB5L8A+4w13JKHlddHLB11U+Qdt+ihcnAoQ+pXNaSME1mrj0S
 lxvnW1Kaiqm/IKsHtX3uYcBo80OMCeRIlTG1SqzdN/2ETdSBvL6JtIqw7qzo0pfhFTINSVALB
 9UbdJ6FyM27MlQiGHas9teIfnYXQSh/E3jkBlOzcr8qIKCV3SvQPGTnBWHmnqPCpMxNLyB99o
 Xd2j/jLwE3pAb4pA1Evo6FCSf8TRus0IMmKITRdn1Ua+hKABEUDaG09F7eP4phOJNK79gBcTu
 zhd5WKtcp6JXpeoqypERhu1aykuZYlAaOmm3zPWzyb+/J99iBBJTqNeXWrhaUqmNbq6uloS5s
 Ue3M3UNxT5mBIM54iU0zRw6IQGBfDdtxTm
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

On Thu, Apr 8, 2021 at 12:29 PM David Hildenbrand <david@redhat.com> wrote:
> On 08.04.21 12:20, Arnd Bergmann wrote:
> > On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> Random drivers should not override a user configuration of core knobs
> >> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> >> dependencies and manual overrides.
> >>
> >> "This is similar to "select" as it enforces a lower limit on another
> >>   symbol except that the "implied" symbol's value may still be set to n
> >>   from a direct dependency or with a visible prompt."
> >>
> >> Implying DRM_CMA should be sufficient, as that depends on CMA.
> >>
> >> Note: If this is a real dependency, we should use "depends on DMA_CMA"
> >> instead -  but I assume the driver can work without CMA just fine --
> >> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
> >
> > 'imply' is almost never the right solution, and it tends to cause more
> > problems than it solves.
>
> I thought that was the case with "select" :)

Yes, but that's a different set of problems

> >
> > In particular, it does not prevent a configuration with 'DRM_CMA=m'
>
> I assume you meant "DRM_CMA=n" ? DRM_CMA cannot be built as a module.

Ok, at least that makes it easier.

> > and 'DRMA_ASPEED_GFX=y', or any build failures from such
> > a configuration.
>
> I don't follow. "DRM_CMA=n" and 'DRMA_ASPEED_GFX=y' is supposed to work
> just fine (e.g., without HAVE_DMA_CONTIGUOUS) or what am I missing?

I thought you were trying to solve the problem where DRMA_ASPEED_GFX
can optionally link against CMA but would fail to build when the CMA code
is in a loadable module.

If the problem you are trying to solve is a different one, you need a different
solution, not what I posted above.

> > If you want this kind of soft dependency, you need
> > 'depends on DRM_CMA || !DRM_CMA'.
>
> Seriously? I think the point of imply is "please enable if possible and
> not prevented by someone else".

That used to be the meaning, but it changed a few years ago. Now
it means "when a used manually turns on this symbol, turn on the
implied one as well, but let them turn it off again if they choose".

This is pretty much a NOP.

> Your example looks more like a NOP - no?
> Or will it have the same effect?

The example I gave is only meaningful if both are tristate, which is
not the case here as you explain.

It is a somewhat awkward way to say "prevent this symbol from
being =y if the dependency is =m".

      Arnd
