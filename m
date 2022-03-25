Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210B4E6FC3
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 10:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPx4P0KNWz30CS
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 20:04:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPnB8Zxs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jPnB8Zxs; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPx4H5BZ7z3050
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 20:04:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648199087; x=1679735087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WbskBVThk2A3f0bek82d4zhtf8YdkGCFyymR0cmcN2k=;
 b=jPnB8Zxs/3uFxitvdwWg5ew7t0uUVK5/eVJMU7z59kU9+krWMlhxaA5k
 ASZUP22kZ23ZV2cQ50rs8VNv/0iYM2sJ9i/sSXm3r1wxFkYBzQDDJbl7t
 KBofjBbLvOULl5c+JOXDJ7H5mEqOjpon3Jhs7GA1Aq7qT23cWRPxBs6x7
 7DplpN9gtwgqgbladgA7hmSlFuYiuaac4X1Ob/kIZaf7MeE7fKQsR6gdl
 qnYqOrAZHU2EaJ8+8N++MGNG8S618AsOPMrCPQCY9RlmKL8Vx8V1b14Nb
 RLj9nKcYayy4+cwuMS4cPf88VyBpxo6BVa//3EZboLWh28m5OsSEXoOvU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="246068159"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="246068159"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 02:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="825977531"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2022 02:03:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nXfqo-000Lyi-70; Fri, 25 Mar 2022 09:03:18 +0000
Date: Fri, 25 Mar 2022 17:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Howard Chiu <howard_chiu@aspeedtech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ARM: dts: aspeed: ast2600-evb: Support KVM
Message-ID: <202203251620.taj6u6mo-lkp@intel.com>
References: <HK0PR06MB2307383743B9AE1D714A899BE61A9@HK0PR06MB2307.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB2307383743B9AE1D714A899BE61A9@HK0PR06MB2307.apcprd06.prod.outlook.com>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Howard,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.17]
[cannot apply to joel-aspeed/for-next next-20220324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Howard-Chiu/ARM-dts-aspeed-ast2600-evb-Support-KVM/20220325-103839
base:    f443e374ae131c168a065ea1748feac6b2e76613
config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20220325/202203251620.taj6u6mo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/9037b86779cd7616b378b3bafd1f32b4c862f0bd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Howard-Chiu/ARM-dts-aspeed-ast2600-evb-Support-KVM/20220325-103839
        git checkout 9037b86779cd7616b378b3bafd1f32b4c862f0bd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed-ast2600-evb.dts:322.1-7 Label or path video not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
