Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B23AC849
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Jun 2021 11:59:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5vY24Z5wz3by2
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Jun 2021 19:59:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5vXx20gbz30Fs
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Jun 2021 19:59:43 +1000 (AEST)
IronPort-SDR: cHejiVr1o/4u5pH2/NRDyqdaYPU5QkaQhY2VNT+R6KKdJCLu6wO2rt6rWFU0+IOYc+hPI6PepF
 tF0e52fHhFpg==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="204699436"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="204699436"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 02:59:30 -0700
IronPort-SDR: skSE3amv8mKVXb+EWAHxoHXR1wl2/JzlAJCk0BlYpeVNHRHZmDiZtMmFL07HiG7D9N2XTzskgH
 jcbnbvO1e9Pw==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="555527300"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 02:59:24 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1luBHU-003ZKx-Se; Fri, 18 Jun 2021 12:59:20 +0300
Date: Fri, 18 Jun 2021 12:59:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <YMxueLOhlXjy1ZRH@smile.fi.intel.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslFSOrnUc5b+zP@smile.fi.intel.com>
 <20210618035340.GA31659@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618035340.GA31659@aspeedtech.com>
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

On Fri, Jun 18, 2021 at 11:53:41AM +0800, Jamin Lin wrote:
> The 06/17/2021 10:33, Andy Shevchenko wrote:
> > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:

...

> > > + *
> > > + *  This program is free software; you can redistribute it and/or modify
> > > + *  it under the terms of the GNU General Public License version 2 as
> > > + *  published by the Free Software Foundation.
> > 
> > SPDX covers this.
> >
> Will change as following what do you think?
> // SPDX-License-Identifier: GPL-2.0-or-later
> /*
>  *  Aspeed I2C Interrupt Controller.
>  * Copyright (C) ASPEED Technology Inc.
>  * Ryan Chen <ryan_chen@aspeedtech.com>
>  */

Yes, something like this.

...

> > > +static const struct aspeed_i2c_base_clk i2c_base_clk[BASE_CLK_COUNT] = {
> > > +	/* name	target_freq */
> > > +	{  "base_clk0",	1000000 },	/* 1M */
> > > +	{  "base_clk1",	4000000 },	/* 4M */
> > > +	{  "base_clk2",	10000000 },	/* 10M */
> > > +	{  "base_clk3",	40000000 },	/* 40M */
> > > +};
> > 
> > Why it's not provided as the clock provider(s)?

> According to the design of ASPEED AST2600 SOC, the I2C bus is connected to PHB bus.
> The clock driver provides PHB clock and its default frequency is 100MHZ.
> AST2600 support the bus frequency of I2C from 0.1kbps to 5Mbps if PHB clock is 50MHZ.
> To meet the different bus frequency of I2C, we use this programmer to calculate the divider to 
> change the base clock.
> For example, 
> It calculates divider to change base_clock 1 to 1M to support I2C bus frequency 100KHZ
> It calculates divider to change base_clock 2 to 4M to support I2C bus frequency 400KHZ 

My question is, why don't you provide a clock provider (under drivers/clk) for
this platform and use it instead?

...

> > > +	struct clk_hw_onecell_data *onecell;
> > > +	struct clk_hw *hw;
> > > +	int err;
> > > +	u32 clk_divider = 0;
> > > +	int i, j;
> > > +	unsigned long base_freq;
> > 
> > Use reversed xmas tree order for all these blocks.
> > 
> > The rule of thumb, btw, that any comment applies to all similar places by
> > default (independently on which line it was given against).
> >
> Do you mena change as following?
> struct clk_hw_onecell_data *onecell;
> unsigned long base_freq;
> u32 clk_divider = 0;
> struct clk_hw *hw;
> int err;
> int i;
> int j;

Yes.

...

> > > +		for (i = 0; i < 0xff; i++) {
> > > +			/*
> > > +			 * i maps to div:
> > > +			 * 0x00: div 1
> > > +			 * 0x01: div 1.5
> > > +			 * 0x02: div 2
> > > +			 * 0x03: div 2.5
> > > +			 * 0x04: div 3
> > > +			 * ...
> > > +			 * 0xFE: div 128
> > > +			 * 0xFF: div 128.5
> > > +			 */
> > > +			base_freq = base_clk * 2 / (2 + i);
> > > +			if (base_freq <= i2c_base_clk[j].base_freq)
> > > +				break;
> > > +		}
> > 
> > oAre yuo sure you can't eliminate the entire for-loop? Think about it a bit,
> > please.
> >
> What do you think if we use "lookup table" instaed of above for loop?

Besides that it should be a part of clock provider, no, you may use a formula
(bit operations and so on).

...

> > > +	i2c_ic->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);

> > > +	if (IS_ERR(i2c_ic->rst)) {
> > 
> > > +		dev_dbg(&pdev->dev,
> > > +			"missing or invalid reset controller device tree entry");
> > 
> > Make it optional.
> Can I change to use "dev_err"?

What I meant here is to make the reset optional (there is even specific API for
that) and return an error in that case.

> > > +	} else {
> > > +		/* SCU I2C Reset */
> > > +		reset_control_assert(i2c_ic->rst);
> > > +		udelay(3);
> > > +		reset_control_deassert(i2c_ic->rst);
> > > +	}

...

> > > +static struct ast_i2c_timing_table aspeed_old_i2c_timing_table[] = {
> > 
> > What the ... is this for?!
> AST2600 support old/new register set for I2C controller.
> This lookup table is used to find the divisor for the specific I2C bus
> frequency for AST2600 I2C controller with old register set.
> For example
> If I2C bus frequency is 100KHZ and PHB clock is 100MHZ, it will find this table
> because 100000000/1024 < 100000
> "{ 1024, 0x00000300 | (0x5) | (0xf << 20) | (0xf << 16) | (0xf << 12) }"

Can't you derive it by formula(s)?

> > > +	/* Divisor : Base Clock : tCKHighMin : tCK High : tCK Low  */
> > > +	/* Divisor :	  [3:0] : [23: 20]   :   [19:16]:   [15:12] */

> > > +};

-- 
With Best Regards,
Andy Shevchenko


