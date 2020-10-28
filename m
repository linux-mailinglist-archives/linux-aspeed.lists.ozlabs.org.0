Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2829CDE3
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 05:48:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLbfm2BjnzDqRN
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 15:48:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Pe/WbYbu; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLbfg6PGzzDqJP
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 15:47:54 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id cv1so1845314qvb.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 21:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3M0WLekqFr96kxIsrR84Jn4HV4j2bOEv/4KnPx68jTI=;
 b=Pe/WbYbuBtwrSjbNw8B6Ukl82pypSAM5eio4JXK285h6DAe4BrRa9YCS9SV2XMATpX
 cc9J+4qRhVeQLxrGrMXs30AqFBQsbVByDinGzhbMiFYtoWkQ7wenmM7h6CkCGO0EAJCz
 3AOWh4l7+MOpKNEj6jRdruKcyFRaz2xIaqA1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3M0WLekqFr96kxIsrR84Jn4HV4j2bOEv/4KnPx68jTI=;
 b=t1jJ5xwOiDMWZsQ+Awoeht33ec4zCyzqwoVTnAZ5Sj7K4VnFINsDg8hg6VGMwgwBKU
 uWK3w2nMvwIy4VVBHXRn1hjKunCVeydksNXUnX53eY6LVRiBOwGPV46G3+WtN6a4rCKJ
 sQHKp2CbPR8bU+AdNNfh1DW16kTKpjoaVY7WYGlLYw6dg3BUySKg/bvPnRtju7t+addy
 2zSX3TTqyxfe9naftyLdgboeKCDAye4j+vbtwKFrHXWiba5GAax97YfRK/WvXjxtC4m6
 cwP0WmuJndz/669g4oT02ZeLcLZqSbdwqmAH85ECPE+IA2x6vChFR01DsYfvFt8bjUFM
 gW6A==
X-Gm-Message-State: AOAM530p6qYm/55RkE7LsSQ3K24uo3SOG37fFOc4QhudG1IEqvm5MpvW
 TEtozbN3buYP43O8+BXiun6R7e7Uq8fvFOClS4k=
X-Google-Smtp-Source: ABdhPJwlFMIeJj2oXCHQcGqJsgpjXmWeIHjnWFfJPn5WyJNep8A+KKIZQ1xp1vfUleS8kNimlWfUF8SaMv2fagilDos=
X-Received: by 2002:a05:6214:11e4:: with SMTP id
 e4mr5495989qvu.61.1603860470934; 
 Tue, 27 Oct 2020 21:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201020220639.130696-1-joel@jms.id.au>
 <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
 <428dc31828795ce0b010509c8c30bf0049ad9190.camel@kernel.crashing.org>
In-Reply-To: <428dc31828795ce0b010509c8c30bf0049ad9190.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 04:47:38 +0000
Message-ID: <CACPK8XfHaGWcDf7vDHoPhqgWQ4LEwxq9EBtbkBngEpHEzJk2SA@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 22 Oct 2020 at 07:41, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-10-21 at 14:40 +0200, Arnd Bergmann wrote:
> > On Wed, Oct 21, 2020 at 12:39 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > >
> > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> > > index 331d4bdd4a67..15cdfeb135b0 100644
> > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > @@ -653,6 +653,11 @@ static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
> > >         ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
> > >         txdes->txdes0 = cpu_to_le32(ctl_stat & priv->txdes0_edotr_mask);
> > >
> > > +       /* Ensure the descriptor config is visible before setting the tx
> > > +        * pointer.
> > > +        */
> > > +       smp_wmb();
> > > +
> > >         priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv, pointer);
> > >
> > >         return true;
> > > @@ -806,6 +811,11 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > >         dma_wmb();
> > >         first->txdes0 = cpu_to_le32(f_ctl_stat);
> > >
> > > +       /* Ensure the descriptor config is visible before setting the tx
> > > +        * pointer.
> > > +        */
> > > +       smp_wmb();
> > > +
> >
> > Shouldn't these be paired with smp_rmb() on the reader side?
>
> (Not near the code right now) I *think* the reader already has them
> where it matters but I might have overlooked something when I quickly
> checked the other day.

Do we need a read barrier at the start of ftgmac100_tx_complete_packet?

        pointer = priv->tx_clean_pointer;
<--- here
        txdes = &priv->txdes[pointer];

        ctl_stat = le32_to_cpu(txdes->txdes0);
        if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
                return false;

This was the only spot I could see that might require one.

Cheers,

Joel
