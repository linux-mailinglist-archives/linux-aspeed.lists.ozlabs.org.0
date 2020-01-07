Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C84132F47
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 20:19:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47shyz5jy8zDqMp
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jan 2020 06:19:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47shyq5C7VzDqMW
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Jan 2020 06:19:47 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007JH4Vd173752; Tue, 7 Jan 2020 14:18:36 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8sa441s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 14:18:35 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 007JI0QY019239;
 Tue, 7 Jan 2020 19:18:35 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 2xajb6w3md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 19:18:35 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 007JIX2X48431424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jan 2020 19:18:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 700006E052;
 Tue,  7 Jan 2020 19:18:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10D296E050;
 Tue,  7 Jan 2020 19:18:32 +0000 (GMT)
Received: from [9.163.26.112] (unknown [9.163.26.112])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jan 2020 19:18:32 +0000 (GMT)
Subject: Re: [PATCH 3/3] video: aspeed: Update copyright information
To: Joel Stanley <joel@jms.id.au>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200107034324.38073-1-joel@jms.id.au>
 <20200107034324.38073-4-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <48c5f0dd-4fa3-919c-9dd7-91afb5da8840@linux.ibm.com>
Date: Tue, 7 Jan 2020 13:18:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107034324.38073-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-07_06:2020-01-07,
 2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070152
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
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 1/6/20 9:43 PM, Joel Stanley wrote:
> Use the preferred form for GPL2+, and add IBM and Intel as the authors.
> The driver was initially upstreamed by Eddie from IBM, and has had major
> contributions from Jae at Intel.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/media/platform/aspeed-video.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index d70b893fd4cf..71e0dbdb37dc 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1,4 +1,6 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2020 IBM Corp.
> +// Copyright (c) 2019 Intel Corporation
>   
>   #include <linux/atomic.h>
>   #include <linux/bitfield.h>
