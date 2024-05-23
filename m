Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E55988CD2E2
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 14:56:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZBk/B4H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlSg01rxwz3vkn
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 22:49:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZBk/B4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlSfp3xT4z3vdx;
	Thu, 23 May 2024 22:49:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716468564; x=1748004564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e1/5ituq3BLc4p6hJQCp0rH729ZvAK/JPQCVOmmZpdg=;
  b=PZBk/B4HMaB491GhXr9X6XolB/gkl0d6ynK4XeB33wPxcNF5qnr95Chs
   PWF7NOK0kcFmESWtIvK1YsSqBrVwm5NwF38mbpHVJUvRWNEqEgJ1OoqRs
   gDg1W5jbkHJNJMq0DgJ1Yo4Y5mxTlE+ctYUCJvIx8e8LP33kaxmTM5O6B
   +0AxbTYS5NZiHAXKCqPhqbvP7eLBmKog7mdgx17n1jMGb2raX+Uf7vV35
   NjfpMFhN6WzdngIPY9849omXR3FeN3pjAMcoWhSr+Np5Zl/ol2vRvy9pe
   Luet25ZT9hgOpS02j1FC79Syn1aorrHH0DdNKaBQK4564BzU4lTX7UgD/
   Q==;
X-CSE-ConnectionGUID: 3dJ33gllRqOB4GIKHn3oKw==
X-CSE-MsgGUID: iik9zJ3tR6e9dBjgoTtF0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23915453"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="23915453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 05:49:16 -0700
X-CSE-ConnectionGUID: SjSzpwZNR5OHnoz4eUBT7g==
X-CSE-MsgGUID: ZdOLjEcxRHGI3Jt0zs7NxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="56886990"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 May 2024 05:49:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA7sZ-0002rl-2g;
	Thu, 23 May 2024 12:49:08 +0000
Date: Thu, 23 May 2024 20:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Message-ID: <202405232008.olE9azVd-lkp@intel.com>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522192524.3286237-18-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Eddie,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.9 next-20240523]
[cannot apply to robh/for-next broonie-spi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/spi-dt-bindings-Document-the-IBM-FSI-attached-SPI-controller/20240523-033334
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240522192524.3286237-18-eajames%40linux.ibm.com
patch subject: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
config: arm-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405232008.olE9azVd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts:13.2-37 Properties must precede subnodes
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
