Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724429597E
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 09:43:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGzqY3XNJzDqPv
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 18:43:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGznt0w6LzDqQQ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Oct 2020 18:41:37 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09M7fDFQ027629
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 22 Oct 2020 02:41:18 -0500
Message-ID: <428dc31828795ce0b010509c8c30bf0049ad9190.camel@kernel.crashing.org>
Subject: Re: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Arnd Bergmann <arnd@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Oct 2020 18:41:13 +1100
In-Reply-To: <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
References: <20201020220639.130696-1-joel@jms.id.au>
 <CAK8P3a3gz4rMSkvZZ+TPaBx3B1yHXcUVFDdMFQMGUtEi4xXzyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2020-10-21 at 14:40 +0200, Arnd Bergmann wrote:
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

(Not near the code right now) I *think* the reader already has them
where it matters but I might have overlooked something when I quickly
checked the other day.

Cheers,
Ben.


