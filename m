Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBB3689A5
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 02:07:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRF3L2JMQz2yjY
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 10:07:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CPLFUXiN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CPLFUXiN; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRF3H2ZgBz2xZs
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Apr 2021 10:07:20 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id h15so13190998qvu.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Apr 2021 17:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfM3d7LOiLS9qmGDziTRg1PSfPwhJZSu7g8WxAmeWYU=;
 b=CPLFUXiNh4B93n9Xa5TPQoafBuJO+Xzvo6rwK5wfYF3Lpx9T05KuYCVSKj9fJcrIJG
 QwBAnHWwPqlV2hBpDeOEawH0udkeNH6RtSJb4e89xjKokYFgoFRYLVkoio1Rg52snfp0
 3b2R+eu7uryyY++tta636sg60TtoVc1+IKtRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfM3d7LOiLS9qmGDziTRg1PSfPwhJZSu7g8WxAmeWYU=;
 b=IgT1sAVxJeGqSSTD8hBvZVicfAbKEozJo4k/3977rwBXyLLwX8+1YBQK+F09Molv+1
 p4K/JbHcHOPdn6+B2R/8Iivoo/BN5uBcPmr87Rdg2dCaBQLNKPFEvxGU3gRx+aDS0dg2
 gha49jfqcpB/O/4gnlMBBxxe2cM769XgsvbuhRXAliOb+IY2Zy1xYbQ8HUJEkcHuZKyn
 aMMEXj3O8JmPAv8ax0bqG7k4AHWGwQyf5G/ZBay+puCeWBYXcsW+vJ7k5bFhM8XMApjw
 VRARh1ZS5XUAUEJWhyWzoKstt9vamAYjzBOOP2hmWmLAxas8Xut1APfI892Aw/HdbETB
 1KNw==
X-Gm-Message-State: AOAM531VwNnjW1o7L3BOUZe49B8kAxNajVqb8weU3S01V0NLx+ZmND+4
 5LehWmIeYSov9x2dqcKFGGgPMb/nzdEzsTTKjnM=
X-Google-Smtp-Source: ABdhPJwzrmIHJN3KSKdUfPi114SsARBXFjKZOnUsANQ2c4AII3cxjV1HF1foJ0rKi1mBguFhLOW4GX9GnFoT5okPR5s=
X-Received: by 2002:a0c:eb06:: with SMTP id j6mr1253747qvp.10.1619136436827;
 Thu, 22 Apr 2021 17:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <YIE90PSXsMTa2Y8n@mwanda>
 <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
In-Reply-To: <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Apr 2021 00:07:04 +0000
Message-ID: <CACPK8XcOkQms8UpRZiansyRfmh4HmrrGN178x7sOEAarNM4u1w@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: fix a ternary sign expansion bug
To: David Laight <David.Laight@aculab.com>
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
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 22 Apr 2021 at 16:21, David Laight <David.Laight@aculab.com> wrote:
>
> From: Dan Carpenter
> > Sent: 22 April 2021 10:12
> >
> > The intent here was to return negative error codes but it actually
> > returns positive values.  The problem is that type promotion with
> > ternary operations is quite complicated.
> >
> > "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
> > returns long.  What happens is that "ret" is cast to u32 and becomes
> > positive then it's cast to long and it's still positive.
> >
> > Fix this by removing the ternary so that "ret" is type promoted directly
> > to long.
> >
> > Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > index 210455efb321..eceeaf8dfbeb 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
> >                       return -EINTR;
> >       }
> >       ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
> > +     if (ret)
> > +             return ret;
> >
> > -     return ret ? ret : copied;
> > +     return copied;
>
> I wonder if changing it to:
>         return ret ? ret + 0L : copied;
>
> Might make people think in the future and not convert it back
> as an 'optimisation'.

I think the change that Dan posted is clear.

Thanks Dan! I'll get it queued up.

Cheers,

Joel
