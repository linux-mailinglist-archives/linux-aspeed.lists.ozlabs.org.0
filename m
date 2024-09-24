Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2910983B5C
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 04:54:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCPZs0LjMz2yVT
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 12:54:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727146447;
	cv=none; b=fPg8znYrzTTxM7kH61pO/xgRKJlFVGSgNHapPVGeVBeuamS+ALVHmDyU6EOZ+QNk2Y0kbQxjK0Vjs1mgwiD9UeatrxJqLBfFvNNifkYyKE47uGP8Djng5gqamWvGk8S0adpxV1EvdmMsNjCnqA3omkLO7XZvh8MPoD2Dk247ed5lAokgwqCAqPnMpEyu/7GsYvMkCAhyBJBMIhc1WnhmYTRkb3E8hYYWUUUPt2DcjdhO3wLwhNxLPsCvuw2YVHxRgBOQ7iGXM+YrxhvDnWfehIbEKoNvowiHbS3aCz6x1anHdet7qL7cCv/9XdLEqpkTFVWr0XFFiaowcEE+YxXuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727146447; c=relaxed/relaxed;
	bh=Gtv55u1bdGo1HB8T/rWn3bvAoB4XszQNlV4fOyPklHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diMx4skOUkyoZajVUgFuaq7ELJSPsbOfjY35lkMwoSGA6wAT2IVps67nPV7P0Ds7NALzr6xexqU1MgGSQ+pt7hcrAkS02u5mzGsRpdp5L+xbc/ulTkXi10XGHPwDoWeqEJbqaZcajQt2eeDG9tmlwIaojliymp2e2b9htt6s8AqwBYn1xMQ9dlk4fSiCshBp0QHK8sR2Y71dAmkoR+n882sFt1fTFEqvK3BMNvdxm26OmUaI5/SEs0ZPx7RuNp0nsxIZV3ernvglXTnS/nQTfaBHZQJOpJseSpfYjaDDCOJTLwHVWH77S+IO3/N4TmitO1ILEINZSRDA0RMWZhsyAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8uGEN/C; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8uGEN/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCPZj3xQfz2xJJ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 12:54:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727146446; x=1758682446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=apgwYaa+hCopS3ypAdBFEVBOYmqMwtamZ5UePFaeU0k=;
  b=L8uGEN/CR+SHCq1mceK4tl4JzWzftxhfxuvVoIH50RekAqcCFZMY07OB
   gjwTNT46/36qj3nvwqBNyF+VypOK1nF1UeMCobZp8zE4SmgC1sucykhdo
   9hN2/hmnTF4Iay5cg2cxX3d/hlp8+gdS5DLkft4Xr/L98Ml1QcpUkzn98
   CFB+eQL1xM9XXX2RvQqlslJ7H/WXUSMg22cmV4DzWSjrCsUANShncGWAZ
   bwDHQPwrCpUaOcbt+73aOH1Yhxl2XvcSLn0o00/L8npkfwcxHhUd2DUKl
   DF82GMFx/wLGbtEzeBN3P4hfaqbTWtESVqWI5E3frZUMlGjHrlFs8WA1M
   A==;
X-CSE-ConnectionGUID: P4BI94D/RFmL0BU0y/BONw==
X-CSE-MsgGUID: iNqr4P2RR7+jGMLlIa5xNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25944440"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="25944440"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 19:53:59 -0700
X-CSE-ConnectionGUID: 1sjRCsuuS9+8cGhY+cNfwQ==
X-CSE-MsgGUID: GbyP1ughQqWsQAEca6+Atg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76041234"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 19:53:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvgW-000Hq1-26;
	Tue, 24 Sep 2024 02:53:52 +0000
Date: Tue, 24 Sep 2024 10:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	Peter.Yin@quantatw.com, Jay_Zhang@wiwynn.com
Subject: Re: [PATCH v5 3/6] gpio: aspeed: Create llops to handle hardware
 access
Message-ID: <202409241029.XEkME4VI-lkp@intel.com>
References: <20240923100611.1597113-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923100611.1597113-4-billy_tsai@aspeedtech.com>
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
[also build test WARNING on linus/master v6.11 next-20240923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240923-180936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240923100611.1597113-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v5 3/6] gpio: aspeed: Create llops to handle hardware access
config: alpha-randconfig-r131-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241029.XEkME4VI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409241029.XEkME4VI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241029.XEkME4VI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-aspeed.c:1208:54: sparse: sparse: Using plain integer as NULL pointer

vim +1208 drivers/gpio/gpio-aspeed.c

  1183	
  1184	static int __init aspeed_gpio_probe(struct platform_device *pdev)
  1185	{
  1186		const struct of_device_id *gpio_id;
  1187		struct gpio_irq_chip *girq;
  1188		struct aspeed_gpio *gpio;
  1189		int rc, irq, i, banks, err;
  1190		u32 ngpio;
  1191	
  1192		gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
  1193		if (!gpio)
  1194			return -ENOMEM;
  1195	
  1196		gpio->base = devm_platform_ioremap_resource(pdev, 0);
  1197		if (IS_ERR(gpio->base))
  1198			return PTR_ERR(gpio->base);
  1199	
  1200		gpio->dev = &pdev->dev;
  1201	
  1202		raw_spin_lock_init(&gpio->lock);
  1203	
  1204		gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
  1205		if (!gpio_id)
  1206			return -EINVAL;
  1207	
> 1208		gpio->clk = devm_clk_get_enabled(&pdev->dev, 0);
  1209		if (IS_ERR(gpio->clk)) {
  1210			dev_warn(&pdev->dev,
  1211					"Failed to get clock from devicetree, debouncing disabled\n");
  1212			gpio->clk = NULL;
  1213		}
  1214	
  1215		gpio->config = gpio_id->data;
  1216	
  1217		if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_get ||
  1218		    !gpio->config->llops->reg_bank_get)
  1219			return -EINVAL;
  1220	
  1221		gpio->chip.parent = &pdev->dev;
  1222		err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
  1223		gpio->chip.ngpio = (u16) ngpio;
  1224		if (err)
  1225			gpio->chip.ngpio = gpio->config->nr_gpios;
  1226		gpio->chip.direction_input = aspeed_gpio_dir_in;
  1227		gpio->chip.direction_output = aspeed_gpio_dir_out;
  1228		gpio->chip.get_direction = aspeed_gpio_get_direction;
  1229		gpio->chip.request = aspeed_gpio_request;
  1230		gpio->chip.free = aspeed_gpio_free;
  1231		gpio->chip.get = aspeed_gpio_get;
  1232		gpio->chip.set = aspeed_gpio_set;
  1233		gpio->chip.set_config = aspeed_gpio_set_config;
  1234		gpio->chip.label = dev_name(&pdev->dev);
  1235		gpio->chip.base = -1;
  1236	
  1237		if (gpio->config->require_dcache) {
  1238			/* Allocate a cache of the output registers */
  1239			banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
  1240			gpio->dcache = devm_kcalloc(&pdev->dev, banks, sizeof(u32), GFP_KERNEL);
  1241			if (!gpio->dcache)
  1242				return -ENOMEM;
  1243			/*
  1244			 * Populate it with initial values read from the HW
  1245			 */
  1246			for (i = 0; i < banks; i++)
  1247				gpio->dcache[i] =
  1248					gpio->config->llops->reg_bank_get(gpio, (i << 5), reg_rdata);
  1249		}
  1250	
  1251		if (gpio->config->llops->privilege_init)
  1252			gpio->config->llops->privilege_init(gpio);
  1253	
  1254		/* Set up an irqchip */
  1255		irq = platform_get_irq(pdev, 0);
  1256		if (irq < 0)
  1257			return irq;
  1258		gpio->irq = irq;
  1259		girq = &gpio->chip.irq;
  1260		gpio_irq_chip_set_chip(girq, &aspeed_gpio_irq_chip);
  1261	
  1262		girq->parent_handler = aspeed_gpio_irq_handler;
  1263		girq->num_parents = 1;
  1264		girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
  1265		if (!girq->parents)
  1266			return -ENOMEM;
  1267		girq->parents[0] = gpio->irq;
  1268		girq->default_type = IRQ_TYPE_NONE;
  1269		girq->handler = handle_bad_irq;
  1270		girq->init_valid_mask = aspeed_init_irq_valid_mask;
  1271	
  1272		gpio->offset_timer =
  1273			devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
  1274		if (!gpio->offset_timer)
  1275			return -ENOMEM;
  1276	
  1277		rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
  1278		if (rc < 0)
  1279			return rc;
  1280	
  1281		return 0;
  1282	}
  1283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
