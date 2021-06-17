Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9953AB17E
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Jun 2021 12:37:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5JQj6lpLz3btM
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Jun 2021 20:37:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5JQf4sBLz30Ff
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Jun 2021 20:37:14 +1000 (AEST)
IronPort-SDR: Lb2VPmb1ceamMOqQUc88lFAsd50+n6eZhyBmsxGXZKtxEfII8iakfHZuPvGL3uWVb0JuOQwbBv
 joc8ed1jPg4g==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193657826"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="193657826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 03:37:10 -0700
IronPort-SDR: 2PuCF4bAZ+esssDVmmcjwCVsseGKNTfBNg7OYii1MRpg6OfOV1PUiZnSC5HZrbj40EdeeCwvl5
 rHTKc6JGGrYw==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="404609716"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 03:37:04 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ltpON-003Hgz-VB; Thu, 17 Jun 2021 13:36:59 +0300
Date: Thu, 17 Jun 2021 13:36:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <YMslyzUKp/7J0ncu@smile.fi.intel.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617094424.27123-4-jamin_lin@aspeedtech.com>
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
 Arnd Bergmann <arnd@arndb.de>, steven_lee@aspeedtech.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> Add i2c new driver to support new register set for AST2600.
> AST2600 support three modes for data transfer which are
> byte mode, buffer mode and dma mode, respectively.
> The global driver of i2c is used to set the new register
> mode and define the base clock frequency
> of baseclk_1~baseclk_4.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  drivers/i2c/busses/Kconfig              |   11 +
>  drivers/i2c/busses/Makefile             |    1 +
>  drivers/i2c/busses/ast2600-i2c-global.c |  205 +++
>  drivers/i2c/busses/ast2600-i2c-global.h |   25 +
>  drivers/i2c/busses/i2c-new-aspeed.c     | 1796 +++++++++++++++++++++++

I commented _something_ (but read comments carefully, they will cover much
more). The overall it seems you have to:
 - shrink the code base by at least ~15% (it's possible), i.e. -200 LOCs
 - rethink how you do calculations and bit operations
 - better code style

-- 
With Best Regards,
Andy Shevchenko


