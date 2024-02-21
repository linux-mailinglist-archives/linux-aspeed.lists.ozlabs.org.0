Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D66ED85E6D9
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:04:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jG0ZMikY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg5L35XQvz3cST
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 06:04:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jG0ZMikY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg5Kz0Hbtz3cGg
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 06:04:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708542263; x=1740078263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n0Imwz+1JuSXsvn3CWF5sPHjqL1Uh/DLyBWeFpnGhgQ=;
  b=jG0ZMikYl7BSBYBUfq0p8wcLIA+gbV2NzfKeqHhRLix1dY28l9pZgLvB
   oIXgGcFQ4KNPNXsmF/t7i+oILUoOXXQJ4uim6lLGOE2JLaxjWJhUqW+bD
   pZeEIOS039yX3N6BLl+Jflk3ZJzhM/MK9/q0LEDnGf2qky+RYW5QCUt4e
   nEgg6YGXwt3hPD4O4R/G3JH+OaZ4kTdC2jjtVT1f6aJ50726zLtPAXlG3
   ujaxfJqq/nR9V3OZAYt6OSyfuacmwNmn//thn2O4/0TWDSDZpPA+dCKMK
   QApJcfVg9sKZ7XO6sha/PHj/GPN9QzW/FJO17IEFHWv0QlA5Fgke5uu1y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2873066"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2873066"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 11:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913355053"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="913355053"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 11:04:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rcrt3-00000006R6t-0QGW;
	Wed, 21 Feb 2024 21:04:09 +0200
Date: Wed, 21 Feb 2024 21:04:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Subject: Re: [PATCH v1 01/14] serial: core: Move struct uart_port::quirks
 closer to possible values
Message-ID: <ZdZJKIrkeasBwL3i@smile.fi.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
 <20240221183442.4124354-2-andriy.shevchenko@linux.intel.com>
 <20240221135452.6fdeb71e60509cca1be016c3@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221135452.6fdeb71e60509cca1be016c3@hugovil.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Andi Shyti <andi.shyti@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 21, 2024 at 01:54:52PM -0500, Hugo Villeneuve wrote:
> On Wed, 21 Feb 2024 20:31:17 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Currently it's not crystal clear what UPIO_* and UPQ_* definitions
> > belong two. Reindent the code, so it will be easy to read and understand.
> 
> two -> to.

Ah, thanks, will fix!

-- 
With Best Regards,
Andy Shevchenko


