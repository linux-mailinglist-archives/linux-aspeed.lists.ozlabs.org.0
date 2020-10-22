Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B35BF2958CC
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 09:07:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGz2w0rlBzDqFh
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 18:07:52 +1100 (AEDT)
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
 header.s=google header.b=i+GofPkS; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyKw48wtzDqkP
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Oct 2020 17:35:46 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id s14so506616qkg.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 23:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioQHIMjnRUOW/mlZwpsZuOwLkU2l1SyBhmTcsUYuavM=;
 b=i+GofPkSiwRWzygK0GUxNpAKSBtTKE0JwuPkLcLEvqtix3sYtFFAOGmJrpCPOL0jRm
 3jMH0KIv+Dl9MkacQkcWPwMVlU4JS9pPg537031vkqv3Mtox9+BMQ/bcPuZ6tXm85LNG
 18vsMuujeIv4zQ30iHZvuTKmJ06+1CV2lq1T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioQHIMjnRUOW/mlZwpsZuOwLkU2l1SyBhmTcsUYuavM=;
 b=Abf9CDtBa9Y1oNuOf0tNNiOZJy6cs3try50jBBpXngh3xj7T/rD6sEGJwoeNuKuHd/
 EHM+b2kPWxpgBr+Ahp0XrABemrMNyzc9LA29esNhfeqW+v3LMz3tVI7N6tVEbKU4kHBZ
 L1HO/HXGVu7pv6tFQX8HFuZY+iY+sK3SryZRvGdHLhoSfz7fWOEidQAGrv/ews5/ToPv
 ohcG0asZ4ypELXkOuuGzxvZV0RZZZ4AECVJQesxLeN5+JdxoIXbyEFTAR0OUlYdj9Sss
 IfdiY0EeZS6NqkJyOGPUt1UB+OOanL/wNAVlH9LbzIGeQbd5gIQkWumH20UlCVjEE4N3
 Zcyw==
X-Gm-Message-State: AOAM532Djo8fnWFYPk4YXaJgs5CAHg3pyKCQCWbtELIj+lR6AQ74Au72
 34Gg1MHnOpB8T5fMToN/kYj7rh6MuTCMx33ZnqQ=
X-Google-Smtp-Source: ABdhPJzGkPSWwSIZHIfclDd5Dif2bkU3dQ4rD3qacZqhFSqEiQ1p41hNPys1ARTpaotQ2gJyDiFnhGedp+jCyr9V7yo=
X-Received: by 2002:a37:a81:: with SMTP id 123mr934295qkk.487.1603348540798;
 Wed, 21 Oct 2020 23:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201020220639.130696-1-joel@jms.id.au>
 <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
In-Reply-To: <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Oct 2020 06:35:27 +0000
Message-ID: <CACPK8Xe2AGRGCsbcmAixeKOD2phO9pXdSKqs5Y4Cx7z4TeVbvw@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 21 Oct 2020 at 12:40, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Wed, Oct 21, 2020 at 12:39 PM Joel Stanley <joel@jms.id.au> wrote:
>
> >
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> > index 331d4bdd4a67..15cdfeb135b0 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -653,6 +653,11 @@ static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
> >         ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
> >         txdes->txdes0 = cpu_to_le32(ctl_stat & priv->txdes0_edotr_mask);
> >
> > +       /* Ensure the descriptor config is visible before setting the tx
> > +        * pointer.
> > +        */
> > +       smp_wmb();
> > +
> >         priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv, pointer);
> >
> >         return true;
> > @@ -806,6 +811,11 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
> >         dma_wmb();
> >         first->txdes0 = cpu_to_le32(f_ctl_stat);
> >
> > +       /* Ensure the descriptor config is visible before setting the tx
> > +        * pointer.
> > +        */
> > +       smp_wmb();
> > +
>
> Shouldn't these be paired with smp_rmb() on the reader side?

Now that I've read memory-barriers.txt, yes, they should.

On my clarification of the description of the patch, I thought it was
about making sure that the txdes0 store (and   thus setting of the
ownership bit) happens before the reader side checks that bit.

But we're not, we're making sure all of the writes to the descriptor
happen before updating the pointer, so when the reader side loads the
ownership bit in txdes0, it sees that store to txdes0 at that pointer.

I'll add in the read side barrier(s) and send a v2.

Cheers,

Joel
