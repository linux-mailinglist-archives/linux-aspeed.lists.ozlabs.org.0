Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C615260A6
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 May 2022 13:05:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L05QM2MmNz3c90
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 May 2022 21:04:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NyCK2Cn9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NyCK2Cn9; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L05QF0FjXz3by9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 May 2022 21:04:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652439893; x=1683975893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TLKqQ2wymwAEhGiToADns1nYw8QR22hogOXokBFX7Cc=;
 b=NyCK2Cn9IZ5TeSpbLivUZz3DA4XpV0ou2mbObYkfSqtmBM/WFKATIb9Q
 2GOQgAdyKLHQLq2ngU2nWkwrYuCTCK5r8wrRd/4rtKWFWoFBKTcBCKAVb
 IBAaHjIT9gZXwCIqCt0Yq/nb7Lki18uQvn+NJ4Q/qCtywa/RtR2l0UT+3
 mOFz6mTsik7OPn3XSo0JAvizyivB/WIgjlNidXjhSrZ7JVJPnnrOkHy3w
 XFw3dWPSdFG69PR1p+0pMt3Krm8DhjORmRboW4741l6bMOhPNONL/We5L
 NIR2RbNDB6ldF06TEPrBWjE8/Rh9imFFjbpbi8Af2EnnW4zLiIROtwisi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270414095"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="270414095"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 04:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="815340352"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 13 May 2022 04:03:36 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npT55-000LfU-DL;
 Fri, 13 May 2022 11:03:35 +0000
Date: Fri, 13 May 2022 19:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/3] usb: gadget: add Aspeed ast2600 udc driver
Message-ID: <202205131836.QEUySDoN-lkp@intel.com>
References: <20220513065728.857722-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513065728.857722-2-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Neal,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220513-150314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220513/202205131836.QEUySDoN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/272ae26f9fe89f60d584cf445431d0fa566eb24b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220513-150314
        git checkout 272ae26f9fe89f60d584cf445431d0fa566eb24b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/aspeed_udc.c: In function 'ast_udc_ep0_out':
>> drivers/usb/gadget/udc/aspeed_udc.c:790:13: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
     790 |         u8 *buf;
         |             ^~~
   drivers/usb/gadget/udc/aspeed_udc.c: In function 'ast_udc_ep0_handle_setup':
>> drivers/usb/gadget/udc/aspeed_udc.c:1099:60: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1099 |                 SETUP_DBG(udc, "No gadget for request !\n");
         |                                                            ^
>> drivers/usb/gadget/udc/aspeed_udc.c:1034:13: warning: variable 'ep_num' set but not used [-Wunused-but-set-variable]
    1034 |         u16 ep_num = 0;
         |             ^~~~~~


vim +/buf +790 drivers/usb/gadget/udc/aspeed_udc.c

   783	
   784	static void ast_udc_ep0_out(struct ast_udc_dev *udc)
   785	{
   786		struct device *dev = &udc->pdev->dev;
   787		struct ast_udc_ep *ep = &udc->ep[0];
   788		struct ast_udc_request *req;
   789		u16 rx_len;
 > 790		u8 *buf;
   791	
   792		if (list_empty(&ep->queue))
   793			return;
   794	
   795		req = list_entry(ep->queue.next, struct ast_udc_request, queue);
   796	
   797		buf = req->req.buf;
   798		rx_len = EP0_GET_RX_LEN(ast_udc_read(udc, AST_UDC_EP0_CTRL));
   799		req->req.actual += rx_len;
   800	
   801		SETUP_DBG(udc, "req %p (%d/%d)\n", req,
   802			  req->req.actual, req->req.length);
   803	
   804		if ((rx_len < ep->ep.maxpacket) ||
   805		    (req->req.actual == req->req.length)) {
   806			ast_udc_ep0_tx(udc);
   807			if (!ep->dir_in)
   808				ast_udc_done(ep, req, 0);
   809	
   810		} else {
   811			if (rx_len > req->req.length) {
   812				// Issue Fix
   813				dev_warn(dev, "Something wrong (%d/%d)\n",
   814					 req->req.actual, req->req.length);
   815				ast_udc_ep0_tx(udc);
   816				ast_udc_done(ep, req, 0);
   817				return;
   818			}
   819	
   820			ep->dir_in = 0;
   821	
   822			/* More works */
   823			ast_udc_ep0_queue(ep, req);
   824		}
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
