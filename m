Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ED2265685
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:17:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BndD41WvqzDqkZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:17:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=103.231.89.101;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [103.231.89.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BndCz4Cy2zDqjj
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 11:17:51 +1000 (AEST)
Received: from pecola.lan (180-150-121-66.b49679.p1.nbn.aussiebb.net
 [180.150.121.66])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AE2DB3FEA9;
 Thu, 10 Sep 2020 21:10:30 -0400 (EDT)
Message-ID: <788526c84deb4763d874be1748fcc5a583f8f79d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 09:10:29 +0800
In-Reply-To: <CACPK8XcT02qv+1H=DDv8BRAdUmrBoweZ+Qb3aG34bQ9-UC08Xg@mail.gmail.com>
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
 <CACPK8XcT02qv+1H=DDv8BRAdUmrBoweZ+Qb3aG34bQ9-UC08Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi Joel,

Thanks for the review!

> A Fixes: might be a good idea.

OK, given this isn't strictly (just) a fix, should I split that out?

> > -#define MAX_NR_SGPIO                   80
> > +#define MAX_NR_HW_SGPIO                        80
> > +#define SGPIO_OUTPUT_OFFSET            MAX_NR_HW_SGPIO
> 
> A short comment explaining what's going on with these defines (as you
> did in your commit message) will help future reviewers.

Sounds good, I'll add one.

> 
> > +static void aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> > +               unsigned long *valid_mask, unsigned int ngpios)
> > +{
> > +       struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> > +       int n = sgpio->n_sgpio;
> > +
> > +       WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > +
> > +       /* input GPIOs in the lower range */
> > +       bitmap_set(valid_mask, 0, n);
> > +       bitmap_clear(valid_mask, n, ngpios - n);
> > +}
> > +
> > +static const bool aspeed_sgpio_is_input(unsigned int offset)
> 
> The 0day bot complained about the 'const' here.

ack, will remove.

> > +{
> > +       return offset < SGPIO_OUTPUT_OFFSET;
> > +}
> >  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
> >  {
> >         struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> >         unsigned long flags;
> > +       int rc;
> > 
> > -       spin_lock_irqsave(&gpio->lock, flags);
> > -
> > -       gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> > -       sgpio_set_value(gc, offset, val);
> > +       /* No special action is required for setting the direction; we'll
> > +        * error-out in sgpio_set_value if this isn't an output GPIO */
> > 
> > +       spin_lock_irqsave(&gpio->lock, flags);
> > +       rc = sgpio_set_value(gc, offset, val);
> >         spin_unlock_irqrestore(&gpio->lock, flags);
> > 
> >         return 0;
> 
> I think this should be 'return rc'

Yup. I'll send a v2 with these changes.

Cheers,


Jeremy

