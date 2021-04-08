Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC4358269
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 13:44:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGKDv14n3z30Gt
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 21:44:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGKDr1vGQz301B
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 21:44:42 +1000 (AEST)
Received: from mail-ot1-f47.google.com ([209.85.210.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mrh9Y-1ly0TT2HZ6-00nejd for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr
 2021 13:44:39 +0200
Received: by mail-ot1-f47.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so1927889otq.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 04:44:39 -0700 (PDT)
X-Gm-Message-State: AOAM532Ac/J9CPAImU+ybSwNPJqlSoM72z1Kx1Dt3rv9YMjSvsixu3n2
 neBzszICtWtXpjoDc/jcK3h25yBZpSJdqEUD8SE=
X-Google-Smtp-Source: ABdhPJw/Kt6oueYEiXqyZYSL7pDJ4LuFJYHMs1Y8FL1ZmuGq8xfxN7KNWR6IE58DyzqBWI3T+US+8jsx0JeptqGIBk4=
X-Received: by 2002:a9d:316:: with SMTP id 22mr7135730otv.210.1617882278035;
 Thu, 08 Apr 2021 04:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
In-Reply-To: <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 13:44:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
Message-ID: <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+w9fvRR3uhCDZAbDSPHjh6SioXnCfxcAHGysiVTfqhgGdvgBglA
 tSMfBqEC6bZrGV7CszYWvYIj+uxE6eLMXvvWhEagqHAtuk9zTagPDtxjIP/GOQKcNPq46u9
 JQdO91FWK5RJf4ffVtndvH0FQwmYmG1jbx+hnxRpv+G3CvE1wxiqa0xSDXScwRP5Y+nsGKI
 oMJlVL/MhdgvOoqJ3tKFA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MYnCDJFQ45U=:P/wYTHWbKITI580h6HEhQr
 H13W/scmfE/1c2vG0lntkwhJ0YKqL3rFhB/C3UP2KFMksjcqMdxxCKVXA62+lb2JYXel1jMKP
 7EotAEykbPaWhkOcEcQWJNxbXwk64OgtsuC5YtoyeDEChtzylcz1AqtBr01fE68l+i3QMNdwz
 1lcBPARd81TwY9FCwOQ/PkcSq+Qm4hPbuyZkuTOpmy+4Z4Mvl8vAfyx7gKuDjwv+ptkM422Bb
 F7KrdhEL4Wr+YrVuHuhVoj3TwjXeQctOt2rKx6MlrfCiv1kOW5Xlevpk0dliH40QkeLicNcNs
 ykmWQENkOkczPcn9X5TCy0genvCnxK32KxXxSazYfJ+SAVB6BAcR9wamVyyzELxY2I5yXptsD
 dbSi5SHZpBR5+YUjpLsWvA/OLOZy9jULASi9Uaz7atujXNIVMnjwkpKc4yXh2EeQac95Pqtdk
 YhJRNxERKD8a1q31vjICQnj2SodV5LE8yKFDkgzqXwTOCJoMqd2Vn+2RqQtiQ6PshT+sbZT8B
 gpuzQMrJL2VzUypBwAZc9Ugb87LpMoKuq22a16Vie6+kcN0K8NaT3M9K5DOrZm9GXTH7hOQOp
 VBiCPamkZkp1205oDRfYQ8ZQ2Pf6DdbAyz
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

On Thu, Apr 8, 2021 at 1:00 PM David Hildenbrand <david@redhat.com> wrote:
> >
> > It is a somewhat awkward way to say "prevent this symbol from
> > being =y if the dependency is =m".
>
> What would be the right thing to do in the case here then to achieve the
> "if DRMA_ASPEED_GFX is enabled, also enable DMA_CMA id possible"?
>
> One approach could be to have for DMA_CMA
>
> default y if DRMA_ASPEED_GFX
>
> but it feels like the wrong way to tackle this.

I'm still not sure what you are trying to achieve. Is the idea only to provide
a useful default for DMA_CMA depending on which drivers are enabled?

This is something you could do using a hidden helper symbol like

config DRMA_ASPEED_GFX
       bool "Aspeed display driver"
       select DRM_WANT_CMA

config DRM_WANT_CMA
       bool
       help
          Select this from any driver that benefits from CMA being enabled

config DMA_CMA
       bool "Use CMA helpers for DRM"
       default DRM_WANT_CMA

         Arnd
