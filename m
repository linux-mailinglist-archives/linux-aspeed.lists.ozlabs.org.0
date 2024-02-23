Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBED861514
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Feb 2024 16:03:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FwaxGmGn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThCvP5KD4z3vY1
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Feb 2024 02:03:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FwaxGmGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThCvH6tVNz3dVx
	for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Feb 2024 02:03:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708700620; x=1740236620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJ4uK049YbYNUUHoL7aPqziogI3mOCKCzfvXZt0+OhQ=;
  b=FwaxGmGnrS015iq4ia3WxqqZJc3JuTmh+fKqIguZAaL3NHIdj1sHlvcH
   nHj5aQxzuSzdLTjeeY9VHxmoR/QKIPldsa2BWbaYf9336ZupJlpB7pw/y
   pwY2i1j8X694OOhLFfZKsOn4e3AJlUnqbkhnEXbUgNWtsN+Npqvjsk/Ak
   Ql02VkicGqy2d3zfW4V7aQFjoV8Z0/XkF/dhV0WCdCQ5MELii8yGwwEw+
   CNJrfko65utxmzIXkyHtcNLylDkzrA+ZhNLJvQM3f9qTkykfTiDOK4A8n
   nQtMN4kmw3HZGx/6tTS2jVgKW8fuBn14Ab78udz59yn1QeXas/n0DBRzl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6833943"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6833943"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="913748390"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="913748390"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:02:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdX4H-00000006vhH-3v03;
	Fri, 23 Feb 2024 17:02:29 +0200
Date: Fri, 23 Feb 2024 17:02:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v1 10/14] serial: 8250_of: Switch to use
 uart_read_port_properties()
Message-ID: <ZdizhVPfwFp72ioI@smile.fi.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
 <20240221183442.4124354-11-andriy.shevchenko@linux.intel.com>
 <0a828f2c50de712940fb9a881702ac1678a35b7c.camel@codeconstruct.com.au>
 <ZddKzHplwOX7naLv@smile.fi.intel.com>
 <Zdd5m2xIPlGI0_Qv@smile.fi.intel.com>
 <Zdd6lnXwvpPPUhRR@smile.fi.intel.com>
 <e5fd9d8b-84eb-4ef9-82ab-ff4ecc41c0d5@broadcom.com>
 <ad91eec0-39da-4b9c-8da7-f1e98bb4565b@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad91eec0-39da-4b9c-8da7-f1e98bb4565b@broadcom.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Andi Shyti <andi.shyti@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22, 2024 at 11:54:46AM -0800, Florian Fainelli wrote:
> On 2/22/24 09:39, Florian Fainelli wrote:
> > On 2/22/24 08:47, Andy Shevchenko wrote:

...

> > Thanks, on 8250_bcm7271.c with the above hunk applied, I did not spot
> > any differences between the values returned by stty or a cat
> > /sys/class/tty/ttyS0/* before or after, the console remained fully
> > functional. I will see if I can run an additional test where I removed
> > the DT's "clocks" property and confirm that the fall back to
> > "clock-frequency" works.
> 
> Also appears to work properly on a Raspberry Pi 4 with the console using the
> bcm2835-aux driver, will provide Tested-by tags on the next submission,
> thanks!

Thank you for prompt testing on real HW!

-- 
With Best Regards,
Andy Shevchenko


