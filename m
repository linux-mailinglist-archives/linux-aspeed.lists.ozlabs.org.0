Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FB55612C4
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 08:54:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYTZv3j0Dz3cL8
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 16:54:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JdCXLXAF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JdCXLXAF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYTZq1KLsz3c7l
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 16:54:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 788E662211;
	Thu, 30 Jun 2022 06:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5F2C34115;
	Thu, 30 Jun 2022 06:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656572047;
	bh=AoZZBIOZ6lxp4R1mhcbQkpMM8z6raWKSubTBxc3uKjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdCXLXAFdIVNttvrE3zYW5gc495EVxTjSxKY3PzJbtg3xdpmjqtTQH9IioyspcVZZ
	 +Ur+l2PNgwu/YRulMcltk2W2KqOP8/zvvDM3bif4NooRhihc2IzocSGAbvFKOjjE/9
	 pqK9K2B7S2w/DbcFADGiZMhG1fjVZEzAxxzOlhdE=
Date: Thu, 30 Jun 2022 08:54:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebin Sebastian <mailmesebin00@gmail.com>
Subject: Re: [PATCH v2 -next] usb: gadget: dereference before null check
Message-ID: <Yr1IjFBe6JjrDq8n@kroah.com>
References: <20220630044706.10772-1-mailmesebin00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630044706.10772-1-mailmesebin00@gmail.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 10:17:06AM +0530, Sebin Sebastian wrote:
> Fix coverity warning dereferencing before null check. _ep and desc is
> dereferenced on all paths until the check for null. Move the
> initializations after the check for null.

How can those values ever be NULL?

> Coverity issue: 1518209
> 
> Reported-by: kernel test robot <lkp@intel.com>

kernel test robot did not find this issue.

> Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>

What commit id does this change fix?

> ---
>  Changes since v1: Fix the build errors and warnings due to first patch.
>  Fix the undeclared 'ep' and 'maxpacket' error. Fix the ISO C90 warning.
> 
>  drivers/usb/gadget/udc/aspeed_udc.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> index d75a4e070bf7..a43cf8dde2a8 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -341,26 +341,33 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
>  static int ast_udc_ep_enable(struct usb_ep *_ep,
>  			     const struct usb_endpoint_descriptor *desc)
>  {
> -	u16 maxpacket = usb_endpoint_maxp(desc);
> -	struct ast_udc_ep *ep = to_ast_ep(_ep);

checking that ep is NULL here is an impossible thing on its own.  You
did change this so that you didn't check this anymore, which is odd as
you did not mention that in the changelog text :(

> -	struct ast_udc_dev *udc = ep->udc;
> -	u8 epnum = usb_endpoint_num(desc);
>  	unsigned long flags;
>  	u32 ep_conf = 0;
>  	u8 dir_in;
>  	u8 type;
> +	u16 maxpacket;
> +	struct ast_udc_ep *ep;
> +	struct ast_udc_dev *udc;
> +	u8 epnum;

Why did you reorder these?

>  
> -	if (!_ep || !ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT ||
> -	    maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
> +	if (!_ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
>  		EP_DBG(ep, "Failed, invalid EP enable param\n");
>  		return -EINVAL;
>  	}
> -

Why did you remove this line?

Also, your To: line is messed up somehow, please fix your email
client...

thanks,

gre gk-h
