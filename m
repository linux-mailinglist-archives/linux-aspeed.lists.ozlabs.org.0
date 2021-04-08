Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E14358213
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 13:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGK5l1lr3z30Kb
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 21:38:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=eS60djC9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=eS60djC9; dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGK5f3lxYz2yx4
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 21:38:27 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id q26so1763916wrz.9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HNjO0LstTaF0YJ+tzxAFP4Syvm5fGCE8nxebVcvJLjU=;
 b=eS60djC9Lqi8q7fWOXC+yuTwdoDdp/fK2d8XmHmBdVmsTRb7l+NFwK+960b7+jwa0f
 FmsY22x6AYJ4yv6tWLC7INl0trTXzlztAcd+b0jK6akV35kkzli/s4AEGxnp0E9T3Hzm
 WeCrdaOppkgKGi6FkMG4W1g5pPS3g8Esg94hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HNjO0LstTaF0YJ+tzxAFP4Syvm5fGCE8nxebVcvJLjU=;
 b=RgbJeGNg7UsBvH5PQaXkxtejOb3T+4yhCKwTQNnvJ1ruptXJBWX7XzSIL/u8PHdk4L
 26MCglZ5D/jTO/91IARnLXQfJpmTad/REonB/YqeajCoYs/oAnSI2NmvFDOjT6DtBrd+
 A3ilVV2Ii0j+KhfOUmf+tRtnbqleDnp1PDInkikn0LCzOGL7Ksif5d5NHkm8fgN2cDkc
 ZSxnQAgDmQ+TACEMswSkOY/PMglrg/14N0LEJ3LYkvZKpjMI4bVY/vYST4eLiMt6Zbdj
 f78favx9h7RJT/CESyODmxgvWi3Cb+g59aP4xA0XjyShJrc2zUb89E2pN9DM2SWar1S5
 jB6Q==
X-Gm-Message-State: AOAM530RCUM5dw4mbw4VsXrnLrCImiGqg/b1rV1w+8HQepCA2EHmdXJI
 6J0Tmk0krb4T0r6nUeR6ylz+Vw==
X-Google-Smtp-Source: ABdhPJySG7qOaE9NShNXxHx9QrPK+umWifIaVL7kyUfSfMRMt7h7zvfu4kAyJkMeLpb8wsS1VXGRaA==
X-Received: by 2002:a5d:6d0f:: with SMTP id e15mr9348009wrq.218.1617881900156; 
 Thu, 08 Apr 2021 04:38:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n5sm24657875wrp.50.2021.04.08.04.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:38:19 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:38:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Message-ID: <YG7rKfJkTDJorqvY@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Joel Stanley <joel@jms.id.au>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mike Rapoport <rppt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Peter Collingbourne <pcc@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 12:20:50PM +0200, Arnd Bergmann wrote:
> On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
> >
> > Random drivers should not override a user configuration of core knobs
> > (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> > dependencies and manual overrides.
> >
> > "This is similar to "select" as it enforces a lower limit on another
> >  symbol except that the "implied" symbol's value may still be set to n
> >  from a direct dependency or with a visible prompt."
> >
> > Implying DRM_CMA should be sufficient, as that depends on CMA.
> >
> > Note: If this is a real dependency, we should use "depends on DMA_CMA"
> > instead -  but I assume the driver can work without CMA just fine --
> > esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
> 
> 'imply' is almost never the right solution, and it tends to cause more
> problems than it solves.
> 
> In particular, it does not prevent a configuration with 'DRM_CMA=m'
> and 'DRMA_ASPEED_GFX=y', or any build failures from such
> a configuration.
> 
> If you want this kind of soft dependency, you need
> 'depends on DRM_CMA || !DRM_CMA'.

The problem is that depends on is a real pain for users to find their
drivers. This is why we have a ton of select, because the kconfig ui tends
to suck.

If you want to change this, we need automatic conflict resolution like apt
and other package managers have, with suggestions how to fix the config if
you want to enable a driver, but some of its requirements are missing. The
current approach of hiding driver symbols complete if any of their
dependencies are off is really not great.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
