Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB3840AF7
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jan 2024 17:12:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V2fWy4RG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNtbt17nqz3c9l
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jan 2024 03:12:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V2fWy4RG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNtbj2NbGz2ykn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jan 2024 03:11:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706544722; x=1738080722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EJuKz+rDfnnrgz4jtF7KK8M8+lKo37WzgpZ8fWKe+go=;
  b=V2fWy4RGAZY99igc0yLcb4DzYayzXCyiaqzfiEu9TScj16nNOpfufkUg
   CBrG+S1kIiock4ZvW31yYVVzMWFHMvwqkDlQUZTAP0Se2s+M/L0BCKCgb
   HK8mZuZKeyrAZ4YaAVFBH86nTRyrtwpxJaFXxD5JGznT7ji7LbKVWOV9r
   pDDaoS1zV4V64ue/XepGVBJkVCYW2tESmSDXqK47cIQsBEPRE3YdfeomU
   VVedRrgt1qz1gvmMUKRraIfkYrdqW0lXOU88x1Na2aeeDVU7gTw6wDKND
   p4sYt2P+F4tSqrroAhHPh1K5i6/h3gim1sN768sKTHnZU21uRfGScLjXw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16359737"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="16359737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 08:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3342415"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2024 08:02:44 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUU5q-0004Oq-0h;
	Mon, 29 Jan 2024 16:02:42 +0000
Date: Tue, 30 Jan 2024 00:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, corbet@lwn.net,
	u.kleine-koenig@pengutronix.de, p.zabel@pengutronix.de,
	naresh.solanki@9elements.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	BMC-SW@aspeedtech.com, patrick@stwcx.xyz
Subject: Re: [PATCH v13 3/3] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED
 g6 PWM/Fan tach
Message-ID: <202401292303.6SVAncvn-lkp@intel.com>
References: <20240124060705.1342461-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124060705.1342461-4-billy_tsai@aspeedtech.com>
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

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.8-rc2 next-20240129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-hwmon-fan-Add-fan-binding-to-schema/20240124-141405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240124060705.1342461-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v13 3/3] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach
config: riscv-randconfig-r071-20240129 (https://download.01.org/0day-ci/archive/20240129/202401292303.6SVAncvn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292303.6SVAncvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292303.6SVAncvn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/aspeed-g6-pwm-tach.c:496:2: error: implicit declaration of function 'of_platform_populate' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           of_platform_populate(dev->of_node, NULL, NULL, dev);
           ^
   1 error generated.


vim +/of_platform_populate +496 drivers/hwmon/aspeed-g6-pwm-tach.c

   446	
   447	static int aspeed_pwm_tach_probe(struct platform_device *pdev)
   448	{
   449		struct device *dev = &pdev->dev, *hwmon;
   450		int ret;
   451		struct device_node *child;
   452		struct aspeed_pwm_tach_data *priv;
   453	
   454		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   455		if (!priv)
   456			return -ENOMEM;
   457		priv->dev = dev;
   458		priv->base = devm_platform_ioremap_resource(pdev, 0);
   459		if (IS_ERR(priv->base))
   460			return PTR_ERR(priv->base);
   461	
   462		priv->clk = devm_clk_get_enabled(dev, NULL);
   463		if (IS_ERR(priv->clk))
   464			return dev_err_probe(dev, PTR_ERR(priv->clk),
   465					     "Couldn't get clock\n");
   466		priv->clk_rate = clk_get_rate(priv->clk);
   467		priv->reset = devm_reset_control_get_exclusive(dev, NULL);
   468		if (IS_ERR(priv->reset))
   469			return dev_err_probe(dev, PTR_ERR(priv->reset),
   470					     "Couldn't get reset control\n");
   471	
   472		ret = reset_control_deassert(priv->reset);
   473		if (ret)
   474			return dev_err_probe(dev, ret,
   475					     "Couldn't deassert reset control\n");
   476	
   477		priv->chip.dev = dev;
   478		priv->chip.ops = &aspeed_pwm_ops;
   479		priv->chip.npwm = PWM_ASPEED_NR_PWMS;
   480	
   481		ret = devm_pwmchip_add(dev, &priv->chip);
   482		if (ret < 0) {
   483			reset_control_assert(priv->reset);
   484			return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
   485		}
   486	
   487		for_each_child_of_node(dev->of_node, child) {
   488			ret = aspeed_tach_create_fan(dev, child, priv);
   489			if (ret < 0) {
   490				of_node_put(child);
   491				dev_warn(dev, "Failed to create fan %d", ret);
   492				return 0;
   493			}
   494		}
   495	
 > 496		of_platform_populate(dev->of_node, NULL, NULL, dev);
   497	
   498		hwmon = devm_hwmon_device_register_with_info(dev, "aspeed_tach", priv,
   499							     &aspeed_tach_chip_info, NULL);
   500		ret = PTR_ERR_OR_ZERO(hwmon);
   501		if (ret) {
   502			reset_control_assert(priv->reset);
   503			return dev_err_probe(dev, ret,
   504					     "Failed to register hwmon device\n");
   505		}
   506	
   507		return 0;
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
