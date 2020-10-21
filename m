Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9242294706
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 05:37:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGGQZ2Gr2zDqS4
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 14:37:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=S0yF5moQ; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGGQR0361zDq99
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 14:37:18 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id h140so1045309qke.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Oct 2020 20:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvMvPvEIzkDzHLBTHLVaGKI3I8TYc8uxn0Gzgfn1fYM=;
 b=S0yF5moQ3zgsfWshFIIAsq+ESTQkQc+axIoz5jeRWLvLrMvOEWoRrIYk4T4LJdCota
 Mi8kln4clBqAqESVvBTY8RSFa3TGx4K3La5VVj6r9HCs3TuCtwtuR5aSGEIGs46CyE+T
 ISl0n2RWmR8iN+HDOkSz6srw3eWvcuLDJZhdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvMvPvEIzkDzHLBTHLVaGKI3I8TYc8uxn0Gzgfn1fYM=;
 b=Z4j21Cqcwm7PtQxGCh3MeO9cv/mu/iIwaBYwSKIbfiZdahzKh5dueW8pxXw2HQRPjC
 c6EPNa2nKwN0D8U1+8twwBpHOMZxaySuNx1UV4uOGxnZtyz6D1t/zWILZXr7+pFtg9Vi
 e+51d72m4CwO0ORNoMhMQ8ZS18OamVxJ1ML7YzR+D9sTNC4Ftj6byAFQdXlZE4gTXHWX
 h2lmDvUudSZ93qFoEDu7h7I6pftZb+eeRx6pICOHOpjssyvfjNN6CNIh7BZv5nBuP86e
 uSll7sTZ5X+9xIt7d3VHfZgv+4tr9Zy3o0fW+MJUpYRmWP7Kg3JtuWt/98FEJ/WQMGy4
 8rfg==
X-Gm-Message-State: AOAM533pe/MjicCN/xeaPFdHTYUNGGgtCBHhIgUfK5lBFpxaugEk0cVX
 LyJG01Fr+siAw5NU2Y9CSoE/2PKIyAneR23s5Rw=
X-Google-Smtp-Source: ABdhPJy50X7s92E4yQURmrw0y3qAXYcHTHBJ+PGZaS5kTRxKsjzOAJtZumbrwf36JRnsvarnNvoJ5csQLlmSLnGY/1o=
X-Received: by 2002:a37:48cc:: with SMTP id v195mr1446238qka.66.1603251434714; 
 Tue, 20 Oct 2020 20:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201020220639.130696-1-joel@jms.id.au>
 <86480db3977cfbf6750209c34a28c8f042be55fb.camel@kernel.crashing.org>
In-Reply-To: <86480db3977cfbf6750209c34a28c8f042be55fb.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Oct 2020 03:37:02 +0000
Message-ID: <CACPK8XfmdUdoke8q=z02ijk89=3ZezTfjOmcr9PX3jnpmvAZPw@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 21 Oct 2020 at 00:00, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-10-21 at 08:36 +1030, Joel Stanley wrote:
> > We must ensure the tx descriptor updates are visible before updating
> > the tx pointer.
> >
> > This resolves the tx hangs observed on the 2600 when running iperf:
>
> To clarify the comment here. This doesn't ensure they are visible to
> the hardware but to other CPUs. This is the ordering vs start_xmit and
> tx_complete.

Thanks. Let me know if this makes sense, or if I'm completely off the mark.

How is this for the commit message:

This resolves the tx hangs observed on the 2600 when running iperf.
This is ensuring the setting of the OWN bit in txdes0 of the
descriptor is visible to other CPUs before updating the pointer. Doing
this provides ordering between start_xmit and tx_complete.

and then I'll put:

        /* Ensure the descriptor config is visible to other CPUs before setting
         * the tx pointer. This ensures ordering against start_xmit which checks
          * the OWN bit before proceeding.
         */

and similar for tx_complete?

>
> Cheers,
> Ben.
>
> > root@ast2600:~# iperf3 -c 192.168.86.146 -R
> > Connecting to host 192.168.86.146, port 5201
> > Reverse mode, remote host 192.168.86.146 is sending
> > [  5] local 192.168.86.173 port 43886 connected to 192.168.86.146
> > port 5201
> > [ ID] Interval           Transfer     Bitrate
> > [  5]   0.00-1.00   sec  90.7 MBytes   760 Mbits/sec
> > [  5]   1.00-2.00   sec  91.7 MBytes   769 Mbits/sec
> > [  5]   2.00-3.00   sec  91.7 MBytes   770 Mbits/sec
> > [  5]   3.00-4.00   sec  91.7 MBytes   769 Mbits/sec
> > [  5]   4.00-5.00   sec  91.8 MBytes   771 Mbits/sec
> > [  5]   5.00-6.00   sec  91.8 MBytes   771 Mbits/sec
> > [  5]   6.00-7.00   sec  91.9 MBytes   771 Mbits/sec
> > [  5]   7.00-8.00   sec  91.4 MBytes   767 Mbits/sec
> > [  5]   8.00-9.00   sec  91.3 MBytes   766 Mbits/sec
> > [  5]   9.00-10.00  sec  91.9 MBytes   771 Mbits/sec
> > [  5]  10.00-11.00  sec  91.8 MBytes   770 Mbits/sec
> > [  5]  11.00-12.00  sec  91.8 MBytes   770 Mbits/sec
> > [  5]  12.00-13.00  sec  90.6 MBytes   761 Mbits/sec
> > [  5]  13.00-14.00  sec  45.2 KBytes   370 Kbits/sec
> > [  5]  14.00-15.00  sec  0.00 Bytes  0.00 bits/sec
> > [  5]  15.00-16.00  sec  0.00 Bytes  0.00 bits/sec
> > [  5]  16.00-17.00  sec  0.00 Bytes  0.00 bits/sec
> > [  5]  17.00-18.00  sec  0.00 Bytes  0.00 bits/sec
> > [   67.031671] ------------[ cut here ]------------
> > [   67.036870] WARNING: CPU: 1 PID: 0 at net/sched/sch_generic.c:442
> > dev_watchdog+0x2dc/0x300
> > [   67.046123] NETDEV WATCHDOG: eth2 (ftgmac100): transmit queue 0
> > timed out
> >
> > Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > b/drivers/net/ethernet/faraday/ftgmac100.c
> > index 331d4bdd4a67..15cdfeb135b0 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -653,6 +653,11 @@ static bool ftgmac100_tx_complete_packet(struct
> > ftgmac100 *priv)
> >       ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
> >       txdes->txdes0 = cpu_to_le32(ctl_stat & priv-
> > >txdes0_edotr_mask);
> >
> > +     /* Ensure the descriptor config is visible before setting the
> > tx
> > +      * pointer.
> > +      */
> > +     smp_wmb();
> > +
> >       priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv,
> > pointer);
> >
> >       return true;
> > @@ -806,6 +811,11 @@ static netdev_tx_t
> > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> >       dma_wmb();
> >       first->txdes0 = cpu_to_le32(f_ctl_stat);
> >
> > +     /* Ensure the descriptor config is visible before setting the
> > tx
> > +      * pointer.
> > +      */
> > +     smp_wmb();
> > +
> >       /* Update next TX pointer */
> >       priv->tx_pointer = pointer;
> >
>
