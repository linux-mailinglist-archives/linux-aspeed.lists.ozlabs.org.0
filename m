Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F4013793385
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 03:59:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YltjKxZI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgQXp2zs2z3c2L
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 11:59:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YltjKxZI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgQXg2b3Gz2ygX
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Sep 2023 11:59:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693965555; x=1725501555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fVDgQhkb2WhLhyH/xw4I3sutewUsbZlxUY73aEfjGm0=;
  b=YltjKxZISRhModNFfesjw+6jceeEYjOeC502nBs1xSrWbDpuV/cBeZo/
   2++swCAopba1Az5LKxGQeHLGATY1h/edFYROAgM9DJyNqDy9F2cEhAzNh
   TI/mGIE2L49UPR6wx2zNjYzoQ73E6U2C5L0Yp+kqh7hM40vp+w1XFhI39
   vSLpcUR8Qux5DcX81xLaA0777xvHN04QPzTfG7prywN9w/NyF1JiDuCB2
   hl1XkH931tm75pCS6beq0XNs1FETUgPF3P3TjNDdTJogUfw2ChS7Z5Ndp
   DSlXEeF/DLPVhWLQlDwsPJayVOSec3D/zhzpBM+l/j49bU9aQjweKhqGl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="361977131"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="361977131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 18:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="770555185"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="770555185"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2023 18:58:58 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdhod-0002Kt-2Q;
	Wed, 06 Sep 2023 01:58:51 +0000
Date: Wed, 6 Sep 2023 09:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Message-ID: <202309060936.2lEsdiub-lkp@intel.com>
References: <20230905062223.774871-2-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905062223.774871-2-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>, peter.yin@quantatw.com, oe-kbuild-all@lists.linux.dev
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230905]
[also build test ERROR on linus/master v6.5]
[cannot apply to robh/for-next v6.5 v6.5-rc7 v6.5-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Yin/ARM-dts-aspeed-Minerva-Add-Facebook-Minerva-AST2600-BMC/20230906-005659
base:   next-20230905
patch link:    https://lore.kernel.org/r/20230905062223.774871-2-peteryin.openbmc%40gmail.com
patch subject: [PATCH v8 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230906/202309060936.2lEsdiub-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060936.2lEsdiub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060936.2lEsdiub-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts:261.1-7 Label or path jtag1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
