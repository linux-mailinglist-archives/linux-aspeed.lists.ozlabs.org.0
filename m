Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE97902E0
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Sep 2023 22:43:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BiR6IIHU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rcqjy5pvhz3c47
	for <lists+linux-aspeed@lfdr.de>; Sat,  2 Sep 2023 06:43:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BiR6IIHU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rcqjh2clwz307V
	for <linux-aspeed@lists.ozlabs.org>; Sat,  2 Sep 2023 06:43:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693600984; x=1725136984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CbVnfzwwwVoFn02TRV4AclDXNOSd+TrBbstsh2fLvjU=;
  b=BiR6IIHU1QncBxs4SK06VoCLSBWEGKDw6srG1D0ROw09B83WLP96ubsX
   mhBv7QeMxle4LaFiKffhfzGDtxZxtSa7vyA9p8N9Z6YlRVtdcZZgEyGqV
   WhgO/KIy6aVnjZ0A1GeOeHX9DG0zxv7C9hGfar9wAjDSFFSFkBr0AgBEJ
   eKxNbajBHSkfA+8gf+rCnITpyUHVOqJoObcC0dEFvx2EVFVP8BfGp5TT6
   GDwS88k/idTe8fMg1QZYfhRIvI2Y+Wqe2E4G2uR8a35bRDsC2yZzhWLXb
   U50NlngvM09P35gEyHUN+o/bLlj7XnONaXkolZYkj1A4cxMbka9AukeI6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440275509"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="440275509"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 13:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="743245059"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="743245059"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Sep 2023 13:42:52 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcAyg-0001cp-2n;
	Fri, 01 Sep 2023 20:42:50 +0000
Date: Sat, 2 Sep 2023 04:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
	eajames@linux.ibm.com
Subject: Re: [PATCH v2 1/1] soc/aspeed: Add host side BMC device driver
Message-ID: <202309020400.PQMeauEC-lkp@intel.com>
References: <20230823173104.3219128-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823173104.3219128-2-ninad@linux.ibm.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ninad-Palsule/soc-aspeed-Add-host-side-BMC-device-driver/20230824-013703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230823173104.3219128-2-ninad%40linux.ibm.com
patch subject: [PATCH v2 1/1] soc/aspeed: Add host side BMC device driver
config: m68k-randconfig-r004-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020400.PQMeauEC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020400.PQMeauEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020400.PQMeauEC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/aspeed/aspeed-host-bmc-dev.c: In function 'aspeed_pci_host_bmc_device_probe':
>> drivers/soc/aspeed/aspeed-host-bmc-dev.c:98:22: error: implicit declaration of function 'pci_request_region'; did you mean 'pci_request_regions'? [-Werror=implicit-function-declaration]
      98 |                 rc = pci_request_region(pdev, i, DRIVER_NAME);
         |                      ^~~~~~~~~~~~~~~~~~
         |                      pci_request_regions
>> drivers/soc/aspeed/aspeed-host-bmc-dev.c:176:17: error: implicit declaration of function 'pci_free_irq_vectors'; did you mean 'pci_alloc_irq_vectors'? [-Werror=implicit-function-declaration]
     176 |                 pci_free_irq_vectors(pdev);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 pci_alloc_irq_vectors
   cc1: some warnings being treated as errors


vim +98 drivers/soc/aspeed/aspeed-host-bmc-dev.c

    42	
    43	static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev,
    44			const struct pci_device_id *ent)
    45	{
    46		struct uart_8250_port uart;
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
    74		nr_entries = pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI,
    75					PCI_IRQ_MSIX | PCI_IRQ_MSI);
    76		if (nr_entries < 0) {
    77			pci_bmc_dev->legacy_irq = 1;
    78			pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
    79			config_cmd_val &= ~PCI_COMMAND_INTX_DISABLE;
    80			pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
    81	
    82		} else {
    83			pci_bmc_dev->legacy_irq = 0;
    84			pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
    85			config_cmd_val |= PCI_COMMAND_INTX_DISABLE;
    86			pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
    87			rc = pci_irq_vector(pdev, BMC_MSI_IDX_BASE);
    88			if (rc < 0) {
    89				dev_err(dev, "pci_irq_vector() returned error %d msi=%u msix=%u\n",
    90					-rc, pdev->msi_enabled, pdev->msix_enabled);
    91				goto out_free1;
    92			}
    93			pdev->irq = rc;
    94		}
    95	
    96		/* Get access to the BARs */
    97		for (i = 0; i < BAR_MAX; i++) {
  > 98			rc = pci_request_region(pdev, i, DRIVER_NAME);
    99			if (rc < 0) {
   100				dev_err(dev, "pci_request_region(%d) returned error %d\n", i, rc);
   101				goto out_unreg;
   102			}
   103	
   104			pci_bmc_dev->bars[i].bar_base = pci_resource_start(pdev, i);
   105			pci_bmc_dev->bars[i].bar_size = pci_resource_len(pdev, i);
   106			pci_bmc_dev->bars[i].bar_ioremap = pci_ioremap_bar(pdev, i);
   107			if (pci_bmc_dev->bars[i].bar_ioremap == NULL) {
   108				dev_err(dev, "pci_ioremap_bar(%d) failed\n", i);
   109				rc = -ENOMEM;
   110				goto out_unreg;
   111			}
   112		}
   113	
   114		/* ERRTA40: dummy read */
   115		(void)__raw_readl((void __iomem *)pci_bmc_dev->bars[BAR_MSG].bar_ioremap);
   116	
   117		pci_set_drvdata(pdev, pci_bmc_dev);
   118	
   119		for (i = 0; i < VUART_MAX_PARMS; i++)
   120			pci_bmc_dev->lines[i] = -1;
   121	
   122		/* setup VUART */
   123		for (i = 0; i < VUART_MAX_PARMS; i++) {
   124			memset(&uart, 0, sizeof(uart));
   125			vuart_ioport[i] = 0x3F8 - (i * 0x100);
   126			vuart_sirq[i] = 0x10 + 4 - i - BMC_MSI_IDX_BASE;
   127			uart.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
   128			uart.port.uartclk = 115200 * 16;
   129	
   130			if (pci_bmc_dev->legacy_irq) {
   131				uart.port.irq = pdev->irq;
   132			} else {
   133				rc = pci_irq_vector(pdev, vuart_sirq[i]);
   134				if (rc < 0) {
   135					dev_err(dev,
   136						"pci_irq_vector() returned error %d msi=%u msix=%u\n",
   137						-rc, pdev->msi_enabled, pdev->msix_enabled);
   138					goto out_unreg;
   139				}
   140				uart.port.irq = rc;
   141			}
   142			uart.port.dev = dev;
   143			uart.port.iotype = UPIO_MEM32;
   144			uart.port.iobase = 0;
   145			uart.port.mapbase =
   146					pci_bmc_dev->bars[BAR_MSG].bar_base + (vuart_ioport[i] << 2);
   147			uart.port.membase =
   148					pci_bmc_dev->bars[BAR_MSG].bar_ioremap + (vuart_ioport[i] << 2);
   149			uart.port.type = PORT_16550A;
   150			uart.port.flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
   151			uart.port.regshift = 2;
   152	
   153			rc = serial8250_register_8250_port(&uart);
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
 > 176			pci_free_irq_vectors(pdev);
   177	
   178		pci_clear_master(pdev);
   179	out_free0:
   180		kfree(pci_bmc_dev);
   181	out_err:
   182	
   183		return rc;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
