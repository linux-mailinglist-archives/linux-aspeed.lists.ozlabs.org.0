Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 953634FAE6C
	for <lists+linux-aspeed@lfdr.de>; Sun, 10 Apr 2022 17:18:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbwcX43v4z2yQG
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 01:18:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1NWFl0PP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=1NWFl0PP; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbwcS0GzJz2yZc
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 01:18:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4845B80D92;
 Sun, 10 Apr 2022 15:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F11C385A4;
 Sun, 10 Apr 2022 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649603920;
 bh=yIvrIYuGpHOrzjH4oQy1ZlnyuMsY1S8I+K/sED7d7QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1NWFl0PPhSiUncXwtxj8dPOJgwu1vYWUWtVUxkTvmRa7rjlbbYdx/XuqYRy5+iIK+
 cbVAFyqCFsnpj6pNRCl2WpSyypnqU+JeoLA7H7gUG79GmB6cKAvtra0BT1+Kl81p60
 QvcivIqZAW7tk1uhNeROif13McOGavVafYQygFEg=
Date: Sun, 10 Apr 2022 17:18:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] usb: gadget: udc: clean up comments
Message-ID: <YlL1Takwt2s05igD@kroah.com>
References: <20220410150828.1891123-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410150828.1891123-1-trix@redhat.com>
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
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 balbi@kernel.org, s.shtylyov@omp.ru, neal_liu@aspeedtech.com,
 rdunlap@infradead.org, nicolas.ferre@microchip.com, quic_wcheng@quicinc.com,
 miles.chen@mediatek.com, cai.huoqing@linux.dev, claudiu.beznea@microchip.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Apr 10, 2022 at 11:08:28AM -0400, Tom Rix wrote:
> SPDX
> *.h use /* */ style comments
> 
> For double words, remove
> with, also
> 
> Spelling replacements
> wayt to way
> wakup to wakeup
> Contrl to Control
> cheks to checks
> initiaization to initialization
> dyanmic to dynamic
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/usb/gadget/udc/amd5536udc.h       | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 4 ++--
>  drivers/usb/gadget/udc/at91_udc.c         | 2 +-
>  drivers/usb/gadget/udc/bdc/bdc_core.c     | 4 ++--
>  drivers/usb/gadget/udc/core.c             | 4 ++--
>  drivers/usb/gadget/udc/trace.h            | 2 +-
>  9 files changed, 12 insertions(+), 12 deletions(-)
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
