Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1A030B6C8
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 06:01:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVCM15DLpzDqw8
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 16:01:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=K0AwAx2a; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVCLs4fV6zDqsc
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Feb 2021 16:00:53 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id h21so9359703qvb.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Feb 2021 21:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PYomAPedjY6Ut2v3tc/j2puk5V3ZM6HLs8QKOrL+71M=;
 b=K0AwAx2atHbBeE5ofba2lhncn83QsHYPwaAkVZOlBq7xJVuwO06nmam9D6p9PxK0Yc
 qHncTgbdEiV4b9ZbLbL1W6QNZK4POSfIgBGOjGZeBb5dopkHlxwOHW3e+9qr+VdgRSDq
 lMzTwDNhiCTs4QHjimAQkxgCJXkUf/1yzaLRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYomAPedjY6Ut2v3tc/j2puk5V3ZM6HLs8QKOrL+71M=;
 b=teu4oOw3Mboi+tu+8JteCwtY4qz8d2t66mmfVqdLArWsb7E+NoNPy1/v90XB1gzKQC
 00WBWHq4/n9smun9Fd4nzDynX/YGd5KmHzX8JiOewZr8YEVlpExYzl9UYfdndhnMQ9Xo
 SmC0Vd9QKHHlqJAxKnLvr+yS8GNesnAjXqvy69nuWwPlOrNVxsD4rqldjjLgS6ICxdGk
 RcqGDvaI85W0RNwJV9YJF0LhuzMF4uwnA7trDJmBrAPWeNspLXiC92m46unfY2pOxDrt
 xfXgRXcmcXLtFZFw4E4fqci/7zgYF7k0MGO9rAUKf66iNbHUYd3D5JEKJKvbnitu+HvN
 O9Yg==
X-Gm-Message-State: AOAM532SeV07FbRD/QNPz/d3QiJk1+9xuIikV0c0AxC+Z5g2e9oXxr6X
 zkKVIbu6VqnvoqII0s43lqsULD6FC4kUZ3VzmEg=
X-Google-Smtp-Source: ABdhPJxhG22cfgTlPgd5Bmp+l5XMEO6iHO8wpVjtVf1lL25VaUDqwXCORBeaAJwrqwOO5B9JMa+bz8dKzG0wG9OGJQI=
X-Received: by 2002:a0c:a541:: with SMTP id y59mr18779062qvy.61.1612242050648; 
 Mon, 01 Feb 2021 21:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-3-joel@jms.id.au>
 <21b49b6a6303bf8c188929bb2cb328ecea33520f.camel@ozlabs.org>
In-Reply-To: <21b49b6a6303bf8c188929bb2cb328ecea33520f.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Feb 2021 05:00:38 +0000
Message-ID: <CACPK8Xes_Lch1W3NuqQ8HdPTrvJUamfQE9sf6dRcoat_UKohXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/aspeed: Use dt matching for default register
 values
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

On Tue, 2 Feb 2021 at 04:46, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> > There are minor differences in the values for the threshold value and
> > the scan line size between families of ASPEED SoC. Additionally the
> > SCU register for the output control differs between families.
> >
> > This adds device tree matching to parameterise these values, allowing
> > us to add support for the AST2400 now, and in the future the AST2600.
>
> Looks good to me. Two super minor things:
>
> > --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> > +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> > @@ -60,7 +60,8 @@ static void aspeed_gfx_enable_controller(struct
> > aspeed_gfx *priv)
> >         u32 ctrl2 = readl(priv->base + CRT_CTRL2);
> >
> >         /* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
> > -       regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
> > +       regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), BIT(16));
>
> The comment references SCU2C; but you've implied that this will
> change...
>
> > @@ -228,7 +258,7 @@ static ssize_t dac_mux_store(struct device *dev,
> > struct device_attribute *attr,
> >         if (val > 3)
> >                 return -EINVAL;
> >
> > -       rc = regmap_update_bits(priv->scu, ASPEED_SCU_MISC_CTRL, 0x30000, val << 16);
> > +       rc = regmap_update_bits(priv->scu, priv->dac_reg, 0x30000, val << 16);
> >         if (rc < 0)
> >                 return 0;
> >
> > @@ -241,7 +271,7 @@ static ssize_t dac_mux_show(struct device *dev,
> > struct device_attribute *attr, c
> >         u32 reg;
> >         int rc;
> >
> > -       rc = regmap_read(priv->scu, ASPEED_SCU_MISC_CTRL, &reg);
> > +       rc = regmap_read(priv->scu, priv->dac_reg, &reg);
> >         if (rc)
> >                 return rc;
>
> You've removed the only uses of ASPEED_SCU_MISC_CTRL here, maybe drop
> the #define too?

Good idea. I'll implement both of your suggestions.
