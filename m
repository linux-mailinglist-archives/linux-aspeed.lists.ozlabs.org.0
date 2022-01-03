Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B33A482FAA
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jan 2022 10:51:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JS9x20vB7z2ynx
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jan 2022 20:51:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5t+34L7U;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5t+34L7U; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JS9wx3Wh4z2xXC
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Jan 2022 20:50:54 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id y22so133859847edq.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 03 Jan 2022 01:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=glHDbRAfQ2rWjG1rklFOPeGp0Df2FguJaQkq2LO7OfI=;
 b=5t+34L7U7Tu1JBDFrp9LGR1M9FHGtjeKJgpZDTUpolYJPyPbaBv9n2ysUAcIlV3yh0
 aMbKyGfS834ruFVZpL70mVwtCHPDJZOTSiggGd428KfMPQMdL8f5SyhMfWf+beAgE6Ci
 2cp6PKjtLxhJbIUbMPumjDF2ytaD/r6BoD3VRzTB5g/Gs2jjcMCj1/2oj88DflyIWzlf
 7n6ezIHCxDWxaZSLbWmpkrr3062Qv1P9HVPI/EfxF05zZeGVAIAIJrH7B4Fe6Rb/3hMP
 Kp8cENGNPF0A+i2ouMiJKcIQ8aRSfvQCqOAa08TgxzRcnX4kNbGDKqcbYzwuo8NSjlV7
 FA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=glHDbRAfQ2rWjG1rklFOPeGp0Df2FguJaQkq2LO7OfI=;
 b=6bIrtZLyYV914d3kBVVsFELcLTU0NnlNQL37kjWFhUBOr0vsTga84hvxK69+1n1LEF
 Lzr8cr3YRskX2ApscSRH+4dXn6706UQoJukcmU9Wkh0KLztMclsM79Qn+1zeIW5ukoYf
 yxnjbgMTRcJizRo9Gr+hyKjweMBoCTeqB84Ld2NSENkWAZpsAQ79sS1MqU/aLF7ZA+MG
 oSp1iPOxpEOrntJ0/zjc1PvpHw9a6XFSHf4V5cFtPqOh6I8MqEfh8AJ8ky1soctjr3qM
 gabc6Q1aHAHMq8lEYR763qDz6EqWdlDIROICy933nvBpX0b4gDo14rDJoOJMjjFArULB
 h+Lg==
X-Gm-Message-State: AOAM530IprjCXUXykxNa6Sy/lHehRxK618OGJUOMOdG3N4edK6Nn59Wt
 gBMOU55bGVFDoMIIqMwkvBuO/yNka/LJFyUibhL7oA==
X-Google-Smtp-Source: ABdhPJwGxzpdSFJDk/tcI94f8WJ6YG2uYjdkrRAo9XjIF9wkF8LCVv6c2K+zndyohDFv96C6YiCL5WIwP+3d+8dsSKc=
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr34869918ejj.636.1641203449046; 
 Mon, 03 Jan 2022 01:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20211214040239.8977-1-steven_lee@aspeedtech.com>
 <20211214040239.8977-2-steven_lee@aspeedtech.com>
 <CAMRc=MdAgK7zKuJ=7cA2T-mSTJD3tWSW2aEB6G=0Tz4X+iHcZQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdAgK7zKuJ=7cA2T-mSTJD3tWSW2aEB6G=0Tz4X+iHcZQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jan 2022 10:50:38 +0100
Message-ID: <CAMRc=McjZZTMjR+riwjj6SLEh=fYq0yjBQYNgzGXHok6=OTz_w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-aspeed-sgpio: Fix wrong hwirq base in
 irq handler
To: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 22, 2021 at 10:18 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Dec 14, 2021 at 5:03 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > Each aspeed sgpio bank has 64 gpio pins(32 input pins and 32 output pins).
> > The hwirq base for each sgpio bank should be multiples of 64 rather than
> > multiples of 32.
> >
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > index 3d6ef37a7702..b3a9b8488f11 100644
> > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > @@ -395,7 +395,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
> >                 reg = ioread32(bank_reg(data, bank, reg_irq_status));
> >
> >                 for_each_set_bit(p, &reg, 32)
> > -                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p * 2);
> > +                       generic_handle_domain_irq(gc->irq.domain, (i * 32 + p) * 2);
> >         }
> >
> >         chained_irq_exit(ic, desc);
> > --
> > 2.17.1
> >
>
> Joel, Andrew: any comments on this? I'd like to send it upstream tomorrow.
>
> Bart

I don't want to delay it anymore, it looks good so I queued it for fixes.

Bart
