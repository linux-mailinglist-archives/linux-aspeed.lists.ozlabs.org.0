Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BB395AC73
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 06:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq8zD6Fd5z2yQG
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2024 14:16:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BVej4FS1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq8z913kqz2y89
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 14:16:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724300197; x=1755836197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcAYJElrUmw8cakNhbZlmrL27yzOntaJO0b9hxovysA=;
  b=BVej4FS1jUJVu1cKNoQkD17uY9A6CokGJ54IMmg7MjbN8LDF4i9mCUmt
   fG4wh22JFO4VPSR74IYL7DL17NurVhQZ64XZ4f2UiqxNSA9DSuXNcA6LH
   B2EL8ARNR/dRxfHX04k8Z0yIIMIKG5lUAPePZ8Xq27LglH7Ew8VyBUKWR
   LtAj8cWPkcshnGrgTxPi0mY9Ldzc+ZggQ+PnnqBrl37N9mq3hgu2HcwTj
   22pT9+VwQlK1myiIrJsigxGaXAQ0IfNPDatRaWLDTA+tV6AaLG+olGoRO
   Z82Zb6MVp7PbZMFR1zlr8CX0am5fb17FJzDcODaLFZff0cjXnbdolgy+N
   Q==;
X-CSE-ConnectionGUID: A5CJ4j2ZR3C6BbiQQtYzww==
X-CSE-MsgGUID: SSKiRiMJQeGnTuPo5mAE5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33846738"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="33846738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 21:16:31 -0700
X-CSE-ConnectionGUID: CDxB2P9ARQ219xXZDtNGng==
X-CSE-MsgGUID: G9OIF0lNQJqeSRsSmg9Wnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="92049605"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2024 21:16:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgzFH-000CLg-2i;
	Thu, 22 Aug 2024 04:16:23 +0000
Date: Thu, 22 Aug 2024 12:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>, Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/5] usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
Message-ID: <202408221126.F1eulsSr-lkp@intel.com>
References: <20240821121048.31566-3-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821121048.31566-3-liulei.rjpt@vivo.com>
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
Cc: opensource.kernel@vivo.com, oe-kbuild-all@lists.linux.dev
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Lei,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lei-Liu/usb-aspeed_udc-Use-devm_clk_get_enabled-helpers/20240821-201358
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240821121048.31566-3-liulei.rjpt%40vivo.com
patch subject: [PATCH 2/5] usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408221126.F1eulsSr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221126.F1eulsSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221126.F1eulsSr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/udc/pxa27x_udc.c: In function 'pxa_udc_probe':
   drivers/usb/gadget/udc/pxa27x_udc.c:2401:39: error: passing argument 1 of 'clk_prepare_enable' from incompatible pointer type [-Wincompatible-pointer-types]
    2401 |         udc->clk = clk_prepare_enable(&pdev->dev, NULL);
         |                                       ^~~~~~~~~~
         |                                       |
         |                                       struct device *
   In file included from drivers/usb/gadget/udc/pxa27x_udc.c:18:
   include/linux/clk.h:1107:50: note: expected 'struct clk *' but argument is of type 'struct device *'
    1107 | static inline int clk_prepare_enable(struct clk *clk)
         |                                      ~~~~~~~~~~~~^~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2401:20: error: too many arguments to function 'clk_prepare_enable'
    2401 |         udc->clk = clk_prepare_enable(&pdev->dev, NULL);
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/clk.h:1107:19: note: declared here
    1107 | static inline int clk_prepare_enable(struct clk *clk)
         |                   ^~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/udc/pxa27x_udc.c:2401:18: error: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2401 |         udc->clk = clk_prepare_enable(&pdev->dev, NULL);
         |                  ^


vim +2401 drivers/usb/gadget/udc/pxa27x_udc.c

  2345	
  2346	/**
  2347	 * pxa_udc_probe - probes the udc device
  2348	 * @pdev: platform device
  2349	 *
  2350	 * Perform basic init : allocates udc clock, creates sysfs files, requests
  2351	 * irq.
  2352	 */
  2353	static int pxa_udc_probe(struct platform_device *pdev)
  2354	{
  2355		struct pxa_udc *udc = &memory;
  2356		int retval = 0, gpio;
  2357		struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
  2358		unsigned long gpio_flags;
  2359	
  2360		if (mach) {
  2361			gpio_flags = mach->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
  2362			gpio = mach->gpio_pullup;
  2363			if (gpio_is_valid(gpio)) {
  2364				retval = devm_gpio_request_one(&pdev->dev, gpio,
  2365							       gpio_flags,
  2366							       "USB D+ pullup");
  2367				if (retval)
  2368					return retval;
  2369				udc->gpiod = gpio_to_desc(mach->gpio_pullup);
  2370			}
  2371			udc->udc_command = mach->udc_command;
  2372		} else {
  2373			udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
  2374		}
  2375	
  2376		udc->regs = devm_platform_ioremap_resource(pdev, 0);
  2377		if (IS_ERR(udc->regs))
  2378			return PTR_ERR(udc->regs);
  2379		udc->irq = platform_get_irq(pdev, 0);
  2380		if (udc->irq < 0)
  2381			return udc->irq;
  2382	
  2383		udc->dev = &pdev->dev;
  2384		if (of_have_populated_dt()) {
  2385			udc->transceiver =
  2386				devm_usb_get_phy_by_phandle(udc->dev, "phys", 0);
  2387			if (IS_ERR(udc->transceiver))
  2388				return PTR_ERR(udc->transceiver);
  2389		} else {
  2390			udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
  2391		}
  2392	
  2393		if (IS_ERR(udc->gpiod)) {
  2394			dev_err(&pdev->dev, "Couldn't find or request D+ gpio : %ld\n",
  2395				PTR_ERR(udc->gpiod));
  2396			return PTR_ERR(udc->gpiod);
  2397		}
  2398		if (udc->gpiod)
  2399			gpiod_direction_output(udc->gpiod, 0);
  2400	
> 2401		udc->clk = clk_prepare_enable(&pdev->dev, NULL);
  2402		if (IS_ERR(udc->clk))
  2403			return PTR_ERR(udc->clk);
  2404	
  2405		udc->vbus_sensed = 0;
  2406	
  2407		the_controller = udc;
  2408		platform_set_drvdata(pdev, udc);
  2409		udc_init_data(udc);
  2410	
  2411		/* irq setup after old hardware state is cleaned up */
  2412		retval = devm_request_irq(&pdev->dev, udc->irq, pxa_udc_irq,
  2413					  IRQF_SHARED, driver_name, udc);
  2414		if (retval != 0) {
  2415			dev_err(udc->dev, "%s: can't get irq %i, err %d\n",
  2416				driver_name, udc->irq, retval);
  2417			goto err;
  2418		}
  2419	
  2420		if (!IS_ERR_OR_NULL(udc->transceiver))
  2421			usb_register_notifier(udc->transceiver, &pxa27x_udc_phy);
  2422		retval = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
  2423		if (retval)
  2424			goto err_add_gadget;
  2425	
  2426		pxa_init_debugfs(udc);
  2427		if (should_enable_udc(udc))
  2428			udc_enable(udc);
  2429		return 0;
  2430	
  2431	err_add_gadget:
  2432		if (!IS_ERR_OR_NULL(udc->transceiver))
  2433			usb_unregister_notifier(udc->transceiver, &pxa27x_udc_phy);
  2434	err:
  2435		clk_unprepare(udc->clk);
  2436		return retval;
  2437	}
  2438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
