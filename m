Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA0966EA5
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 03:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwdDL5Btbz30VP
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 11:46:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725068816;
	cv=none; b=gtcs8i4hmY6/RSaSD+9wUCs2COnf3DNC9QSvy1rAuYtKnLESKV9355KPd5x2bHe+v4Xc7rUGCRWS1SiHE2+jraGBd3DffHHznB6Epha3PawoK4VhPiNCJ4BnMYBf6YBfpjk5RHfzTQnm1U1aWQkqSPtX7JEsHDDBZqAw3QiVqcHFtYR6xl8+QmmMuymtnRN3a/pdQVvG9oonk1QuptkzXKJ+c+KSktWiO88Lui/z/jaZRYUk6Ej9f3GS0RA6vTEiK6fZnjHgkHe9BS4WwylV63Ri86QuStv897bEdbRofTV2eK/BXHEU80CYGFI4AjprpVlb9g5oEETWPT34WN0j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725068816; c=relaxed/relaxed;
	bh=Z1576DgGNBx/57jdRLf4vQFW2xEEG3bCZuuajmVtpjA=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eltzSC0n0vAHxGHnwc4LD72uxeOC584wE9R2dTuiMJ1AT+MGQKePLwYuZRIr+ybh1acNPGCmV0tXdjskz9I1uDJFumTLG04oCZnnJEMJjEkddfpZO97dvsgmwYQ/tuAq3CiAvaa0ONYk4cy4QhXaTs2QEdxQy4HowfdDrNX2QO3Dg6+NgF5bnRkr/7bfoEYs4n6sJBeLKB6bZdJ0w3E9HIU+XJPP0Jo9OC4docqvR/oXTWcVguPsxQ+Ra8mTmOXGC4LV10/LGAMHgu4U5E4KsID1EnsS5v4103xaq8fSB08cL+expf0NwRUIVrNI5zSXPiH6F4SJuXYqXUAhy6f9ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j71Vc1DV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j71Vc1DV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwdDF6xMhz30Pg
	for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2024 11:46:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725068814; x=1756604814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JH7/oxYMhrd5K0tQtkbX38c7uRzIq1POnaw6jGBwBAg=;
  b=j71Vc1DVXdNQoGQPh60sTzQmJzXVdkF0U0hoaQzfoMeAAolDj8hw26gb
   B5d6EsnH0dCbqT7WT3hbINpR/rKIl+xIyYkgjkcFQvnxtwYxJd7XXJujn
   9tynqvdRDIepn48+R71fhu5no2q1XD3XUe7L37KOiGHLpqsb/ay2yR4rp
   DVnujXvLsGT1Azbn+teBBUIb3P9jNJW1xOSffYc7Seav/8lHkXgpggvC4
   g0v0n6kjmLPrCHOTvq2hZDNafFX1JZX1TKYXPxYW2BOz/deFw5RIPQODD
   A4XT6F3mx1NJEqNlsXK9mdrIUCKeMYTtzACjJ1qD0P7zjVgRG1GibAPqI
   w==;
X-CSE-ConnectionGUID: 2vgZvhnJQ4WQwKlKuypVug==
X-CSE-MsgGUID: 82AVF3jtQjC/LkIh4F0QTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41204771"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="41204771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 18:46:47 -0700
X-CSE-ConnectionGUID: zTL1yrceTkmGa+A5aSN7Ww==
X-CSE-MsgGUID: 4Ct7P5J8SlSFEmV+B8gtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="64559992"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Aug 2024 18:46:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skDCL-0002H4-2O;
	Sat, 31 Aug 2024 01:46:41 +0000
Date: Sat, 31 Aug 2024 09:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware
 access
Message-ID: <202408310953.Z0c7NIuz-lkp@intel.com>
References: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240830-114325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240830034047.2251482-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware access
config: openrisc-randconfig-r131-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310953.Z0c7NIuz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408310953.Z0c7NIuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310953.Z0c7NIuz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-aspeed.c:1107:26: sparse: sparse: symbol 'aspeed_g4_llops' was not declared. Should it be static?

vim +/aspeed_g4_llops +1107 drivers/gpio/gpio-aspeed.c

  1106	
> 1107	struct aspeed_gpio_llops aspeed_g4_llops = {
  1108		.copro_request = aspeed_gpio_copro_request,
  1109		.copro_release = aspeed_gpio_copro_release,
  1110		.reg_bits_set = aspeed_g4_reg_bits_set,
  1111		.reg_bits_read = aspeed_g4_reg_bits_read,
  1112	};
  1113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
