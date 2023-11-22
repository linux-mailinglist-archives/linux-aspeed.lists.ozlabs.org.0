Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 384267F456D
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Nov 2023 13:10:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L8PF9xHL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb0Sn0gqdz3d9H
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Nov 2023 23:10:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L8PF9xHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb0Sg5lwjz3byP
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Nov 2023 23:10:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71BD161D59;
	Wed, 22 Nov 2023 12:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65E0C433C9;
	Wed, 22 Nov 2023 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700655038;
	bh=wl0JFYvB32NP7y30q+NX9TJJbF3cXUAoYsHbwutxyDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8PF9xHLNQicGYNp8JtaNyx/n8NDLkfwt2tBPdzukJLzsRucicY7f/SIUft+4P54x
	 7RuPTI8ETjaKi9ABpt5831/IdepwzgPfvCET6UsbhBN2/ZpPgdnZEt/TGd5IkwUPgW
	 mRsQpX+OmnWmBwBINOlxM69RtI6EUvVlshgHQMhs=
Date: Wed, 22 Nov 2023 12:10:34 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] usb: gadget: aspeed: Check return value of kasprintf in
 ast_vhub_alloc_epn
Message-ID: <2023112236-bullseye-pranker-491e@gregkh>
References: <20231122014212.304254-1-chentao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122014212.304254-1-chentao@kylinos.cn>
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
Cc: andriy.shevchenko@linux.intel.com, linux-aspeed@lists.ozlabs.org, kunwu.chan@hotmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 09:42:12AM +0800, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> index 148d7ec3ebf4..e0854e878411 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> @@ -826,6 +826,8 @@ struct ast_vhub_ep *ast_vhub_alloc_epn(struct ast_vhub_dev *d, u8 addr)
>  	ep->vhub = vhub;
>  	ep->ep.ops = &ast_vhub_epn_ops;
>  	ep->ep.name = kasprintf(GFP_KERNEL, "ep%d", addr);
> +	if (!ep->ep.name)
> +		return NULL;

This will break things if this ever triggers.  How was this tested?  The
"slot" for this device will still be seen as used and so the resources
never freed and then you can run out of space for real devices, right?

Looks like the other error handling in this function below this call is
also broken, can you fix that up too?

thanks,

greg k-h
