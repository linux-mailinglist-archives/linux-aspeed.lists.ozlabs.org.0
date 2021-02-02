Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C66030B6C6
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 06:00:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVCLM5YQyzDr49
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 16:00:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ag5N1hX5; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVCLB6qPvzDqsc
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Feb 2021 16:00:16 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id t63so18748980qkc.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Feb 2021 21:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHw4bny1Wwo2iSShQVV6B7iNSJANKQ/GGFfcMHS85eI=;
 b=Ag5N1hX5J+pqVl90avHSmQoVpceCOhvNtJdqzAr9/yrRozGVv//bYFxl8F3/iMHzHh
 ljyhdu33mqwSBSh8Z6WQmEjyqBx3Bguiot0wK7ohICaG5FVx/diV5BNrQSmz+mFzjiT3
 xApLB697+wTghiaR0sr/t0+BRRuotyOqhBn6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHw4bny1Wwo2iSShQVV6B7iNSJANKQ/GGFfcMHS85eI=;
 b=MAUjIA5nGiHfjViBZFsx6BXRSJsxKLFut4gIC5Qd6LJsaAOxzquahTWBZg4sZNReCJ
 U2u+WEjzR1NGsnLlO1AArvzQsGway06gPBYqoCXrLZzl89e2uGk/iN/YOhNAr+HKcDqZ
 CmECI5OHWpgp7rYpFOiiAWWCS5qdq8H/XgKo/m2BFsSqK1BuqmPsmvhYeMYvEhbbVdh+
 unjvOsXt+Amu/DHHJxgdCeeHyIPGBHBVcwhi2BZ1+y5a/2fpQwu9NCtCJTVUVR3dn3ny
 k1eQX2W0oJ2Q0uXH8XVnsjAndoGY2BHu+zj9tHoyarMa+otqkNS528DSSkNzkimaljN/
 gEnQ==
X-Gm-Message-State: AOAM5334pykvORW0dvFN1yrKy85ZjxdKD+L9Ym1SAWnPJrZ0Gkdrcnlb
 VcUgITs1FM9l9VVJbENUpUCaRrptNQmLWSJh0Ow=
X-Google-Smtp-Source: ABdhPJx4tRBI8/Cn5iy+JanLzzy1zk2Re3Wf7TOY2NqH0BRxEAnciKUn/VwHrG7h9zcE2pqKykXQcako+fM0dHk5GqU=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr19383783qkn.273.1612242012955; 
 Mon, 01 Feb 2021 21:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-2-joel@jms.id.au>
 <8ff9f9d92271b25bd11cf473bf64466816efe93b.camel@ozlabs.org>
In-Reply-To: <8ff9f9d92271b25bd11cf473bf64466816efe93b.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Feb 2021 05:00:00 +0000
Message-ID: <CACPK8XeTZ7kNPL4dWUJT44Zd+69VJ3FCMb7K=t6L0apwQOM1kQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/aspeed: Look up syscon by phandle
To: Jeremy Kerr <jk@ozlabs.org>
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
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2 Feb 2021 at 04:39, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> Sounds like a good idea! One comment though:
>
> > @@ -111,10 +112,13 @@ static int aspeed_gfx_load(struct drm_device *drm)
> >         if (IS_ERR(priv->base))
> >                 return PTR_ERR(priv->base);
> >
> > -       priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
> > +       priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
> >         if (IS_ERR(priv->scu)) {
> > -               dev_err(&pdev->dev, "failed to find SCU regmap\n");
> > -               return PTR_ERR(priv->scu);
> > +               priv->scu = syscon_regmap_lookup_by_compatible("aspeed,aspeed-scu");
>
> Is this (more generic) compatible value guaranteed to exist alongside
> aspeed,ast2500-scu? The scu binding only specifies the model-specific
> ones:
>
>     Documentation/devicetree/bindings/mfd/aspeed-scu.txt:
>
>     Required properties:
>     - compatible:       One of:
>                     "aspeed,ast2400-scu", "syscon", "simple-mfd"
>                     "aspeed,ast2500-scu", "syscon", "simple-mfd"
>
> - the only mention of the new compatible value that I can find is this
> thread. Maybe we should retain the existing one to keep the fallback
> case working?

Yes, it was a mistake to change ast2500-scu to aspeed-scu. The only
reason to keep the lookup_by_compatible was to decouple this patch
from the device tree changes.

I will send a v2 with syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu").
