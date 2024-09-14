Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53D9791D4
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Sep 2024 17:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5Zwl2x26z2yVX
	for <lists+linux-aspeed@lfdr.de>; Sun, 15 Sep 2024 01:34:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726328068;
	cv=none; b=Fu0SZNJ57LzzxKAOLxDj5cpvSuPA1C04kuWOlKlaq2RiI9laHCbjBp+icLIWkTLYP5fzKow3HUTDp5DQ9+3s7Qdg1rqYWANJi3LDB3Q3Wzdwn7LjhCZK0XAv2eA22eDyH78rp8PIv2GDvo82GhbC92Iqu1ypy449x0eOn2+/aLBVa+7xQYKsTfYlGjIyOcF14qG0/RZpD4ntNzqmOBauQvKfzbpoInHdtrltabPwB5tLrPKy+6NaHtGEzr+dBCr/txyHFQp9qdBHO2lP2qMtFd6DHuX+vG3Jih0DDPog42nnOHKWBA/Lg57/9Ulz7fgv+EuMbBZVJbxRvVFMuFBKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726328068; c=relaxed/relaxed;
	bh=rJ43pkR1TDPg2GHpxs4NP8t1goTABs2RAt0syjIR0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaxbRYOa2zPrbO6qC58Ax+3UIwKavz59k2/Bd0eGYEcbkkl9jGYBKbBLtGaUsC+p2aZS5Xu/bB3Z3fClc2zYNRkaXDGJTH4amwUj69QEDB534x/6g+OMOd5ZD/xH/TP9Vi3NiuTvLGeSKnwA1g10DrMM7CIzv067T5SpySCko6ffPcHn5UGcl7S2z7C/EjEfGDIQMPlcgZZMtCsLnXlLBVVwPO4vfsiqAVLVWL3kyAYy89HI3Gp1SJNApgzdUZzgwf9rJgLFRWJFDL+rzOv9GVnYxz/TM5ZNlhr+umhuTE25fucWrISCo5ZFq9YIBmGeLyD5jamn2HDXS7kNgHoPyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DstZpE9L; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DstZpE9L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5Zwf6RkXz2xrJ
	for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Sep 2024 01:34:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726328068; x=1757864068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QBOVB0yM2vWg5VsUrg726BxZNDRJISV0VOA08vKcut4=;
  b=DstZpE9LjzAtnOltlGwLQJnjuDevbEBs8GQeAO1Z9YLoGrRTXXy0jIEe
   OkPcGffC5Y/Ifq6C7D2yd2QKG4l3Cqq86rw/9jgIDRH+K3JlgKwoRJxwT
   Kgs5Qf4iJB4n7f75lIz7AeHUlOFzOHMi/Lha83ucy3uqN8EZhSXLgBo8k
   BF+SuEcZNvJHIvbyJdOYLPLVR6bwJ2KfoLMdu5oMu5lHgLhzrCu0b7rwU
   SzacUufzMODzl41E1JJLRCDipZcUK6c+vj7bNv+QB2rm7opRdXtN+4zap
   lTt7peVn9z5JJkhCV3P2LoYnSTBiUJBCVVirhlSACQV3KSv0Lqfbw+dgb
   g==;
X-CSE-ConnectionGUID: 8BFDOeqERwCKRqFa2Ww9Gw==
X-CSE-MsgGUID: +yc5wy88SmWdGfFzgv30dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42695728"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="42695728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 08:34:10 -0700
X-CSE-ConnectionGUID: bxZoZih5SFOFijIVQ5phng==
X-CSE-MsgGUID: txFGEYR2TWmI7oVjMJY0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72808096"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2024 08:34:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spUmh-0007ta-20;
	Sat, 14 Sep 2024 15:34:03 +0000
Date: Sat, 14 Sep 2024 23:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	Peter.Yin@quantatw.com
Subject: Re: [PATCH v3 5/6] gpio: aspeed: Change the macro to support
 deferred probe
Message-ID: <202409142334.UEVN1oRP-lkp@intel.com>
References: <20240913074325.239390-6-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913074325.239390-6-billy_tsai@aspeedtech.com>
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
[also build test WARNING on linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240913-154911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240913074325.239390-6-billy_tsai%40aspeedtech.com
patch subject: [PATCH v3 5/6] gpio: aspeed: Change the macro to support deferred probe
config: arm-randconfig-003-20240914 (https://download.01.org/0day-ci/archive/20240914/202409142334.UEVN1oRP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142334.UEVN1oRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142334.UEVN1oRP-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
>> WARNING: modpost: drivers/gpio/gpio-aspeed: section mismatch in reference: aspeed_gpio_driver+0x0 (section: .data) -> aspeed_gpio_probe (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
