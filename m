Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7C3AE2A3
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Jun 2021 07:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7d4S6N5Kz306D
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Jun 2021 15:14:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7d4P12Lbz2yjJ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Jun 2021 15:14:26 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15L4wwS9005360;
 Mon, 21 Jun 2021 12:58:58 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun
 2021 13:13:33 +0800
Date: Mon, 21 Jun 2021 13:13:31 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <20210621051330.GA27876@aspeedtech.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslFSOrnUc5b+zP@smile.fi.intel.com>
 <20210618035340.GA31659@aspeedtech.com>
 <YMxueLOhlXjy1ZRH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YMxueLOhlXjy1ZRH@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15L4wwS9005360
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
 Yicong Yang <yangyicong@hisilicon.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, "open
 list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.de>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Khalil Blaiech <kblaiech@mellanox.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
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

The 06/18/2021 09:59, Andy Shevchenko wrote:
> On Fri, Jun 18, 2021 at 11:53:41AM +0800, Jamin Lin wrote:
> > The 06/17/2021 10:33, Andy Shevchenko wrote:
> > > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> 
> ...
> 
> > > > + *
> > > > + *  This program is free software; you can redistribute it and/or modify
> > > > + *  it under the terms of the GNU General Public License version 2 as
> > > > + *  published by the Free Software Foundation.
> > > 
> > > SPDX covers this.
> > >
> > Will change as following what do you think?
> > // SPDX-License-Identifier: GPL-2.0-or-later
> > /*
> >  *  Aspeed I2C Interrupt Controller.
> >  * Copyright (C) ASPEED Technology Inc.
> >  * Ryan Chen <ryan_chen@aspeedtech.com>
> >  */
> 
> Yes, something like this.
> 
> ...
> 
> > > > +static const struct aspeed_i2c_base_clk i2c_base_clk[BASE_CLK_COUNT] = {
> > > > +	/* name	target_freq */
> > > > +	{  "base_clk0",	1000000 },	/* 1M */
> > > > +	{  "base_clk1",	4000000 },	/* 4M */
> > > > +	{  "base_clk2",	10000000 },	/* 10M */
> > > > +	{  "base_clk3",	40000000 },	/* 40M */
> > > > +};
> > > 
> > > Why it's not provided as the clock provider(s)?
> 
Will try it
> > According to the design of ASPEED AST2600 SOC, the I2C bus is connected to PHB bus.
> > The clock driver provides PHB clock and its default frequency is 100MHZ.
> > AST2600 support the bus frequency of I2C from 0.1kbps to 5Mbps if PHB clock is 50MHZ.
> > To meet the different bus frequency of I2C, we use this programmer to calculate the divider to 
> > change the base clock.
> > For example, 
> > It calculates divider to change base_clock 1 to 1M to support I2C bus frequency 100KHZ
> > It calculates divider to change base_clock 2 to 4M to support I2C bus frequency 400KHZ 
> 
> My question is, why don't you provide a clock provider (under drivers/clk) for
> this platform and use it instead?
Will try it
> 
> ...
> 
> > > > +	struct clk_hw_onecell_data *onecell;
> > > > +	struct clk_hw *hw;
> > > > +	int err;
> > > > +	u32 clk_divider = 0;
> > > > +	int i, j;
> > > > +	unsigned long base_freq;
> > > 
> > > Use reversed xmas tree order for all these blocks.
> > > 
> > > The rule of thumb, btw, that any comment applies to all similar places by
> > > default (independently on which line it was given against).
> > >
> > Do you mena change as following?
> > struct clk_hw_onecell_data *onecell;
> > unsigned long base_freq;
> > u32 clk_divider = 0;
> > struct clk_hw *hw;
> > int err;
> > int i;
> > int j;
> 
> Yes.
> 
> ...
> 
> > > > +		for (i = 0; i < 0xff; i++) {
> > > > +			/*
> > > > +			 * i maps to div:
> > > > +			 * 0x00: div 1
> > > > +			 * 0x01: div 1.5
> > > > +			 * 0x02: div 2
> > > > +			 * 0x03: div 2.5
> > > > +			 * 0x04: div 3
> > > > +			 * ...
> > > > +			 * 0xFE: div 128
> > > > +			 * 0xFF: div 128.5
> > > > +			 */
> > > > +			base_freq = base_clk * 2 / (2 + i);
> > > > +			if (base_freq <= i2c_base_clk[j].base_freq)
> > > > +				break;
> > > > +		}
> > > 
> > > oAre yuo sure you can't eliminate the entire for-loop? Think about it a bit,
> > > please.
> > >
> > What do you think if we use "lookup table" instaed of above for loop?
> 
> Besides that it should be a part of clock provider, no, you may use a formula
> (bit operations and so on).
> 
Will provide a formula
> ...
> 
> > > > +	i2c_ic->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> 
> > > > +	if (IS_ERR(i2c_ic->rst)) {
> > > 
> > > > +		dev_dbg(&pdev->dev,
> > > > +			"missing or invalid reset controller device tree entry");
> > > 
> > > Make it optional.
> > Can I change to use "dev_err"?
> 
> What I meant here is to make the reset optional (there is even specific API for
> that) and return an error in that case.
> 
> > > > +	} else {
> > > > +		/* SCU I2C Reset */
> > > > +		reset_control_assert(i2c_ic->rst);
> > > > +		udelay(3);
> > > > +		reset_control_deassert(i2c_ic->rst);
> > > > +	}
> 
> ...
> 
> > > > +static struct ast_i2c_timing_table aspeed_old_i2c_timing_table[] = {
> > > 
> > > What the ... is this for?!
> > AST2600 support old/new register set for I2C controller.
> > This lookup table is used to find the divisor for the specific I2C bus
> > frequency for AST2600 I2C controller with old register set.
> > For example
> > If I2C bus frequency is 100KHZ and PHB clock is 100MHZ, it will find this table
> > because 100000000/1024 < 100000
> > "{ 1024, 0x00000300 | (0x5) | (0xf << 20) | (0xf << 16) | (0xf << 12) }"
> 
> Can't you derive it by formula(s)?
> 
Will provide formula(s)
> > > > +	/* Divisor : Base Clock : tCKHighMin : tCK High : tCK Low  */
> > > > +	/* Divisor :	  [3:0] : [23: 20]   :   [19:16]:   [15:12] */
> 
> > > > +};
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
