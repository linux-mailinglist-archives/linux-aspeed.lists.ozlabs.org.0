Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B62883E1
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 09:47:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C70Y30DK4zDqbt
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 18:47:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=W2/Ti3kY; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C70Xv2nG0zDqZq
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 18:47:40 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id t9so6469588qtp.9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Oct 2020 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAiaW+93Fl44jRzXXS4wP2VkVubvR/5JY7dN1rt4R24=;
 b=W2/Ti3kYbkEU5RKCfPrBtOvrhfe9cr5iuuAldgjQ7SvTctTZBqQB3etOoQUyfT1pjh
 9uLIyPpE3dMy91CHV8oruvhojOvHgUTEGe0B1p52ndlkMEoY9sf9xwsZ8MwshknuqA4f
 jpAFBR0c47xN5bTpItg86xQwUfhypUtNqWUPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAiaW+93Fl44jRzXXS4wP2VkVubvR/5JY7dN1rt4R24=;
 b=JXNdKs1imVDno70lHeDBnKcLnVZpjDqvna1yLUmLiKBJqQQawM20Oqc3Y3TzX6xMEJ
 kAPqL8KmB/uJo+U5J7aA9TQQLSOu6y2kJqcm1rVDRVxjK8qG7Fe7/Ks0NsqQaE+30NID
 AkULLZ/9kWZFrqfvmr92xYaD8uEfkQWbz3xVj7ybeAD4hrg95DFP6sIVbkormSQHhCIB
 +M9qiRpx8NLgfhjpP0rd1XYc5GGyy2KBWOYqao60nbFN5CVcs1wzRqqGy2Ax4cxZ6fS1
 04mKNzT/v6MJSV1UaxvsCEmeLRvTGWzfEFzKUOQ1pr2lUT+LnabULl55WR0oanb25kRO
 dpXg==
X-Gm-Message-State: AOAM530p5O9XEfutZkoOn9G6K29vbfptQqfEE6XV58SqUmBb+LuA+jKI
 eVPFAp0z/acGkcKW3G7Ol97JkSrL2ZaVtWrooHc=
X-Google-Smtp-Source: ABdhPJzaS4AsDvCUEmHGRC+WwFuD4vOUEpxsmXwUsmKQfLl5+lxXtC5MeHCenesLqwiwzmORkg0T9r/PACyAmMvdq7A=
X-Received: by 2002:ac8:48ca:: with SMTP id l10mr12339910qtr.385.1602229656436; 
 Fri, 09 Oct 2020 00:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200222235152.242816-1-megous@megous.com>
 <020e9eb5-4fdc-44d0-b00e-42b6e6435110@www.fastmail.com>
In-Reply-To: <020e9eb5-4fdc-44d0-b00e-42b6e6435110@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 07:47:24 +0000
Message-ID: <CACPK8Xd-o+5xA=T12yR6+gxmpvwkqi_VjU10MpsLVzh0e2dKnA@mail.gmail.com>
Subject: Re: [PATCH] drm: aspeed: Fix GENMASK misuse
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:DRM DRIVER FOR ASPEED BMC GFX" <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 24 Feb 2020 at 00:06, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Sun, 23 Feb 2020, at 10:21, Ondrej Jirman wrote:
> > Arguments to GENMASK should be msb >= lsb.
> >
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> > I just grepped the whole kernel tree for GENMASK argument order issues,
> > and this is one of the three that popped up. No testing was done.
>
> I think someone's sent a patch previously, and last time it turned into a
> discussion about how the macros aren't actually used and could be
> removed.
>
> Regardless:
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, I've applied this to drm-misc-next. Apologies for the delay.
