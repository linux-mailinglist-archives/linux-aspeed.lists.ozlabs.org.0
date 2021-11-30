Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51EC463323
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 12:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3L6p3tK3z3bbv
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 22:47:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qxreogXL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=qxreogXL; 
 dkim-atps=neutral
X-Greylist: delayed 117 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 22:47:10 AEDT
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3L6k29YLz2ym7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 22:47:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AE5ACCE18C8;
 Tue, 30 Nov 2021 11:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4D0C58335;
 Tue, 30 Nov 2021 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638272827;
 bh=k9WyNYGgTV92Nf8EhsdK/4a7BRg1HEKvlaZQo0J87Sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qxreogXLDgZULP3/Us7kcZz2y+4YjJ9XPaqc2uhv0CZsWv+7HECN4Mdts51gr/0m0
 9scCdnf0PDmoOzK1M2iiwKGIiXcv93WAS3GEyw2eYG6ZqIllx62FIw6na+LuNwjxDF
 /sQtThqqZ3ebzLJFIHc4lGY3ONV+OxopKKvniy90=
Date: Tue, 30 Nov 2021 12:47:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 4/4] usb: aspeed-vhub: support test mode feature
Message-ID: <YaYPOAB3Anfhh5AA@kroah.com>
References: <20211130104256.3106797-1-neal_liu@aspeedtech.com>
 <20211130104256.3106797-5-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130104256.3106797-5-neal_liu@aspeedtech.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Cai Huoqing <caihuoqing@baidu.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 06:42:56PM +0800, Neal Liu wrote:
> Support aspeed usb vhub set feature to test mode.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c | 18 ++++++++++++++----
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c | 22 ++++++++++++++++------
>  2 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> index d918e8b2af3c..4462f4b73b04 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> @@ -110,15 +110,25 @@ static int ast_vhub_dev_feature(struct ast_vhub_dev *d,
>  				u16 wIndex, u16 wValue,
>  				bool is_set)
>  {
> +	u32 val;
> +
>  	DDBG(d, "%s_FEATURE(dev val=%02x)\n",
>  	     is_set ? "SET" : "CLEAR", wValue);
>  
> -	if (wValue != USB_DEVICE_REMOTE_WAKEUP)
> -		return std_req_driver;
> +	if (wValue == USB_DEVICE_REMOTE_WAKEUP) {
> +		d->wakeup_en = is_set;
> +		return std_req_complete;
>  
> -	d->wakeup_en = is_set;
> +	} else if (wValue == USB_DEVICE_TEST_MODE) {

If you return, no need for an else statement, right?


> +		val = readl(d->vhub->regs + AST_VHUB_CTRL);
> +		val &= ~GENMASK(10, 8);
> +		val |= VHUB_CTRL_SET_TEST_MODE((wIndex >> 8) & 0x7);
> +		writel(val, d->vhub->regs + AST_VHUB_CTRL);
>  
> -	return std_req_complete;
> +		return std_req_complete;
> +	}
> +
> +	return std_req_driver;
>  }
>  
>  static int ast_vhub_ep_feature(struct ast_vhub_dev *d,
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 93f27a745760..e52805fbdebd 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -212,17 +212,27 @@ static int ast_vhub_hub_dev_feature(struct ast_vhub_ep *ep,
>  				    u16 wIndex, u16 wValue,
>  				    bool is_set)
>  {
> +	u32 val;
> +
>  	EPDBG(ep, "%s_FEATURE(dev val=%02x)\n",
>  	      is_set ? "SET" : "CLEAR", wValue);
>  
> -	if (wValue != USB_DEVICE_REMOTE_WAKEUP)
> -		return std_req_stall;
> +	if (wValue == USB_DEVICE_REMOTE_WAKEUP) {
> +		ep->vhub->wakeup_en = is_set;
> +		EPDBG(ep, "Hub remote wakeup %s\n",
> +		      is_set ? "enabled" : "disabled");
> +		return std_req_complete;
>  
> -	ep->vhub->wakeup_en = is_set;
> -	EPDBG(ep, "Hub remote wakeup %s\n",
> -	      is_set ? "enabled" : "disabled");
> +	} else if (wValue == USB_DEVICE_TEST_MODE) {

Same here, no need for else.

thanks,

greg k-h
