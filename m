Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 359F857932B
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 08:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln87413Csz3drV
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 16:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hEgZ7x9S;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=mailmesebin00@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hEgZ7x9S;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY0lY55sxz3dxj
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 22:15:04 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id cv13so15507463pjb.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fIylpPsCi1ABfV76nWqOfFV4XRKIutPZz0K9Tp2LFOs=;
        b=hEgZ7x9S/UmFFpJP6ILkWqIiAIijBVgh/17UnOdeP4h/8EVNVHwK6Sf5QwY9W07TfL
         fc82dLWOLOerZOEdwY0Gn7oM0fCiArB35bcVUXgdN5JR6UHTPdK21RvIvLYRIV83VMJ5
         Dbfqp22pSs2CAcDCHMuatIFTg2Al4tiijmqlixG9WEszg2LRbDKwI3wtkwwZ+uDPBzAw
         21flIiBHL8BqfPwbZhZhsWhCinwakwDPQc1NMgPIvBacX2qcwiAWzj9XvtyEqYo68fV9
         /GO3GKMrT3gYOuVxA4Y55Mp4TZCguAVE56rnAuwKi2tsvlQSH2J/UYAwIzAEWNdN4R3T
         IHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fIylpPsCi1ABfV76nWqOfFV4XRKIutPZz0K9Tp2LFOs=;
        b=4zwfWX/uRptIShB3QmzD6jUaZh2UBxutT5oh/gXENw2KeZggB/9Fh85vzit8+Kd3KM
         p2/C9j1vkaWTPf4g9dM54h8pM4u5Y//yemKnGtx9B7ujdVy34BGZD2B8XLLxF0xKWyXA
         iTh1jDGOT5/d9LlkK0r/91oF9gGSpIpb12WVl5Qg/9ZTYaUS7LuaTee/LMQeiIYjAHPm
         Jwie6qDevHUivVzqOA/FTEVniEdAvvwAKixTuFxvMKijcTG757He6ULSQObaPrkW5LBe
         K3GYFggcwPqAPqtUgewYakOPdEUwcfJ4A1/QkoM+e901vZzjsWJj8Ey2jgSoY4Mx85E5
         DwOQ==
X-Gm-Message-State: AJIora/PHIwrZ7YB9onde2O0sYLe2ChT6PARUOnmEjqctBrEu9TMxkkw
	XW/Y5SL+GbiVanRBmmnFP9s=
X-Google-Smtp-Source: AGRyM1u6hbzWp4S+iMWlHW2RimxNvNSEmwFQFCSTNBB1DoA0RlhNEq+qsoUpMlMKYTptqX0hE37lOA==
X-Received: by 2002:a17:90b:1b11:b0:1ed:37b0:be25 with SMTP id nu17-20020a17090b1b1100b001ed37b0be25mr3517713pjb.99.1656504902573;
        Wed, 29 Jun 2022 05:15:02 -0700 (PDT)
Received: from sebin-inspiron ([103.160.233.84])
        by smtp.gmail.com with ESMTPSA id m14-20020a056a00080e00b00525b61f4792sm6365353pfk.109.2022.06.29.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 05:15:01 -0700 (PDT)
Date: Wed, 29 Jun 2022 17:44:55 +0530
From: Sebin Sebastian <mailmesebin00@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next] usb: gadget: dereference before null check
Message-ID: <YrxCP4EE2jhUm8e+@sebin-inspiron>
References: <20220629080726.107297-1-mailmesebin00@gmail.com>
 <YrwMJ+3mdFO2Lpm0@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrwMJ+3mdFO2Lpm0@kroah.com>
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

On Wed, Jun 29, 2022 at 10:24:07AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 29, 2022 at 01:37:25PM +0530, SebinSebastian wrote:
> > Fix coverity warning dereferencing before null check. _ep and desc is
> > dereferenced on all paths until the check for null. Move the
> > initializations after the check for null.
> > Coverity issue: 1518209
> > 
> > Signed-off-by: SebinSebastian <mailmesebin00@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/aspeed_udc.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> > index d75a4e070bf7..96f8193fca15 100644
> > --- a/drivers/usb/gadget/udc/aspeed_udc.c
> > +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> > @@ -341,10 +341,6 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
> >  static int ast_udc_ep_enable(struct usb_ep *_ep,
> >  			     const struct usb_endpoint_descriptor *desc)
> >  {
> > -	u16 maxpacket = usb_endpoint_maxp(desc);
> > -	struct ast_udc_ep *ep = to_ast_ep(_ep);
> > -	struct ast_udc_dev *udc = ep->udc;
> > -	u8 epnum = usb_endpoint_num(desc);
> >  	unsigned long flags;
> >  	u32 ep_conf = 0;
> >  	u8 dir_in;
> > @@ -356,6 +352,11 @@ static int ast_udc_ep_enable(struct usb_ep *_ep,
> >  		return -EINVAL;
> >  	}
> > 
> > +	u16 maxpacket = usb_endpoint_maxp(desc);
> > +	struct ast_udc_ep *ep = to_ast_ep(_ep);
> > +	struct ast_udc_dev *udc = ep->udc;
> > +	u8 epnum = usb_endpoint_num(desc);
> > +
> >  	if (!udc->driver) {
> >  		EP_DBG(ep, "bogus device state\n");
> >  		return -ESHUTDOWN;
> > --
> > 2.34.1
> > 
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - Your patch breaks the build.
> 
> - Your patch contains warnings and/or errors noticed by the
>   scripts/checkpatch.pl tool.
> 
> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/SubmittingPatches for what needs to be done
>   here to properly describe this.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

I am sorry to keep on bothering with this incorrect patches. I am
running the checkpatch script everytime before I sent any patches. It is
not showing any warnings or errors. Is it because of my name that my
patches are getting rejected? I can see a space missing.

