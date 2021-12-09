Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C243E46DF46
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Dec 2021 01:10:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8ZD55pjWz30J3
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Dec 2021 11:09:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J8ZD30ZFNz2xD4
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Dec 2021 11:09:54 +1100 (AEDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1B905TbW017335;
 Wed, 8 Dec 2021 18:05:29 -0600
Message-ID: <391323f136e49387797d43e89b6e42cd95d916c2.camel@kernel.crashing.org>
Subject: Re: [PATCH v3 2/4] usb: aspeed-vhub: fix remote wakeup failure in
 iKVM use case
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Neal Liu <neal_liu@aspeedtech.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Cai Huoqing
 <caihuoqing@baidu.com>, Tao Ren <rentao.bupt@gmail.com>, Julia Lawall
 <julia.lawall@inria.fr>, kernel test robot <lkp@intel.com>, Sasha Levin
 <sashal@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Thu, 09 Dec 2021 11:05:28 +1100
In-Reply-To: <20211208100545.1441397-3-neal_liu@aspeedtech.com>
References: <20211208100545.1441397-1-neal_liu@aspeedtech.com>
 <20211208100545.1441397-3-neal_liu@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2021-12-08 at 18:05 +0800, Neal Liu wrote:
> Signaling remote wakeup if an emulated USB device has any activity
> if the device is allowed by host.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>

I still think it should fundamentally be the device making that
decision, but since they don't, this is an acceptable workaround, but
please, don't write the MMIO on every EP queue. Either keep track of
the bus being suspended, or turn on the AUTO bit in HW when wakeup_en
is set.

Cheers,
Ben.

> ---
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> index 917892ca8753..ccc239b5cc17 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> @@ -381,6 +381,11 @@ static int ast_vhub_epn_queue(struct usb_ep*
> u_ep, struct usb_request *u_req,
>  	} else
>  		u_req->dma = 0;
>  
> +	if (ep->dev->wakeup_en) {
> +		EPVDBG(ep, "Wakeup host first\n");
> +		ast_vhub_hub_wake_all(vhub);
> +	}
> +
>  	EPVDBG(ep, "enqueue req @%p\n", req);
>  	EPVDBG(ep, " l=%d dma=0x%x zero=%d noshort=%d noirq=%d
> is_in=%d\n",
>  	       u_req->length, (u32)u_req->dma, u_req->zero,

