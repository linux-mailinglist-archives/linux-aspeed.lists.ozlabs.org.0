Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D54B1048BF
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Nov 2019 03:53:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JPHz3YwszDqsp
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Nov 2019 13:53:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="eM8XKCwL"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JPHs1C1dzDqpR
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Nov 2019 13:52:56 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id p14so1792140qkm.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Nov 2019 18:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HRBpb1NofTDSzn/r03yAMNZB5b+BCFqizd3KS9TU4pA=;
 b=eM8XKCwLiBTrYDBgxBsRw2BnAmazqG7Yh6EbctgrhhDT/VkJWtpyd4I0jgafYvddrh
 D66QjPZTHqlc9/T9Pq6r+XndN0ChjvCNCAbtD1ti+CxMAcIA0x8gA/v8a9/8DxOw6uTh
 MX6B2lo/1ZzdCXW7YoJyaVCv3hhhg1OJvwgSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRBpb1NofTDSzn/r03yAMNZB5b+BCFqizd3KS9TU4pA=;
 b=flYSahPkj3EqXqzPRZ5YLr2CkL9P5KpXn/zxd6oe2zgiAA2aoVD6XxcZykk6e5usjv
 xMVT3T6ve7dCvyJbLIUFGDEziTTNASsZIUcvCSqu2h+ulqfsPBKosBHsU5lghg/3RecH
 Pr6ci5DHhkoVbVcRWB9VfjL8q6OAYbMzRRZs+mNupksRKbVjzEmrxAaDK1fFSLUeY40t
 QCyTdi7swEE3/TmafffhIdhxk4l72YOFXGU/gnlL/SmhdaRvftBqGqiwFHksHWKLmwVq
 ehhK8SJisZWzJJ8FSYzj/KdsoOtuT+WfRCunavbZblfd+1TLHXw87E4y2mP2hPhmgobQ
 aHjQ==
X-Gm-Message-State: APjAAAVxGoW5bUGeEpvzHPrTM1WvFl/AefcpBRCN0p9FNmOSBvwq8O1N
 fQQE5E7p9Vvi11YhlbG/gunx1Lxrib+6/8tDqGo=
X-Google-Smtp-Source: APXvYqzEOaht5xTwJzZ1PyVm7pSpljnawSJw5pVkoy6TqeJnWlaviiQzQVT03RYWqcb2qhbWWljBiAkv81grK5w5zNg=
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr5861034qki.330.1574304771112; 
 Wed, 20 Nov 2019 18:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20191120000647.30551-1-luc.vanoostenryck@gmail.com>
 <787e54c2-2fe3-4afc-a69b-94771726194b@www.fastmail.com>
In-Reply-To: <787e54c2-2fe3-4afc-a69b-94771726194b@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Nov 2019 02:52:39 +0000
Message-ID: <CACPK8XfO=F-BtCuDqyQODJv=6joYmyFiQ5eOYC5YuDJhcLSJtw@mail.gmail.com>
Subject: Re: [PATCH] aspeed: fix snoop_file_poll()'s return type
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
Cc: Robert Lippert <rlippert@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 20 Nov 2019 at 05:42, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Wed, 20 Nov 2019, at 10:36, Luc Van Oostenryck wrote:
> > snoop_file_poll() is defined as returning 'unsigned int' but the
> > .poll method is declared as returning '__poll_t', a bitwise type.
> >
> > Fix this by using the proper return type and using the EPOLL
> > constants instead of the POLL ones, as required for __poll_t.
> >
> > CC: Joel Stanley <joel@jms.id.au>
> > CC: Andrew Jeffery <andrew@aj.id.au>
> > CC: linux-aspeed@lists.ozlabs.org
> > CC: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> > ---
> >  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > index 48f7ac238861..f3d8d53ab84d 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -97,13 +97,13 @@ static ssize_t snoop_file_read(struct file *file,
> > char __user *buffer,
> >       return ret ? ret : copied;
> >  }
> >
> > -static unsigned int snoop_file_poll(struct file *file,
> > +static __poll_t snoop_file_poll(struct file *file,
> >                                   struct poll_table_struct *pt)
> >  {
> >       struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
> >
> >       poll_wait(file, &chan->wq, pt);
> > -     return !kfifo_is_empty(&chan->fifo) ? POLLIN : 0;
> > +     return !kfifo_is_empty(&chan->fifo) ? EPOLLIN : 0;
>
> Looks fine to me as POLLIN and EPOLLIN evaluate to the same value despite
> the type difference.

I assume Luc was using sparse to check:

CHECK   ../drivers/soc/aspeed/aspeed-lpc-snoop.c
../drivers/soc/aspeed/aspeed-lpc-snoop.c:112:19: warning: incorrect
type in initializer (different base types)
../drivers/soc/aspeed/aspeed-lpc-snoop.c:112:19:    expected
restricted __poll_t ( *poll )( ... )
../drivers/soc/aspeed/aspeed-lpc-snoop.c:112:19:    got unsigned int (
* )( ... )

If you fix the return type:

  CHECK   ../drivers/soc/aspeed/aspeed-lpc-snoop.c
../drivers/soc/aspeed/aspeed-lpc-snoop.c:106:45: warning: incorrect
type in return expression (different base types)
../drivers/soc/aspeed/aspeed-lpc-snoop.c:106:45:    expected restricted __poll_t
../drivers/soc/aspeed/aspeed-lpc-snoop.c:106:45:    got int

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will send this to the ARM SOC maintainer. Thanks Luc!

Cheers,

Joel
