Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93085359FEB
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 15:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGzfQ2j7Xz3bTh
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 23:35:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGzfM0cfYz2xYd
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 23:35:37 +1000 (AEST)
Received: from mail-ot1-f47.google.com ([209.85.210.47]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFK8N-1lK8z70jV3-00Fk5I for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Apr
 2021 15:35:32 +0200
Received: by mail-ot1-f47.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so5688190otk.5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Apr 2021 06:35:30 -0700 (PDT)
X-Gm-Message-State: AOAM531lFFW7Iy2DsN9Ju1zqRAtmhXCkFmiQgrBjccfI2anSBjvE6fJZ
 v0JsTli5+lRExgQG99RYo1Ly5jXgE675VGiNbpM=
X-Google-Smtp-Source: ABdhPJynlbx4kLNikSNjAjnCb5vtFq6G/850R+R5+xWMARHqWLy+tfY7F0Z+Hrp7Hz4KWDmPvvGBCrUcX4hM8LkZWnk=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr12240759otk.305.1617975319390; 
 Fri, 09 Apr 2021 06:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210409112035.27221-1-david@redhat.com>
In-Reply-To: <20210409112035.27221-1-david@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Apr 2021 15:35:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Message-ID: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:z00D4/GO7BRlIt6Kx9vu4JL9t3ZPzFC5uamqBACPPgT3Ox1Mzl+
 kHtuxoDrfhX4k7BeoRM/xV7iyZUyEV/LU8V1/1vU15ArYSc4Twba8WSshT0EhsEVNIyIr6M
 rHIkwGwOBKE67WLP2ICorO6P5KAG81P18d8oxqaCtfcfxfq8A4qI247UMxdR1qQCLd6+fGr
 qS/Ks0jrUoq1ss6HAgs9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b2FTPS4yV5k=:lIc8bRfayfrwKdRvrUmFwE
 SnZVfQtYGCiJKrcJlvVz2W2JMlUPMXjI4LF+g0fLgqv6yAPMrtbc2lCW6INXiF9psTW7daP2X
 vQgtMXykhbzSLY8kHTR4xM6RSzAWdDo1AK/7nxYahdMtSeE0SefvNe4Ho/LnPpvFnROa3frkW
 Ee9Ed0fIibzhpx9KB8oM5jmF13U8hefXTOoMYd66vB0oBcjlDycfni0+7qq71Z1xNMeVRU1HQ
 JyTJXpOiAe1ZN8ceXLUVO2uJEWBxoigsk/k6O2CKfRSj69zU8AQLgp1M7S6zwwPcuSnmuqP5d
 ey0G6HRTv4peKV2q09eqW6kmE0/GxjHWbamVUBVt6/T3iUToIqsIjOcqCE5DId5bwZb2+ImtE
 9R6iyZbhnm1PJqsXY5QnRTGMWTD78pBDsuxoXj51BkxZSDvzoE3kyzkaUpbmRb8vAV6qkWLyZ
 nySZlX6pe0Y41NuGjbp5bHCvyJLcxkN+RDYCGrmKXKGv3rAIEfsAqpe01/2EGisNb51pHzpm3
 YfIdh+ychRUFDSAcpR/F3MvqovlCLVDqsD3YAqZtJzKCWN562ANNw2nvsInE+LK+8e3kGqTAb
 wy6F49KiGZcB0ViddBpgst+Pbb8TTuDFUS
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
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Eric Anholt <eric@anholt.net>,
 Suman Anna <s-anna@ti.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Linux-MM <linux-mm@kvack.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 9, 2021 at 1:21 PM David Hildenbrand <david@redhat.com> wrote:
>
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
> which depends on CMA, if possible; however, these drivers also have to
> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
> driver cannot do it's job properly in some configurations.
>
> For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and DMA_CMA if
> available") documents
>         While this is no build dependency, etnaviv will only work correctly
>         on most systems if CMA and DMA_CMA are enabled. Select both options
>         if available to avoid users ending up with a non-working GPU due to
>         a lacking kernel config.
> So etnaviv really wants to have DMA_CMA, however, can deal with some cases
> where it is not available.
>
> Let's introduce WANT_DMA_CMA and use it in most cases where drivers
> select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
> of recursive dependency issues).
>
> We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
> DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.
>
> With this change, distributions can disable CONFIG_CMA or
> CONFIG_DMA_CMA, without it silently getting enabled again by random
> drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
> and CONFIG_DMA_CMA if they are unspecified and any driver is around that
> selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
> DRM_KMS_CMA_HELPER.
>
> For example, if any driver selects WANT_DMA_CMA and we do a
> "make olddefconfig":
>
> 1. With "# CONFIG_CMA is not set" and no specification of
>    "CONFIG_DMA_CMA"
>
> -> CONFIG_DMA_CMA won't be part of .config
>
> 2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA
>
> Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
> DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)
>
> 3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"
>
> -> CONFIG_DMA_CMA will be removed from .config
>
> Note: drivers/remoteproc seems to be special; commit c51e882cd711
> ("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains that
> there is a real dependency to DMA_CMA for it to work; leave that dependency
> in place and don't convert it to a soft dependency.

I don't think this dependency is fundamentally different from the others,
though davinci machines tend to have less memory than a lot of the
other machines, so it's more likely to fail without CMA.

Regardless of this,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
