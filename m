Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB07AB9E2
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Sep 2023 21:10:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlI2gvzK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RshgT6bpjz3cBh
	for <lists+linux-aspeed@lfdr.de>; Sat, 23 Sep 2023 05:10:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlI2gvzK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Sat, 23 Sep 2023 05:10:39 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RshgM16smz3c2k
	for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Sep 2023 05:10:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695409839; x=1726945839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYJY4FDZFMc6MaW1N7f842npIFM179p1eBa4lIdfLwo=;
  b=BlI2gvzKi4fEUniptPoU7PI2q4jVseTK2XzVeV8ihklEMGIpyxe141kI
   BbJden6pp3ngHaLySR/fj+mUJnSm7k1z0Dl8gA6TYQ2UVcQ5NBdiGqg3i
   jtVh6HqRII/I1Yf0S2A3yog8FPkBasp9nX57YajjbFFHxwNR3ljGt1uzn
   ybXTzTwnqM1CBp51EeXVcUGPqjMG6olXtNYVGiYnGHBzfc9b5P/xurc1V
   JNwgVVIr4Xg+Adm2ZYqFl6g/Iz1yiT4ndw0Qvg3Y6SahNqiCXw7CaCk+8
   SQ5KQzApoO0+HfqCM41QFKlWWc/kLHu36J+aQ+bg+cikiNJcWy25MJn67
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="380819089"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="380819089"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 12:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750939180"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="750939180"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2023 12:09:16 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjlWc-0001BA-2l;
	Fri, 22 Sep 2023 19:09:14 +0000
Date: Sat, 23 Sep 2023 03:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom
 devices
Message-ID: <202309230217.cHc3qLuk-lkp@intel.com>
References: <20230922064127.283625-2-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922064127.283625-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/ARM-dts-aspeed-yosemite4-Add-i2c-mux-eeprom-devices/20230922-144218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20230922064127.283625-2-Delphine_CC_Chiu%40wiwynn.com
patch subject: [PATCH v1 1/1] ARM: dts: aspeed: yosemite4: Add i2c-mux/eeprom devices
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230923/202309230217.cHc3qLuk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230217.cHc3qLuk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230217.cHc3qLuk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1229.1-7 Label or path jtag1 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
