Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB0785224
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 09:58:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E/wU8zwA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVz9V0rrXz3c8W
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 17:58:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E/wU8zwA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVz9L2YrMz3bvd
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Aug 2023 17:58:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777494; x=1724313494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/7RRnTvGQwPcZ/Ng1AtLSyuUMoakgOEQVTL9ZFy7sY8=;
  b=E/wU8zwAxJcpCps9i1xN6fqHRIFLo9hUJCGUmWgjdPBNOnb0AG7nzk2r
   7VwOejbNBHacTerZQ6X2bwKMirKt2eJ0ObNUMbCPuZjbfmuuiI37EKldZ
   /g0F6YHD+uDza9YvWjyJeHk2iF4G7zGw6q083P1XJE8wH5WevnK0zEt37
   MVd4WnH6c6mEEGJXExqSNAgWFIxwuOI8P8gI9+e6H/HQ+ruTLNa2MvR3d
   3nvMWeVpoTRA6sUY669OOVV41PuwZ/pfJXrXVPFcBKYRPFQT5qG1nyR/3
   0ZjeMC1mjrTMUYUuKU67Y1k9vw4dYpvKR2nWjXsTfMrg35ruaL/KG0Ycz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359080990"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359080990"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 00:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="826624663"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826624663"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 00:58:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYikd-0000z9-2b;
	Wed, 23 Aug 2023 07:58:03 +0000
Date: Wed, 23 Aug 2023 15:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
	eajames@linux.ibm.com
Subject: Re: [PATCH v1 1/1] soc/aspeed: Add host side BMC device driver
Message-ID: <202308231554.SV5ASPV0-lkp@intel.com>
References: <20230821183525.3427144-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821183525.3427144-2-ninad@linux.ibm.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, oe-kbuild-all@lists.linux.dev
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Ninad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ninad-Palsule/soc-aspeed-Add-host-side-BMC-device-driver/20230822-023858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230821183525.3427144-2-ninad%40linux.ibm.com
patch subject: [PATCH v1 1/1] soc/aspeed: Add host side BMC device driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230823/202308231554.SV5ASPV0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231554.SV5ASPV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231554.SV5ASPV0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/aspeed/aspeed-host-bmc-dev.c: In function 'aspeed_pci_host_bmc_device_probe':
>> drivers/soc/aspeed/aspeed-host-bmc-dev.c:184:1: warning: the frame size of 1072 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     184 | }
         | ^


vim +184 drivers/soc/aspeed/aspeed-host-bmc-dev.c

    42	
    43	static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev,
    44			const struct pci_device_id *ent)
    45	{
    46		struct uart_8250_port uart[VUART_MAX_PARMS];
    47		struct device *dev = &pdev->dev;
    48		struct aspeed_pci_bmc_dev *pci_bmc_dev;
    49		int rc = 0;
    50		int i = 0;
    51		int nr_entries;
    52		u16 config_cmd_val;
    53	
    54		pci_bmc_dev = kzalloc(sizeof(*pci_bmc_dev), GFP_KERNEL);
    55		if (!pci_bmc_dev) {
    56			rc = -ENOMEM;
    57			dev_err(dev, "kmalloc() returned NULL memory.\n");
    58			goto out_err;
    59		}
    60	
    61		rc = pcim_enable_device(pdev);
    62		if (rc != 0) {
    63			dev_err(dev, "pcim_enable_device() returned error %d\n", rc);
    64			goto out_free0;
    65		}
    66	
    67		/* set PCI host mastering  */
    68		pci_set_master(pdev);
    69	
    70		/*
    71		 * Try to allocate max MSI. If multiple MSI is not possible then use
    72		 * the legacy interrupt. Note: PowerPC doesn't support multiple MSI.
    73		 */
    74		nr_entries = pci_alloc_irq_vectors(pdev, BMC_MULTI_MSI, BMC_MULTI_MSI,
    75					PCI_IRQ_MSIX | PCI_IRQ_MSI);
    76	
    77		if (nr_entries < 0) {
    78			pci_bmc_dev->legacy_irq = 1;
    79			pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
    80			config_cmd_val &= ~PCI_COMMAND_INTX_DISABLE;
    81			pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
    82	
    83		} else {
    84			pci_bmc_dev->legacy_irq = 0;
    85			pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
    86			config_cmd_val |= PCI_COMMAND_INTX_DISABLE;
    87			pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
    88			rc = pci_irq_vector(pdev, BMC_MSI_IDX_BASE);
    89			if (rc < 0) {
    90				dev_err(dev, "pci_irq_vector() returned error %d msi=%u msix=%u\n",
    91					-rc, pdev->msi_enabled, pdev->msix_enabled);
    92				goto out_free1;
    93			}
    94			pdev->irq = rc;
    95		}
    96	
    97		/* Get access to the BARs */
    98		for (i = 0; i < BAR_MAX; i++) {
    99			rc = pci_request_region(pdev, i, DRIVER_NAME);
   100			if (rc < 0) {
   101				dev_err(dev, "pci_request_region(%d) returned error %d\n", i, rc);
   102				goto out_unreg;
   103			}
   104	
   105			pci_bmc_dev->bars[i].bar_base = pci_resource_start(pdev, i);
   106			pci_bmc_dev->bars[i].bar_size = pci_resource_len(pdev, i);
   107			pci_bmc_dev->bars[i].bar_ioremap = pci_ioremap_bar(pdev, i);
   108			if (pci_bmc_dev->bars[i].bar_ioremap == NULL) {
   109				dev_err(dev, "pci_ioremap_bar(%d) failed\n", i);
   110				rc = -ENOMEM;
   111				goto out_unreg;
   112			}
   113		}
   114	
   115		/* ERRTA40: dummy read */
   116		(void)__raw_readl((void __iomem *)pci_bmc_dev->bars[BAR_MSG].bar_ioremap);
   117	
   118		pci_set_drvdata(pdev, pci_bmc_dev);
   119	
   120		/* setup VUART */
   121		memset(uart, 0, sizeof(uart));
   122	
   123		for (i = 0; i < VUART_MAX_PARMS; i++) {
   124			vuart_ioport[i] = 0x3F8 - (i * 0x100);
   125			vuart_sirq[i] = 0x10 + 4 - i - BMC_MSI_IDX_BASE;
   126			uart[i].port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
   127			uart[i].port.uartclk = 115200 * 16;
   128			pci_bmc_dev->lines[i] = -1;
   129	
   130			if (pci_bmc_dev->legacy_irq) {
   131				uart[i].port.irq = pdev->irq;
   132			} else {
   133				rc = pci_irq_vector(pdev, vuart_sirq[i]);
   134				if (rc < 0) {
   135					dev_err(dev,
   136						"pci_irq_vector() returned error %d msi=%u msix=%u\n",
   137						-rc, pdev->msi_enabled, pdev->msix_enabled);
   138					goto out_unreg;
   139				}
   140				uart[i].port.irq = rc;
   141			}
   142			uart[i].port.dev = dev;
   143			uart[i].port.iotype = UPIO_MEM32;
   144			uart[i].port.iobase = 0;
   145			uart[i].port.mapbase =
   146					pci_bmc_dev->bars[BAR_MSG].bar_base + (vuart_ioport[i] << 2);
   147			uart[i].port.membase =
   148					pci_bmc_dev->bars[BAR_MSG].bar_ioremap + (vuart_ioport[i] << 2);
   149			uart[i].port.type = PORT_16550A;
   150			uart[i].port.flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
   151			uart[i].port.regshift = 2;
   152	
   153			rc = serial8250_register_8250_port(&uart[i]);
   154			if (rc < 0) {
   155				dev_err(dev,
   156					"cannot setup VUART@%xh over PCIe, rc=%d\n",
   157					vuart_ioport[i], -rc);
   158				goto out_unreg;
   159			}
   160			pci_bmc_dev->lines[i] = rc;
   161		}
   162	
   163		return 0;
   164	
   165	out_unreg:
   166		for (i = 0; i < VUART_MAX_PARMS; i++) {
   167			if (pci_bmc_dev->lines[i] >= 0)
   168				serial8250_unregister_port(pci_bmc_dev->lines[i]);
   169		}
   170	
   171		pci_release_regions(pdev);
   172	out_free1:
   173		if (pci_bmc_dev->legacy_irq)
   174			free_irq(pdev->irq, pdev);
   175		else
   176			pci_free_irq_vectors(pdev);
   177	
   178		pci_clear_master(pdev);
   179	out_free0:
   180		kfree(pci_bmc_dev);
   181	out_err:
   182	
   183		return rc;
 > 184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
