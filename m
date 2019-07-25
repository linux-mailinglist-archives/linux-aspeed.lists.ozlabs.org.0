Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7874376
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2019 04:52:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vGwg3LXwzDqMd
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2019 12:52:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="VWLm7pb1"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vGwX3HyJzDqM0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Jul 2019 12:52:43 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id r6so35403442qkc.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2019 19:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TYbaU/RcXXoDnrZeMQ94CuW6JxA4bBgoJMHBj+E8c3U=;
 b=VWLm7pb1QP2B0tihwP9USNElFOTjEp6/v4Hd70rru6K+fpcBLvsEDPhud9KTe7tp1C
 gOYRrkbY5+tRQ2nBFGxx4CHJMbUfjVlQcbyTAYX2Zp31qb6KjaBAMSvULqFBUzF8Kb53
 /HA80hSPJspYIH/79t0OEPIUrlEg+sessZKds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYbaU/RcXXoDnrZeMQ94CuW6JxA4bBgoJMHBj+E8c3U=;
 b=i7QQF6W9q+0GyRwl8990kEEN3y7SJwpmq4ooujoKE8SneRd1zW7u9hLCiNlKytzD7o
 s2ngxh1fZl05i6kg5Dwrkx9fuLwBXECmDeCBZDpQvZkoxpl0zbWY9v1ubMoIiefLeolb
 GQhSRA2Bt1/YoiaKk3kUb+Y+WN9X1HGXTFx7zjvJ8vTrEhIhltNoMPFVRhG+GcVjklhc
 jXNQtV7EG+22kAbVJVbFgcXXVp9LZuOh63ISetC5W+fWP0gxJo+C1PHOm4pjXpmdVgMa
 Bs5B8OfILzm1nkuG1RuEEbdxW9OolwMbR/mxbsXWBy/HEoRDmBw9Em95+PUGzUbxYX4g
 3ANg==
X-Gm-Message-State: APjAAAVjH8/rMgI6+X00N4QbhkDR7B8UHjTC9y6o4/8o9lsgV42+NSry
 Pc/Z0K6/wR9dO78Wsg2dNUZBt2FXFJGftLEtF8Q=
X-Google-Smtp-Source: APXvYqyM3sqW/iwNxySOMbv+KfAtuOilJ1tOA6mmxNVc4AhyblxyzikTIraPFFcFyT9J6TSPJ9ksANxa4ctyvg2uzs8=
X-Received: by 2002:a37:a1d6:: with SMTP id
 k205mr56474155qke.171.1564023159729; 
 Wed, 24 Jul 2019 19:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562734889.git.joe@perches.com>
 <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
 <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
 <4f6709f8-381f-415c-8569-798b074b66c5@www.fastmail.com>
 <4e5bc8d61436024a30a8fb6a1516e29e23a75ede.camel@perches.com>
In-Reply-To: <4e5bc8d61436024a30a8fb6a1516e29e23a75ede.camel@perches.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 Jul 2019 02:52:27 +0000
Message-ID: <CACPK8Xd3+iwkuw-Ofwf+Hy1Ez5-1pBvnk_G4xT72ZQdOVd7Sag@mail.gmail.com>
Subject: Re: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
To: Joe Perches <joe@perches.com>
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
Cc: linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 25 Jul 2019 at 01:18, Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2019-07-25 at 10:40 +0930, Andrew Jeffery wrote:
> >
> > On Thu, 25 Jul 2019, at 02:46, Joe Perches wrote:
> > > On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> > > > Arguments are supposed to be ordered high then low.
> > > >
> > > > Signed-off-by: Joe Perches <joe@perches.com>
> > > > ---
> > > >  drivers/gpu/drm/aspeed/aspeed_gfx.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> > > > index a10358bb61ec..095ea03e5833 100644
> > > > --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> > > > +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> > > > @@ -74,7 +74,7 @@ int aspeed_gfx_create_output(struct drm_device *drm);
> > > >  /* CTRL2 */
> > > >  #define CRT_CTRL_DAC_EN                  BIT(0)
> > > >  #define CRT_CTRL_VBLANK_LINE(x)          (((x) << 20) & CRT_CTRL_VBLANK_LINE_MASK)
> > > > -#define CRT_CTRL_VBLANK_LINE_MASK        GENMASK(20, 31)
> > > > +#define CRT_CTRL_VBLANK_LINE_MASK        GENMASK(31, 20)
> >
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> This hardly needs a review, it needs to be applied.
> There's a nominal git tree for aspeed here:
>
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
>
> But who's going to do apply this?

This is a DRM patch, so it goes through the DRM tree. I am a
co-maintainer there and can apply it once I remember how to drive the
tools.

(FYI, this macro is not used by the current driver).

Cheers,

Joel
