Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A526463363
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 12:52:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3LDf3GTpz3bhg
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 22:52:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pRLVxdO2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=pRLVxdO2; 
 dkim-atps=neutral
X-Greylist: delayed 423 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 22:52:14 AEDT
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3LDZ64Hcz3bXj
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 22:52:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BEC7FCE1410;
 Tue, 30 Nov 2021 11:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B47C53FD1;
 Tue, 30 Nov 2021 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638272705;
 bh=2h877NUNcxuYoPp2Gk4J/rQHwqfdOCqinlttcnauj50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pRLVxdO2S5UcB5Ej6DKrLPUqUO/AH4IcNzudkuPuCF7915XrRs2mVDg7A0EMsXfGw
 uvzziA0cwsIN6afsgGqwDz2nGqL5+qhuP+jEmxFkgmdBLKWbhZyNMjGtuk2evEU1od
 RuOT2TMEEJV+ZZm+IQ9iU0UEJ0Q6PoSODJcsI9ts=
Date: Tue, 30 Nov 2021 12:45:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] usb: aspeed-vhub: add qualifier descriptor
Message-ID: <YaYOvgCaO4FJ8r+z@kroah.com>
References: <20211130104256.3106797-1-neal_liu@aspeedtech.com>
 <20211130104256.3106797-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130104256.3106797-2-neal_liu@aspeedtech.com>
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

On Tue, Nov 30, 2021 at 06:42:53PM +0800, Neal Liu wrote:
> Support qualifier descriptor to pass USB30CV compliance test.

Please provide more information here in this description.  This does not
explain what is happening here very well.

Also, what is "USB30CV"?

> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 24 +++++++++++++++++++++++
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index b9960fdd8a51..93f27a745760 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -68,6 +68,18 @@ static const struct usb_device_descriptor ast_vhub_dev_desc = {
>  	.bNumConfigurations	= 1,
>  };
>  
> +static const struct usb_qualifier_descriptor ast_vhub_qual_desc = {
> +	.bLength = 0xA,
> +	.bDescriptorType = USB_DT_DEVICE_QUALIFIER,
> +	.bcdUSB = cpu_to_le16(0x0200),
> +	.bDeviceClass = USB_CLASS_HUB,
> +	.bDeviceSubClass = 0,
> +	.bDeviceProtocol = 0,
> +	.bMaxPacketSize0 = 64,
> +	.bNumConfigurations = 1,
> +	.bRESERVED = 0,

Fields that are to be set to zero do not need to be set here, the
compiler does it for you.

thanks,

greg k-h
