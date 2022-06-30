Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 562925618C2
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 13:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYbFn1nNkz3bpc
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 21:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bNJnP44b;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bNJnP44b;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYbFW2G8hz3bmC
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 21:09:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02163622A7;
	Thu, 30 Jun 2022 11:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE09C34115;
	Thu, 30 Jun 2022 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656587371;
	bh=QZ6v7tJvZDnDS4E3NPYQseW8/iFcyjFOm1Qn6vFL/T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNJnP44bQ6i2KTGfBEgrGO4Jj+/z2LKcj1ym5rqOCXkI5tE8XA3e5jf/ECLOaOqEi
	 qQ77I7f9shRrMXwFyZKgLc6iBZfuxwOxPLKF2EXpiqTR4OEFt98Cg4qcjf4Am9wexE
	 s6SgRkgAF+DpDmZIKKjNyyStAv14WnqTy1i2X3qE=
Date: Thu, 30 Jun 2022 13:09:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebin Sebastian <mailmesebin00@gmail.com>
Subject: Re: [PATCH v2 -next] usb: gadget: dereference before null check
Message-ID: <Yr2EaEqEbYC7LViw@kroah.com>
References: <20220630044706.10772-1-mailmesebin00@gmail.com>
 <Yr1IjFBe6JjrDq8n@kroah.com>
 <Yr2DDkdFdt/A7pmL@sebin-inspiron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr2DDkdFdt/A7pmL@sebin-inspiron>
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

On Thu, Jun 30, 2022 at 04:33:42PM +0530, Sebin Sebastian wrote:
> On Thu, Jun 30, 2022 at 08:54:04AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jun 30, 2022 at 10:17:06AM +0530, Sebin Sebastian wrote:
> > > Fix coverity warning dereferencing before null check. _ep and desc is
> > > dereferenced on all paths until the check for null. Move the
> > > initializations after the check for null.
> > 
> > How can those values ever be NULL?
> > 
> > > Coverity issue: 1518209
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > kernel test robot did not find this issue.
> > 
>  After I submitted the PATCH v1, kernel test robot ran some tests and
>  produced a report of the things that I broke while creating the patch.
>  That's why I kept this tag.

Yes, but the kernel test robot reported your first patch was broken, not
that this commit itself was reported by that.  Please drop that, it's
confusing I know, and trips lots of people up, but is not needed here.

> 
> > > Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
> > 
> > What commit id does this change fix?
> > 
>  So should I provide the commit ID of the patch v1 that kernel
>  test robot referred to?

No, report the commit id that this commit you are creating fixes.  It
had to be added to the tree sometime in the past, right?

> 
> > > ---
> > >  Changes since v1: Fix the build errors and warnings due to first patch.
> > >  Fix the undeclared 'ep' and 'maxpacket' error. Fix the ISO C90 warning.
> > > 
> > >  drivers/usb/gadget/udc/aspeed_udc.c | 21 ++++++++++++++-------
> > >  1 file changed, 14 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> > > index d75a4e070bf7..a43cf8dde2a8 100644
> > > --- a/drivers/usb/gadget/udc/aspeed_udc.c
> > > +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> > > @@ -341,26 +341,33 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
> > >  static int ast_udc_ep_enable(struct usb_ep *_ep,
> > >  			     const struct usb_endpoint_descriptor *desc)
> > >  {
> > > -	u16 maxpacket = usb_endpoint_maxp(desc);
> > > -	struct ast_udc_ep *ep = to_ast_ep(_ep);
> > 
> > checking that ep is NULL here is an impossible thing on its own.  You
> > did change this so that you didn't check this anymore, which is odd as
> > you did not mention that in the changelog text :(
> > 
>  Yes, I missed the checking for ep. I thought of checking it after
>  initilizing ep.
> 
> > > -	struct ast_udc_dev *udc = ep->udc;
> > > -	u8 epnum = usb_endpoint_num(desc);
> > >  	unsigned long flags;
> > >  	u32 ep_conf = 0;
> > >  	u8 dir_in;
> > >  	u8 type;
> > > +	u16 maxpacket;
> > > +	struct ast_udc_ep *ep;
> > > +	struct ast_udc_dev *udc;
> > > +	u8 epnum;
> > 
> > Why did you reorder these?
> > 
> This is actually the original order that these were in. I reordered it
> while creating the first patch, then I changed it back to the original
> order they were in the source tree for this patch.

So this patch does not apply cleanly on linux-next?  We did not apply
your intermediate, broken, patch for obvious reasons, so you can not
send a change on top of that, right?

> > >  
> > > -	if (!_ep || !ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT ||
> > > -	    maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
> > > +	if (!_ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
> > >  		EP_DBG(ep, "Failed, invalid EP enable param\n");
> > >  		return -EINVAL;
> > >  	}
> > > -
> > 
> > Why did you remove this line?
> >
> I removed the check for maxpacket because it is not initialized in this
> part, the check for the same thing comes after initialization.
> This is the check for that, this is also included in the patch.
> +	if (maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
> +               EP_DBG(ep, "Failed, invalid EP enable param\n");
> +               return -EINVAL;
> +       }
> Should I add the check for 'ep' in this part?
> 
> > Also, your To: line is messed up somehow, please fix your email
> > client...
> > 
> Ok, I will surely do it.
> 
> > thanks,
> > 
> > gre gk-h
> 
> I did many mistakes in the patch v1, so I had to bring this patch to the
> original state things were. I left all the declarations in the same
> order (which made it seem like reordering) and moved the initialization
> part after the check for _ep and desc. 


Perhaps you might want to start out doing coding style cleanups in
drivers/staging/* to get the process of how to submit patches properly
and test your changes before sending them out, before going out into the
real part of the kernel.

thanks,

greg k-h
