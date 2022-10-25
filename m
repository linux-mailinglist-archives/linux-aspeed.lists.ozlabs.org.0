Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7660C3C6
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 08:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxMKy5Gdzz3bym
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 17:22:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lSsesLZY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lSsesLZY;
	dkim-atps=neutral
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxMKp270Zz3bcY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 17:22:03 +1100 (AEDT)
Received: by mail-ua1-x933.google.com with SMTP id p1so1306407uak.11
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 23:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vjhCMJ8a1lWEwc5lKcva0autIJNGaKra1VBDgEdvOnQ=;
        b=lSsesLZY7EGX2+FB5+i8PxJGpxMQdr229dAC80JjAywq6H0xB3iI5yxDQK+DSjlR7f
         4xkrwpiEhYGqQgj7quG6T2Os/AxOyoSOBB78h/qYv5QBYK89tWPX/+mbYX9aqnCwLLzv
         a9cBqX7i2I+fNIxeBU0cz6kgFFVQWGcO4egEQtDCRGuc/A1IhVRN0wOdXQqny0OFDbHK
         ZGtxxKwO9eGedFppAzt7EBf5p8E0kNJQ8+hsN/GBE8m89YMxnRb509T+L2rsuzDbZ7If
         9BQxEPlNikhZlO3xcVr3u6KINGB9I+ZwwJh0mApSyXxCEEUfphy4L2WKo8HMSbXU/hvP
         efDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjhCMJ8a1lWEwc5lKcva0autIJNGaKra1VBDgEdvOnQ=;
        b=zbbz2Mfsv1FEb7vxLNmnNdQp6lSAqOPdV00eiQj36Adjv9NEg9optyISXg3074zIFZ
         NbZJQ6yig/GHd/CGzqKDBkLUepQ2ZlAruFULYSJ8j4uYOsgcLLKygFT/xUbN5p/ffBY5
         pETD6jNyYl8Ly482H/Cs7EkKslQH4AP6oCapeosC0lK929feUMfzdDrG/AbyokbtYSXD
         bDgaueGRBZ/hz6E6eQMJZqwuKlcp5rNL1zBqt5ai7rX5xJN3zcLFPH58YsDyUlWPrQl0
         6s4+FgxWuRjLtx0abCtEuFZ0H4DjwSn4f/PW/wgpnpteNRv+RoHfxmU1ZMWQBWsfBQ64
         kGpg==
X-Gm-Message-State: ACrzQf0VHJB1rPzifSzTVzVA/VnU873Nvmb1Pt8Vm29dQFPy6AlpqKuC
	p1axyeEvI+MHEsmVvhwv8jQUgGWUu1nJMSq6/H6KIw==
X-Google-Smtp-Source: AMsMyM7F/K1+h/RnqQyC078CIIpFW0/yryvvVcmnalMDY0PtvtDu7Bz8bRM10fCu1SgA61eB9OpehUz/+P0C619F1zM=
X-Received: by 2002:ab0:6451:0:b0:3b8:7f95:f20e with SMTP id
 j17-20020ab06451000000b003b87f95f20emr21630282uap.31.1666678918419; Mon, 24
 Oct 2022 23:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221024094853.2877441-1-yulei.sh@bytedance.com> <661b43881b7f8764919847f29c0daf1866441090.camel@kernel.crashing.org>
In-Reply-To: <661b43881b7f8764919847f29c0daf1866441090.camel@kernel.crashing.org>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 25 Oct 2022 14:21:47 +0800
Message-ID: <CAGm54UE1oS1N_hn4RKuF8a+OWgfvJ-OCc0-uju4mXbtz-jw8VA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 25, 2022 at 6:00 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Mon, 2022-10-24 at 09:48 +0000, Lei YU wrote:
> > From: Henry Tian <tianxiaofeng@bytedance.com>
>
> I wrote that driver, please CC me on further patches to it (thanks Joel
> for the heads up).
>
> > In ast_vhub_epn_handle_ack() when the received data length exceeds the
> > buffer, it does not check the case and just copies to req.buf and cause
> > a buffer overflow, kernel oops on this case.
>
>  .../...
>
> Thanks ! Seems like a legit bug, however:
>
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > index b5252880b389..56e55472daa1 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > @@ -84,6 +84,7 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
> >  {
> >         struct ast_vhub_req *req;
> >         unsigned int len;
> > +       int status = 0;
> >         u32 stat;
> >
> >         /* Read EP status */
> > @@ -119,9 +120,15 @@ static void ast_vhub_epn_handle_ack(struct ast_vhub_ep *ep)
> >         len = VHUB_EP_DMA_TX_SIZE(stat);
> >
> >         /* If not using DMA, copy data out if needed */
> > -       if (!req->req.dma && !ep->epn.is_in && len)
> > -               memcpy(req->req.buf + req->req.actual, ep->buf, len);
> > -
> > +       if (!req->req.dma && !ep->epn.is_in && len) {
> > +               if (req->req.actual + len > req->req.length) {
> > +                       req->last_desc = 1;
> > +                       status = -EOVERFLOW;
> > +                       goto done;
>
> Should we stall as well ? Should we continue receiving and just dropping the data until we have
> a small packet ? Otherwise the EP could get out of sync for subsequent ones...
>

This case is treated as an error and we do not care about the following data.
Similarly, if we change the MTU in BMC and let BMC ping the OS, the OS
kernel does not crash and it gets RX errors, and the ping fails.

 # ifconfig usb0
 usb0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         ...
         RX packets 85  bytes 15380 (15.0 KiB)
         RX errors 51  dropped 0  overruns 0  frame 51

With this patch, we get the similar behavior on BMC that the RX errors
are increasing.

> Additionally, I'm curious, why in this specific case is the device sending more data than
> the buffer can hold ? The MTU change should have resulted in buffers being re-allocated no ?

The issue is found in a rare case during BIOS boot, we assume that
BIOS is sending unexpected data to BMC for unknown reasons.

> Or did you change the MTU on the remote and not on the local device ?
>

Yes, the MTU is changed to 2000 in OS and kept 1500 on BMC, then the
issue is reproduced. (see detailed steps in the above email).

The reason we made the above test is because we are trying to
reproduce the behavior as BIOS, and from the logs it looks like it's
sending a packet larger than MTU. Then we tried to adjust the MTU on
the OS side and reproduced the issue.
