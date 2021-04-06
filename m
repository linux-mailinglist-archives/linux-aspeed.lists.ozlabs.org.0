Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C612635610D
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Apr 2021 03:54:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFSB35hysz30C8
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Apr 2021 11:54:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 06 Apr 2021 23:23:18 AEST
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF7WV5FM7z303M
 for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Apr 2021 23:23:18 +1000 (AEST)
IronPort-SDR: UlBdSMmqcNRpRE8TtT3sAMCwyNWXh67vKKuUnMlzxOZDU8F6BR5DwXDkIg048IelzRZYeFFwMI
 7C0bn+H0Bwrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="180604199"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="180604199"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 06:22:09 -0700
IronPort-SDR: 6F6fMunmDKi9b4oJzFoNeL2C2XgciVVaoki4Yi0yYBkg3MnC3shLBS4RGfx56+aCyh0Ck0FUI9
 iEnCYrk08FIA==
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="529807929"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 06:22:07 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1lTlef-001iw4-0G; Tue, 06 Apr 2021 16:22:05 +0300
Date: Tue, 6 Apr 2021 16:22:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: [PATCH v29 0/6] JTAG driver introduction
Message-ID: <YGxgfFBUr6eHJ1Qi@smile.fi.intel.com>
References: <20200413222920.4722-1-ernesto.corona@intel.com>
 <20210115104635.GA2971@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115104635.GA2971@home.paul.comp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 07 Apr 2021 11:54:16 +1000
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
Cc: linux-arm-kernel@lists.infradead.org,
 Ernesto Corona <ernesto.corona@intel.com>, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jan 15, 2021 at 01:46:35PM +0300, Paul Fertser wrote:
> Hello,
> 
> This is a multi-part review of the series, with general notes inline
> in this message, and specific points raised as replies to the
> individual patches.
> 
> On Mon, Apr 13, 2020 at 03:29:14PM -0700, Ernesto Corona wrote:
> > We propose to implement general JTAG interface and infrastructure
> > to communicate with user layer application.
> 
> Working with a Tioga Pass server platform I needed to use the JTAG
> master controller of an ASPEED AST2500 SoC to configure a Lattice
> LCMXO2-4000HC CPLD. I'm mentioning these fine details because that's
> the only proper runtime testing I performed, but my review is not
> limited to that.
> 
> Being a long-time OpenOCD community member, I got familiar with many
> different facilities and protocols offered by hardware JTAG adapters,
> and of wide range of usecases as I was providing end-user
> support. This is my perspective when looking at these patches.
> 
> I have to note that the current v29 version of the series is broken in
> several aspects:

Is it correct that this series is actually abandoned so far?

> 1. The aspeed driver fails probe(), see the driver review for details;
> 
> 2. The uapi include header is unusable;
> 
> 3. The offered userspace implementation wasn't updated to the latest
> API, but even with the changes to make it compile it's still a mess
> too horrible to be used in production;
> 
> Points 1 and 2 will be addressed in separate mails. To workaround
> point 3 I prepared a recipe with an additional patch[0] so that
> mlnx_cpldprog can be at least compiled and used for some minimal
> testing.
> 
> The shortcomings of mlnx_cpldprog are numerous:
> 
> 1. It doesn't consistently choose between hardware and bitbang modes;
> 
> 2. Even though it checks TDO it doesn't print any errors on mismatch
> and continues playing back the SVF as if it's all right;
> 
> 3. It has JTAG speed hardcoded;
> 
> 4. It doesn't implement RUNTEST so with the CPLD I'm using it's always
> _not_ working properly, failing silently;
> 
> 5. It is just awfully slow, taking about 40 minutes to play back a
> file that takes 1.5 minutes with OpenOCD with the same hardware and
> kernel driver.
> 
> So I added support for the proposed API to OpenOCD: patch that applies
> to the version in OpenBMC[1], patch for the latest version[2]. And
> since it can do much more than just playing back SVF I hope this can
> highlight some essential API shortcomings if it's meant to be
> generic. My impression is that in its current state it's not adequate
> for the purpose.
> 
> [0] https://bitbucket.org/paulfertser/mlnx_cpldprog_bitbake
> [1] http://openocd.zylin.com/#/c/5976/
> [2] http://openocd.zylin.com/#/c/5975/

-- 
With Best Regards,
Andy Shevchenko


