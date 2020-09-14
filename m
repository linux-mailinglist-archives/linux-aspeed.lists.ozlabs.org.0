Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08759268AD7
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 14:26:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqlvr00zxzDqRh
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 22:26:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SY+nMVNE; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqlvV2450zDqPF
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Sep 2020 22:25:57 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id n13so17311632edo.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Sep 2020 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7BdFAddq3RL7rFBEGnlqI6CKwA0tfgEjJpCRYq7bxjU=;
 b=SY+nMVNE8BVVG8ruSR5EiacuhIKxjjgXR9WrOal16ZSF/q8w+hTw0Ovle+QzD6126z
 7fcMPAlyyrMVpVqQt9fd7pJ+l946ySRRZ9i0JaFdIGyuYAczoOGJ/uxKt6pXehjk4vAX
 JLgJDFoB5rHn/zw0yh5fFvwqdFgLQz+5h7c+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BdFAddq3RL7rFBEGnlqI6CKwA0tfgEjJpCRYq7bxjU=;
 b=LWsN8pHGp/ssoU63Cu9V5uIFZlrkK+TtYYy9n6+0t7Qae+FxjgLISpz+KZ7GCa9XZX
 Xa2sIQxGvL8/XkAxx/khwDFVfaByNaGBWuQoFmrUFgs9AeR7SUKPVNd44Gl/U0pIcPi1
 xhughWous2NLwPb8AZvS41Bpy34bufRgNEWjaCsEhkT75UMOhhxvJyt0HAAfCC5KNmkT
 B/TpE5pQmbBBWvkFin+ZAVNGgYUD03+yPflJASiKsNUNenCsLUr/F5+XtCULoE4gUsCM
 nzMaUBp0a/bUNEpX6h9W408dEXAmJ1FpxlkGmilZZN8insI+pc9ZIbYvFRChDBPPi9AN
 OYyg==
X-Gm-Message-State: AOAM530Yl8k0U+6sZll/bmRzWJulaSKaqk+EWpvKkvMj+2PIZ5gvGrUc
 Nh4imfCDFtgrQ4N5YUul1uQzsiFMcKFEgqSG3ZQ=
X-Google-Smtp-Source: ABdhPJwSGNnu67PnYtbgAyhVZqnOww0LDfKxxJooWZDtBPLdj0aTdSYJeckD3nPCMOPCHtjf4qb+aGCqyjmZbea0upw=
X-Received: by 2002:a50:fb0e:: with SMTP id d14mr17550786edq.172.1600086354159; 
 Mon, 14 Sep 2020 05:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
 <alpine.DEB.2.21.2009131156090.6163@felia>
In-Reply-To: <alpine.DEB.2.21.2009131156090.6163@felia>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Sep 2020 12:25:41 +0000
Message-ID: <CACPK8XdvmUN6XsqGEYMwyb1JhWtm9Nyrje8xXx2zBN4N=+gNow@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-aspeed list remarks consistent
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 13 Sep 2020 at 09:57, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Sat, 12 Sep 2020, Lukas Bulwahn wrote:
>
> > Commit f15a3ea80391 ("MAINTAINERS: Add ASPEED BMC GFX DRM driver entry")
> > does not mention that linux-aspeed@lists.ozlabs.org is moderated for
> > non-subscribers, but the other three entries for
> > linux-aspeed@lists.ozlabs.org do.
> >
> > By 'majority vote' among entries, let us assume it was just missed here and
> > adjust it to be consistent with others.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on master and next-20200911
> >
> > Joel, please ack.
> > David, Daniel, please pick this minor non-urgent clean-up patch.
> >
> > This patch submission will also show me if linux-aspeed is moderated or
> > not. I have not subscribed to linux-aspeed and if it shows up quickly in
> > the archive, the list is probably not moderated; and if it takes longer,
> > it is moderated, and hence, validating the patch.
> >
>
> I did quickly get back an moderation email that my email is being held
> back. So, that response validates my patch.

The bmc related lists (openbmc@, linux-aspeed@, linux-fsi@) on
ozlabs.org that I own have a soft-moderation policy. The first time
you post a patch I add you to a whitelist. Given the low volume on
these lists this works for me.

I don't know if this necessitates marking the lists as moderated in
MAINTINERS, but if you find that helpful then that's fine with me.

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
