Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69095A814
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 01:14:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq2GL6MMCz2yYK
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 09:14:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RYw45slz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq2GG2Wynz2xMW
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 09:14:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724282054; x=1755818054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5jrbVAdo6wAYvsEzV739oZ/MNr2YMBA+5HAAwIrmh+I=;
  b=RYw45slzYtQpXJml9+iWRaLVbstrD6aWIanaogSIzgAawTcf+Uy5VBjl
   bkDZD9tioXX6D5GqCNXYMlUd4F40K1JnYqmOjhdzo32ZPjSRn50BOYgXc
   v3iOr/usQVMbohrneR1M9QAscxtD1lFvtMSU1lrZqO7ZrR+OkMqCWM4jG
   dlm0OfASHGLVH/sxDTpg57ttsnQufQFk+olzsCvwdgsASqZ2O8C/znxAH
   KCN6LRa6VqCVK505ugN69OA1DfP5aKtaH9EXpXMeSoLqnFN8DI63SjIeK
   pErxeD4TFxwC1AQAMn1sLQlljTJUcxVevRMI3HLJLppFiKipsigFCDEIY
   A==;
X-CSE-ConnectionGUID: L46pw9arSpS9US/jTPgkyQ==
X-CSE-MsgGUID: VU0rB5pxTSePuspc0g1sww==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48066176"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="48066176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 16:14:08 -0700
X-CSE-ConnectionGUID: 3IVNMZUQSgeppVVPDSfDxw==
X-CSE-MsgGUID: 1sJH8KpESnyRhMvJMrQQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66126930"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 16:14:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sguWf-000C2W-2C;
	Wed, 21 Aug 2024 23:14:01 +0000
Date: Thu, 22 Aug 2024 07:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Message-ID: <202408220503.hxIARcuf-lkp@intel.com>
References: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240821-150951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240821070740.2378602-3-billy_tsai%40aspeedtech.com
patch subject: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408220503.hxIARcuf-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220503.hxIARcuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220503.hxIARcuf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_request':
>> drivers/gpio/gpio-aspeed-g7.c:474:48: error: passing argument 1 of 'pinctrl_gpio_request' makes pointer from integer without a cast [-Wint-conversion]
     474 |         return pinctrl_gpio_request(chip->base + offset);
         |                                     ~~~~~~~~~~~^~~~~~~~
         |                                                |
         |                                                unsigned int
   In file included from drivers/gpio/gpio-aspeed-g7.c:16:
   include/linux/pinctrl/consumer.h:30:44: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |                          ~~~~~~~~~~~~~~~~~~^~
>> drivers/gpio/gpio-aspeed-g7.c:474:16: error: too few arguments to function 'pinctrl_gpio_request'
     474 |         return pinctrl_gpio_request(chip->base + offset);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:30:5: note: declared here
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_free':
>> drivers/gpio/gpio-aspeed-g7.c:479:38: error: passing argument 1 of 'pinctrl_gpio_free' makes pointer from integer without a cast [-Wint-conversion]
     479 |         pinctrl_gpio_free(chip->base + offset);
         |                           ~~~~~~~~~~~^~~~~~~~
         |                                      |
         |                                      unsigned int
   include/linux/pinctrl/consumer.h:31:42: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      31 | void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset);
         |                        ~~~~~~~~~~~~~~~~~~^~
>> drivers/gpio/gpio-aspeed-g7.c:479:9: error: too few arguments to function 'pinctrl_gpio_free'
     479 |         pinctrl_gpio_free(chip->base + offset);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:31:6: note: declared here
      31 | void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset);
         |      ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_set_config':
>> drivers/gpio/gpio-aspeed-g7.c:676:48: error: passing argument 1 of 'pinctrl_gpio_set_config' makes pointer from integer without a cast [-Wint-conversion]
     676 |                 return pinctrl_gpio_set_config(offset, config);
         |                                                ^~~~~~
         |                                                |
         |                                                unsigned int
   include/linux/pinctrl/consumer.h:36:47: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |                             ~~~~~~~~~~~~~~~~~~^~
>> drivers/gpio/gpio-aspeed-g7.c:676:24: error: too few arguments to function 'pinctrl_gpio_set_config'
     676 |                 return pinctrl_gpio_set_config(offset, config);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:36:5: note: declared here
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_request':
>> drivers/gpio/gpio-aspeed-g7.c:475:1: warning: control reaches end of non-void function [-Wreturn-type]
     475 | }
         | ^


vim +/pinctrl_gpio_request +474 drivers/gpio/gpio-aspeed-g7.c

   468	
   469	static int aspeed_gpio_g7_request(struct gpio_chip *chip, unsigned int offset)
   470	{
   471		if (!have_gpio(gpiochip_get_data(chip), offset))
   472			return -ENODEV;
   473	
 > 474		return pinctrl_gpio_request(chip->base + offset);
 > 475	}
   476	
   477	static void aspeed_gpio_g7_free(struct gpio_chip *chip, unsigned int offset)
   478	{
 > 479		pinctrl_gpio_free(chip->base + offset);
   480	}
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
