Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734985607F6
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 19:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY8LW2HyMz3cCm
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 03:57:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFgo2iPl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFgo2iPl;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY8LM17rqz3bkZ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jun 2022 03:57:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656525435; x=1688061435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=INf/MAvqf2uKsO8grp6pTmrI5AfWfQYZJ5KdN59VDBQ=;
  b=JFgo2iPldHIVNJY3R/HNksJzckbNGGYRp5KPy6NLtuFVb0GGpiTL92CY
   uGmJ7K1ujZ1qozwqOeCvFkK0TAMFzGQq2wrJi41+ufD8fSduOczqumBqG
   J6YunEd8W1//67NqHcBnXXkd0td0aCo4z7TAvqQ8c3Oqyd9qEKhXCCa4x
   vpt6wCrL5pdSq1rR0lV9zMVVFj6W+W5PI4/lVU/cemT+771a5j9HCSmBO
   u/sOGNQ6yLgw8FpdviZHacGaJQMpXuCwQvmWS1ePpqYk7VP1QYi1jm/rB
   tJ0KZJrD+8czu+xvV98YXvoGeHTOqCZ7a4uJlXRhhgpCKFPDES1HOwDeH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283198655"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="283198655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 10:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="540940843"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jun 2022 10:57:06 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6bw1-000BOO-RQ;
	Wed, 29 Jun 2022 17:57:05 +0000
Date: Thu, 30 Jun 2022 01:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: SebinSebastian <mailmesebin00@gmail.com>
Subject: Re: [PATCH -next] usb: gadget: dereference before null check
Message-ID: <202206300156.qNpjgo9z-lkp@intel.com>
References: <20220629080726.107297-1-mailmesebin00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629080726.107297-1-mailmesebin00@gmail.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, kbuild-all@lists.01.org, linux-aspeed@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mailmesebin00@gmail.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, Neal Liu <neal_liu@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi SebinSebastian,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220628]

url:    https://github.com/intel-lab-lkp/linux/commits/SebinSebastian/usb-gadget-dereference-before-null-check/20220629-161008
base:    cb71b93c2dc36d18a8b05245973328d018272cdf
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220630/202206300156.qNpjgo9z-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97ebbd93f269a58b3b5a003898d6e09c29a73ab0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review SebinSebastian/usb-gadget-dereference-before-null-check/20220629-161008
        git checkout 97ebbd93f269a58b3b5a003898d6e09c29a73ab0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/gadget/udc/aspeed_udc.c: In function 'ast_udc_ep_enable':
>> drivers/usb/gadget/udc/aspeed_udc.c:349:22: error: 'ep' undeclared (first use in this function); did you mean '_ep'?
     349 |         if (!_ep || !ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT ||
         |                      ^~
         |                      _ep
   drivers/usb/gadget/udc/aspeed_udc.c:349:22: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/usb/gadget/udc/aspeed_udc.c:350:13: error: 'maxpacket' undeclared (first use in this function)
     350 |             maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
         |             ^~~~~~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:355:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     355 |         u16 maxpacket = usb_endpoint_maxp(desc);
         |         ^~~


vim +349 drivers/usb/gadget/udc/aspeed_udc.c

055276c1320564b Neal Liu       2022-05-23  340  
055276c1320564b Neal Liu       2022-05-23  341  static int ast_udc_ep_enable(struct usb_ep *_ep,
055276c1320564b Neal Liu       2022-05-23  342  			     const struct usb_endpoint_descriptor *desc)
055276c1320564b Neal Liu       2022-05-23  343  {
055276c1320564b Neal Liu       2022-05-23  344  	unsigned long flags;
055276c1320564b Neal Liu       2022-05-23  345  	u32 ep_conf = 0;
055276c1320564b Neal Liu       2022-05-23  346  	u8 dir_in;
055276c1320564b Neal Liu       2022-05-23  347  	u8 type;
055276c1320564b Neal Liu       2022-05-23  348  
055276c1320564b Neal Liu       2022-05-23 @349  	if (!_ep || !ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT ||
055276c1320564b Neal Liu       2022-05-23 @350  	    maxpacket == 0 || maxpacket > ep->ep.maxpacket) {
055276c1320564b Neal Liu       2022-05-23  351  		EP_DBG(ep, "Failed, invalid EP enable param\n");
055276c1320564b Neal Liu       2022-05-23  352  		return -EINVAL;
055276c1320564b Neal Liu       2022-05-23  353  	}
055276c1320564b Neal Liu       2022-05-23  354  
97ebbd93f269a58 SebinSebastian 2022-06-29  355  	u16 maxpacket = usb_endpoint_maxp(desc);
97ebbd93f269a58 SebinSebastian 2022-06-29  356  	struct ast_udc_ep *ep = to_ast_ep(_ep);
97ebbd93f269a58 SebinSebastian 2022-06-29  357  	struct ast_udc_dev *udc = ep->udc;
97ebbd93f269a58 SebinSebastian 2022-06-29  358  	u8 epnum = usb_endpoint_num(desc);
97ebbd93f269a58 SebinSebastian 2022-06-29  359  
055276c1320564b Neal Liu       2022-05-23  360  	if (!udc->driver) {
055276c1320564b Neal Liu       2022-05-23  361  		EP_DBG(ep, "bogus device state\n");
055276c1320564b Neal Liu       2022-05-23  362  		return -ESHUTDOWN;
055276c1320564b Neal Liu       2022-05-23  363  	}
055276c1320564b Neal Liu       2022-05-23  364  
055276c1320564b Neal Liu       2022-05-23  365  	EP_DBG(ep, "maxpacket:0x%x\n", maxpacket);
055276c1320564b Neal Liu       2022-05-23  366  
055276c1320564b Neal Liu       2022-05-23  367  	spin_lock_irqsave(&udc->lock, flags);
055276c1320564b Neal Liu       2022-05-23  368  
055276c1320564b Neal Liu       2022-05-23  369  	ep->desc = desc;
055276c1320564b Neal Liu       2022-05-23  370  	ep->stopped = 0;
055276c1320564b Neal Liu       2022-05-23  371  	ep->ep.maxpacket = maxpacket;
055276c1320564b Neal Liu       2022-05-23  372  	ep->chunk_max = AST_EP_DMA_DESC_MAX_LEN;
055276c1320564b Neal Liu       2022-05-23  373  
055276c1320564b Neal Liu       2022-05-23  374  	if (maxpacket < AST_UDC_EPn_MAX_PACKET)
055276c1320564b Neal Liu       2022-05-23  375  		ep_conf = EP_SET_MAX_PKT(maxpacket);
055276c1320564b Neal Liu       2022-05-23  376  
055276c1320564b Neal Liu       2022-05-23  377  	ep_conf |= EP_SET_EP_NUM(epnum);
055276c1320564b Neal Liu       2022-05-23  378  
055276c1320564b Neal Liu       2022-05-23  379  	type = usb_endpoint_type(desc);
055276c1320564b Neal Liu       2022-05-23  380  	dir_in = usb_endpoint_dir_in(desc);
055276c1320564b Neal Liu       2022-05-23  381  	ep->dir_in = dir_in;
055276c1320564b Neal Liu       2022-05-23  382  	if (!ep->dir_in)
055276c1320564b Neal Liu       2022-05-23  383  		ep_conf |= EP_DIR_OUT;
055276c1320564b Neal Liu       2022-05-23  384  
055276c1320564b Neal Liu       2022-05-23  385  	EP_DBG(ep, "type %d, dir_in %d\n", type, dir_in);
055276c1320564b Neal Liu       2022-05-23  386  	switch (type) {
055276c1320564b Neal Liu       2022-05-23  387  	case USB_ENDPOINT_XFER_ISOC:
055276c1320564b Neal Liu       2022-05-23  388  		ep_conf |= EP_SET_TYPE_MASK(EP_TYPE_ISO);
055276c1320564b Neal Liu       2022-05-23  389  		break;
055276c1320564b Neal Liu       2022-05-23  390  
055276c1320564b Neal Liu       2022-05-23  391  	case USB_ENDPOINT_XFER_BULK:
055276c1320564b Neal Liu       2022-05-23  392  		ep_conf |= EP_SET_TYPE_MASK(EP_TYPE_BULK);
055276c1320564b Neal Liu       2022-05-23  393  		break;
055276c1320564b Neal Liu       2022-05-23  394  
055276c1320564b Neal Liu       2022-05-23  395  	case USB_ENDPOINT_XFER_INT:
055276c1320564b Neal Liu       2022-05-23  396  		ep_conf |= EP_SET_TYPE_MASK(EP_TYPE_INT);
055276c1320564b Neal Liu       2022-05-23  397  		break;
055276c1320564b Neal Liu       2022-05-23  398  	}
055276c1320564b Neal Liu       2022-05-23  399  
055276c1320564b Neal Liu       2022-05-23  400  	ep->desc_mode = udc->desc_mode && ep->descs_dma && ep->dir_in;
055276c1320564b Neal Liu       2022-05-23  401  	if (ep->desc_mode) {
055276c1320564b Neal Liu       2022-05-23  402  		ast_ep_write(ep, EP_DMA_CTRL_RESET, AST_UDC_EP_DMA_CTRL);
055276c1320564b Neal Liu       2022-05-23  403  		ast_ep_write(ep, 0, AST_UDC_EP_DMA_STS);
055276c1320564b Neal Liu       2022-05-23  404  		ast_ep_write(ep, ep->descs_dma, AST_UDC_EP_DMA_BUFF);
055276c1320564b Neal Liu       2022-05-23  405  
055276c1320564b Neal Liu       2022-05-23  406  		/* Enable Long Descriptor Mode */
055276c1320564b Neal Liu       2022-05-23  407  		ast_ep_write(ep, EP_DMA_CTRL_IN_LONG_MODE | EP_DMA_DESC_MODE,
055276c1320564b Neal Liu       2022-05-23  408  			     AST_UDC_EP_DMA_CTRL);
055276c1320564b Neal Liu       2022-05-23  409  
055276c1320564b Neal Liu       2022-05-23  410  		ep->descs_wptr = 0;
055276c1320564b Neal Liu       2022-05-23  411  
055276c1320564b Neal Liu       2022-05-23  412  	} else {
055276c1320564b Neal Liu       2022-05-23  413  		ast_ep_write(ep, EP_DMA_CTRL_RESET, AST_UDC_EP_DMA_CTRL);
055276c1320564b Neal Liu       2022-05-23  414  		ast_ep_write(ep, EP_DMA_SINGLE_STAGE, AST_UDC_EP_DMA_CTRL);
055276c1320564b Neal Liu       2022-05-23  415  		ast_ep_write(ep, 0, AST_UDC_EP_DMA_STS);
055276c1320564b Neal Liu       2022-05-23  416  	}
055276c1320564b Neal Liu       2022-05-23  417  
055276c1320564b Neal Liu       2022-05-23  418  	/* Cleanup data toggle just in case */
055276c1320564b Neal Liu       2022-05-23  419  	ast_udc_write(udc, EP_TOGGLE_SET_EPNUM(epnum), AST_VHUB_EP_DATA);
055276c1320564b Neal Liu       2022-05-23  420  
055276c1320564b Neal Liu       2022-05-23  421  	/* Enable EP */
055276c1320564b Neal Liu       2022-05-23  422  	ast_ep_write(ep, ep_conf | EP_ENABLE, AST_UDC_EP_CONFIG);
055276c1320564b Neal Liu       2022-05-23  423  
055276c1320564b Neal Liu       2022-05-23  424  	EP_DBG(ep, "ep_config: 0x%x\n", ast_ep_read(ep, AST_UDC_EP_CONFIG));
055276c1320564b Neal Liu       2022-05-23  425  
055276c1320564b Neal Liu       2022-05-23  426  	spin_unlock_irqrestore(&udc->lock, flags);
055276c1320564b Neal Liu       2022-05-23  427  
055276c1320564b Neal Liu       2022-05-23  428  	return 0;
055276c1320564b Neal Liu       2022-05-23  429  }
055276c1320564b Neal Liu       2022-05-23  430  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
