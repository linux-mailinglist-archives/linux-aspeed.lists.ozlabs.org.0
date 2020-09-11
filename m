Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33250265673
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:15:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd9F3Y47zDqkB
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:15:29 +1000 (AEST)
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
 header.s=google header.b=DHL8lSfl; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnd933h9GzDqc6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 11:15:19 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id i26so11472300ejb.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 18:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqB7DPHtIqi+Bw4fMVuljm+cc0DjSGuY8RA1DkIWScA=;
 b=DHL8lSflYdMnee4Le9oK2Cmw2kT1eKSCFxkEhyOVZfuzMIo/md+bD1KtO10sDhEJ7s
 xkYUKlXqQqmHWSsOqTkXU9VCQa6ufMsGzNaeAa6D+XybzjCJZhojTlf9pYPIgmghItuY
 Try0QKw8VXdzCAO3PeOi3EogI8kn3HmlTB3Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqB7DPHtIqi+Bw4fMVuljm+cc0DjSGuY8RA1DkIWScA=;
 b=DoLqWHSYbShpphtBG+QmlIcSaEGjL5N+ZWb0btczT5ryRXuZyyMETUWWt7E+KlgOln
 efmTJ+83IFjFGhC/4cP/RnFIG0/Fj6+lRSS9cRql/47AFEgG8fkCMc5NZJoZYozxGAeV
 TGdrmYvjyKbCYKBUvFxE4TXyLhAijkriSbV7cKhbUb/bADNxSdtIARIaYmJn24LqE+si
 H0BCq4J05kCypkWNKfhzMxo9e1D+QIrOGYCBu/+VuEHv1Jwi/bQMJ5KTn3ue8UAXuhje
 CdYenVjGWvqOgg9LSwkzecYssufAEYqb+sSCqIGCz3JGuTYZj9Eue6tukCtn5+3aP8XC
 hgkw==
X-Gm-Message-State: AOAM531nuqkFjvPGXhoQDnOg9mCXKuv5I2hA4Sh94fsJBhtwtfP3Qw3Z
 t3Rz0ZtbnYgwehZ+y/CppSQ32NNpNzecJIFfoTOXLYk04mg=
X-Google-Smtp-Source: ABdhPJyC/5wFl0aS0uol0uyiBTrxuWRqUjvlvqNkVX3NwIiFYVzywBU8WdIF3SqqzUmJnc3M3EdqulZFtzFPOftVnJE=
X-Received: by 2002:a17:906:8695:: with SMTP id
 g21mr11320548ejx.504.1599786914775; 
 Thu, 10 Sep 2020 18:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
 <CACPK8XcT02qv+1H=DDv8BRAdUmrBoweZ+Qb3aG34bQ9-UC08Xg@mail.gmail.com>
 <788526c84deb4763d874be1748fcc5a583f8f79d.camel@codeconstruct.com.au>
In-Reply-To: <788526c84deb4763d874be1748fcc5a583f8f79d.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 01:15:02 +0000
Message-ID: <CACPK8XetpRt9gnfA3WbTzXOctqD5Anb0ugub3LaVzyyVnjycmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
To: Jeremy Kerr <jk@codeconstruct.com.au>
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 at 01:10, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> Thanks for the review!
>
> > A Fixes: might be a good idea.
>
> OK, given this isn't strictly (just) a fix, should I split that out?

I assume anyone using the sgpio driver in anger would need this patch
for it to work properly, so a fix tag will help them there. No need to
break it down any further in my opinion.

Cheers,

Joel

>
> > > -#define MAX_NR_SGPIO                   80
> > > +#define MAX_NR_HW_SGPIO                        80
> > > +#define SGPIO_OUTPUT_OFFSET            MAX_NR_HW_SGPIO
> >
> > A short comment explaining what's going on with these defines (as you
> > did in your commit message) will help future reviewers.
>
> Sounds good, I'll add one.
>
> >
> > > +static void aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> > > +               unsigned long *valid_mask, unsigned int ngpios)
> > > +{
> > > +       struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> > > +       int n = sgpio->n_sgpio;
> > > +
> > > +       WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > > +
> > > +       /* input GPIOs in the lower range */
> > > +       bitmap_set(valid_mask, 0, n);
> > > +       bitmap_clear(valid_mask, n, ngpios - n);
> > > +}
> > > +
> > > +static const bool aspeed_sgpio_is_input(unsigned int offset)
> >
> > The 0day bot complained about the 'const' here.
>
> ack, will remove.
>
> > > +{
> > > +       return offset < SGPIO_OUTPUT_OFFSET;
> > > +}
> > >  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
> > >  {
> > >         struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > >         unsigned long flags;
> > > +       int rc;
> > >
> > > -       spin_lock_irqsave(&gpio->lock, flags);
> > > -
> > > -       gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> > > -       sgpio_set_value(gc, offset, val);
> > > +       /* No special action is required for setting the direction; we'll
> > > +        * error-out in sgpio_set_value if this isn't an output GPIO */
> > >
> > > +       spin_lock_irqsave(&gpio->lock, flags);
> > > +       rc = sgpio_set_value(gc, offset, val);
> > >         spin_unlock_irqrestore(&gpio->lock, flags);
> > >
> > >         return 0;
> >
> > I think this should be 'return rc'
>
> Yup. I'll send a v2 with these changes.
>
> Cheers,
>
>
> Jeremy
>
