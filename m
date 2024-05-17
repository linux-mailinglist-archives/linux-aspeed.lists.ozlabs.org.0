Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22518C899A
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 17:49:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QWIJAAf/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgrxV2Bz2z2yGk
	for <lists+linux-aspeed@lfdr.de>; Sat, 18 May 2024 01:49:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QWIJAAf/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgrxL6gh6z2xjM
	for <linux-aspeed@lists.ozlabs.org>; Sat, 18 May 2024 01:49:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715960968; x=1747496968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nYaui3EVpbCs7z9n+UR9+uF/xT8dwlB3DJdTf8Aj4oc=;
  b=QWIJAAf/sHDNYhUv0Nrk4pvdNjcysMuuwlqFdxK/9TQ/JP5ZnhuirFgB
   fR7JmB69wE3WdXJg/pgyQlQF1U52TlfmnONW1ZCnL4I/BVSk8WNvSikQd
   aXK6sce6xZnd9C9dB3Iv3h/9EmuyZ7Ze9Rz2wPystOV3VzoaGrWdYIptx
   uGXCvH4wSzi5plVF1kE5qEpzbP36xoPnPF5hRQaLcajuZrseQ19HTOID5
   8tRJFljQFOxmikMPZB0Sv/6rgv0X72os4KaRGbUzD0+gHdY1ocGoY44bb
   2tXpWF4Hjj/1+Y4TPlORDaqRQIoMGb6KCjk2lVfZegJlhH5uIUaGw1l0T
   g==;
X-CSE-ConnectionGUID: Sw1oNkY7TsGBl8RlA3Uwjg==
X-CSE-MsgGUID: skcHwj8kRr6zrOpqJ7k8SA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12256640"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="12256640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:49:22 -0700
X-CSE-ConnectionGUID: gdfmtDVsSuSm4Pk+sKEWcA==
X-CSE-MsgGUID: bJpcJ3KdQRypXWaRp5ZLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="55053761"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 08:49:19 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7zpY-0000rx-22;
	Fri, 17 May 2024 15:49:13 +0000
Date: Fri, 17 May 2024 23:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Subject: Re: [PATCH v3 37/40] fsi: core: Add different types of CFAM
Message-ID: <202405172346.olJbkgod-lkp@intel.com>
References: <20240516181907.3468796-38-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516181907.3468796-38-eajames@linux.ibm.com>
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, oe-kbuild-all@lists.linux.dev, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/fsi-hub-Set-master-index-to-link-number-plus-one/20240517-023205
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240516181907.3468796-38-eajames%40linux.ibm.com
patch subject: [PATCH v3 37/40] fsi: core: Add different types of CFAM
config: x86_64-randconfig-122-20240517 (https://download.01.org/0day-ci/archive/20240517/202405172346.olJbkgod-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172346.olJbkgod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172346.olJbkgod-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fsi/fsi-core.c:1113:26: sparse: sparse: symbol 'fsi_get_cfam_type' was not declared. Should it be static?

vim +/fsi_get_cfam_type +1113 drivers/fsi/fsi-core.c

  1112	
> 1113	const struct device_type *fsi_get_cfam_type(u32 id)
  1114	{
  1115		u32 major = (id & 0xf00) >> 8;
  1116		u32 minor = (id & 0xf0) >> 4;
  1117	
  1118		switch (major) {
  1119		case 0x9:
  1120			return &cfam_s_type;
  1121		case 0xc:
  1122			if (minor == 0)
  1123				return &cfam_ody_type;
  1124			fallthrough;
  1125		case 0xd:
  1126		default:
  1127			return &cfam_type;
  1128		}
  1129	}
  1130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
