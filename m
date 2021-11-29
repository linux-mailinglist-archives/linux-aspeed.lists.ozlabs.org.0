Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0295B4628A7
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 00:53:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J32H36tzfz3bhl
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 10:53:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J32H06dchz2yP9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 10:53:16 +1100 (AEDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1ATNmnMv025112;
 Mon, 29 Nov 2021 17:48:49 -0600
Message-ID: <12cf11dc4326922ceb67ede7b63a53fe1840b6fd.camel@kernel.crashing.org>
Subject: Re: [PATCH 3/3] usb: aspeed-vhub: fix ep0 OUT ack received wrong
 length issue
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Neal Liu <neal_liu@aspeedtech.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Cai Huoqing
 <caihuoqing@baidu.com>, Tao Ren <rentao.bupt@gmail.com>, Julia Lawall
 <julia.lawall@inria.fr>, kernel test robot <lkp@intel.com>, Sasha Levin
 <sashal@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Tue, 30 Nov 2021 10:48:48 +1100
In-Reply-To: <20211126110954.2677627-4-neal_liu@aspeedtech.com>
References: <20211126110954.2677627-1-neal_liu@aspeedtech.com>
 <20211126110954.2677627-4-neal_liu@aspeedtech.com>
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

On Fri, 2021-11-26 at 19:09 +0800, Neal Liu wrote:
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> index 74ea36c19b1e..bea9cbb191a2 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> @@ -251,6 +251,13 @@ static void ast_vhub_ep0_do_receive(struct
> ast_vhub_ep *ep, struct ast_vhub_req
>  		len = remain;
>  		rc = -EOVERFLOW;
>  	}
> +
> +	/* HW return wrong data len */
> +	if (len < ep->ep.maxpacket && len != remain) {
> +		EPDBG(ep, "using expected data len instead\n");
> +		len = remain;
> +	}
> +

Wow, that is a nasty hw bug ! Patch looks good, I had to swap some of
that logic back into my brain but it looks like it won't break any
normal case :-)

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Cheers,
Ben.

