Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 935153AE2AD
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Jun 2021 07:15:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7d5f2Mn8z306D
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Jun 2021 15:15:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7d5b3sNZz2yjY
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Jun 2021 15:15:30 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15L50DTC006012;
 Mon, 21 Jun 2021 13:00:13 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun
 2021 13:14:48 +0800
Date: Mon, 21 Jun 2021 13:14:46 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <20210621051446.GB27876@aspeedtech.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslyzUKp/7J0ncu@smile.fi.intel.com>
 <20210618035855.GB31659@aspeedtech.com>
 <YMxuz03aTijWH6uj@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YMxuz03aTijWH6uj@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15L50DTC006012
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

The 06/18/2021 10:00, Andy Shevchenko wrote:
> On Fri, Jun 18, 2021 at 11:58:55AM +0800, Jamin Lin wrote:
> > The 06/17/2021 10:36, Andy Shevchenko wrote:
> > > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> > > > Add i2c new driver to support new register set for AST2600.
> > > > AST2600 support three modes for data transfer which are
> > > > byte mode, buffer mode and dma mode, respectively.
> > > > The global driver of i2c is used to set the new register
> > > > mode and define the base clock frequency
> > > > of baseclk_1~baseclk_4.
> 
> > >  - shrink the code base by at least ~15% (it's possible), i.e. -200 LOCs
> > Can you describe it more detail?
> > Do you mean I should separate the patch file to fix size limitation? 
> 
> No. Based on my brief review you introduce to many redundant LOCs (lines of
> code). Remove them, refactor the code, make it small and neat and easy to read
> and understand. It is possible to achieve!
>
Will fix
Thanks
> > >  - rethink how you do calculations and bit operations
> > >  - better code style
> > >
> > Thanks for your review and very good suggestion
> > I will update them and sent patch again.
> > By the way, I received test failed email from Robot due to compiling
> > warning. I will fix them, too.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
