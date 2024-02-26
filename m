Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D317786780B
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 15:17:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WeqmG7xp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk2kb0H0vz3vfK
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 01:17:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WeqmG7xp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk2kP6sMJz3vZt
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 01:17:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708957039; x=1740493039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HZlXZGpEZ0auGfIkoqRiKy72XZYfKXmXVmc4SJZWGJo=;
  b=WeqmG7xpd31JcYRAK415r1+mYqt5fadbZShvafapB5CmXVFY/u4dJknl
   H/4VgJgWRHmQADxOrMQ4Jizce0WR93NasKiony2h6H9zk5vZqk8cUsGj7
   tIGNRLLsAT7s+mTrYgJ2vaJulORlWpA+XMBIg1eQjUKCcB+VNL8QySiRe
   3NhRi0jd4k0EuO3urwpMiddYVr1bUSV1hfpXZe2Bn3zctFT0bCtGHhNY0
   /6OqbDnd5+5Ks/b5Lua3RFU6NkwUW+SjV/ql/i/kBvlYbL656+aCDZtRn
   30T20L0k4QB2yKhZzMjBMJP2ECbm+fs6k3nkqNETHIUh7sPm1BXCjJo9M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="7047441"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7047441"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="913872291"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="913872291"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:17:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rebmx-00000007hRa-3oE3;
	Mon, 26 Feb 2024 16:17:03 +0200
Date: Mon, 26 Feb 2024 16:17:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v1 02/14] serial: core: Add UPIO_UNSET constant for unset
 port type
Message-ID: <ZdydX79GBaedFqku@smile.fi.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
 <20240221183442.4124354-3-andriy.shevchenko@linux.intel.com>
 <5aeee02f-45a6-48e5-a6f4-e55b76d4b959@kernel.org>
 <ZddKaaB7HO0CyldD@smile.fi.intel.com>
 <fa46f220-a1c4-43f4-91e1-5929ff335be0@kernel.org>
 <ZdiyzKMZPlkN462G@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdiyzKMZPlkN462G@smile.fi.intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Feb 23, 2024 at 04:59:25PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 23, 2024 at 06:42:15AM +0100, Jiri Slaby wrote:
> > On 22. 02. 24, 14:21, Andy Shevchenko wrote:
> > > On Thu, Feb 22, 2024 at 07:58:32AM +0100, Jiri Slaby wrote:
> > > > On 21. 02. 24, 19:31, Andy Shevchenko wrote:

...

> > > > >    	unsigned char		iotype;			/* io access style */
> > > > > +#define UPIO_UNSET		((unsigned char)~0U)	/* UCHAR_MAX */
> > > > 
> > > > Perhaps making the var u8 and this U8_MAX then? It would make more sense to
> > > > me.
> > > 
> > > WFM, should it be a separate change?
> > 
> > Likely.
> 
> Then I need a commit message, because I'm unable to justify this change myself.
> 
> > > Btw, how can I justify it?
> > 
> > Hmm, thinking about it, why is it not an enum?
> 
> Maybe, but it is a replica of UAPI definitions, do we want to see it as a enum?
> To me it will be a bit ugly looking.
> 
> > But it could be also an u8 because you want it be exactly 8 bits as you want
> > to be sure values up to 255 fit.
> 
> Depends on what we assume UAPI does with those flags. It maybe even less than
> 8 bits, or great than, currently 8 bits is enough...
> 
> TL;DR: I would rather take a patch from you and incorporate into the series
> than trying hard to invent a justification and proper type.

Okay, I want to send a new version, for now I leave the type change for
the next time. It looks that quirks as well will benefit from type clarifying.

-- 
With Best Regards,
Andy Shevchenko


