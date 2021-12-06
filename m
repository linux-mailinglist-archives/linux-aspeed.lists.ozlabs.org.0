Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10937468E36
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Dec 2021 01:13:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6kRw6WZcz2yPL
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Dec 2021 11:13:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J6kRn68Jpz2xF1
 for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Dec 2021 11:13:40 +1100 (AEDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1B608gtt022162;
 Sun, 5 Dec 2021 18:08:44 -0600
Message-ID: <07472b315d6adecb874f29128e9b5fe3eadad590.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/3] usb: aspeed-vhub: support remote wakeup feature
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Neal Liu <neal_liu@aspeedtech.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Cai Huoqing
 <caihuoqing@baidu.com>, Tao Ren <rentao.bupt@gmail.com>, Julia Lawall
 <julia.lawall@inria.fr>, kernel test robot <lkp@intel.com>, Sasha Levin
 <sashal@kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Date: Mon, 06 Dec 2021 11:08:42 +1100
In-Reply-To: <HK0PR06MB3202F55EEE02B9931D9CD4AD80699@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20211126110954.2677627-1-neal_liu@aspeedtech.com>
 <20211126110954.2677627-3-neal_liu@aspeedtech.com>
 <279c42970790787e928ed017149e300835085235.camel@kernel.crashing.org>
 <HK0PR06MB3202A1F0710655B3E8EA709580679@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <5d234a400a89f64ad183020b93b68f478f1addc7.camel@kernel.crashing.org>
 <HK0PR06MB3202F55EEE02B9931D9CD4AD80699@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2021-12-02 at 03:03 +0000, Neal Liu wrote:
> > 
> Let's me describe more details for our hardware behavior and hope you
> understand.
> 
> HUB00[3]: MANUAL_REMOTE_WAKEUP
> HUB00[4]: AUTO_REMOTE_WAKEUP
> 
> Set HUB00[3] implies USB device will do remote wakeup if any write
> command to vhub register.
> Set HUB00[4] implies USB device will do remote wakeup. It can only be
> set in suspend state.
> 
> For current design, d->wakeup_en only controls whether HUB00[4] can
> be set through usb_gadget_ops.wakeup().
> If some applications (take KVM as example) want to wakeup host by
> sending a packet, it won't go through sb_gadget_ops.wakeup().
> We enable HUB00[3] to fix this problem. It won't override above
> mentioned behavior.
> If host has enabled the USB_DEVICE_REMOTE_WAKEUP feature, it has 2
> ways to wakeup host.
> 1. set srp 1 (/sys/device/platform/xxxxxxxxx/udc/xxxxxx/srp)
> 2. emulated device has activity
> If host has disabled the USB_DEVICE_REMOTE_WAKEUP feature, these 2
> ways still cannot wakeup host even if USB bus is in resume state.
> Thanks

So what you are saying is that currently, the various gadgets aren't
calling usb_gadget_wakeup() ?

Ie. it should be a gadget policy to decide when to wake-up I suppose,
but it's true that nothing in the core nor the existing gadgets seem to
handle that.

I think what you propose is a band-aid. The real problem is that the
gadget drivers should trigger wakeups (or the core should do so on
activity).

That said, for now, I don't object to adding that "auto" bit, but I
would prefer if that behaviour was use configurable.

Cheers,
Ben.

