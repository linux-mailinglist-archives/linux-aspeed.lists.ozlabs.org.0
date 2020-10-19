Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E11652931EA
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Oct 2020 01:24:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFXrr1gJpzDqTl
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Oct 2020 10:24:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFXrh72fczDqMg;
 Tue, 20 Oct 2020 10:24:04 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09JNNgCF024309
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2020 18:23:45 -0500
Message-ID: <1a02e57b6b7d425a19dc59f84091c38ca4edcf47.camel@kernel.crashing.org>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Jakub Kicinski <kuba@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Oct 2020 10:23:41 +1100
In-Reply-To: <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Po-Yu Chuang <ratbert@faraday-tech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, netdev@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2020-10-19 at 12:00 -0700, Jakub Kicinski wrote:
> On Mon, 19 Oct 2020 08:57:03 +0000 Joel Stanley wrote:
> > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > > b/drivers/net/ethernet/faraday/ftgmac100.c
> > > index 00024dd41147..9a99a87f29f3 100644
> > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > @@ -804,7 +804,8 @@ static netdev_tx_t
> > > ftgmac100_hard_start_xmit(struct sk_buff *skb,
> > >          * before setting the OWN bit on the first descriptor.
> > >          */
> > >         dma_wmb();
> > > -       first->txdes0 = cpu_to_le32(f_ctl_stat);
> > > +       WRITE_ONCE(first->txdes0, cpu_to_le32(f_ctl_stat));
> > > +       READ_ONCE(first->txdes0);  
> > 
> > I understand what you're trying to do here, but I'm not sure that
> > this
> > is the correct way to go about it.
> > 
> > It does cause the compiler to produce a store and then a load.
> 
> +1 @first is system memory from dma_alloc_coherent(), right?
> 
> You shouldn't have to do this. Is coherent DMA memory broken 
> on your platform?

I suspect the problem is that the HW (and yes this would be a HW bug)
doesn't order the CPU -> memory and the CPU -> MMIO path.

What I think happens is that the store to txde0 is potentially still in
a buffer somewhere on its way to memory, gets bypassed by the store to
MMIO, causing the MAC to try to read the descriptor, and getting the
"old" data from memory.

It's ... fishy, but that isn't the first time an Aspeed chip has that
type of bug (there's a similar one in the USB device controler iirc).

Cheers,
Ben.


