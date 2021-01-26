Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0675D30457E
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Jan 2021 18:40:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQDXd1BJTzDqdw
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Jan 2021 04:40:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=tHr9IRSq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQDX35BcTzDqD7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Jan 2021 04:40:03 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2929B22228;
 Tue, 26 Jan 2021 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611682800;
 bh=t5FEKloI/6KDyGm6sAJ0H3ldMzvUb5M0dXOLgYL8aOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tHr9IRSqUdTQdutykeZAniX66EyqUCsXr+aKVV05pnC0QWOhwqhMM7FDCElq9cdFa
 UtNRv9YL+2rOEe/uy1emrn8XfqjDwL8SM6GUvQPDryiM4+iSja7S2Mqk/dj28u0pee
 EszTIIe1KNAJEEEJdqKz1Mk9Tzv9wj4dkfScFz1Q=
Date: Tue, 26 Jan 2021 18:39:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] usb: gadget: Remove unused including
 <linux/version.h>
Message-ID: <YBBT7gNiKGmM4jjD@kroah.com>
References: <1611578492-43121-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611578492-43121-1-git-send-email-zou_wei@huawei.com>
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
Cc: sashal@kernel.org, balbi@kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jan 25, 2021 at 08:41:32PM +0800, Zou Wei wrote:
> Fix the following versioncheck warning:
> 
> drivers/usb/gadget/udc/aspeed-vhub/hub.c:33:1: unused including <linux/version.h>
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 396a7d8..b192d57 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -30,7 +30,6 @@
>  #include <linux/regmap.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/bcd.h>
> -#include <linux/version.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>

You didn't test this patch either :(

Your script is not correct...

greg k-h
