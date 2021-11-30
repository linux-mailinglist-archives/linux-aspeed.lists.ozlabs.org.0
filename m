Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47725463337
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 12:47:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3L7J1Z8Rz3bc4
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 22:47:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DShlCtnz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=DShlCtnz; 
 dkim-atps=neutral
X-Greylist: delayed 315 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 22:47:36 AEDT
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3L7D5v0cz2yng
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 22:47:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3ED1AB81861;
 Tue, 30 Nov 2021 11:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1EBC53FC1;
 Tue, 30 Nov 2021 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638272852;
 bh=esuyAu0AZAKQCbcMnPxlzfsPEbqi8Voq0+gP3C9fpms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DShlCtnz+NqhMzSRarUnk4BtipEaua/5W+waWvRRmC1n3gYa2jyhbEUh25QPdOt9i
 pu0j7aecbKxwtEW9iirj3GhlwEfofGMiASAOzt8l3b9g936khjlDzFASSfRIl/OEHD
 onNpUy9K9AeRUEXujmygX8DzZVoRJ/+84kv02ErE=
Date: Tue, 30 Nov 2021 12:47:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 3/4] usb: aspeed-vhub: fix ep0 OUT ack received wrong
 length issue
Message-ID: <YaYPUfFTNkh+zpqz@kroah.com>
References: <20211130104256.3106797-1-neal_liu@aspeedtech.com>
 <20211130104256.3106797-4-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130104256.3106797-4-neal_liu@aspeedtech.com>
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

On Tue, Nov 30, 2021 at 06:42:55PM +0800, Neal Liu wrote:
> If multiple devices in vhub are enumerated simultaneously, ep0 OUT
> ack might received wrong data length. Using expected data length
> instead.
> 
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/ep0.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> index 74ea36c19b1e..bea9cbb191a2 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> @@ -251,6 +251,13 @@ static void ast_vhub_ep0_do_receive(struct ast_vhub_ep *ep, struct ast_vhub_req
>  		len = remain;
>  		rc = -EOVERFLOW;
>  	}
> +
> +	/* HW return wrong data len */

Please spell out "Hardware"?

thanks,

greg k-h
