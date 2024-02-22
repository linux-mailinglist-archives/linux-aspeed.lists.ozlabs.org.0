Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1128885F99D
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 14:24:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkxhtEgU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgYkn6vsJz3dVS
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Feb 2024 00:24:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkxhtEgU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgYkK0FG3z3dWk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Feb 2024 00:23:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708608217; x=1740144217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I2mpqktQUMpUVIwK9ivMrxcCg4Ivx2ALtVlPcDb4C1Y=;
  b=nkxhtEgUpYeG82BMNP5rwvm8R0qeTowgOTFLe7QtHPQXHrOi7JbOM4tZ
   nzZzFZ73SI4byzkDRKuhSSpgkCIGm0roEG6QLcffpShB6LS4xjHpZn0qW
   AwPE4+tbRyfMyyrxVwBzm2hJY4nAyxiIVPpgYleT3sT8VPNkAc/qyaKyT
   GWbP6stIc4xwlzVUD5aa5y0heJlZcyMh9KARJ0P3mKTYUX9SZrONUgEZ2
   Men7ZtRNxn1oNVtlb/bCroGMg6w9mcs+ZLDj/qlk2ALqxA3UeThvCIt78
   49AGE6UgRRtd9WbC13WIQdd1Le5MFHFfIpsPG1g1YKGXcW8IgQueFfllp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25292080"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="25292080"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913523658"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="913523658"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:23:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rd92q-00000006dXM-30Tv;
	Thu, 22 Feb 2024 15:23:24 +0200
Date: Thu, 22 Feb 2024 15:23:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v1 10/14] serial: 8250_of: Switch to use
 uart_read_port_properties()
Message-ID: <ZddKzHplwOX7naLv@smile.fi.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
 <20240221183442.4124354-11-andriy.shevchenko@linux.intel.com>
 <0a828f2c50de712940fb9a881702ac1678a35b7c.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a828f2c50de712940fb9a881702ac1678a35b7c.camel@codeconstruct.com.au>
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

On Thu, Feb 22, 2024 at 11:07:05AM +1030, Andrew Jeffery wrote:
> On Wed, 2024-02-21 at 20:31 +0200, Andy Shevchenko wrote:
> > Since we have now a common helper to read port properties
> > use it instead of sparse home grown solution.
> 
> I did some brief testing of the series for the Aspeed machines under
> qemu, building them on top of v6.8-rc5:
> 
> export ARCH=arm
> export CROSS_COMPILE=arm-linux-gnueabihf-
> make aspeed_g5_defconfig
> make -j$(nproc)
> qemu-system-arm -M rainier-bmc -nographic -no-reboot -kernel arch/arm/boot/zImage -dtb arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb -initrd ...
> 
> I got an oops during boot, which bisected to this change:

Thank you for prompt testing! I will look at it.

-- 
With Best Regards,
Andy Shevchenko


