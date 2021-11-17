Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86817453E7D
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 03:29:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv6Lr2swlz2yQB
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 13:29:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Dd+GTwzJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Dd+GTwzJ; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv6Lm0xlMz2xtf
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 13:29:01 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id b1so2773892lfs.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 18:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jl+AtN/+Mu/whgH79LA7r4Af2Mt1jJsmU9jNqLNR8Ec=;
 b=Dd+GTwzJyyfFaNufM7HI7IRxF+fJXM6/+7Z/W2JwVE3zmE8dPGflxCSimLkvljXnvr
 h2VSVVOY23M5ewWG7VMQJ4i1/XIEm6maaJ0mFJJPfpyVXznkpRk/gz/U8bB5IbAVr1qq
 9egxj2rieE4HN52GTEGwHJa11WmD8qoxJ3QK1Sig7SygOrGMoDjaGF6qW73xMRpo9OEt
 MwxErbSiwKctiuDkmj6+nUo7oIDqK6N5ZfmhgVTnKciRcw7X1NrO1Q3+WL+nnlKHUJsb
 hlP6BK9NlZsL/05+Ms3SRoJgrMgbq4vIXQVQWYnslXVoqtE8QE3yPww7cxZh18S6BQOQ
 ET3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jl+AtN/+Mu/whgH79LA7r4Af2Mt1jJsmU9jNqLNR8Ec=;
 b=h0/wQgBAuuEy397LTNsQG3NrPkl7Y9NZw+dr36B8vus/Jka4TWCTeHmWOOi8hFmXDy
 mPjh5pNCvWXXdrRltvtqic2LnKl8CDgh+6n164PJrSA+qTBizy3kbUoVQhOsjOmsrkyg
 8g5OWbsNo8e0IpOYH6yAszxOdUF08rRXrZ4sxyGoIJV14l2Im2bOjuE1q7Kq02fgOPEg
 dtNKYeJzXam8FxeAtH+BvY2tCGa6AxZ6uyoIG5j6IjN0EQL6TbfvzV9pP8Sio3fVn/2m
 iwqYE83PbLRo63+Ituo1xhy5+Mi2rMFy20d+XlGiAozOcaxjv9T8aqH0TGREhc4s/dvb
 SDmg==
X-Gm-Message-State: AOAM532OYvIn5ZzlwHYxOke5IF5HIZ/gUs86kvno8AEwxrpxgE0ndW08
 veG/0XQ0AdErfZ+MukSFPzne20i0+ERftcFou7+fsQ==
X-Google-Smtp-Source: ABdhPJw8HVPX1dGZl0rl/MHYsQZvuSM4h3tFpAsNpmwJbd8T00RckFLgCRAmq+WwuDgIU5IN9yO8csm2lf3OiHVnWhs=
X-Received: by 2002:a05:6512:1289:: with SMTP id
 u9mr11740314lfs.273.1637116132467; 
 Tue, 16 Nov 2021 18:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117010145.297253-1-joel@jms.id.au>
In-Reply-To: <20211117010145.297253-1-joel@jms.id.au>
From: Oskar Senft <osk@google.com>
Date: Tue, 16 Nov 2021 21:28:36 -0500
Message-ID: <CABoTLcS=8vpqystmz0yv=wwYvzZaSZrvYeiHH8hpA8=P9HDoBA@mail.gmail.com>
Subject: Re: [PATCH] drm/aspeed: Fix vga_pw sysfs output
To: Joel Stanley <joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 16, 2021 at 8:02 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Before the drm driver had support for this file there was a driver that
> exposed the contents of the vga password register to userspace. It would
> present the entire register instead of interpreting it.
>
> The drm implementation chose to mask of the lower bit, without explaining
> why. This breaks the existing userspace, which is looking for 0xa8 in
> the lower byte.
>
> Change our implementation to expose the entire register.
>
> Fixes: 696029eb36c0 ("drm/aspeed: Add sysfs for output settings")
> Reported-by: Oskar Senft <osk@google.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index b53fee6f1c17..65f172807a0d 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -291,7 +291,7 @@ vga_pw_show(struct device *dev, struct device_attribute *attr, char *buf)
>         if (rc)
>                 return rc;
>
> -       return sprintf(buf, "%u\n", reg & 1);
> +       return sprintf(buf, "%u\n", reg);
>  }
>  static DEVICE_ATTR_RO(vga_pw);
>
> --
> 2.33.0
>

Tested-by: Oskar Senft <osk@google.com>
