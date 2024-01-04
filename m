Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44382488A
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 20:03:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UNpXUTyR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5bbQ06cDz3cTN
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 06:03:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UNpXUTyR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 05 Jan 2024 06:03:36 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5bbD5T0Dz2xdp
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 06:03:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704395017; x=1735931017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3rUMvGvL6YB+Sg9CHINyeLAItR2uRWwb2yiVVnAXKvo=;
  b=UNpXUTyRcoF8LNiohuZeYs474KmljfWwOW8o5tuj6dGJwnCwRpxkP/9d
   aTfyBY6HalXTRXNuiTGVUqBa74SaUWkB2cgjV84VloTDqa2rRPGSa7Udi
   9egzQcHuUb0t5HEjLg0JopTjSAXzhHTATOs+CvjNQWI6BafOar7LFlqsr
   jgJndUuHwj+HtDQtrCWdySBPsD/IjDC+EO9Jb208GJW/Rkq0P1Ruuw5vJ
   LyBtj8dgfNl1ZWykgYdbkxnrA0YbpmBeUSMbl2pHEZWkrhzDQkfrpIdu2
   hgamXAMAOp5uJ82Uy6xBMLmljTlE94LZ3/GWbVJIzTCplQHtSrd6OAMe2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4707786"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4707786"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 11:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="1111857269"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="1111857269"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jan 2024 11:02:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLSyo-0000LI-1z;
	Thu, 04 Jan 2024 19:02:10 +0000
Date: Fri, 5 Jan 2024 03:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
	corbet@lwn.net, thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de, p.zabel@pengutronix.de,
	naresh.solanki@9elements.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	BMC-SW@aspeedtech.com, patrick@stwcx.xyz
Subject: Re: [PATCH v11 3/3] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED
 g6 PWM/Fan tach
Message-ID: <202401050234.nDBceclJ-lkp@intel.com>
References: <20240104034120.3516290-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104034120.3516290-4-billy_tsai@aspeedtech.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.7-rc8 next-20240104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-hwmon-fan-Add-fan-binding-to-schema/20240104-114552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240104034120.3516290-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v11 3/3] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240105/202401050234.nDBceclJ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050234.nDBceclJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050234.nDBceclJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/aspeed-g6-pwm-tach.c:270:3: error: field designator 'owner' does not refer to any field in type 'const struct pwm_ops'
     270 |         .owner = THIS_MODULE,
         |         ~^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +270 drivers/hwmon/aspeed-g6-pwm-tach.c

   266	
   267	static const struct pwm_ops aspeed_pwm_ops = {
   268		.apply = aspeed_pwm_apply,
   269		.get_state = aspeed_pwm_get_state,
 > 270		.owner = THIS_MODULE,
   271	};
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
