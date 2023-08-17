Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42D77FE3C
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Aug 2023 20:59:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSoO+bhs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRZ6y5vjtz3cGc
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 04:59:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSoO+bhs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 18 Aug 2023 04:59:13 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRZ6n67bdz3byX
	for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Aug 2023 04:59:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692298754; x=1723834754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7yo3tNXh31iOl1DRSqLjn8gRj2unBq2YatRzwFJUzDI=;
  b=fSoO+bhsV5vIZgbQJOltktJ26kor59rLCcp766AFkO13oNoLWa1cVqZJ
   Mnr7hxASNkTIEh70jrqS+LpmxDMxPNNnrHsHgVMX2O2uwy5lkN9Faduak
   OYetm5AndN4j08rjxMlt2aV6NUdLMys68pNbpIr8yaUocbnPAiy2haXk5
   pD7SpKLtzIZZQr//OtjC6US1abJJTjpmZiBkM5WF3OFj/H3n3hf1JPH4y
   quxdE8wUcQzajj8BuJl+FtH6Ipsdp4ONWziknjIbvq+ff0aFGdAX468Eu
   WJ+7iFEZCK/7cGZk8adNvXEBbKagMcIBy6+0ig5vyj/HbhI6K/3sQwsEs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="371805532"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371805532"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 11:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734766972"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="734766972"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 11:57:51 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWiBp-0001Ox-34;
	Thu, 17 Aug 2023 18:57:49 +0000
Date: Fri, 18 Aug 2023 02:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
	corbet@lwn.net, thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, patrick@stwcx.xyz
Subject: Re: [PATCH v7 2/2] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED
 g6 PWM/Fan tach
Message-ID: <202308180218.lgWU1tp1-lkp@intel.com>
References: <20230817120029.221484-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817120029.221484-3-billy_tsai@aspeedtech.com>
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-hwmon-Support-Aspeed-g6-PWM-TACH-Control/20230817-200427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230817120029.221484-3-billy_tsai%40aspeedtech.com
patch subject: [PATCH v7 2/2] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach
config: powerpc-randconfig-r011-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180218.lgWU1tp1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180218.lgWU1tp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180218.lgWU1tp1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/aspeed-g6-pwm-tach.c:431:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     431 |         int ret, count;
         |             ^
   1 warning generated.


vim +/ret +431 drivers/hwmon/aspeed-g6-pwm-tach.c

   426	
   427	static int aspeed_tach_create_fan(struct device *dev,
   428					  struct aspeed_pwm_tach_data *priv)
   429	{
   430		u8 *tach_ch;
 > 431		int ret, count;
   432	
   433		count = of_property_count_u8_elems(dev->of_node, "aspeed,fan-tach-ch");
   434		if (count < 1)
   435			return -EINVAL;
   436		tach_ch = devm_kcalloc(dev, count, sizeof(*tach_ch), GFP_KERNEL);
   437		if (!tach_ch)
   438			return -ENOMEM;
   439		ret = of_property_read_u8_array(dev->of_node, "aspeed,fan-tach-ch",
   440						tach_ch, count);
   441	
   442		aspeed_present_fan_tach(priv, tach_ch, count);
   443	
   444		return 0;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
