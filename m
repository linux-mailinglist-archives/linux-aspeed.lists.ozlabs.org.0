Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B608B2DF8
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 02:23:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPvPbEeu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQYNx3Gk2z3dSx
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 10:23:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPvPbEeu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Fri, 26 Apr 2024 10:23:36 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQYNm5BDpz3cRq;
	Fri, 26 Apr 2024 10:23:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714091017; x=1745627017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6pB7q7nmDjgq8t4EpI8naTsCxD3cIOJ6KhiwmNr1Bq4=;
  b=fPvPbEeu3Iud7NIdNrF3YIVQ/f356IXvR47DtNeP3F5PeJgxG4xNOFQo
   q6vbCiKiTASCreEitQhGfMc2rmd89jiUcWBXg3aEiECXKcDcq12gvSe/m
   I/jlVRvZUWPgL4rGGBhFORq0ndy1gDhQu2j1FqQB4+9uMLi9ew3LqBIDW
   kT9dTShTo4A8u4d0IIyHf7UbZ81NdFHKpJCEr+oBc4iX2cFQ+6TNxISSZ
   /yA/Kq/IGMtrWbJ3XQUNTBNEzS6BumLyvJBzPV3xOHh31g2EeIPGzzAZJ
   UQoOxIulusZ12muy2CxaRDUxGkFcyJ5Z2guMHY9wmr71roZ0uz7heyocz
   w==;
X-CSE-ConnectionGUID: sWRySVPaSoGDHSKzK7s4Ng==
X-CSE-MsgGUID: X2xvzNyBRa+yVnCHKlwjjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9668944"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9668944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 17:22:27 -0700
X-CSE-ConnectionGUID: RNJ53kYiS+m+b6R3HCJXeA==
X-CSE-MsgGUID: 6/3RjcZaRi+Rr+ZheRQpLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="56191111"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2024 17:22:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s09M4-00033g-33;
	Fri, 26 Apr 2024 00:22:20 +0000
Date: Fri, 26 Apr 2024 08:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 10/14] dt-bindings: i2c: i2c-fsi: Switch to yaml format
Message-ID: <202404260842.hNo9YEmT-lkp@intel.com>
References: <20240425213701.655540-11-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425213701.655540-11-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240424]
[also build test WARNING on linus/master v6.9-rc5]
[cannot apply to robh/for-next broonie-spi/for-next andi-shyti/i2c/i2c-host v6.9-rc5 v6.9-rc4 v6.9-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/dt-bindings-spi-Document-the-IBM-Power-SPI-controller/20240426-054336
base:   next-20240424
patch link:    https://lore.kernel.org/r/20240425213701.655540-11-eajames%40linux.ibm.com
patch subject: [PATCH v3 10/14] dt-bindings: i2c: i2c-fsi: Switch to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20240426/202404260842.hNo9YEmT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260842.hNo9YEmT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-fsi.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
