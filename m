Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC8985FE66
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 17:47:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fq0r6ldD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgfFg1rh3z3dTs
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Feb 2024 03:47:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fq0r6ldD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgfFZ65Rvz3cy4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Feb 2024 03:47:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708620451; x=1740156451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rZ8aZS6VSxj1TAeS8bays2vC+U6OkHH9YohfP+YSMeA=;
  b=Fq0r6ldDdVrT0gSdTJWNRzi/4xH7p0cPCaVNA95f4l1IpS8ItB+2jNBC
   Vw8QLPrV6UujMbl+bPJvPQtQx3v4+0/h/7Xm7xpPGbT0QPcJKD7Cqbo5O
   x7S0TSW4iEs27XZSBXdLBTIYHQyTWGyrOukJA4/9Kq4WxkTNhkS1VWm9e
   hD2fAlSlzEFI56j1f2d83zbNhaZpVVZC0EIGah6aRhnxWRjGasmK253sC
   QmFcDrAPkQdBLXPxbp66QZIDqfxmKChB7uIq+MsJQXi+Y7kholglbQQJA
   1qJjA0TodpRBBGpv6vN1BFGDLtSMFhaTNlYxAcw6v2mngDjzq2pU1eq3q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2732227"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2732227"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913553757"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="913553757"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:47:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdCEB-00000006gCi-0sPe;
	Thu, 22 Feb 2024 18:47:19 +0200
Date: Thu, 22 Feb 2024 18:47:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v1 10/14] serial: 8250_of: Switch to use
 uart_read_port_properties()
Message-ID: <Zdd6lnXwvpPPUhRR@smile.fi.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
 <20240221183442.4124354-11-andriy.shevchenko@linux.intel.com>
 <0a828f2c50de712940fb9a881702ac1678a35b7c.camel@codeconstruct.com.au>
 <ZddKzHplwOX7naLv@smile.fi.intel.com>
 <Zdd5m2xIPlGI0_Qv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zdd5m2xIPlGI0_Qv@smile.fi.intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22, 2024 at 06:43:08PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 22, 2024 at 03:23:24PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 22, 2024 at 11:07:05AM +1030, Andrew Jeffery wrote:
> > > On Wed, 2024-02-21 at 20:31 +0200, Andy Shevchenko wrote:
> > > > Since we have now a common helper to read port properties
> > > > use it instead of sparse home grown solution.
> > > 
> > > I did some brief testing of the series for the Aspeed machines under
> > > qemu, building them on top of v6.8-rc5:
> > > 
> > > export ARCH=arm
> > > export CROSS_COMPILE=arm-linux-gnueabihf-
> > > make aspeed_g5_defconfig
> > > make -j$(nproc)
> > > qemu-system-arm -M rainier-bmc -nographic -no-reboot -kernel arch/arm/boot/zImage -dtb arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb -initrd ...
> > > 
> > > I got an oops during boot, which bisected to this change:
> > 
> > Thank you for prompt testing! I will look at it.
> 
> I found the issue, will be fixed in next version.

Whoever is going to test this series, the

-		port->iotype = use_defaults ? UPIO_MEM : port->iotype;
+		port->iotype = UPIO_MEM;

should be applied to uart_read_port_properties() implementation.

-- 
With Best Regards,
Andy Shevchenko


