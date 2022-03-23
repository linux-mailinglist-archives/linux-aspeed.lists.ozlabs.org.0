Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 006424E4BC8
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Mar 2022 05:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNZd86d5qz2xWc
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Mar 2022 15:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hmg+VTmW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hmg+VTmW; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNZd05xprz2xTs
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Mar 2022 15:09:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648008597; x=1679544597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FrzGS17QkT0C68ifo1QFYnbnGDIcFo2ZdF9OFfitl38=;
 b=Hmg+VTmWJWMxaXpMexUDulURJPxJWaFLSdP7LMwaiSWakoFK0/teAUqs
 NHKZ2TxfSX5Q+GHovODk5/GJyKnxo/Df7XBN5OR05Wb74Kui1l7qDOBYl
 lwCDNHmj7ndTQPLSKOr/H750RUSg57OE5iRLqV2ZUp63wymA6IT+os+fI
 1i/yRPxRSj9ZyWFucEFik4SAy9+VfJWll1sgpPz4cwQfLST+GpGdO4cLy
 8c+r7hXtUJch9qhg03q0e9gulhvxZvxIIqiggUHsyiJ3Ab1+aOF0ldlxG
 c3VTi+bzX0oDQ+e+8sVlNrj9olFfc2J5OMrBl5y3N1VQswgVQf5g66KgC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="245489495"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="245489495"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 21:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="515636423"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 22 Mar 2022 21:08:48 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWsIh-000JdP-IE; Wed, 23 Mar 2022 04:08:47 +0000
Date: Wed, 23 Mar 2022 12:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, BMC-SW@aspeedtech.com,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c:aspeed:support ast2600 i2c new register mode
 driver
Message-ID: <202203231247.KCb0uKWD-lkp@intel.com>
References: <20220323004009.943298-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323004009.943298-3-ryan_chen@aspeedtech.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi ryan_chen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on robh/for-next pza/reset/next v5.17 next-20220322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/ryan_chen/Add-ASPEED-AST2600-I2C-new-controller-driver/20220323-084205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220323/202203231247.KCb0uKWD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4fa1d6c517dfca057852514880a8e52e5da51572
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review ryan_chen/Add-ASPEED-AST2600-I2C-new-controller-driver/20220323-084205
        git checkout 4fa1d6c517dfca057852514880a8e52e5da51572
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-new-aspeed.c: In function 'aspeed_new_i2c_init':
>> drivers/i2c/busses/i2c-new-aspeed.c:1407:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1407 |         u8 i2c_count = (((u32)(i2c_bus->reg_base) & 0xFFF)/0x80);
         |                          ^


vim +1407 drivers/i2c/busses/i2c-new-aspeed.c

  1402	
  1403	static void aspeed_new_i2c_init(struct aspeed_new_i2c_bus *i2c_bus)
  1404	{
  1405		struct platform_device *pdev = to_platform_device(i2c_bus->dev);
  1406		u32 fun_ctrl = AST_I2CC_BUS_AUTO_RELEASE | AST_I2CC_MASTER_EN;
> 1407		u8 i2c_count = (((u32)(i2c_bus->reg_base) & 0xFFF)/0x80);
  1408	
  1409		/* I2C Reset */
  1410		writel(0, i2c_bus->reg_base + AST_I2CC_FUN_CTRL);
  1411	
  1412		if (of_property_read_bool(pdev->dev.of_node, "multi-master"))
  1413			i2c_bus->multi_master = true;
  1414		else
  1415			fun_ctrl |= AST_I2CC_MULTI_MASTER_DIS;
  1416	
  1417		/* AST2600 i2c10 need to overcome sda glich with is flag. */
  1418		if (i2c_count == 0xA)
  1419			fun_ctrl |= AST_I2CC_SDA_DRIVE_1T_EN;
  1420	
  1421		/* Enable Master Mode */
  1422		writel(fun_ctrl, i2c_bus->reg_base + AST_I2CC_FUN_CTRL);
  1423		/* disable slave address */
  1424		writel(0, i2c_bus->reg_base + AST_I2CS_ADDR_CTRL);
  1425	
  1426		/* Set AC Timing */
  1427		writel(aspeed_select_i2c_clock(i2c_bus), i2c_bus->reg_base + AST_I2CC_AC_TIMING);
  1428	
  1429		/* Clear Interrupt */
  1430		writel(0xfffffff, i2c_bus->reg_base + AST_I2CM_ISR);
  1431	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
