Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4C978F34
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Sep 2024 10:45:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5PrN2gRjz303K
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Sep 2024 18:45:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726303501;
	cv=none; b=FIILHJKSvQJCC1EJam0Nn6txLgPCs5ykrD++U+w3KqOionIs0rUsg6cWkYM3ACaZX2ahJL56wFBkg3xDu4Geos/8pQ02VhDbNnuUY+3LGvZVRE1zmpmJD3xGVW5cSQpbXxyzvmRY00f+u5VbyMWx7tYY1dVDyVkeBfHMi69w7KC+zMNRT5fQtHxJ0ikBD1nPLyP5JShtK7cIQV2w3hKKHd0vWDf3D6Pse4K+k+NnXGz1vFyHptB67zsmxErNJ1jF9Atuvt4IkOiTtVBUZQkkKDSsknqlKeoLEw7A0OKfUO/nk3avxT47oh4eaKidt/dr9lR2k7xpVPoqtoLS6HW3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726303501; c=relaxed/relaxed;
	bh=koB3GGv6GVDcyw4RX2uNUV3acyZ/bozEUKF+SZIwpJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv0tPs9KES3JQKUS9AKoyeO9DFlYYVyqN4CFqwKiwAOFyHr/b9bAcDsv04NJ5F0VrPohlLWGYTnanjIFCJjuoo+8CF9+Xvf5Uu0zJ4xmbramc8xay+HU7of3rVK6Wv4SubLPduR71DP0x0spbh/Gp9SI7Bmeu5zRUfEszWbsudpZBSVYIpYp+X9bceEaTQMVPAwPwWAmj9tIIC7vwV3yNb3vIrLHIteekuSKncNrSQ9dcuMdS3Mrv+gUD39QkBvXhpmtFzbfKEaO2qxtQQlXgcNoHeBF1A4VB4msvK6Ut0pHT+T+F6hfOeSiya44V0+zT10jTURcOBr3b3UC9jgxhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vnih7J7v; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vnih7J7v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5PrC1xR6z2yDw
	for <linux-aspeed@lists.ozlabs.org>; Sat, 14 Sep 2024 18:44:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726303499; x=1757839499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yo2t08wq6mqrLt2v9Yb6EbR8Hv+2oN77BrDNhVFJZzk=;
  b=Vnih7J7vlMBs3qIx/zLxpxNQYlfUPdcljhVVMhEbpUpaSyPpBmoM24y/
   p7FoRG6hx9oc9CAP/JUuubENSFTxnASEgpMUiS4vVD4Jk4PxkvxE7EYFX
   tIG2VoxU0pCNe4U94tBCdowtCh2rD4QitIz2Y5FcSS/Eto2fL2bdR8iZv
   9y5Wr+3mWDsxn7ilkLKFueAkiHjOlu+GLa7z2uiH8eGPqGmYK5vc7wYOw
   21diGbhgDpaT4YtnnDTrChn0ERLyt92+cVW/S/UZBRGKWJ7Je5e+3//gw
   Xl/1k5SospUsIkr8OU/h5qLQuV6bCkfNrtvSAsotU6NSgCRIik8wLhBGw
   Q==;
X-CSE-ConnectionGUID: 7m6HJDRTQKiZrmnJiNyxAQ==
X-CSE-MsgGUID: bMBtrzFvS/6ddJx4qCRZTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25092066"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25092066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 01:44:54 -0700
X-CSE-ConnectionGUID: xmrBwu1NS0qQAciLVisk0w==
X-CSE-MsgGUID: E9tgl2zaSju+Bp7vrddTKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="105796452"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2024 01:44:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spOOe-0007Xw-0K;
	Sat, 14 Sep 2024 08:44:48 +0000
Date: Sat, 14 Sep 2024 16:44:02 +0800
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
Message-ID: <202409141654.wHuMQLLU-lkp@intel.com>
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
config: arc-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141654.wHuMQLLU-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141654.wHuMQLLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141654.wHuMQLLU-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: aspeed_gpio_driver+0x0 (section: .data) -> aspeed_gpio_probe (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
