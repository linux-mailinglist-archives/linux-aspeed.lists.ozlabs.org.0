Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37888462895
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 00:50:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J32CT17Xgz3bg8
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 10:50:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J32CP5vJSz2xBv
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 10:50:09 +1100 (AEDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1ATNjirY024975;
 Mon, 29 Nov 2021 17:45:45 -0600
Message-ID: <279c42970790787e928ed017149e300835085235.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/3] usb: aspeed-vhub: support remote wakeup feature
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Neal Liu <neal_liu@aspeedtech.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Cai Huoqing
 <caihuoqing@baidu.com>, Tao Ren <rentao.bupt@gmail.com>, Julia Lawall
 <julia.lawall@inria.fr>, kernel test robot <lkp@intel.com>, Sasha Levin
 <sashal@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Tue, 30 Nov 2021 10:45:44 +1100
In-Reply-To: <20211126110954.2677627-3-neal_liu@aspeedtech.com>
References: <20211126110954.2677627-1-neal_liu@aspeedtech.com>
 <20211126110954.2677627-3-neal_liu@aspeedtech.com>
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
> Remote wakeup signaling will be automatically issued
> whenever any write commands has been received in suspend
> state.

> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -240,6 +240,9 @@ void ast_vhub_init_hw(struct ast_vhub *vhub)
>  	if (vhub->force_usb1)
>  		ctrl |= VHUB_CTRL_FULL_SPEED_ONLY;
>  
> +	/* Enable auto remote wakeup */
> +	ctrl |= VHUB_CTRL_AUTO_REMOTE_WAKEUP;
> +
>  	ctrl |= VHUB_CTRL_UPSTREAM_CONNECT;
>  	writel(ctrl, vhub->regs + AST_VHUB_CTRL);

Should this  be controlled by d->wakeup_en ? IE, we have a feature for
the host to enable/disable remote wakeup, should we honor it ?
 
> +	} else if (wValue == USB_DEVICE_TEST_MODE) {
> +		val = readl(d->vhub->regs + AST_VHUB_CTRL);
> +		val &= ~GENMASK(10, 8);
> +		val |= VHUB_CTRL_SET_TEST_MODE((wIndex >> 8) & 0x7);
> +		writel(val, d->vhub->regs + AST_VHUB_CTRL);

This is unrelated to remote wakeup is it ? In which case it should
probably be a separate patch.

Cheers,
Ben.


