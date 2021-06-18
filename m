Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA843AC853
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Jun 2021 12:01:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5vZV6lCGz3bxj
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Jun 2021 20:01:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5vZS1qtMz3076
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Jun 2021 20:01:03 +1000 (AEST)
IronPort-SDR: uBdGdiO0g3MRhlEovyDwbMsc41blGY57ZRdhwfPDrBdb+uwTZ0XDrfgGSmb09b3rXhfQObuGNn
 bkjTs9qUvafQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="228055377"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="228055377"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 03:00:57 -0700
IronPort-SDR: 5gdfw7IuCHm/YLPTg4K/dBM62CuMxNb7JWSCYMa71bVWYnVFOyYu4OCNjIT6DXZ8053gWgdzHe
 xoIJAgLxSW1w==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="416401095"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 03:00:51 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1luBIt-003ZLy-Lb; Fri, 18 Jun 2021 13:00:47 +0300
Date: Fri, 18 Jun 2021 13:00:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <YMxuz03aTijWH6uj@smile.fi.intel.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslyzUKp/7J0ncu@smile.fi.intel.com>
 <20210618035855.GB31659@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618035855.GB31659@aspeedtech.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.de>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Khalil Blaiech <kblaiech@mellanox.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
 Arnd Bergmann <arnd@arndb.de>, Steven Lee <steven_lee@aspeedtech.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 18, 2021 at 11:58:55AM +0800, Jamin Lin wrote:
> The 06/17/2021 10:36, Andy Shevchenko wrote:
> > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> > > Add i2c new driver to support new register set for AST2600.
> > > AST2600 support three modes for data transfer which are
> > > byte mode, buffer mode and dma mode, respectively.
> > > The global driver of i2c is used to set the new register
> > > mode and define the base clock frequency
> > > of baseclk_1~baseclk_4.

> >  - shrink the code base by at least ~15% (it's possible), i.e. -200 LOCs
> Can you describe it more detail?
> Do you mean I should separate the patch file to fix size limitation? 

No. Based on my brief review you introduce to many redundant LOCs (lines of
code). Remove them, refactor the code, make it small and neat and easy to read
and understand. It is possible to achieve!

> >  - rethink how you do calculations and bit operations
> >  - better code style
> >
> Thanks for your review and very good suggestion
> I will update them and sent patch again.
> By the way, I received test failed email from Robot due to compiling
> warning. I will fix them, too.

-- 
With Best Regards,
Andy Shevchenko


