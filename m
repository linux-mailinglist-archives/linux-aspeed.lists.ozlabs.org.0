Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52555F5FF
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 08:06:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXrZg2hN2z3cjD
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 16:06:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wkuD9Lm/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wkuD9Lm/;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrZT6ZDRz3dpn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 16:06:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74910B821C1;
	Wed, 29 Jun 2022 06:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B903C34114;
	Wed, 29 Jun 2022 06:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656482795;
	bh=v+QrMFau7PMS8LMjF6or9QJ2YF6CwZpdYo1DW6OX/PM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wkuD9Lm/QUKbnK0gSvj9vKBqQtHURYHwsAti95fWhu9rdQna5+oi9b1X8O+lY3V3I
	 rs1HyZWJOM71izFEI+7o9bSAHajpOaXqs3ZhMv9lBliLdckglEubgOvHNs7eeRiLni
	 DmKzoq0+zvXc4f1rwgFC5rIrQboiMKnhqdkMgLN0=
Date: Wed, 29 Jun 2022 08:06:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: SebinSebastian <mailmesebin00@gmail.com>
Subject: Re: [PATCH-next] usb: gadget: dereference before null check
Message-ID: <Yrvr6A8YgyZuWQUz@kroah.com>
References: <20220629055605.102425-1-mailmesebin00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629055605.102425-1-mailmesebin00@gmail.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 29, 2022 at 11:26:05AM +0530, SebinSebastian wrote:
> From: Sebin Sebastian <mailmesebin00@gmail.com>
> 
> Fix coverity warning dereferencing before null check. _ep and desc is
> deferenced on all paths until the check for null. Move the
> initilizations after the check for null.
> Coverity issue: 1518209
> 
> Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> index d75a4e070bf7..4f158030e2cc 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -341,10 +341,6 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
>  static int ast_udc_ep_enable(struct usb_ep *_ep,
>  			     const struct usb_endpoint_descriptor *desc)
>  {
> -	u16 maxpacket = usb_endpoint_maxp(desc);
> -	struct ast_udc_ep *ep = to_ast_ep(_ep);
> -	struct ast_udc_dev *udc = ep->udc;
> -	u8 epnum = usb_endpoint_num(desc);
>  	unsigned long flags;
>  	u32 ep_conf = 0;
>  	u8 dir_in;
> @@ -355,6 +351,12 @@ static int ast_udc_ep_enable(struct usb_ep *_ep,
>  		EP_DBG(ep, "Failed, invalid EP enable param\n");
>  		return -EINVAL;
>  	}
> +
> +	u16 maxpacket = usb_endpoint_maxp(desc);
> +	struct ast_udc_ep *ep = to_ast_ep(_ep);
> +	struct ast_udc_dev *udc = ep->udc;
> +	u8 epnum = usb_endpoint_num(desc);
> +
>  
>  	if (!udc->driver) {
>  		EP_DBG(ep, "bogus device state\n");
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch breaks the build.

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
