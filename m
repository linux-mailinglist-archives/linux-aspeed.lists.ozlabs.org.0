Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF590A9C9B
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 10:08:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PCxd0R33zDr09
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 18:08:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ldqIJr7r"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PCxS5n22zDqsD
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 18:08:27 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t11so934904plo.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p4cc3HD6wCgRlnUtcn0OOHFmBZxcsFw0lbNwPOQXaMs=;
 b=ldqIJr7rYiw3PfQqdQzuOi7dClRQkPVHQ78j0B22mJIViZA3bBPXpqOgqQfRYw477s
 HSy1oDmzKI7o2tp87ZoXVsuCMMg1FTgRrNOA125vjse2m5crWv6rqwXnRW/56VJ3R5Gl
 5lbkaq+trdJvu3B3FD95traiLrl5n0Frg1kDdyfgETxTIwvuH7fJ3Xbi+9rw6I0LpPyh
 9dEC67LHeKADIOu3uUCU5Ja1B30P0AB6ewmQ72l5j0LBBBQ7bK0tBlz8PBniTjaLAE0E
 RQEM8MjW7Get5PgLg3Azvc4wbNxm1078ev2AKbDiNFD7yruPq+HkHQUu0Q7SgZ/te7KX
 y1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4cc3HD6wCgRlnUtcn0OOHFmBZxcsFw0lbNwPOQXaMs=;
 b=kSXmQ3Px5ATnuXYpfrAYYVY3C0g+pQojMg/CkibMh8n7m9BuGv/vEywv3603nbOmms
 R5yPCGtzE1AbRsKIDSYV9P/qxN6aD6YLz7eSH5IHcFIXK3q9/+fSJM88Rjt5Ty4NPsVp
 6lEcayEBeLgMKO7/JB0WioNYWJYisXx9cnUcCXwp0ajlhtiyYcogSY48RC8irMX+0dau
 dEoN/gdBpjuxypDIJiGiWeoNdV7eT+Bg5uJIoNSbyRjT3XEj3ZZPkdYt6REGyEZcbq9A
 hXq0Fz59VDQdcGRyj1RKMX3Dz7BdRYp2vVSIMN2qyjP9WgRzzvMCIdSWtJhO+RxoqlRO
 4IWQ==
X-Gm-Message-State: APjAAAXp+wwENSlZtkpKY3fGEEyuAAH57Gfi9v+dcR9831fa4RdnhKhO
 FzXpUdBpgQUVoEFwZGn7QYprSktc9LEvouN2j7A=
X-Google-Smtp-Source: APXvYqwWrgyUGsctjbz9xkNUlborGLECclh7l27G2fO9h6X4J9/miCFZcTmLyyj7sm/bNj1c3Gs23ePhQy3qAsUB81A=
X-Received: by 2002:a17:902:9348:: with SMTP id
 g8mr2103599plp.18.1567670905658; 
 Thu, 05 Sep 2019 01:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
 <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
 <dd62da5f10c06fae1823bf8338c2acc83fe40a40.camel@gmail.com>
In-Reply-To: <dd62da5f10c06fae1823bf8338c2acc83fe40a40.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Sep 2019 11:08:13 +0300
Message-ID: <CAHp75VfbjRfCOzo2+95aiGDcmEUOAqUORY4epK+REJ=Y57XFFQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
To: Rashmica Gupta <rashmica.g@gmail.com>
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Sep 5, 2019 at 2:17 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:
> On Wed, 2019-09-04 at 19:27 +0300, Andy Shevchenko wrote:
> > On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com>
> > wrote:

> > > -       banks = gpio->config->nr_gpios >> 5;
> > > +       banks = (gpio->config->nr_gpios >> 5) + 1;
> >
> > Shouldn't be rather DIV_ROUND_UP(nr_gpios, sizeof(u32)) ?
>
> I agree that DIV_ROUND_UP is the right thing to use here, but wouldn't
> it be DIV_ROUND_UP(nr_gpios, 32)?

Right. Either this or BITS_PER_TYPE(u32).

> > >         gpio->dcache = devm_kcalloc(&pdev->dev,
> > >                                     banks, sizeof(u32),
> > > GFP_KERNEL);

-- 
With Best Regards,
Andy Shevchenko
