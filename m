Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BF9555A0
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2024 07:41:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="::1"
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hv3LWK79;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wm75j3dpXz2yyC
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2024 15:41:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hv3LWK79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wm75Y5Dp1z2yFL
	for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Aug 2024 15:41:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723873298; x=1755409298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UT3TEXjAnt6juaSW5v7iJywRiqzsU/IKcktZg/tIjHE=;
  b=hv3LWK79I+F40GoNz32J2WSZJj2spDz7YQoE2TiNd7DKX782bI3smJD+
   s7l5qUiIE0WZCuYKaGYOVDuQeDjpBRubrM5oiRbgHwEKVqZDxJAp4+H9V
   L5tUljO7veOjzk3YM3lTYTM/1HEX9mL0KX117nSF1YaQUUqEqvP4h9D53
   wictxkFxvDQEONEsPFkegTWSxaMhLYsevdk/NLQHNAC/fG3FZxj3OQZcY
   StXucnl/yMy8gKp34CJ2dJAWb2XKOhAgnITxGgX8SWlOz51Jtn4gBiTz+
   XkI+w3iBJw+bOb3DVhFl0RSxEfjJ8A03BuI5iQkdJkfKFjW/kmmyluVrT
   Q==;
X-CSE-ConnectionGUID: g6PnYS6MR1SVzuGrV6CR0Q==
X-CSE-MsgGUID: S8fCkoqOT7ObfoV9A/LwNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33586390"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="33586390"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 22:41:31 -0700
X-CSE-ConnectionGUID: iTH+5IiAQmidIYMfmvrviw==
X-CSE-MsgGUID: W28H85x6Tz2caN/vW2hXrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="64761382"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Aug 2024 22:41:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfCBp-0007DG-1w;
	Sat, 17 Aug 2024 05:41:25 +0000
Date: Sat, 17 Aug 2024 13:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v12 28/28] ARM: dts: aspeed: yosemite4: fix GPIO linename
 typo
Message-ID: <202408171324.4kdqlh1v-lkp@intel.com>
References: <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/ARM-dts-aspeed-yosemite4-Revise-i2c-mux-devices/20240816-173326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240816092417.3651434-29-Delphine_CC_Chiu%40wiwynn.com
patch subject: [PATCH v12 28/28] ARM: dts: aspeed: yosemite4: fix GPIO linename typo
config: arm-randconfig-001-20240817 (https://download.01.org/0day-ci/archive/20240817/202408171324.4kdqlh1v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171324.4kdqlh1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171324.4kdqlh1v-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1721.1-6 Label or path i3c0 not found
   Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1764.1-6 Label or path i3c1 not found
>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1833.1-7 Label or path jtag1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
