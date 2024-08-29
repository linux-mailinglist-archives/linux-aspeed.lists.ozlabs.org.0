Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97B9636C6
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Aug 2024 02:18:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvMMY66pfz2ysb
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Aug 2024 10:18:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724890726;
	cv=none; b=Oc7XIZ6UaTdyVHBME8QlmxAQvci9QgpLUkhZk5kJcM+ym4rovjBurb7aYGsuqJBYsrumcWQ7IYwiJLBdF4HEQQqmUvTQOniOYpIm/qdSuZZOp0EOcA3A0RN+n9rv9N6GIHAV/N66qmEF8eAkmGpVhWixS2TlltNUGTX7vyJDx7komdfHlKI/5No/cTBgODUt5cA+X7na7lWUI79Ebfh8CbODuYwZYAfHSiXwIPCc8I3SeD04EJeGWcX+nIESk9XZlNv8N94H3mHzR5rTXMMvdUity8KRDbkPvat6Q7WgnDGzg8BQeke4ynjbIT/kOJFsAwAUNOZXqnGjZ2UdOD1jvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724890726; c=relaxed/relaxed;
	bh=4dmE+ncIaPbPLa2fFoDwTNU++4L/GTfOiSKWu/hm1PA=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lbWpCw5MRlEf9GNXjQ/BvHgoj80spR4Q7Lo8KqRx6TGsenDNvwRTXPCN87uUAaLXwKb4DA7urLqwvF23YeHshfdyEsprSga5DZ/UlDaRGkm4HBDaxpP41jIaD1iAWQQMd7/3X/H31BklXVGjRRjdqAR8GkHJt5ZH2sn7ELrTmmMSLKGdihdlZmkV9l9va05crW6ZoxfT0BHpJmUOlnFYGdRvuVp2LcHG5Z9o0N7fmlJv3zycfDvt5d1w9xMT3BiEEKVDtjEG+PSwm3EU4D0JSDka5mGq470UKYbs5eFzIgbMaVPltPYMrj6C/IPZ+47gW/sikaCHmfBqF0H05zjq9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U1uaibG9; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U1uaibG9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvMMT0PMtz2xjd
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Aug 2024 10:18:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724890725; x=1756426725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JS57zOOV3O/UH7xonHh/DDsPR5hEbfRvwHiP+7Zq0s8=;
  b=U1uaibG9yKNhs2nhgbqUaij3k9MxqCArRBadHVycHJX2N9RV8nY9zWo2
   o9fbNVG1Z6XS6i6ojStrz/Dd6MZkVgSIRsHmQ5JM6lZMGyQ25jShdUrAK
   1PAI6iraEpjEgoO26XJUvxmU+4+bVW0ZRUrz0P/v8ObE42Jb57mnse61j
   /uNw3jnurfgXcsUxpQhFxMEEEtQypK2pL49c1eXg1aIJQVGfzAsOhmR1I
   fvt52XdGPhVWBwwJdyT9v8sAcW/M7Tc+A01dP0znHfqB2uVVSrKPrMQc7
   LmUKIW4o4euuyaIg1vDw6visu3tldGMZTJkn6/aKfLkyyIbA5bjoas/kU
   g==;
X-CSE-ConnectionGUID: 6gyC+hVuTziGlq5gPmj2wg==
X-CSE-MsgGUID: 0HFsVwC+QT+vqWbQO05/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="22973558"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="22973558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:18:38 -0700
X-CSE-ConnectionGUID: LypQ0+ovQWepwXB35kZ4gQ==
X-CSE-MsgGUID: /z3S3VrLRWaWDkgrA1eMPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="68227056"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2024 17:18:35 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjSrw-000LUA-15;
	Thu, 29 Aug 2024 00:18:32 +0000
Date: Thu, 29 Aug 2024 08:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
Message-ID: <202408290836.KrEafUdK-lkp@intel.com>
References: <20240828062740.1614744-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828062740.1614744-4-ryan_chen@aspeedtech.com>
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

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-reset-Add-AST2700-reset-bindings/20240828-143005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240828062740.1614744-4-ryan_chen%40aspeedtech.com
patch subject: [PATCH v2 3/3] clk: aspeed: add AST2700 clk driver
config: microblaze-randconfig-r111-20240829 (https://download.01.org/0day-ci/archive/20240829/202408290836.KrEafUdK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240829/202408290836.KrEafUdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290836.KrEafUdK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/clk/clk-ast2700.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>> drivers/clk/clk-ast2700.c:100:10: sparse: sparse: Initializer entry defined twice
   drivers/clk/clk-ast2700.c:107:10: sparse:   also defined here

vim +100 drivers/clk/clk-ast2700.c

    66	
    67	static const struct ast2700_reset_signal ast2700_reset0_signals[] = {
    68		[SCU0_RESET_SDRAM] = { 1, SCU0_RESET_CTRL1, BIT(0) },
    69		[SCU0_RESET_DDRPHY] = { 1, SCU0_RESET_CTRL1, BIT(1) },
    70		[SCU0_RESET_RSA]     = { 1, SCU0_RESET_CTRL1, BIT(2) },
    71		[SCU0_RESET_SHA3]	= { 1, SCU0_RESET_CTRL1, BIT(3) },
    72		[SCU0_RESET_HACE]	= { 1, SCU0_RESET_CTRL1, BIT(4) },
    73		[SCU0_RESET_SOC]	= { 1, SCU0_RESET_CTRL1, BIT(5) },
    74		[SCU0_RESET_VIDEO]	= { 1, SCU0_RESET_CTRL1, BIT(6) },
    75		[SCU0_RESET_2D]	= { 1, SCU0_RESET_CTRL1, BIT(7) },
    76		[SCU0_RESET_PCIS]	= { 1, SCU0_RESET_CTRL1, BIT(8) },
    77		[SCU0_RESET_RVAS0]		= { 1, SCU0_RESET_CTRL1, BIT(9) },
    78		[SCU0_RESET_RVAS1]		= { 1, SCU0_RESET_CTRL1, BIT(10) },
    79		[SCU0_RESET_SM3]		= { 1, SCU0_RESET_CTRL1, BIT(11) },
    80		[SCU0_RESET_SM4]		= { 1, SCU0_RESET_CTRL1, BIT(12) },
    81		[SCU0_RESET_CRT0]	= { 1, SCU0_RESET_CTRL1, BIT(13) },
    82		[SCU0_RESET_ECC]	= { 1, SCU0_RESET_CTRL1, BIT(14) },
    83		[SCU0_RESET_DP_PCI]	= { 1, SCU0_RESET_CTRL1, BIT(15) },
    84		[SCU0_RESET_UFS]	= { 1, SCU0_RESET_CTRL1, BIT(16) },
    85		[SCU0_RESET_EMMC]	= { 1, SCU0_RESET_CTRL1, BIT(17) },
    86		[SCU0_RESET_PCIE1RST]	= { 1, SCU0_RESET_CTRL1, BIT(18) },
    87		[SCU0_RESET_PCIE1RSTOE]	= { 1, SCU0_RESET_CTRL1, BIT(19) },
    88		[SCU0_RESET_PCIE0RST]		= { 1, SCU0_RESET_CTRL1, BIT(20) },
    89		[SCU0_RESET_PCIE0RSTOE]	= { 1, SCU0_RESET_CTRL1, BIT(21) },
    90		[SCU0_RESET_JTAG]	= { 1, SCU0_RESET_CTRL1, BIT(22) },
    91		[SCU0_RESET_MCTP0] = { 1, SCU0_RESET_CTRL1, BIT(23) },
    92		[SCU0_RESET_MCTP1]		= { 1, SCU0_RESET_CTRL1, BIT(24) },
    93		[SCU0_RESET_XDMA0]	= { 1, SCU0_RESET_CTRL1, BIT(25) },
    94		[SCU0_RESET_XDMA1]	= { 1, SCU0_RESET_CTRL1, BIT(26) },
    95		[SCU0_RESET_H2X1]	= { 1, SCU0_RESET_CTRL1, BIT(27) },
    96		[SCU0_RESET_DP]	= { 1, SCU0_RESET_CTRL1, BIT(28) },
    97		[SCU0_RESET_DP_MCU]	= { 1, SCU0_RESET_CTRL1, BIT(29) },
    98		[SCU0_RESET_SSP]	= { 1, SCU0_RESET_CTRL1, BIT(30) },
    99		[SCU0_RESET_H2X0]	= { 1, SCU0_RESET_CTRL1, BIT(31) },
 > 100		[SCU0_RESET_PORTA_USB]	= { 1, SCU0_RESET_CTRL2, BIT(0) },
   101		[SCU0_RESET_PORTA_PHY3]	= { 1, SCU0_RESET_CTRL2, BIT(1) },
   102		[SCU0_RESET_PORTA_XHCI]	= { 1, SCU0_RESET_CTRL2, BIT(2) },
   103		[SCU0_RESET_PORTB_VHUB1]	= { 1, SCU0_RESET_CTRL2, BIT(3) },
   104		[SCU0_RESET_PORTB_PHY3]	= { 1, SCU0_RESET_CTRL2, BIT(4) },
   105		[SCU0_RESET_PORTB_XHCI]	= { 1, SCU0_RESET_CTRL2, BIT(5) },
   106		/*PORTA EHCI/VHUB share reset */
   107		[SCU0_RESET_PORTA_USB]	= { 1, SCU0_RESET_CTRL2, BIT(6) },
   108		/*PORTB EHCI/VHUB share reset */
   109		[SCU0_RESET_PORTB_USB]	= { 1, SCU0_RESET_CTRL2, BIT(7) },
   110		[SCU0_RESET_UHCI]	= { 1, SCU0_RESET_CTRL2, BIT(8) },
   111		[SCU0_RESET_TSP]	= { 1, SCU0_RESET_CTRL2, BIT(9) },
   112		[SCU0_RESET_E2M0]	= { 1, SCU0_RESET_CTRL2, BIT(10) },
   113		[SCU0_RESET_E2M1]	= { 1, SCU0_RESET_CTRL2, BIT(11) },
   114		[SCU0_RESET_VLINK]	= { 1, SCU0_RESET_CTRL2, BIT(12) },
   115	};
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
