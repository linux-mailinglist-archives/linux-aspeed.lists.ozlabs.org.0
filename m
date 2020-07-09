Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B82198E2
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jul 2020 08:52:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2RgH2qBlzDqyk
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jul 2020 16:52:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HMkT8gZt; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Rg76PFDzDqv2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jul 2020 16:52:03 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id dr13so1129271ejc.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Jul 2020 23:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qC6ikPyAkkZDEb9ir5eEV2kSBTjyBB0hcPesB8iDBzU=;
 b=HMkT8gZtcPJUF8GcOk4mhQA0XzCuo24QFbpsy/EQ++/a9dyIEzXHW5pWoHG+rdOYsm
 xoxASy9VtzcGgvTPgxN+Wxa8/m7Axkq2Hi3BJ94g6Vl5qwmM3gKpwebpczBWGvJBlIRK
 rzMZrOsMRep1fyOEpevHPW43USm2kdy7jah/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qC6ikPyAkkZDEb9ir5eEV2kSBTjyBB0hcPesB8iDBzU=;
 b=A3DXp3jaD7G6z/Wq1iwT40D5FtLUUSCbeU5STwTd9Jsy4mpAQ4FcveeWB/apZ3eSrx
 LFLxNvKmoP9O2C8Wr8d9QwK8/1RQG3M3k7jS7+SFU1miS05aFszGQidQEVXKR6yjuhnF
 9cOzrXOtbv8+Y7peYgi2fCic3JlpojwShPCSUdkhTxYhlBMUmeSX8vnwkqWor+TJTTAT
 cX7b+ImSJeCi58JLPwsZAd61gsOH3vAsQ28VyUsHoMpcDDYkL8m+5MZlFe2gDgexilnw
 XxGzj/CFTFHa0RkFaxLznaADN49vrO1rh59nvzqozWui50kQsHb7wplPZYQIfyab/Y1a
 RVNQ==
X-Gm-Message-State: AOAM530vEAva2xbH7J9rVT7JgnVpAgA/SM9Ny91OzKFhRwuHDgn0BgnI
 2ktqMv0vT21KzoyIZlUhHXDjMPzaCWgBRCeSaTA=
X-Google-Smtp-Source: ABdhPJyk8qb4D04v5BrhicG+Xy3FGlw4wqFYNSQErh6C94HtP/sa7EmHdq4CIsCgiOB3EWMM+rqGoeThfN/1ns6BMRk=
X-Received: by 2002:a17:906:1455:: with SMTP id
 q21mr38382187ejc.139.1594277518385; 
 Wed, 08 Jul 2020 23:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200701001002.74997-1-linux@roeck-us.net>
 <20200701091021.GA266726@ravnborg.org>
In-Reply-To: <20200701091021.GA266726@ravnborg.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Jul 2020 06:51:46 +0000
Message-ID: <CACPK8Xcb2jskKRsPEQ98Ty-yetkUZbZ8KzTGZ-ncc43nSXsRug@mail.gmail.com>
Subject: Re: [PATCH] drm/aspeed: Call drm_fbdev_generic_setup after
 drm_dev_register
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, g@ravnborg.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 1 Jul 2020 at 09:10, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Guenter.
>
> On Tue, Jun 30, 2020 at 05:10:02PM -0700, Guenter Roeck wrote:
> > The following backtrace is seen when running aspeed G5 kernels.
> >
> > WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_fb_helper.c:2233 drm_fbdev_generic_setup+0x138/0x198
> > aspeed_gfx 1e6e6000.display: Device has not been registered.
> > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3 #1
> > Hardware name: Generic DT based system
> > Backtrace:
> > [<8010d6d0>] (dump_backtrace) from [<8010d9b8>] (show_stack+0x20/0x24)
> > r7:00000009 r6:60000153 r5:00000000 r4:8119fa94
> > [<8010d998>] (show_stack) from [<80b8cb98>] (dump_stack+0xcc/0xec)
> > [<80b8cacc>] (dump_stack) from [<80123ef0>] (__warn+0xd8/0xfc)
> > r7:00000009 r6:80e62ed0 r5:00000000 r4:974c3ccc
> > [<80123e18>] (__warn) from [<80123f98>] (warn_slowpath_fmt+0x84/0xc4)
> > r9:00000009 r8:806a0140 r7:000008b9 r6:80e62ed0 r5:80e631f8 r4:974c2000
> > [<80123f18>] (warn_slowpath_fmt) from [<806a0140>] (drm_fbdev_generic_setup+0x138/0x198)
> > r9:00000001 r8:9758fc10 r7:9758fc00 r6:00000000 r5:00000020 r4:9768a000
> > [<806a0008>] (drm_fbdev_generic_setup) from [<806d4558>] (aspeed_gfx_probe+0x204/0x32c)
> > r7:9758fc00 r6:00000000 r5:00000000 r4:9768a000
> > [<806d4354>] (aspeed_gfx_probe) from [<806dfca0>] (platform_drv_probe+0x58/0xa8)
> >
> > Since commit 1aed9509b29a6 ("drm/fb-helper: Remove return value from
> > drm_fbdev_generic_setup()"), drm_fbdev_generic_setup() must be called
> > after drm_dev_register() to avoid the warning. Do that.
> >
> > Fixes: 1aed9509b29a6 ("drm/fb-helper: Remove return value from drm_fbdev_generic_setup()")
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> I thought we had this fixed already - but could not find the patch.
> Must have been another driver then.
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> I assume Joel Stanley will pick up this patch.

I do not have the drm maintainer tools set up at the moment. Could one
of the other maintainers put this in the drm-misc tree?

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

>
>         Sam
>
> > ---
> >  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > index 6b27242b9ee3..bca3fcff16ec 100644
> > --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > @@ -173,8 +173,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
> >
> >       drm_mode_config_reset(drm);
> >
> > -     drm_fbdev_generic_setup(drm, 32);
> > -
> >       return 0;
> >  }
> >
> > @@ -225,6 +223,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto err_unload;
> >
> > +     drm_fbdev_generic_setup(&priv->drm, 32);
> >       return 0;
> >
> >  err_unload:
> > --
> > 2.17.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
