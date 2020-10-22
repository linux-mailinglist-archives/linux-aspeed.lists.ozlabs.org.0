Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12655295956
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 09:38:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGzkg1wf0zDqQR
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Oct 2020 18:38:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGzkV0L2czDqP4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Oct 2020 18:38:41 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09M7bwWk027578
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 22 Oct 2020 02:38:04 -0500
Message-ID: <ef0d576f4eba266b60586b93c6ace79ed3cc7096.camel@kernel.crashing.org>
Subject: Re: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>, Joel Stanley <joel@jms.id.au>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Dylan Hung <dylan_hung@aspeedtech.com>
Date: Thu, 22 Oct 2020 18:37:58 +1100
In-Reply-To: <dca2ce4487024eba9398426af86c761d@AcuMS.aculab.com>
References: <20201020220639.130696-1-joel@jms.id.au>
 <86480db3977cfbf6750209c34a28c8f042be55fb.camel@kernel.crashing.org>
 <dca2ce4487024eba9398426af86c761d@AcuMS.aculab.com>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2020-10-21 at 08:18 +0000, David Laight wrote:
> From: Benjamin Herrenschmidt
> > Sent: 21 October 2020 01:00
> > 
> > On Wed, 2020-10-21 at 08:36 +1030, Joel Stanley wrote:
> > > We must ensure the tx descriptor updates are visible before updating
> > > the tx pointer.
> > > 
> > > This resolves the tx hangs observed on the 2600 when running iperf:
> > 
> > To clarify the comment here. This doesn't ensure they are visible to
> > the hardware but to other CPUs. This is the ordering vs start_xmit and
> > tx_complete.
> 
> You need two barriers.
> 1) after making the data buffers available before transferring
> the descriptor ownership to the device.
> 2) after transferring the ownership before 'kicking' the mac engine.
> 
> The first is needed because the mac engine can poll the descriptors
> at any time (eg on completing the previous transmit).
> This stops it transmitting garbage.
> 
> The second makes sure it finds the descriptor you've just set.
> This stops delays before sending the packet.
> (But it will get sent later.)

The above is unrelated to this patch. This isn't about fixing any
device <-> CPU ordering or interaction but purely about ensuring proper
ordering between start_xmit and tx packet cleanup. IE. We are looking
at two different issues with this driver.

> For (2) dma_wmb() is the documented barrier.
> 
> I'm not sure which barrier you need for (1).
> smp_wmb() would be right if the reader were another cpu,
> but it is (at most) a compile barrier on UP kernels.
> So you need something stronger than smp_wmb().

There should already be sufficient barriers for that in the driver
(except for the HW bug mentioned earlier).

> On a TSO system (which yours probably is) a compile barrier
> is probably sufficient, but if memory writes can get re-ordered
> it needs to be a stronger barrier - but not necessarily as strong
> as dma_wmb().
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

