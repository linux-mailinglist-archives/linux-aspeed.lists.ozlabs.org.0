Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id C8B628CDAAA
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 21:16:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OCWaWop/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vld3f72JYz3gLw
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 05:07:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OCWaWop/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vld3V6H6Wz3gLl;
	Fri, 24 May 2024 05:07:50 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NJ7VWF025991;
	Thu, 23 May 2024 19:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Q688xSTw6bWKVlI3IHoLWJi8/sQGfWoYKVe4r6Iv/ww=;
 b=OCWaWop/kQs/bPc1og2/kn2iSnXtYM1ra6y92lZ5/up+cWbRdvEdxecLWJcv4p8NU5M3
 78upzBMzpVkSmrylcJLljGtemVPeXBwXu7Spw/8mW3c2IBy6KVs1WkMJCuPl3g94s3bL
 CUVhTIOpqUUdI+P8PwMxmul8v1NO9CbxsClkjgT2+B0lH4wcEiWH8q1M2Oh+uHnmno2b
 7goaPK12oKqsTJyEk5jR1h/MQVYXRWTcJoGIBWSnVEk0DV1+uCXBVuzdCbkXJJqBJGdk
 ejT+rB3LHPPcpHBoi0O3WZyeZjjpbVfvGPaFoGvo+jLk26UvBzALzH0uB+H4b7cCcAI4 zQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yabp0g01j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 19:07:37 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NHDRtD023485;
	Thu, 23 May 2024 19:07:36 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77npkudv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 19:07:36 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NJ7XXK44761568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 19:07:35 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F27B58055;
	Thu, 23 May 2024 19:07:33 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 548C55804B;
	Thu, 23 May 2024 19:07:32 +0000 (GMT)
Received: from [9.61.104.209] (unknown [9.61.104.209])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 19:07:32 +0000 (GMT)
Message-ID: <36030de9-0b05-4ab8-a603-510602d0fdf8@linux.ibm.com>
Date: Thu, 23 May 2024 14:07:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: linux-fsi@lists.ozlabs.org
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <202405232008.olE9azVd-lkp@intel.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <202405232008.olE9azVd-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 35oWZC4sOfejH1QRxif28YVySryd5vh4
X-Proofpoint-ORIG-GUID: 35oWZC4sOfejH1QRxif28YVySryd5vh4
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230131
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 5/23/24 07:48, kernel test robot wrote:
> Hi Eddie,
>
> kernel test robot noticed the following build errors:


Silly mistake. If this patch can be dropped from the series, I can send 
an updated Huygens DTS after this series is merged, unless I need to do 
a v7.


Thanks,

Eddie


>
> [auto build test ERROR on andi-shyti/i2c/i2c-host]
> [also build test ERROR on linus/master v6.9 next-20240523]
> [cannot apply to robh/for-next broonie-spi/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/spi-dt-bindings-Document-the-IBM-FSI-attached-SPI-controller/20240523-033334
> base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20240522192524.3286237-18-eajames%40linux.ibm.com
> patch subject: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
> config: arm-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405232008.olE9azVd-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts:13.2-37 Properties must precede subnodes
>     FATAL ERROR: Unable to parse input tree
>
