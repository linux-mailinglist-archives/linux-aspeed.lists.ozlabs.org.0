Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EA96667C
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 18:08:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwNNt6dj5z30T9
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2024 02:08:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725034108;
	cv=none; b=KOBelCnmjaVnAcQbuzAveU5ssOipsOk2A168mOuRNCVBqrENujiwTRT+3FdK5k4Ou0PisaI3lBjjwIrwwWwMA+oO+dx/Ymrp2b+Wv0YzaAfzHR3N+FtfMzy4toqIirOujcRM3LdmG3HEiLN7RdkHbVytgDDP5K6k+RrNV/a71PNAD+tozfAq6tVM4ulsEOAHjXUQmMhU2h8gui9Tipor5GEEdJIHTAAphKmSZZ2HP0V5m8m//kvcwDyKzI1Ed1pCJO4UUgVNGjoo5u47qMULEQwkyAwCEw0eyoc4C09Q/fUQB2SLRDg1M5y7zfqW7WNWsLHfu2UIjNMs3p32XlOWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725034108; c=relaxed/relaxed;
	bh=fMS3F5PDwY7VIuxae76isLa1thCqmtQAuDR5qyklub0=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=B6Naa2Z3zsGkk0PlreBt1mZV4eBQIN/nBDJIcHYUKew07xZuq01cAo/8jHxJRStjEiSCZ02GvbWBMxK0z7C5YA2e/SuXL9R+om2J/4itVdTDYODwWh750cG8gxesTHmhRckUFgqBNeWP2nqFDm99XxttBYKYvxHme5rmxGN2CrkqXydXHSIcgpo7xM94NZST3gvm0iEqtqrx/27Zt4g30Y3iPb54jsTvi5/UoCnxnrtQzegn+S6IEsCxL98HJPM64Ct2U9OI1EBNs8cUqGVAaja801w18sZLit5p+RUlfGynsZ8zw0XafYlCeNZnLmkRkaq1Qg4+aVgfhMWDKQMlUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VeeK8x5y; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VeeK8x5y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwNNp6Bbtz30Dw
	for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2024 02:08:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725034107; x=1756570107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NQvkHbKFvCNmAk13O0Hw0+Go2GG2xCkOaQ+cBqqlySY=;
  b=VeeK8x5ypKbrmmUW0LAPYZNbPZs6nOEzcegawDXhw4/XFSyZOORWHad0
   8RcOaX3t6xm6gCw4eyz9Vrjm1WnE3N74NwbavnwX5hXNb+L7B32T8q/xi
   s8JWlXOjYwncRslZBBb1h9B8Ag9peUk6sHQjX3CtU1lEQMHx1DYbrbMiC
   fV4fOfpzac18gaQe0pMczaRtjslEXCfoqril13XJpLcrUuEVXKf1ZD4pL
   SJXB0PiooQM6Mmf2bpudZHPf541XDh1OjPN2YliP0a1kZNS7dZWy0O2I7
   T7/TyBrijPLukI+XhE3/yf4uYBIhJpX8PZmeeEOUoLcskhc1ktjqvYP/x
   A==;
X-CSE-ConnectionGUID: lLWCY8PfS5e0Gd1DR1K5gQ==
X-CSE-MsgGUID: YeUPfjeiRYCxm/7OkVT1gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34255330"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="34255330"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 09:08:21 -0700
X-CSE-ConnectionGUID: dUUB7NMLS0i/oQh7OvxTUA==
X-CSE-MsgGUID: LVikeV91R/i9tICoQsoktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="94674482"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2024 09:08:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk4AY-0001cu-2r;
	Fri, 30 Aug 2024 16:08:14 +0000
Date: Sat, 31 Aug 2024 00:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware
 access
Message-ID: <202408302344.bCpCF6bu-lkp@intel.com>
References: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>
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

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240830-114325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240830034047.2251482-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware access
config: i386-buildonly-randconfig-004-20240830 (https://download.01.org/0day-ci/archive/20240830/202408302344.bCpCF6bu-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302344.bCpCF6bu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302344.bCpCF6bu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-aspeed.c:394:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     394 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:399:6: note: uninitialized use occurs here
     399 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:394:2: note: remove the 'if' if its condition is always true
     394 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     395 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:391:12: note: initialize the variable 'copro' to silence this warning
     391 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:415:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     415 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:418:6: note: uninitialized use occurs here
     418 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:415:2: note: remove the 'if' if its condition is always true
     415 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     416 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:408:12: note: initialize the variable 'copro' to silence this warning
     408 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:438:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     438 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:443:6: note: uninitialized use occurs here
     443 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:438:2: note: remove the 'if' if its condition is always true
     438 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     439 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:431:12: note: initialize the variable 'copro' to silence this warning
     431 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:502:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     502 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:507:6: note: uninitialized use occurs here
     507 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:502:2: note: remove the 'if' if its condition is always true
     502 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:495:12: note: initialize the variable 'copro' to silence this warning
     495 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:528:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     528 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:533:6: note: uninitialized use occurs here
     533 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:528:2: note: remove the 'if' if its condition is always true
     528 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     529 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:517:12: note: initialize the variable 'copro' to silence this warning
     517 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:589:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     589 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:596:6: note: uninitialized use occurs here
     596 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:589:2: note: remove the 'if' if its condition is always true
     589 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     590 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:561:12: note: initialize the variable 'copro' to silence this warning
     561 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:659:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     659 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:664:6: note: uninitialized use occurs here
     664 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:659:2: note: remove the 'if' if its condition is always true
     659 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     660 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:656:12: note: initialize the variable 'copro' to silence this warning
     656 |         bool copro;
         |                   ^
         |                    = 0
   7 warnings generated.


vim +394 drivers/gpio/gpio-aspeed.c

   385	
   386	static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
   387				    int val)
   388	{
   389		struct aspeed_gpio *gpio = gpiochip_get_data(gc);
   390		unsigned long flags;
   391		bool copro;
   392	
   393		raw_spin_lock_irqsave(&gpio->lock, flags);
 > 394		if (gpio->llops->copro_request)
   395			copro = gpio->llops->copro_request(gpio, offset);
   396	
   397		__aspeed_gpio_set(gc, offset, val);
   398	
   399		if (copro && gpio->llops->copro_release)
   400			gpio->llops->copro_release(gpio, offset);
   401		raw_spin_unlock_irqrestore(&gpio->lock, flags);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
