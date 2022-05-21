Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2652F774
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 May 2022 03:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4mwT5Fwhz3bm2
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 May 2022 11:58:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XVGQqWbg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XVGQqWbg; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4mwK5ndyz3bY6
 for <linux-aspeed@lists.ozlabs.org>; Sat, 21 May 2022 11:58:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653098322; x=1684634322;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DrWDg9joVp2dABARq0RhykWRXTcxvZJXfd8ePCmsTW0=;
 b=XVGQqWbga2St701//o6hNz3NZUZfHEN/UTUq3z2csnXSLkFSmX4c/jcs
 ht/uesQGph+e4AT9jZZlflqHx/zkIXKjl1CnL7It/xenpIdFSlWRoG14u
 w49fndDJfsyO49KV4h6afkat5/9hYG1UOGD3+y9wjj8FmrYcR0kQu+s9F
 A9ZdfBBSB3TdeymFBNgCZmJBkWYfbs3RpnJkYfb9XreuGSE+g9I86GO4a
 k1zafdJyXgylDFJoqi9fDKl5DICtCGnpbBI9ksLgZOZmqoHC59GnxCW6e
 dlmwq//K//WwerjnytXX9M4IUsL8yRz6Un/nBm37mgsSB/k/8KCvko/DA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="260375549"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="260375549"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 18:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="546969294"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 20 May 2022 18:58:23 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nsENq-0005lm-Q8;
 Sat, 21 May 2022 01:58:22 +0000
Date: Sat, 21 May 2022 09:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v4 1/3] usb: gadget: add Aspeed ast2600 udc driver
Message-ID: <202205210945.hUK3CONa-lkp@intel.com>
References: <20220520090617.2225080-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520090617.2225080-2-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 kbuild-all@lists.01.org, linux-aspeed@lists.ozlabs.org,
 Neal Liu <neal_liu@aspeedtech.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Neal,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next v5.18-rc7 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220520-170904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220521/202205210945.hUK3CONa-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/19f3e863ea1b55f570db57febb96c6e8cb39c145
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220520-170904
        git checkout 19f3e863ea1b55f570db57febb96c6e8cb39c145
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clk/ drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/aspeed_udc.c:310:11: warning: comparison of address of 'ep->queue' equal to a null pointer is always false [-Wtautological-pointer-compare]
           if (&ep->queue == NULL)
                ~~~~^~~~~    ~~~~
>> drivers/usb/gadget/udc/aspeed_udc.c:967:7: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
                   if (len < ep->ep.maxpacket) {
                       ^~~
   drivers/usb/gadget/udc/aspeed_udc.c:908:9: note: initialize the variable 'len' to silence this warning
           u16 len;
                  ^
                   = 0
>> drivers/usb/gadget/udc/aspeed_udc.c:1011:7: warning: variable 'epnum' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case USB_RECIP_INTERFACE:
                ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/usb/ch9.h:67:30: note: expanded from macro 'USB_RECIP_INTERFACE'
   #define USB_RECIP_INTERFACE             0x01
                                           ^~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1021:16: note: uninitialized use occurs here
           ep = &udc->ep[epnum];
                         ^~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1007:7: warning: variable 'epnum' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case USB_RECIP_DEVICE:
                ^~~~~~~~~~~~~~~~
   include/uapi/linux/usb/ch9.h:66:27: note: expanded from macro 'USB_RECIP_DEVICE'
   #define USB_RECIP_DEVICE                0x00
                                           ^~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1021:16: note: uninitialized use occurs here
           ep = &udc->ep[epnum];
                         ^~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1002:11: note: initialize the variable 'epnum' to silence this warning
           u16 epnum;
                    ^
                     = 0
>> drivers/usb/gadget/udc/aspeed_udc.c:1096:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (udc->driver) {
               ^~~~~~~~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1108:6: note: uninitialized use occurs here
           if (rc >= 0)
               ^~
   drivers/usb/gadget/udc/aspeed_udc.c:1096:2: note: remove the 'if' if its condition is always true
           if (udc->driver) {
           ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1039:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   5 warnings generated.


vim +310 drivers/usb/gadget/udc/aspeed_udc.c

   304	
   305	static void ast_udc_nuke(struct ast_udc_ep *ep, int status)
   306	{
   307		int count = 0;
   308	
   309		/* Sanity check */
 > 310		if (&ep->queue == NULL)
   311			return;
   312	
   313		while (!list_empty(&ep->queue)) {
   314			struct ast_udc_request *req;
   315	
   316			req = list_entry(ep->queue.next, struct ast_udc_request,
   317					 queue);
   318			ast_udc_done(ep, req, status);
   319			count++;
   320		}
   321	
   322		if (count)
   323			EP_DBG(ep, "Nuked %d request(s)\n", count);
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
