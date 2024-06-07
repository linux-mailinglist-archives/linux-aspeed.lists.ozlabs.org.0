Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7D8FFFD6
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Jun 2024 11:45:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QmLNjru1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwbsJ1R3Nz2yvp
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Jun 2024 19:45:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QmLNjru1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vwbs42m6Qz30VT
	for <linux-aspeed@lists.ozlabs.org>; Fri,  7 Jun 2024 19:44:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717753498; x=1749289498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=voo+058tPlgVMfI1TZTTzr4t/Aowjlk+5Zt2NGckp00=;
  b=QmLNjru1G6Eaw9VWDIOC2iKpQ30Nc303nP6Fbcaa2RmcsKSmMxpnnI+W
   DDydSToJyRCqUl/4cJd7OUjvQfb4eH01FPUhjuFoyUcpMF33eTzVqlFr4
   btqx9DQKKaME8TMhyENGC/yAidADQty4VyRblQpjUoMvJ/VL7p8BEy0Jj
   hQV0X7LYELjBxFELbPVnQe4C1SNvfHPRpAGoyki33mU6Ibjho+qzx4U8t
   5y6lKb/hVptTlLsgMjWDmf3CxgBZY9m2viAdFD0Rl+5XoMW68gF7uoQha
   5Eo3dpFMbc+Ykw9oeTbpp7FRx2MgQ4hBAdO3wHdEdENuiEA5otGtSwcf+
   Q==;
X-CSE-ConnectionGUID: rGfMastJQAWvKbpK23dvwA==
X-CSE-MsgGUID: +BiL3/GFSUu6tCeauyWdSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18294761"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="18294761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 02:44:50 -0700
X-CSE-ConnectionGUID: 8ZQlJrjIRZii1uvJWoEVGA==
X-CSE-MsgGUID: UsrlsgBJRDKUnLDBbEx3qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="61472308"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2024 02:44:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFW9M-0004Z5-1b;
	Fri, 07 Jun 2024 09:44:44 +0000
Date: Fri, 7 Jun 2024 17:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH] arm: dts: aspeed: Use standard 'i2c' bus node name
Message-ID: <202406071717.2B7aM49z-lkp@intel.com>
References: <20240531193115.3814887-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531193115.3814887-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm-dts-aspeed-Use-standard-i2c-bus-node-name/20240601-033514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240531193115.3814887-1-robh%40kernel.org
patch subject: [PATCH] arm: dts: aspeed: Use standard 'i2c' bus node name
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071717.2B7aM49z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071717.2B7aM49z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:541.10-555.4: Warning (avoid_unnecessary_addr_size): /ahb/apb/bus@1e78a000/i2c@480/gpio@77: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +541 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts

36d96827f480e9 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Quan Nguyen  2022-08-17  532  
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  533  &i2c8 {
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  534  	status = "okay";
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  535  
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  536  	temperature-sensor@48 {
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  537  		compatible = "ti,tmp112";
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  538  		reg = <0x48>;
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  539  	};
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  540  
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28 @541  	gpio@77 {
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  542  		compatible = "nxp,pca9539";
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  543  		reg = <0x77>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  544  		gpio-controller;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  545  		#address-cells = <1>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  546  		#size-cells = <0>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  547  		#gpio-cells = <2>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  548  
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  549  		bmc-ocp0-en-hog {
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  550  			gpio-hog;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  551  			gpios = <7 GPIO_ACTIVE_LOW>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  552  			output-high;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  553  			line-name = "bmc-ocp0-en-n";
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  554  		};
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  555  	};
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  556  };
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  557  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
