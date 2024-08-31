Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0682966F22
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 05:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wwgkr1TtQz30V2
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 13:40:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725075601;
	cv=none; b=eO3uflzvzAVFOROamrwtP8n8OxgVPHYgm3InJ6jTTn1Ldhhv7+uIjhuVGAa9ezdeYRq/J1cRtkKwl5ZWAW+ouVRWO5Yq6R2Y1gypOnyIKDzU82Gxp0+/4svzPE09H4Hs7quJxUaxI/K1iVMJIukrt/1HTa8KiZFgJju/u3zwT1OhRvBbFtH+7qQqjXA5TEGox01xO0IScHSs2nkxZym3eiwjr2gyQ5u2NakQePskh71JE5eDnqGgRiaZ8R2yt5OV6CkybHLGgrlZNLK/V7UqNJRoUGEGXF3Ede0fDIAGHiQ26hy0Gm/NNBVCu5m2QLsS6IxS48ypoRfKWaui0DJERg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725075601; c=relaxed/relaxed;
	bh=g+BTqZ5/p7UflQ/mPXMy2diry3j+WNQR0P4CGVgCkws=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Mj6mrOyg9pS1fIAS+kr77y1O8sXPGHePgE9H/eshhGPFpqorIX5Pk1yZ4t6Kkek1K0xEQ88qsIfVjFy3jyVGQQel2t9zdg8yWOp7yLyz3HdY0wJoJndYLpYZ28EjGkcK+wSuCb6TYxJ2cEaTF6mcw4NfmmAwjGQeTx7kEod0K0oZYXf7KxmxYRtHwmHyPpGwU+lo/P9GiMk+opRTwJHZZtbeyYL/XQngy7amSnV1V1aVntN7OnDEqCugUu9nwXM5S2H02/mNpcRw8fCLpfkT2XH9lI6IKIy8erxsDhmq5bpqxwv9L8wQWRsD47hM59DtoMpagVToh+SwVlDVmHrPLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PLqt9g0y; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PLqt9g0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wwgkl6xsgz2yXs
	for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2024 13:39:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725075600; x=1756611600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3vRu46hlWxy6N2bSPsweS01OPMGvsArMoRLzr9AZOA=;
  b=PLqt9g0yPqjyUqoZ4/Odr6Dy0Mdl8tW2WNRMcNvUhoApYigsn8z3dIuS
   XuQ3Blrnd0IVMgkqh8LY8uE7cBg/lS63af5/alF0pSVXmigBb6WSVb8pg
   GILYKoJ3/QGIe3QBuxXTrD4zL4aIUiif+bcC+qKAxC0/q0xb94vvo/frH
   /7CfCdxh+oyJjE9Zp7CH+A7uisJMurRL7FkMj0nJMggVmTRJkh0JzgzEG
   ZJMTW5/TDslDdapX+bzzFjQn9GzLntCxASf2qaFh6FTJqH1/ar09KtHS6
   1MJWK6NcQRXXLk/wijmG0Te1SmvtlsvJiBm4nsmLUOpUHhd/a8p2ZKUo0
   Q==;
X-CSE-ConnectionGUID: VKgmaLLEROKTzKC77iNIeg==
X-CSE-MsgGUID: Bq3YcVjcR+qyE26fwGlpEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23592799"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="23592799"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 20:39:54 -0700
X-CSE-ConnectionGUID: e3zhyya4TkGgJU8661giWg==
X-CSE-MsgGUID: FVPujpNEQdiXXGkrmCT8Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68740810"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2024 20:39:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skExj-0002KF-1g;
	Sat, 31 Aug 2024 03:39:43 +0000
Date: Sat, 31 Aug 2024 11:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 4/4] gpio: aspeed: Support G7 Aspeed gpio controller
Message-ID: <202408311104.T3i0AxEf-lkp@intel.com>
References: <20240830034047.2251482-5-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-5-billy_tsai@aspeedtech.com>
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
patch link:    https://lore.kernel.org/r/20240830034047.2251482-5-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 4/4] gpio: aspeed: Support G7 Aspeed gpio controller
config: openrisc-randconfig-r131-20240830 (https://download.01.org/0day-ci/archive/20240831/202408311104.T3i0AxEf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408311104.T3i0AxEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311104.T3i0AxEf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpio/gpio-aspeed.c:1181:26: sparse: sparse: symbol 'aspeed_g4_llops' was not declared. Should it be static?
>> drivers/gpio/gpio-aspeed.c:1215:26: sparse: sparse: symbol 'aspeed_g7_llops' was not declared. Should it be static?

vim +/aspeed_g7_llops +1215 drivers/gpio/gpio-aspeed.c

  1214	
> 1215	struct aspeed_gpio_llops aspeed_g7_llops = {
  1216		.copro_request = NULL,
  1217		.copro_release = NULL,
  1218		.reg_bits_set = aspeed_g7_reg_bits_set,
  1219		.reg_bits_read = aspeed_g7_reg_bits_read,
  1220	};
  1221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
