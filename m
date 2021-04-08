Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CB358088
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 12:26:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGHVX6j6rz30L3
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 20:26:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 310 seconds by postgrey-1.36 at boromir;
 Thu, 08 Apr 2021 20:26:26 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGHVV1Xl5z3042
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 20:26:25 +1000 (AEST)
Received: from mail-oi1-f178.google.com ([209.85.167.178]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIxFi-1lA1WR0hhq-00KRJ4 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr
 2021 12:21:09 +0200
Received: by mail-oi1-f178.google.com with SMTP id i3so1623756oik.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 03:21:08 -0700 (PDT)
X-Gm-Message-State: AOAM530YHAkKoc0on8J3D43+832zXA5Bvvl9RqByH9grI9L8HMWssVhA
 /0SRJSZnkWjJkC0TnCOjzCfPDHWgAg7Y0zeNtjs=
X-Google-Smtp-Source: ABdhPJy3jeKTxPcNwfngsbvoonksh80soCCHxiz4gKJ4G+0Fm3IstMzm5ZSVa0dFJZ+2JUBZ8yF1Sx9mjNQUOlISLnU=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr5654228oie.4.1617877267082; 
 Thu, 08 Apr 2021 03:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
In-Reply-To: <20210408092011.52763-3-david@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 12:20:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
Message-ID: <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:3okD8D4Sq5wBEPYqHB2aCSFv366gz5mnRDDZALM4sb/Ls/+bvgd
 HZ+ipfakxq/xl+w4/0eaJ6nwL4dtU0Sw8SAxI8N6uKHA5gA4ULNpt84iCmkUMbzL4fvjvda
 XM9kzHbsrBor5Bkv7KFFkCw9V8CWvi0LkMQ+f3gw/Gax0JhQ9xrhvM731NkjuAYpmwDBo6S
 yCAqhqp5O9ArzdA2wb3pA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IaZVLe+M7lE=:/8BJZtuyEOUQFXylOvD1KV
 sbG2RG6OO6zrRc0Pjaz3WMInlIAKZcMzD4RasD9SuSkqxMPJxNHoIMYH39tm6x8W6aw5LEwkQ
 v0Wn9PDO+pAOWHWLUVwqlCctVyKdh93HltwOUc1x8oKcxA6KiEd3zcMJT+S0sPyaGVfuSVAGG
 9T4i4IRJIa6yor+0QatVJj2nZ8CrkRhNwXH0KWbSSm9I5nr0Eexnjv1y6W9VkvtBjz3rNS+DL
 pQsSO5tvNbwhLKNaJ1+hQ1ctPsncVy+NwWqnyA9/d+Z/4oafCHAdd3J3ly9iD4G7vwGfzw3Ba
 3/GudEF5/sYQBK1HmwkiWZ2eQK+vXJkycKNOwWNjy9g3kSbybYGdeABXduW0umL4+wt8UrQUm
 91YyWaw2fS5zpFzaOBxS6j/uXudJPEpVFuZo93lG9kGhkzrFjiAW2e0RNAZ+81ZZkcOXiqyvD
 FsilvEK7nx7K7mvKDeLhiw7ujqS4boq95Fk9hFHALu+kwdlUxXjuRSgjjTucWh5H5sD1x2TIG
 KxYuJncbrB9PoNsbZfNTV8pu+eacOzi7ICm3tOWCksyXbgp+ctxz6VqZhBXzO+nV0tVMo27yO
 Ub+1T+BX7sorjkMNCL2G2Ad6TUNnhuBdwW
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

On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
>
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> dependencies and manual overrides.
>
> "This is similar to "select" as it enforces a lower limit on another
>  symbol except that the "implied" symbol's value may still be set to n
>  from a direct dependency or with a visible prompt."
>
> Implying DRM_CMA should be sufficient, as that depends on CMA.
>
> Note: If this is a real dependency, we should use "depends on DMA_CMA"
> instead -  but I assume the driver can work without CMA just fine --
> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.

'imply' is almost never the right solution, and it tends to cause more
problems than it solves.

In particular, it does not prevent a configuration with 'DRM_CMA=m'
and 'DRMA_ASPEED_GFX=y', or any build failures from such
a configuration.

If you want this kind of soft dependency, you need
'depends on DRM_CMA || !DRM_CMA'.

         Arnd
