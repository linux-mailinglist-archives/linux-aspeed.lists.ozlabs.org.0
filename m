Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF854861509
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Feb 2024 16:00:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RRgG3bNZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThCr268Nxz3vXM
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Feb 2024 02:00:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RRgG3bNZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 24 Feb 2024 02:00:44 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThCqw6l0rz3cb5
	for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Feb 2024 02:00:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708700445; x=1740236445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tKzaZ4SrfW3NZnt7/A7BvgRIDvidSwzO3kkc6CIop9s=;
  b=RRgG3bNZ4CaCV8E0WFT+7lkm5cYM6PnWH56FSbnlxxPwoqQp9xNyTkUy
   z6CeyXLhlb2e6FNahURiYzAHEMkR2icc4+v3yZTivrPve4toE7Kh6CkCw
   E7vdfuEdIuswdUreMEuXOSoNmjLXiimW1HvqPa/LFiCLc/N/cT1JiopMQ
   ZWhN3bEKJOagmZyBvfZKni2/3KwhGNEXYZ1LMhT6NlYU7iGRNAVgvSy7f
   9bCTazddpD20b0ZAS6HcI20hnv73hnUDEMiqXB4efs5rlrh5gmElinAVv
   QZh2HCCB1kdGiF6FocapKp8sSO36rIfT6NdQCTwA3eKFjVarJC3edG79H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6832457"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6832457"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 06:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="913748299"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="913748299"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 06:59:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdX1I-00000006ve5-4BqP;
	Fri, 23 Feb 2024 16:59:25 +0200
Date: Fri, 23 Feb 2024 16:59:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v1 02/14] serial: core: Add UPIO_UNSET constant for unset
 port type
Message-ID: <ZdiyzKMZPlkN462G@smile.fi.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
 <20240221183442.4124354-3-andriy.shevchenko@linux.intel.com>
 <5aeee02f-45a6-48e5-a6f4-e55b76d4b959@kernel.org>
 <ZddKaaB7HO0CyldD@smile.fi.intel.com>
 <fa46f220-a1c4-43f4-91e1-5929ff335be0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa46f220-a1c4-43f4-91e1-5929ff335be0@kernel.org>
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

On Fri, Feb 23, 2024 at 06:42:15AM +0100, Jiri Slaby wrote:
> On 22. 02. 24, 14:21, Andy Shevchenko wrote:
> > On Thu, Feb 22, 2024 at 07:58:32AM +0100, Jiri Slaby wrote:
> > > On 21. 02. 24, 19:31, Andy Shevchenko wrote:

...

> > > >    	unsigned char		iotype;			/* io access style */
> > > > +#define UPIO_UNSET		((unsigned char)~0U)	/* UCHAR_MAX */
> > > 
> > > Perhaps making the var u8 and this U8_MAX then? It would make more sense to
> > > me.
> > 
> > WFM, should it be a separate change?
> 
> Likely.

Then I need a commit message, because I'm unable to justify this change myself.

> > Btw, how can I justify it?
> 
> Hmm, thinking about it, why is it not an enum?

Maybe, but it is a replica of UAPI definitions, do we want to see it as a enum?
To me it will be a bit ugly looking.

> But it could be also an u8 because you want it be exactly 8 bits as you want
> to be sure values up to 255 fit.

Depends on what we assume UAPI does with those flags. It maybe even less than
8 bits, or great than, currently 8 bits is enough...

TL;DR: I would rather take a patch from you and incorporate into the series
than trying hard to invent a justification and proper type.

-- 
With Best Regards,
Andy Shevchenko


