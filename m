Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE0D48BC0E
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jan 2022 01:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYTZh1C5Rz2xtv
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jan 2022 11:53:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=g+bG6qp7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=g+bG6qp7; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYTZc2n6Bz2xX8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jan 2022 11:53:28 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id h4so1246597qth.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Jan 2022 16:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bn6LXYkb5vJoSA2+wYUtLd/FTU4C6AaGfIXYzaQTkB4=;
 b=g+bG6qp7d16/Bm6fLmk9kal8e7Ni7EM3x9j7lmP2pd2eYVaNmm7hxjrEj0Ckp3yJi6
 3lsoB8UMz04gacJAEz0UAlEF7NK4vpKAAuh7WbS9HT+KiF4VgVHpRgpP01xiYbC53dE8
 o0lo6e1atdVhDXDcHAY7viUa+8O6LGpugkPUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bn6LXYkb5vJoSA2+wYUtLd/FTU4C6AaGfIXYzaQTkB4=;
 b=Lp/EXn+umjHVxM/bkGYO4ors6E6OXml/kBqlmHXdH0BjUZ+BWPsxucuMzlNIflqA/J
 PBNu0ypn2MBpmoHVJATdl7hMEOeOAy7cat6yfHOXQo7Axl3xmZ4kjdhTUpZM0ey8aAeT
 ldqBZtM4mCohQZvar8ooSne7lCsO21hmz81VvzebFAyM12RQ4fpVEuK0lYeSqL+LEW+l
 VyRFyRC1HIr0K3kTMWyMRCXTT+s66L8pSITLyBLlQmGKtZnzuPvquoVTgcLMasQSvtP7
 VynwkvLWjagcm1EmY+gOJ/AA1mz/LdEO44lKK6WMbfwg2H6kpIblIL67YHSEzDT3ymCo
 lMDQ==
X-Gm-Message-State: AOAM533bc2/Rui1qxaskt4yTkPuMUCuEQ5F16O/sJ8Svbunz6TFT+0NZ
 xaPgsfp0sHJu+q6x4ySrV+plhlvMUyFP7VSryds=
X-Google-Smtp-Source: ABdhPJxTg2vyG/RY3cEh3LvIQ5+6rj7Uz5GMFpvmPNspTJRCbdFJYoUg/3X4brah8OJSqaTk4qsHuqoJz1+zVF1gJUA=
X-Received: by 2002:ac8:5a0b:: with SMTP id n11mr5879929qta.625.1641948804856; 
 Tue, 11 Jan 2022 16:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20211214040239.8977-1-steven_lee@aspeedtech.com>
 <20211214040239.8977-2-steven_lee@aspeedtech.com>
 <CAMRc=MdAgK7zKuJ=7cA2T-mSTJD3tWSW2aEB6G=0Tz4X+iHcZQ@mail.gmail.com>
 <CAMRc=McjZZTMjR+riwjj6SLEh=fYq0yjBQYNgzGXHok6=OTz_w@mail.gmail.com>
In-Reply-To: <CAMRc=McjZZTMjR+riwjj6SLEh=fYq0yjBQYNgzGXHok6=OTz_w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jan 2022 00:53:12 +0000
Message-ID: <CACPK8XdXkrTfsMoZRDjQ_-MwOQ-no_B2yG3F79_SkQ0o6mGuQg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-aspeed-sgpio: Fix wrong hwirq base in
 irq handler
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
 Steven Lee <steven_lee@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 3 Jan 2022 at 09:50, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Dec 22, 2021 at 10:18 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Tue, Dec 14, 2021 at 5:03 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> > >
> > > Each aspeed sgpio bank has 64 gpio pins(32 input pins and 32 output pins).
> > > The hwirq base for each sgpio bank should be multiples of 64 rather than
> > > multiples of 32.
> > >
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > > index 3d6ef37a7702..b3a9b8488f11 100644
> > > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > > @@ -395,7 +395,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
> > >                 reg = ioread32(bank_reg(data, bank, reg_irq_status));
> > >
> > >                 for_each_set_bit(p, &reg, 32)
> > > -                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p * 2);
> > > +                       generic_handle_domain_irq(gc->irq.domain, (i * 32 + p) * 2);
> > >         }
> > >
> > >         chained_irq_exit(ic, desc);
> > > --
> > > 2.17.1
> > >
> >
> > Joel, Andrew: any comments on this? I'd like to send it upstream tomorrow.
> >
> > Bart
>
> I don't want to delay it anymore, it looks good so I queued it for fixes.

Thanks for queuing. We were on leave over the holiday break, so no
time for reviewing kernel patches.

Cheers,

Joel
