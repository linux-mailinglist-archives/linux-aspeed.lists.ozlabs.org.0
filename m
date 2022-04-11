Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD04FBBFB
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 14:25:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcSjX1n3kz3bWt
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 22:25:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ss27V85L;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ss27V85L; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcSjP3RTVz2xfP
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 22:24:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB91BB81212;
 Mon, 11 Apr 2022 12:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA0EC385A5;
 Mon, 11 Apr 2022 12:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649679891;
 bh=JWAqPgc7iD1EbdPyywpeDJppdn5+C50+xF16jAEfvEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss27V85LyEf3va8uUAhMU2T361UsxXasbR9zk5VhBFDgQKKAWrlxbo/ZIRwtKUMm1
 oCaDGoCx0OavbahlsC7PhtGhwerIhAduzFShGEoJNTc2bbYtybz8c8H2rcn2mLoiKM
 r1MTB+/qp5OGpXLViaxgmnHTIekBgR5mBtYvxb3I=
Date: Mon, 11 Apr 2022 14:24:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] usb: gadget: udc: clean up comments
Message-ID: <YlQeEC41m3UeOeiE@kroah.com>
References: <20220410150828.1891123-1-trix@redhat.com>
 <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
 <ecd8609b-2c52-5fb8-7820-191559d76011@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecd8609b-2c52-5fb8-7820-191559d76011@redhat.com>
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
Cc: alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, alcooperx@gmail.com,
 linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, yashsri421@gmail.com,
 balamanikandan.gunasundar@microchip.com, stern@rowland.harvard.edu,
 bcm-kernel-feedback-list@broadcom.com, linux-geode@lists.infradead.org,
 christophe.jaillet@wanadoo.fr, jakobkoschel@gmail.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, s.shtylyov@omp.ru,
 neal_liu@aspeedtech.com, rdunlap@infradead.org, nicolas.ferre@microchip.com,
 quic_wcheng@quicinc.com, miles.chen@mediatek.com, cai.huoqing@linux.dev,
 claudiu.beznea@microchip.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 11, 2022 at 04:49:00AM -0700, Tom Rix wrote:
> 
> On 4/11/22 3:22 AM, Andy Shevchenko wrote:
> > On Sun, Apr 10, 2022 at 11:08:28AM -0400, Tom Rix wrote:
> > > SPDX
> > > *.h use /* */ style comments
> > > 
> > > For double words, remove
> > > with, also
> > > 
> > > Spelling replacements
> > > wayt to way
> > > wakup to wakeup
> > > Contrl to Control
> > > cheks to checks
> > > initiaization to initialization
> > > dyanmic to dynamic
> > Something really wrong with indentation above.
> > 
> > ...
> > 
> > >   drivers/usb/gadget/udc/amd5536udc.h       | 2 +-
> > >   drivers/usb/gadget/udc/aspeed-vhub/core.c | 2 +-
> > >   drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 2 +-
> > >   drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 2 +-
> > >   drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 4 ++--
> > >   drivers/usb/gadget/udc/at91_udc.c         | 2 +-
> > >   drivers/usb/gadget/udc/bdc/bdc_core.c     | 4 ++--
> > >   drivers/usb/gadget/udc/core.c             | 4 ++--
> > >   drivers/usb/gadget/udc/trace.h            | 2 +-
> > I believe that Greg's bot asks to split on per-driver basis.
> > OTOH I don't see anything that can be problematic if in one
> > change. So, it's up to maintainers then.
> 
> Yes, whatever folks want. I can split these.
> 
> I have been cleaning up the comments in other areas and am trying to strike
> a balance between too big of a patch vs peppering with many single changes.

Patch series are much easier to review and is just as simple to apply as
a single patch, so that makes it overall better for you to do.

thanks,

greg k-h
