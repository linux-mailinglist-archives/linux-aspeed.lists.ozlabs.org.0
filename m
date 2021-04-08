Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C97523582F2
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 14:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGKsS4Kg1z30JY
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 22:13:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGKsP6RzZz2yYv
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 22:12:56 +1000 (AEST)
Received: from mail-ot1-f44.google.com ([209.85.210.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTzrW-1l3QCP21pK-00R5BJ for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr
 2021 14:12:51 +0200
Received: by mail-ot1-f44.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so2055211oto.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 05:12:50 -0700 (PDT)
X-Gm-Message-State: AOAM531g+WzzzMLt/ACwCY70afRxu5PMFefdpNpyfI+6UPT6QRLf7Gu9
 cquAR7jKNPD/28INISigibIz63bgwyS6ofX3VgE=
X-Google-Smtp-Source: ABdhPJxHyCWMenVUxv33s1E6jvbsFFZTfTMiy2a27GKmZ/Mw2GJW7+vO9jPST57wudsWVl6e6VoT2RKQT0t6kEAsZEE=
X-Received: by 2002:a9d:316:: with SMTP id 22mr7238748otv.210.1617883969787;
 Thu, 08 Apr 2021 05:12:49 -0700 (PDT)
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
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 14:12:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3v2aY3CNLED5NkONJ6bS74WgLu=KCTwr1pKjnAmDeSjw@mail.gmail.com>
Message-ID: <CAK8P3a3v2aY3CNLED5NkONJ6bS74WgLu=KCTwr1pKjnAmDeSjw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:S5qG5FZqy3TMhtoCX/BSfRuskSkzlrB+ZDOHK9u+o/O3qBvmyRg
 TLedpBZ6Uehy/Fe25MtdhHVUALXYK4ZpGmAPsPw18rFCnisdkUJLFh79F8bWRFTtZdFK7wz
 lOcgxSeb99bPgqwgAsN6Wkuzb2eDK2T6lgK4Jw83lMnIi5ysfXN/Eq51RlL3EXJIxvRBGgo
 M4Qh3N4dTAatqbMA3WQXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mDzFgryjpLA=:B38vCpUI82+kWOFx0hAvrj
 aEaSH/5TdE+8fxxydqYKm2zyTSdGsYDQ1dBfYFiAxJMVmF0ne9v+nRmUZ8ZcYWhQMpyIT6D35
 x89tlTXCrHbTK1EMLWcZyo+rve9n5YOEf+C8jwlw7cNoI9m952DOA2V4tJjTJWdmxMxTCLcgK
 U3giHaLmcBCEafHB93L/sjBEa6RT7WAku0NslEoU2X/mDorKpx5aw73ts7vPYqQZZ/tJrj2v0
 HMvKGT/JAiURF0RvYtgfUy2Cr2tVy9/n/QhzXto4SrHfvASKhnYrcjPdQ08zHAA1CmMQ7QmQv
 VaqwWSa3obZN6xcBXeLUefskyIZG6nYUosY6oRs1GDlqx95OHIgENDJftZJu+DqmU46LK7GKQ
 1C5au7QPlv8OZqzwYOrs7HA2+43lwAcMKNbtEebWFzRDJYs0LwAsUoq0UabRRiBdltfoLYrgS
 01bVLYt/Frif5NWTPEJfCTSh+aifpUgd1BjnqdhsgNAaFC7UdkxJ/GgMEHexOL2h0Q3bSkHyq
 sV+Sztv6KIIcMhUcnErIigHZmoWsn3ltZ9Z7O43Wed872JbBj50j6AbAikqj5OvOgrfgOXH+f
 4Hk1Lgt3HwXSDPMnOxQmu8wJGFfoy9SHZl
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

On Thu, Apr 8, 2021 at 2:00 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 08.04.21 13:44, Arnd Bergmann wrote:
> > On Thu, Apr 8, 2021 at 1:00 PM David Hildenbrand <david@redhat.com> wrote:
> >>>
> >>> It is a somewhat awkward way to say "prevent this symbol from
> >>> being =y if the dependency is =m".
> >>
> >> What would be the right thing to do in the case here then to achieve the
> >> "if DRMA_ASPEED_GFX is enabled, also enable DMA_CMA id possible"?
> >>
> >> One approach could be to have for DMA_CMA
> >>
> >> default y if DRMA_ASPEED_GFX
> >>
> >> but it feels like the wrong way to tackle this.
> >
> > I'm still not sure what you are trying to achieve. Is the idea only to provide
> > a useful default for DMA_CMA depending on which drivers are enabled?
>
> "Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n)."
>
> Let's assume I'm a distribution and want to set CONFIG_CMA=n or want to
> set CONFIG_DMA_CMA=n with CONFIG_CMA=y; there is no way to do that with
> e.g., DRMA_ASPEED_GFX=y because it will always override my (user!)
> setting -- even though it doesn't really always need it. Using "select"
> is the problem here.

I agree on the part of removing the 'select' if we don't need it. The
part I couldn't figure out was what the 'imply' is supposed to help with.
Most other users that added imply tried (and failed) to fix a build problem.

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
> I wondered if there is a better approach to achieve the same; "imply"
> sounded like a good candidate.

I can probably find a couple more, but regardless of how many others
exist, this would be a much clearer way of doing it than 'imply' since it
has none of the ambiguity and misuse problems.

I think the reason we don't see more is that generally speaking, those
defaults are widely ignored anyway. You almost always start out with
a defconfig file that contains everything you know you need, and then
you add bits to that. Having the default in any form only helps to
make that defconfig file one line shorter, while requiring other users
to add another line to turn it off when they do not want it.

         Arnd
