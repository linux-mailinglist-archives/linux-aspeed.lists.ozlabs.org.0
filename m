Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188145D659
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 09:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0BBg5yRLz3035
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 19:39:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0BBc1DlBz2xrP
 for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Nov 2021 19:39:34 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="298876080"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="298876080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 00:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="510212396"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 25 Nov 2021 00:38:29 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqAGy-00063r-JV; Thu, 25 Nov 2021 08:38:28 +0000
Date: Thu, 25 Nov 2021 16:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.u>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] ARM: aspeed: Add secure boot controller support
Message-ID: <202111251600.hBmyvSD0-lkp@intel.com>
References: <20211117035106.321454-4-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117035106.321454-4-joel@jms.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Paul Menzel <pmenzel@molgen.mpg.de>, kbuild-all@lists.01.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on soc/for-next rockchip/for-next shawnguo/for-next v5.16-rc2 next-20211125]
[cannot apply to arm/for-next arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Joel-Stanley/ARM-aspeed-Secure-Boot-Controller-support/20211117-115258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: sparc64-randconfig-s032-20211118 (https://download.01.org/0day-ci/archive/20211125/202111251600.hBmyvSD0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/5057997868102d26f0af9c8d769a4809a3bd60be
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Joel-Stanley/ARM-aspeed-Secure-Boot-Controller-support/20211117-115258
        git checkout 5057997868102d26f0af9c8d769a4809a3bd60be
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=sparc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/soc/aspeed/aspeed-socinfo.c:166:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/soc/aspeed/aspeed-socinfo.c:166:38: sparse:     expected void *base
   drivers/soc/aspeed/aspeed-socinfo.c:166:38: sparse:     got void [noderef] __iomem *
>> drivers/soc/aspeed/aspeed-socinfo.c:171:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/soc/aspeed/aspeed-socinfo.c:171:46: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/aspeed/aspeed-socinfo.c:171:46: sparse:     got void *
>> drivers/soc/aspeed/aspeed-socinfo.c:173:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/soc/aspeed/aspeed-socinfo.c:173:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/aspeed/aspeed-socinfo.c:173:25: sparse:     got void *base

vim +166 drivers/soc/aspeed/aspeed-socinfo.c

   126	
   127	static int __init aspeed_socinfo_init(void)
   128	{
   129		struct soc_device_attribute *attrs;
   130		struct soc_device *soc_dev;
   131		struct device_node *np;
   132		void __iomem *reg;
   133		bool has_chipid = false;
   134		bool has_sbe = false;
   135		u32 siliconid;
   136		u32 chipid[2];
   137		const char *machine = NULL;
   138	
   139		np = of_find_compatible_node(NULL, NULL, "aspeed,silicon-id");
   140		if (!of_device_is_available(np)) {
   141			of_node_put(np);
   142			return -ENODEV;
   143		}
   144	
   145		reg = of_iomap(np, 0);
   146		if (!reg) {
   147			of_node_put(np);
   148			return -ENODEV;
   149		}
   150		siliconid = readl(reg);
   151		iounmap(reg);
   152	
   153		/* This is optional, the ast2400 does not have it */
   154		reg = of_iomap(np, 1);
   155		if (reg) {
   156			has_chipid = true;
   157			chipid[0] = readl(reg);
   158			chipid[1] = readl(reg + 4);
   159			iounmap(reg);
   160		}
   161		of_node_put(np);
   162	
   163		/* AST2600 only */
   164		np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
   165		if (of_device_is_available(np)) {
 > 166			void *base = of_iomap(np, 0);
   167			if (!base) {
   168				of_node_put(np);
   169				return -ENODEV;
   170			}
 > 171			security_status = readl(base + SEC_STATUS);
   172			has_sbe = true;
 > 173			iounmap(base);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
