Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724D57932E
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 08:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln87B6gmkz3dsM
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 16:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SjHanqCB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=mailmesebin00@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SjHanqCB;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYPXd6N0Zz3cBq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 13:52:00 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id d14so17542663pjs.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 20:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ww35KvPbbjc84EcIzgLWF7R368pVQCk81zL7hh0gsy8=;
        b=SjHanqCBoSVhVl0q6cRp0IvcGb7UBIZFKMUhOZ6rAE+rvHl36/sUTfmAof89gFuOAc
         uQ9fc7zajEa8Iy+u4/xWZKWnTCNFSBD4p/N/TOw3h3mEuLMEqWgPIhIlzMEvBtUxNPLW
         R3vE5JByabprap5TPJvzKHwxdDz8pRfs4VvcF0Voaf+XGf9MW1lz8wD+P4bqjdfTkSZd
         Eg+umyIpg0ACpZL8O9M05+YVftmOq4qXsrfb0Xp49rqYYctp9toZTHCuoqS1HH+OSH2L
         oAK2y6EWlVv/42kyau0YMg+X0YO2dJ0zVcfUwLswn2a1yvGfI4TRw083EWbeZzSmD2UD
         e7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ww35KvPbbjc84EcIzgLWF7R368pVQCk81zL7hh0gsy8=;
        b=TdQ6EHWIrvjfwnwa1lA+XFb7Dt4MogipAdmrbxJR8VLPZuVKlNieJl96jV1PcsYpVx
         q1FJL8K9QFKoK5gV4Bxc1GU19wNYSvnXqYOnaLyKOudmTlUD1nDq6XwwyZ6juUFmHzhz
         XGUS4zZxDax8xgN0SS/ww2lWQ+wtRAseX26cyNSJWpHOqErj62mJSKeNvn1/8/X2w/kI
         CgI1NbrL8wTsDMyG/vi37q1AXlPshbj3hQNfzRLvw8OXCgaACGfTnWNyo9xhvCuvtFVV
         Xj9We9chhcNqmpPg6Htnkh55KCkI9Ztihw38KO82HfZcYMXoNbHkH+4TIV8Y8+2S6GRC
         El7Q==
X-Gm-Message-State: AJIora/lq+IZ0EETbmfDYueX6UFfpwSweE04o7wNFbvL6sIW60KwJqW5
	WqZQ7N6i0KmaJTmKCTOhEJU=
X-Google-Smtp-Source: AGRyM1tgM4RIWDQecAOhX5NWccj1dwC63jWSYuJ5zzwt9yFEtgmtMgzO94TPYC128B1OkCPeQZ6rZA==
X-Received: by 2002:a17:902:ce8b:b0:16a:4a3e:4fa1 with SMTP id f11-20020a170902ce8b00b0016a4a3e4fa1mr12408705plg.167.1656561118597;
        Wed, 29 Jun 2022 20:51:58 -0700 (PDT)
Received: from sebin-inspiron ([103.160.233.84])
        by smtp.gmail.com with ESMTPSA id m9-20020a17090a158900b001ef3daa0f21sm87498pja.16.2022.06.29.20.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 20:51:57 -0700 (PDT)
Date: Thu, 30 Jun 2022 09:21:50 +0530
From: Sebin Sebastian <mailmesebin00@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next] usb: gadget: dereference before null check
Message-ID: <Yr0d1tULzx4Mn1pp@sebin-inspiron>
References: <20220629080726.107297-1-mailmesebin00@gmail.com>
 <YrwMJ+3mdFO2Lpm0@kroah.com>
 <YrxCP4EE2jhUm8e+@sebin-inspiron>
 <Yrxwbb/TbFmYdga/@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yrxwbb/TbFmYdga/@kroah.com>
X-Mailman-Approved-At: Tue, 19 Jul 2022 16:26:55 +1000
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

On Wed, Jun 29, 2022 at 05:31:57PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 29, 2022 at 05:44:55PM +0530, Sebin Sebastian wrote:
> > On Wed, Jun 29, 2022 at 10:24:07AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Jun 29, 2022 at 01:37:25PM +0530, SebinSebastian wrote:
> > > > Fix coverity warning dereferencing before null check. _ep and desc is
> > > > dereferenced on all paths until the check for null. Move the
> > > > initializations after the check for null.
> > > > Coverity issue: 1518209
> > > > 
> > > > Signed-off-by: SebinSebastian <mailmesebin00@gmail.com>
> > > > ---
> > > >  drivers/usb/gadget/udc/aspeed_udc.c | 9 +++++----
> > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> > > > index d75a4e070bf7..96f8193fca15 100644
> > > > --- a/drivers/usb/gadget/udc/aspeed_udc.c
> > > > +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> > > > @@ -341,10 +341,6 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
> > > >  static int ast_udc_ep_enable(struct usb_ep *_ep,
> > > >  			     const struct usb_endpoint_descriptor *desc)
> > > >  {
> > > > -	u16 maxpacket = usb_endpoint_maxp(desc);
> > > > -	struct ast_udc_ep *ep = to_ast_ep(_ep);
> > > > -	struct ast_udc_dev *udc = ep->udc;
> > > > -	u8 epnum = usb_endpoint_num(desc);
> > > >  	unsigned long flags;
> > > >  	u32 ep_conf = 0;
> > > >  	u8 dir_in;
> > > > @@ -356,6 +352,11 @@ static int ast_udc_ep_enable(struct usb_ep *_ep,
> > > >  		return -EINVAL;
> > > >  	}
> > > > 
> > > > +	u16 maxpacket = usb_endpoint_maxp(desc);
> > > > +	struct ast_udc_ep *ep = to_ast_ep(_ep);
> > > > +	struct ast_udc_dev *udc = ep->udc;
> > > > +	u8 epnum = usb_endpoint_num(desc);
> > > > +
> > > >  	if (!udc->driver) {
> > > >  		EP_DBG(ep, "bogus device state\n");
> > > >  		return -ESHUTDOWN;
> > > > --
> > > > 2.34.1
> > > > 
> > > 
> > > Hi,
> > > 
> > > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> > > a patch that has triggered this response.  He used to manually respond
> > > to these common problems, but in order to save his sanity (he kept
> > > writing the same thing over and over, yet to different people), I was
> > > created.  Hopefully you will not take offence and will fix the problem
> > > in your patch and resubmit it so that it can be accepted into the Linux
> > > kernel tree.
> > > 
> > > You are receiving this message because of the following common error(s)
> > > as indicated below:
> > > 
> > > - Your patch breaks the build.
> > > 
> > > - Your patch contains warnings and/or errors noticed by the
> > >   scripts/checkpatch.pl tool.
> > > 
> > > - This looks like a new version of a previously submitted patch, but you
> > >   did not list below the --- line any changes from the previous version.
> > >   Please read the section entitled "The canonical patch format" in the
> > >   kernel file, Documentation/SubmittingPatches for what needs to be done
> > >   here to properly describe this.
> > > 
> > > If you wish to discuss this problem further, or you have questions about
> > > how to resolve this issue, please feel free to respond to this email and
> > > Greg will reply once he has dug out from the pending patches received
> > > from other developers.
> > > 
> > > thanks,
> > > 
> > > greg k-h's patch email bot
> > 
> > I am sorry to keep on bothering with this incorrect patches. I am
> > running the checkpatch script everytime before I sent any patches. It is
> > not showing any warnings or errors. Is it because of my name that my
> > patches are getting rejected? I can see a space missing.
> 
> Did you test build your patch?  If not, why not?
> 
> thanks,
> 
> greg k-h

Ok, now I understand the source of all errors. I did build the entire
tree, but make never touched udc. I have fixed all errors and warnings,
build the patch properly, ran through checkpatch and is now ready for
submission.
