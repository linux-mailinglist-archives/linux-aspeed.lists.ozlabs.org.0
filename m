Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF086FFD6
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 12:09:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCSFjjgs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpGDS4NJSz3cPX
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 22:09:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCSFjjgs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpGDK6J2kz3bnv
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Mar 2024 22:09:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709550562; x=1741086562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KXv3Q2iupm09gepMI0TpXGJCp9MnBfLCvS53P06EY2k=;
  b=NCSFjjgsBjFPQXRBO0QjSW0yZbetgqSJKno2F0tN9G59Pnbbz4E8yK01
   WIZJ+4OCsc8AfLNkc2M9m02fOS0k2Jeo2ipYSbi4lRolAI8xVhQgXf9qd
   SjhQ2jy1Zcm5RgtFsvBFuX1xdqdb80WF/c6qqwxZg8HcyWI2xHO4R0Crb
   4niKggRgI5wtlU0HoE54tKsYV294q7Mf6W9jPzH5PHfEgSJFJAVe9by6n
   b+UlNRhC9hR1ZnZGxVz7jW3Tqa6dUO7O9Jy9cPMgtuC8iINlNzIZSxBGe
   BeDByaSP+z+uxDp8psD7IGYdfNlaVc6IVJTxJ+lUFBFTcQAZu9S78WZ5c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4202214"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4202214"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 03:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="914102864"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="914102864"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 03:09:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rh6Bw-00000009hG5-1IAi;
	Mon, 04 Mar 2024 13:09:08 +0200
Date: Mon, 4 Mar 2024 13:09:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 03/14] serial: port: Introduce a common helper to read
 properties
Message-ID: <ZeWr06YWj5cDHfWL@smile.fi.intel.com>
References: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
 <20240226142514.1485246-4-andriy.shevchenko@linux.intel.com>
 <2024030259-playback-starlit-a472@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024030259-playback-starlit-a472@gregkh>
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Mar 02, 2024 at 09:58:53PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 26, 2024 at 04:19:19PM +0200, Andy Shevchenko wrote:

...

> > + * uart_read_port_properties - read firmware properties of the given UART port
> 
> I like, but:
> 
> > + * @port: corresponding port
> > + * @use_defaults: apply defaults (when %true) or validate the values (when %false)
> 
> Using random booleans in a function is horrid.  Every time you see the
> function call, or want to call it, you need to go and look up what the
> boolean is and means.
> 
> Make 2 public functions here, one that does it with use_defaults=true
> and one =false and then have them both call this one static function,
> that way the function names themselves are easy to read and understand
> and maintain over time.

Okay! I'll redo that.

...

> > +EXPORT_SYMBOL(uart_read_port_properties);
> 
> EXPORT_SYMBOL_GPL()?  I have to ask :)

No clue, the rest in this file is EXPORT_SYMBOL, but I admit I followed the
cargo cult. I'll check the modified code and see if I may use _GPL version.

Thank you for review!

-- 
With Best Regards,
Andy Shevchenko


