Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BA5593A8
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 08:42:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTnbz64Q1z3c8M
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 16:42:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTnbs10HKz30Dp
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 16:42:15 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25O6dolY023080;
	Fri, 24 Jun 2022 01:39:51 -0500
Message-ID: <46f88070d8f6f47f55310e964a4576cadbc810f4.camel@kernel.crashing.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Jun 2022 16:39:50 +1000
In-Reply-To: <20220624063457.GG11460@kadam>
References: <YrMsU9HvdBm5YrRH@kili>
	 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
	 <20220623064320.GN16517@kadam>
	 <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
	 <20220624063457.GG11460@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: "balbi@kernel.org" <balbi@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

(switching back to my normal "community" email)

On Fri, 2022-06-24 at 09:34 +0300, Dan Carpenter wrote:
> > Hrm... what is that driver ? I've missed it ... is the code lifted
> > from
> > aspeed-vhub ? If yes, should we instead make it a common code base
> > ?
> > And if there are bug fixes on one they might apply to the other as
> > well...
> 
> 
> No, I'm the person who introduced the bug so it's unique to this
> driver.

Ok thanks. That said, the code looks fairly similar to the vhub code,
so my comment stands, if this is the same IP block, which it appears to
be, the driver should be common.

IE. The vhub is made of a virtual hub with a bunch of UDCs underneath,
this appears to address the ast2600 "new" standalone (no hub) variant
of said UDC if I'm not mistaken.

The way I structured the code in vhub, it shouldn't be overly difficult
to make it standalone. I wrote (and maintain) aspeed-vhub and would be
happy to work on this if I got sent an ast2600 board.

Cheers,
Ben.

