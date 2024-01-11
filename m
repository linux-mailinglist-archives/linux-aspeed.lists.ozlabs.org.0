Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B1F82AB83
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jan 2024 11:03:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vE1AA7fU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9gGm3kVpz3cVZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jan 2024 21:03:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vE1AA7fU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9gGf0V1hz3020
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jan 2024 21:03:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0CC4CE1DA0;
	Thu, 11 Jan 2024 10:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE793C433C7;
	Thu, 11 Jan 2024 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704967397;
	bh=XKju82+bUIQUC2/IEKI3rWnSmsS5G+w7eqtJG86hh90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vE1AA7fUthH45yZcRUBa4OzJIYWGm2k2UED9/2miba5n74LCLpqMXf3CcA56sdNwd
	 RIjFQwZwSuqpk/s6FCLAQSGE9bEsCRc9uq0drr43QB+1NTB5heMTEzweqs+s0U1WMV
	 INM5Zrvf1NpL4bcpYm9UnSqoHRliv8nfYP8xIl50=
Date: Thu, 11 Jan 2024 11:03:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] usb: gadget: aspeed: Check return value of kasprintf in
 ast_vhub_alloc_epn
Message-ID: <2024011132-gigolo-cornmeal-844f@gregkh>
References: <20231122014212.304254-1-chentao@kylinos.cn>
 <2023112236-bullseye-pranker-491e@gregkh>
 <346b631c-8b46-4b41-9188-8cbaaa1ff178@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <346b631c-8b46-4b41-9188-8cbaaa1ff178@kylinos.cn>
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

On Thu, Jan 11, 2024 at 05:31:35PM +0800, Kunwu Chan wrote:
> Sorry, I didn't find out about this email until now because it was
> intercepted by my company's email server.
> 
> On 2023/11/22 20:10, Greg KH wrote:
> > On Wed, Nov 22, 2023 at 09:42:12AM +0800, Kunwu Chan wrote:
> > > kasprintf() returns a pointer to dynamically allocated memory
> > > which can be NULL upon failure. Ensure the allocation was successful
> > > by checking the pointer validity.
> > > 
> > > Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> > > ---
> > >   drivers/usb/gadget/udc/aspeed-vhub/epn.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > > index 148d7ec3ebf4..e0854e878411 100644
> > > --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > > @@ -826,6 +826,8 @@ struct ast_vhub_ep *ast_vhub_alloc_epn(struct ast_vhub_dev *d, u8 addr)
> > >   	ep->vhub = vhub;
> > >   	ep->ep.ops = &ast_vhub_epn_ops;
> > >   	ep->ep.name = kasprintf(GFP_KERNEL, "ep%d", addr);
> > > +	if (!ep->ep.name)
> > > +		return NULL;
> > 
> > This will break things if this ever triggers.  How was this tested?  The
> It's my fault, I think it's too simplistic. Compiled test only.
> Cause I don't know how to test effectively. I didn't find a way to test this
> in 'Documentation/usb/gadget-testing.rst'.
> > "slot" for this device will still be seen as used and so the resources
> > never freed and then you can run out of space for real devices, right?
> > 
> > Looks like the other error handling in this function below this call is
> > also broken, can you fix that up too?Yes, after reading the relevant code, I found that this is indeed a problem.
> So I write the v2 patch below, but the same question bothering me, about how
> to test effectively and what hardware equipment is needed? I'm new to this
> area, do you have any suggestions?

That is up to you, but you need to test stuff like this if you wish to
change it as your previous patch obviously would have broken things.

good luck!

greg k-h
