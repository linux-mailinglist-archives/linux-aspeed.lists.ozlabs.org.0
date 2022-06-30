Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E84D7579330
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 08:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln87J6Db8z3cjY
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 16:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ghcVJngF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=mailmesebin00@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ghcVJngF;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYb6z0QmSz3bkG
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 21:03:52 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id l2so17246307pjf.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b8V7ADY+zFVOUBZ7Rju9ar4QXAaErxZ2CHOzbzSN9aU=;
        b=ghcVJngFT59Awjf2m+9tt7nkxAzRI7AzqoBXPWYNru3ZRPZsjKH/Ic/7qq1mtSJGfY
         /c+6+WG83JgVPEytgHUxTRJXf2mZoWeEH87TOzN/sPmiVZzUyDZJ3jd32XbX/GqiKvS+
         p6mRm5cLKJfdpeCdErCDzbaziT19/wEIyRO3Mzh/aVQV7ak/DPCSR/u9Z70N29roPJ/A
         AVNbuWq5nFZ0dFlJ0ONeoByVbEuibt0y3/y4CkhCYVpefBX/wd1/vRElsKFFWkDyyY3u
         xNAM0NubeP4aGLIhSdnjmvotlcaiLtcet6kjSVqeKPeH4fK8+eDFX4n2pbC6r595tZLW
         I7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b8V7ADY+zFVOUBZ7Rju9ar4QXAaErxZ2CHOzbzSN9aU=;
        b=RkFsPKHmIGBVSYjYX6ygf5cLNe6df5+9OIm7DBFzqtVt4qgThvUC9wa3qsN7c7DUfQ
         adOc72+gThwfFgJYs0XXrkDRqv9JzD5ujm+Y+9o69f16T1H3KRytpCfTFHFBfdMpntRi
         MurThAIj1W7ykR5oRclDWGOPZDAg0t42abVDb7k12Veqje2s8qjEBd6qr8Mj3T0aJhx6
         apcWPwQaiHpIA1GveTynexsLvy426hBzosDb2gTtHipkgR3uC58TN/VeZuVDGWh11Ygy
         /OdxwBwffoYDxWXla5DH8xmw95h6oUhKUSVF63BqcQSUxxyfj5QSWuKY/J4fXI9oS+vL
         soBQ==
X-Gm-Message-State: AJIora9djX41tGpc/OdpR0JbwrlPb2fW+jrRepipvo9Itu1VNVSnWaMg
	qUbq/WfLyBZ3EtL6graZVa4=
X-Google-Smtp-Source: AGRyM1ukhTWAIPYaktK2CZ95Dz22JWNG1wp6pO6utXGwC8iUrqhPhxq8MXvgizcmNMtAKu/hlmW+Xw==
X-Received: by 2002:a17:90a:760e:b0:1ec:83e0:3ae1 with SMTP id s14-20020a17090a760e00b001ec83e03ae1mr11095167pjk.25.1656587029967;
        Thu, 30 Jun 2022 04:03:49 -0700 (PDT)
Received: from sebin-inspiron ([103.160.233.84])
        by smtp.gmail.com with ESMTPSA id b12-20020a1709027e0c00b0016b82ff7072sm7509155plm.138.2022.06.30.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 04:03:49 -0700 (PDT)
Date: Thu, 30 Jun 2022 16:33:42 +0530
From: Sebin Sebastian <mailmesebin00@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 -next] usb: gadget: dereference before null check
Message-ID: <Yr2DDkdFdt/A7pmL@sebin-inspiron>
References: <20220630044706.10772-1-mailmesebin00@gmail.com>
 <Yr1IjFBe6JjrDq8n@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr1IjFBe6JjrDq8n@kroah.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 08:54:04AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 30, 2022 at 10:17:06AM +0530, Sebin Sebastian wrote:
> > Fix coverity warning dereferencing before null check. _ep and desc is
> > dereferenced on all paths until the check for null. Move the
> > initializations after the check for null.
> 
> How can those values ever be NULL?
> 
> > Coverity issue: 1518209
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> kernel test robot did not find this issue.
> 
 After I submitted the PATCH v1, kernel test robot ran some tests and
 produced a report of the things that I broke while creating the patch.
 That's why I kept this tag.

> > Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
> 
> What commit id does this change fix?
> 
 So should I provide the commit ID of the patch v1 that kernel
 test robot referred to?

> > ---
> >  Changes since v1: Fix the build errors and warnings due to first patch.
> >  Fix the undeclared 'ep' and 'maxpacket' error. Fix the ISO C90 warning.
> > 
> >  drivers/usb/gadget/udc/aspeed_udc.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> > index d75a4e070bf7..a43cf8dde2a8 100644
> > --- a/drivers/usb/gadget/udc/aspeed_udc.c
> > +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> > @@ -341,26 +341,33 @@ static void ast_udc_stop_activity(struct ast_udc_dev *udc)
> >  static int ast_udc_ep_enable(struct usb_ep *_ep,
> >  			     const struct usb_endpoint_descriptor *desc)
> >  {
> > -	u16 maxpacket = usb_endpoint_maxp(desc);
> > -	struct ast_udc_ep *ep = to_ast_ep(_ep);
> 
> checking that ep is NULL here is an impossible thing on its own.  You
> did change this so that you didn't check this anymore, which is odd as
> you did not mention that in the changelog text :(
> 
 Yes, I missed the checking for ep. I thought of checking it after
 initilizing ep.

> > -	struct ast_udc_dev *udc = ep->udc;
> > -	u8 epnum = usb_endpoint_num(desc);
> >  	unsigned long flags;
> >  	u32 ep_conf = 0;
> >  	u8 dir_in;
> >  	u8 type;
> > +	u16 maxpacket;
> > +	struct ast_udc_ep *ep;
> > +	struct ast_udc_dev *udc;
> > +	u8 epnum;
> 
> Why did you reorder these?
> 
This is actually the original order that these were in. I reordered it
while creating the first patch, then I changed it back to the original
order they were in the source tree for this patch.

> >  
> > -	if (!_ep || !ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT ||
> > -	    maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
> > +	if (!_ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
> >  		EP_DBG(ep, "Failed, invalid EP enable param\n");
> >  		return -EINVAL;
> >  	}
> > -
> 
> Why did you remove this line?
>
I removed the check for maxpacket because it is not initialized in this
part, the check for the same thing comes after initialization.
This is the check for that, this is also included in the patch.
+	if (maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
+               EP_DBG(ep, "Failed, invalid EP enable param\n");
+               return -EINVAL;
+       }
Should I add the check for 'ep' in this part?

> Also, your To: line is messed up somehow, please fix your email
> client...
> 
Ok, I will surely do it.

> thanks,
> 
> gre gk-h

I did many mistakes in the patch v1, so I had to bring this patch to the
original state things were. I left all the declarations in the same
order (which made it seem like reordering) and moved the initialization
part after the check for _ep and desc. 
