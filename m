Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B746878E
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Dec 2021 21:47:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J61w71r3Qz2yX8
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Dec 2021 07:47:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J61w31Rvxz2yHM
 for <linux-aspeed@lists.ozlabs.org>; Sun,  5 Dec 2021 07:47:09 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="300528983"
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; d="scan'208";a="300528983"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2021 12:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; d="scan'208";a="598478173"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2021 12:46:01 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mtbuz-000JQc-0i; Sat, 04 Dec 2021 20:46:01 +0000
Date: Sun, 5 Dec 2021 04:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Howard Chiu <howard10703049@gmail.com>, robh+dt@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] ARM: dts: aspeed: Adding Facebook Bletchley BMC
Message-ID: <202112050427.TQfPqAXr-lkp@intel.com>
References: <20211202091303.979044-1-howard.chiu@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202091303.979044-1-howard.chiu@quantatw.com>
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
Cc: kbuild-all@lists.01.org, Howard Chiu <howard.chiu@quantatw.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Howard,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on soc/for-next]
[also build test ERROR on v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Howard-Chiu/ARM-dts-aspeed-Adding-Facebook-Bletchley-BMC/20211202-171524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: arm-randconfig-c002-20211202 (https://download.01.org/0day-ci/archive/20211205/202112050427.TQfPqAXr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4c77c422c22eee6a98c7e5f25325ab535a06c4c5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Howard-Chiu/ARM-dts-aspeed-Adding-Facebook-Bletchley-BMC/20211202-171524
        git checkout 4c77c422c22eee6a98c7e5f25325ab535a06c4c5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:810.1-5 Label or path pwm not found
>> Error: arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:820.1-6 Label or path tach not found
>> FATAL ERROR: Syntax error parsing input tree

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
