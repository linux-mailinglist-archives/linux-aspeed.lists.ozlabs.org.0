Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55B91E41D
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Jul 2024 17:29:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jf6ZCbzk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCVMr534Zz3cGS
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jul 2024 01:29:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jf6ZCbzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCVMl75TXz3cF6;
	Tue,  2 Jul 2024 01:29:39 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461F088C007808;
	Mon, 1 Jul 2024 15:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=u
	niWTNZhY6/PeN2PBXp9nxUxWcQ8eIFPOkQf1pvT4LY=; b=Jf6ZCbzkoD4m7gYMB
	bnVL6XGh21Nwtv/YCIC9h//5Igs4GrdW/dhhaRNShK4fykKwVAwDGAxSicWLvo1d
	hfrG1MiyiXc+OsT9lK89Xa6TKMTyPreKiUhDT08IVZoyd9qzCqjOSA176CoN4fdg
	c2YHIxxsHKmuK4Q8ZdP/GMRWd6SKE2VyAPLlqWZ7CKAUI0t8yHGnZZvbRSZmyJAF
	ewG5iQmkosvazaCmb6Hp890uLPSLXCcsE6BQLcShLd+ZgSYwZVTaxV/C/8R3EZUy
	wiKF0NQtzeWMRfDTfMOM4IQe0czD5EyaZM8otac2HsKOryS5p21QGhDoNJSckbzI
	18WCQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403xpf025p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 15:29:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 461CBTO2030030;
	Mon, 1 Jul 2024 15:29:26 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402x3mqumu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 15:29:26 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 461FTNfV60621240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 15:29:25 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 484015806A;
	Mon,  1 Jul 2024 15:29:23 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 950DB58053;
	Mon,  1 Jul 2024 15:29:22 +0000 (GMT)
Received: from [9.61.77.123] (unknown [9.61.77.123])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 15:29:22 +0000 (GMT)
Message-ID: <a242af91-5e7f-48e3-8445-46c4a8b6a4ef@linux.ibm.com>
Date: Mon, 1 Jul 2024 10:29:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/40] fsi: Add interrupt support
To: Andrew Jeffery <andrew@codeconstruct.com.au>, linux-fsi@lists.ozlabs.org
References: <20240605212312.349188-1-eajames@linux.ibm.com>
 <21490f28ab110ae2eca59ec23591fc9c676361cc.camel@codeconstruct.com.au>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <21490f28ab110ae2eca59ec23591fc9c676361cc.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vnhkp8-_gSn0iLzqGVG5IlnMptV4-1Yb
X-Proofpoint-GUID: Vnhkp8-_gSn0iLzqGVG5IlnMptV4-1Yb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_15,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010118
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 6/5/24 20:02, Andrew Jeffery wrote:
> On Wed, 2024-06-05 at 16:22 -0500, Eddie James wrote:
>> Eddie James (40):
> ...
>
>>   .../dts/aspeed/aspeed-bmc-ibm-everest.dts     |  32 +-
>>   .../boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   1 +
>>   .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |  17 +-
>>   .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi |  16 +-
>>   drivers/fsi/Kconfig                           |   2 +
>>   drivers/fsi/fsi-core.c                        | 888 +++++++++++++++---
>>   drivers/fsi/fsi-master-aspeed.c               | 431 +++++----
>>   drivers/fsi/fsi-master-hub.c                  | 244 ++---
>>   drivers/fsi/fsi-master-i2cr.c                 |   2 +-
>>   drivers/fsi/fsi-master.h                      |  33 +
>>   drivers/fsi/fsi-slave.h                       | 117 +++
>>   drivers/i2c/busses/i2c-fsi.c                  | 463 ++++++---
>>   drivers/spi/spi-fsi.c                         |  33 +-
>>   include/linux/fsi.h                           |   3 +
>>   include/trace/events/fsi.h                    | 171 ++--
>>   include/trace/events/fsi_master_aspeed.h      |  86 +-
>>   include/trace/events/i2c_fsi.h                |  45 +
>>   17 files changed, 1897 insertions(+), 687 deletions(-)
>>   create mode 100644 include/trace/events/i2c_fsi.h
>
> That's a lot of patches, that span the trees of several maintainers.
>
> What's your expectation for those who should be merging work in this
> combined series? Have you had any feedback in that regard?
>
> I'm asking because I need to make a call on what I do with respect to
> the Aspeed devicetrees. I think it would clarify responsibility if this
> series were split by subsystem. That way I can apply the devicetree
> patches and the rest can go through their respective trees.


OK, I'll go ahead and split this up, and probably just wait for the FSI 
changes to merge before sending other subsystems. Thanks for the 
guidance on merging!


Eddie



>
> If there are dependencies that require merging all or none, then it
> would be helpful if they were outlined in the cover letter. Even then,
> merging the leaves and waiting a cycle might make everyone's lives
> easier?
>
> Andrew
