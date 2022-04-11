Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C64FB98F
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 12:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcQ6L5SxPz2yyG
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 20:27:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VDjHnVaR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VDjHnVaR; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcQ6G2rYCz2x9M
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 20:27:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649672870; x=1681208870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w/B9OC3B9ubhCDDuz61ASu2Hiu/rM8Lrj6qHHNYq32U=;
 b=VDjHnVaRlJtlzvn1V+mHThBKBnueyAAj5x5m5WpKeko1pyEAEErhe8ye
 0zeKCplSTnnQl6R7vL/j4cORhDIYNg1wjBjnbLIyy/hJbJd05Zhw2wR5f
 jX/rEmxpdUx02dhW1EL0m0y9HSgUpnHzyzRc5eLigTwGj6Mn2r97OR6A4
 USftLlRrzD1EuJDAS7Y3VUmlgp8lGwB2XbBS+Ve1NKyTQmqBSfze1vRj7
 CqNTW7Qv3J7QXwMML7T7Se9cgUvVkWBJ+G1ntU7xxbMwTSHhs+akZirz6
 Y/5gQ4zT3xAUbsggU79cakye9aiPgT3Tl1uoh0LGmpK2+NJ3fD9+5th1w Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="249365450"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="249365450"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 03:26:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="644032222"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 03:26:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndrCE-001BAf-W7; Mon, 11 Apr 2022 13:22:58 +0300
Date: Mon, 11 Apr 2022 13:22:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] usb: gadget: udc: clean up comments
Message-ID: <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
References: <20220410150828.1891123-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410150828.1891123-1-trix@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, s.shtylyov@omp.ru,
 neal_liu@aspeedtech.com, rdunlap@infradead.org, nicolas.ferre@microchip.com,
 quic_wcheng@quicinc.com, miles.chen@mediatek.com, gregkh@linuxfoundation.org,
 cai.huoqing@linux.dev, claudiu.beznea@microchip.com
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

Something really wrong with indentation above.

...

>  drivers/usb/gadget/udc/amd5536udc.h       | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 4 ++--
>  drivers/usb/gadget/udc/at91_udc.c         | 2 +-
>  drivers/usb/gadget/udc/bdc/bdc_core.c     | 4 ++--
>  drivers/usb/gadget/udc/core.c             | 4 ++--
>  drivers/usb/gadget/udc/trace.h            | 2 +-

I believe that Greg's bot asks to split on per-driver basis.
OTOH I don't see anything that can be problematic if in one
change. So, it's up to maintainers then.

...

> --- a/drivers/usb/gadget/udc/amd5536udc.h
> +++ b/drivers/usb/gadget/udc/amd5536udc.h

>   * amd5536.h -- header for AMD 5536 UDC high/full speed USB device controller

At the same time you may drop the filename(s) from the file(s) as this very
one shows why it's good not to have a filename inside file.

-- 
With Best Regards,
Andy Shevchenko


