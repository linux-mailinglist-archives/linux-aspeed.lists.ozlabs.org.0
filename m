Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6D358492
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 15:24:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGMSR2xr0z30L4
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 23:24:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir;
 Thu, 08 Apr 2021 23:24:53 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGMSP2PVlz30Cb
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 23:24:52 +1000 (AEST)
Received: from mail-oi1-f173.google.com ([209.85.167.173]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M27ix-1lS1j90Deb-002aFt for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr
 2021 15:19:38 +0200
Received: by mail-oi1-f173.google.com with SMTP id i81so2115714oif.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 06:19:36 -0700 (PDT)
X-Gm-Message-State: AOAM533zsQFOW16vGuhBqfCz8SfktrIdDvBjeqCK1WLXBXaIhCbDgBMO
 xiNtxbRa7c7D6zty34EP9NGJczL1uXkm0/4r+rQ=
X-Google-Smtp-Source: ABdhPJzHb7t36K8Eh3/YW98i9jFFwt105TSLCljFkAhUwPloRFuMsDPsNoXrOsOYqi1vkp97GaHnIbSFi7HvVPlRimE=
X-Received: by 2002:a05:6808:313:: with SMTP id
 i19mr5867255oie.67.1617887975911; 
 Thu, 08 Apr 2021 06:19:35 -0700 (PDT)
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
In-Reply-To: <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 15:19:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Wu7tT-YajfdXSSVvg5MYMEnEy3APJ83DcLeJdGkkSrQ@mail.gmail.com>
Message-ID: <CAK8P3a2Wu7tT-YajfdXSSVvg5MYMEnEy3APJ83DcLeJdGkkSrQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PNblxz39FFUtl3w0yq9hAOvD5hr33UsCZ4epWrM+hbxF/nZTJYy
 QMZ0IRkJD9iS/aJOF75tdRsiMid/EoM8f6x37IRGlIqZDSv/9poXv2aQcBLmAynyaJqBAUT
 8BJHJbrD7aZsUACr26ihmsPDaNyoZX/+ovbZx1KkGDQpjQfwUA7kLZGm7k4QyeX/7J9lpdT
 3eOpT43j++LysJHw7N9FQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AyfefCQv+wM=:ociLV5nea1pbUwdXshxq8C
 ICNH2rJfA9dA+Pm7Ky5gCJ12mfxj5NWV1vwze3Wsv1QHzJIceax2fb1kg/0kQlt7qDShGA7Wa
 6p/Ij58LZX+iSQegLRdoNunUmGjrWvlOOI3o0Mqee73Ltjmf679aEPEkR9Qb25aeBMiWuGHdy
 g+wrRvEpOM0R5QKIbsU1OQ4cBxp9orw85vBz9ubEUl2r+ououYs3k3DUzR/upl1cXI7fk0P8N
 rqbBhZygEcv2WNZFrl3kaxG1c7WlJ58X4f1uNfTf/OhlpV/IEyrRTFZfKQphFWVhqL2i7NSOG
 A9KpbbHw6eUbqo5jmZGXU1X2kmWuKGedYXDa4fXcl2XKN3cBUVf7kJBi5+aUWrIcfKdylpfHb
 3NkWvScROnb6ZKY5qkKVqesYL6xtk/bBa4pM2bI69T8ubU9Onr3F6p9etTCOpxtaGuxJ7ChcT
 t72Zk8JmMM3/3dQNXNzdI6FbPp2X+sZzdPgCvLWtyVQg77icowcbe8FmsABpt2DKLf02suNMD
 O0Ap8JObNtBeevC+wypc6XWGlSz4UOe/SB9fqnQ82/Kmz3UmxQoX7QgfeeWGCGuei0/9dTBO+
 Znci0lVFAR56tHyx0qsFDW9fSRetJDE2oW
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
 Randy Dunlap <rdunlap@infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
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

On Thu, Apr 8, 2021 at 2:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:
>
> > > This is something you could do using a hidden helper symbol like
> > >
> > > config DRMA_ASPEED_GFX
> > >         bool "Aspeed display driver"
> > >         select DRM_WANT_CMA
> > >
> > > config DRM_WANT_CMA
> > >         bool
> > >         help
> > >            Select this from any driver that benefits from CMA being enabled
> > >
> > > config DMA_CMA
> > >         bool "Use CMA helpers for DRM"
> > >         default DRM_WANT_CMA
> > >
> > >           Arnd
> > >
> >
> > That's precisely what I had first, with an additional "WANT_CMA" --  but
> > looking at the number of such existing options (I was able to spot 1 !)
>
> If you do this it probably makes sense to fix a few other drivers
> Kconfig in the process. It's not just a problem with your driver.
> "my" drivers:
>
> drivers/gpu/drm/mcde/Kconfig
> drivers/gpu/drm/pl111/Kconfig
> drivers/gpu/drm/tve200/Kconfig
>
> certainly needs this as well, and pretty much anything that is
> selecting DRM_KMS_CMA_HELPER or
> DRM_GEM_CMA_HELPER "wants" DMA_CMA.

Are there any that don't select either of the helpers and
still want CMA? If not, it would be easy to just add

   default  DRM_KMS_CMA_HELPER || DRM_GEM_CMA_HELPER

and skipt the extra symbol.

        Arnd
