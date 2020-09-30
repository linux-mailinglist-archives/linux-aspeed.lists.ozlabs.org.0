Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40327EA12
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Sep 2020 15:39:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1cmL0h8lzDqWN
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Sep 2020 23:38:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E04XESno; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1cm61r4MzDqTw
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Sep 2020 23:38:44 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UDX4PN138798; Wed, 30 Sep 2020 09:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+Gvon2NFXY2HwR64ot4UTKRGlN2iANmBqeR1OTawFXg=;
 b=E04XESnoLwc29JtuF0NuJCVS6gSDafNwcG8G7DFrKZd/ESDA5sEYlCi2cvJnzw8dI7Qx
 sDpiq+Dkd7VTJyYcE2aCbza6e+1oqdUKd2gm+BklZvpolfCmX7y/12c+KkTDcp/XkO61
 2ws+Tp0PDiQ2YJDQkNdNyEmjMsN1Zl+rw6cgtHb2ABQqAfSnOzkkyzlpjxQzhAOdrc1U
 vMMhUsEuNWcn1WQfDSp1X9TDjSvRfkF8n4ufJyW0PKEyj1qejFxIyu058i3+xAgP9OL+
 d4cuSwIIZ6zHeRXzZaLa11RcFat4tzhSPGavZUD1K5HoUOPNmI9DKCY3B76EOYy2Lw3w tw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vry3mj5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 09:38:34 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08UDWLoR028259;
 Wed, 30 Sep 2020 13:38:33 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 33sw99dnyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 13:38:33 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08UDcXZs55247218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 13:38:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A670B2066;
 Wed, 30 Sep 2020 13:38:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61A11B205F;
 Wed, 30 Sep 2020 13:38:32 +0000 (GMT)
Received: from [9.163.63.54] (unknown [9.163.63.54])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Sep 2020 13:38:32 +0000 (GMT)
Subject: Re: [PATCH] soc: aspeed: xdma: Return -EFAULT if copy_from_user()
 fails
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200930090334.GB621698@mwanda>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <65b1447e-8f37-69f9-4049-25d130a281f8@linux.ibm.com>
Date: Wed, 30 Sep 2020 08:38:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930090334.GB621698@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_07:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300108
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
Cc: kernel-janitors@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 9/30/20 4:03 AM, Dan Carpenter wrote:
> The copy_from_user() function returns the number of bytes remaining
> which we weren't able to copy.  This should return -EFAULT to the
> user.


Thanks,

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Fixes: 86609baa4217 ("soc: aspeed: xdma: Add user interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/soc/aspeed/aspeed-xdma.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
> index 91b51a3de8df..e6b4744bda64 100644
> --- a/drivers/soc/aspeed/aspeed-xdma.c
> +++ b/drivers/soc/aspeed/aspeed-xdma.c
> @@ -569,9 +569,8 @@ static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
>   	if (len != sizeof(op))
>   		return -EINVAL;
>   
> -	rc = copy_from_user(&op, buf, len);
> -	if (rc)
> -		return rc;
> +	if (copy_from_user(&op, buf, len))
> +		return -EFAULT;
>   
>   	if (!op.len || op.len > client->size ||
>   	    op.direction > ASPEED_XDMA_DIRECTION_UPSTREAM)
