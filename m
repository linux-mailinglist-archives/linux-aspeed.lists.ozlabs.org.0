Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D622239B6EF
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 12:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxJjH6gd5z302l
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Jun 2021 20:22:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=L30wT9Gq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L30wT9Gq; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxJjB2L92z2yxS
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Jun 2021 20:22:04 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so6838671pjr.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 04 Jun 2021 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aUTAR6wf3YjHvE8+6bjBL3/E962RYRKJQK58myGqUmo=;
 b=L30wT9Gqzu4Awu7kONktI1IDMc9NsZdNoJ8lA7zfngTzBLSGNIdxGF27OrmMGpOes2
 NCHhHQqIIvIuIrghRnAUcYJFwQkPv+bVNz28ZyWSkQnxBV/ySlmFlc/tNXEu1keHQKcU
 tOyJTfyocsBvW4COyd7jQyNEmqdxJ2TYsyEeLkmo+goJIEdTDkGRIiV06oxzN+mgSV0A
 cvBKAmYQ9iZ5h35JJmLAWsEVklfeTKWclOgJ9qnXC5fQmPut7pKgGjirxe6IZc9DDy53
 lHsTUWh0L5vLGSj4IrUPGXAIvsbPpAKCf49KClLz+aSsX3snEKv6pBEdp40bkof5BySK
 nOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aUTAR6wf3YjHvE8+6bjBL3/E962RYRKJQK58myGqUmo=;
 b=NwP2V4JbrqQHZQJ6OY0c85bbu/aW8ML8gcfaEux2rsyUO+f/xVqQ78OW+JLmeXM4Of
 gDSD+esGo84Bmits0jSJwBkrpzqru1GnN787kb5qB+t1E7zXv0Y4BcQYdbHjpI8LH1HT
 PXuxePZiyNNxpV6bZsGwYOlq8xSehO0l2b9tp/yygR/2TEF6sCkcB9Tl5Ba/KP4Ell9m
 +qRa0xcL9WZETywLQLO/TYPWt0xO0bJsNbqwqthHPJKTfdyI4GVVwM1ND61IsCKWl5tV
 vgrXNUf5ka6xzucz6TpUXmfxgd2Y8RBXiFxLjA/cGrflvVjCv9daERd1b2ND3A8DR/TK
 XOsg==
X-Gm-Message-State: AOAM530u/CNi1WEgrIi83OSL0rAh0h9MilIeNlsx7FT1F1f+t3HyYzb5
 dyRuk9ANyJ9VWbaBP8xGvxJFg8VWgcC6bBrPyfs=
X-Google-Smtp-Source: ABdhPJz0oU98a0IEMUBvGYHgVWiHvtHkWNGD3vRTHMitz6twCDnTyAUyXMyaiL9RpUbfVkqVHjdEnWAwNttkcCue/po=
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr16339993pja.181.1622802120096; 
 Fri, 04 Jun 2021 03:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-4-steven_lee@aspeedtech.com>
 <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
 <20210604021422.GA25112@aspeedtech.com>
In-Reply-To: <20210604021422.GA25112@aspeedtech.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Jun 2021 13:21:43 +0300
Message-ID: <CAHp75VfmCJEP+N-U5nhg-R1bhG5iSfqAsPf3022u8T2mmTFRAA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, "Hongweiz@ami.com" <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 4, 2021 at 5:14 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> The 06/03/2021 19:05, Andy Shevchenko wrote:
> > On Thu, Jun 3, 2021 at 1:19 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> > > +#define GPIO_OFFSET(x)        ((x) & 0x1f)
> >
> > GENMASK()
> >
> > ...
> >
>
> Do you mean the macro should be modified as follows?
> #define GPIO_OFFSET(x)        ((x) & GENMASK(4, 0))

Yes.

-- 
With Best Regards,
Andy Shevchenko
