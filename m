Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF5991519
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Oct 2024 09:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLHLQ107Dz3bg1
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Oct 2024 17:37:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728113836;
	cv=none; b=ABZnONApSwAHaK9OpJu4fzzE1lH33tdXHftyLuNk/PWoo3QMxeLJXa/ZmtHWpoVk7ilfPg5yNPC5ptJn2QAiztMfH4J+SA1rMR8B98KOyEGNsuQi0j/m1ArS3A3M8vasRvFcHHajqgW7K0ry7FfvjB/I0ZqFaiM5M5AkYYh7a9DNB6IKnHCIpkiLd5mQOftkvUrr+PVOAazLEdX+kFpuHZYP0zdExcVCqmsbQt9E8cPFHNJhV0hEJvw5gQ5H1bgDEE5Z7bKE4zP+0rm/RD01i0z1bwy6QmVBdSupt0uSy6zRbSNTLML5RW2IhR9QBKdEeSJMdF5DDv/rlHheF8fTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728113836; c=relaxed/relaxed;
	bh=ZkNgLHMw44oNNkQN4d4HJxy8L+gik/cbCPxW6GPkBAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8GyyM9a/DfADLwhffHk2oixt5l/b5uZUkPrctavH4Dvn7GBDiqe0lChk8zKFLMp2zQxH/r9P3BEeKWSIMyzA8nmSWLXNaeDYhtIXjdYgTjV2C3niYIFB/NK/5tzsf46KNBuGlz/gYesheNItqe4ihePkdBAxmRCflbHk+i1njk2X+DwD+RyihnPwsM6k5jGo4D5nTYMdBtB173hVpUZPorxRymrnOOlHZpFnXZUTdeHeo46nim5BpX9aLcHkIJdD4YkMMQCoyXEoLJ75Yo12KhTy9dQ6tRLZCVrLiowm8bf3H5hUpn8cgT2Ve5KBIqcEl87fPJNso34nsRSQjvoGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=awuCbhBo; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=awuCbhBo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLHLK0s24z2yGD
	for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Oct 2024 17:37:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728113833; x=1759649833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u6WMt7NaLIFTr5THXasDszPWd+K083tVONyzoKZD91Q=;
  b=awuCbhBoSdl0lvbFmaOM+wzpOl4vRYMvdP8Vg4yaA2h5tdBdUBoRqcaF
   BskwdC5P5bjo1ifg/t5oF1gFED9NpEwPYV0fbw1mhTulpl+rnbViyzuUA
   pZzIrn9jtno0fsiACNMfJ9PF+y5q5HKt6HRifn6nTM/S/uC6tBGFpOcqZ
   AHc8yWSZjhDHGEhg0pVrFe6aBBCdmLtp3B4WYFy3ysIOpdWRpn+dxS4jt
   bvlj4jZbWc/VnQmysZp7C/XrdZ8GPFnaeGsCptoVYb3tsX50ZODI6OBfP
   Ynctm1V0D1JE3GMg14IO+9MYTnFAC5a+KO9SWjiBcQAyMXEXevHDF3J+7
   A==;
X-CSE-ConnectionGUID: W4Bi7R8ERbW4GycUKORPDg==
X-CSE-MsgGUID: Co96BAhMSi6aUIG4I1D96Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31218603"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31218603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:37:06 -0700
X-CSE-ConnectionGUID: v7tGEJ1EQsSmbuMbbEYZGg==
X-CSE-MsgGUID: i2WP+xpVR8S+46CU4OAu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79892116"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2024 00:37:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzLX-0002k8-2H;
	Sat, 05 Oct 2024 07:36:59 +0000
Date: Sat, 5 Oct 2024 15:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202410051547.vOL3qMOc-lkp@intel.com>
References: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.11]
[cannot apply to andi-shyti/i2c/i2c-host v6.12-rc1 linus/master next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20241002-150410
base:   v6.11
patch link:    https://lore.kernel.org/r/20241002070213.1165263-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051547.vOL3qMOc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_setup_buff_tx':
>> drivers/i2c/busses/i2c-ast2600.c:437:41: error: implicit declaration of function 'get_unaligned_le16'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     437 |                                         get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl
>> drivers/i2c/busses/i2c-ast2600.c:441:41: error: implicit declaration of function 'get_unaligned_le24'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     441 |                                         get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl
>> drivers/i2c/busses/i2c-ast2600.c:445:41: error: implicit declaration of function 'get_unaligned_le32'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     445 |                                         get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl


vim +437 drivers/i2c/busses/i2c-ast2600.c

   405	
   406	static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
   407	{
   408		struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
   409		u32 wbuf_dword;
   410		int xfer_len;
   411		int i;
   412	
   413		cmd |= AST2600_I2CM_PKT_EN;
   414		xfer_len = msg->len - i2c_bus->master_xfer_cnt;
   415		if (xfer_len > i2c_bus->buf_size)
   416			xfer_len = i2c_bus->buf_size;
   417		else if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
   418			cmd |= AST2600_I2CM_STOP_CMD;
   419	
   420		if (cmd & AST2600_I2CM_START_CMD)
   421			cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
   422	
   423		if (xfer_len) {
   424			cmd |= AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
   425			/*
   426			 * The controller's buffer register supports dword writes only.
   427			 * Therefore, write dwords to the buffer register in a 4-byte aligned,
   428			 * and write the remaining unaligned data at the end.
   429			 */
   430			for (i = 0; i < xfer_len; i += 4) {
   431				switch (min(xfer_len - i, 4) % 4) {
   432				case 1:
   433					wbuf_dword = msg->buf[i2c_bus->master_xfer_cnt + i];
   434					break;
   435				case 2:
   436					wbuf_dword =
 > 437						get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   438					break;
   439				case 3:
   440					wbuf_dword =
 > 441						get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   442					break;
   443				default:
   444					wbuf_dword =
 > 445						get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   446					break;
   447				}
   448				writel(wbuf_dword, i2c_bus->buf_base + i);
   449			}
   450			writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
   451			       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
   452		}
   453	
   454		writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   455	
   456		return 0;
   457	}
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
