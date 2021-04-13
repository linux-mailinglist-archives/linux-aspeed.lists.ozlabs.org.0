Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6471635E76C
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Apr 2021 22:09:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKcBY2JShz30HD
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 06:09:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KhXBibXv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KhXBibXv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKcBW0Yv2z304X;
 Wed, 14 Apr 2021 06:09:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DK3PxC175481; Tue, 13 Apr 2021 16:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=TWVqT+biIie5U0vDKWFF2EaxQEXoONy8pq4DWay0w6Y=;
 b=KhXBibXvJI+rnP0pS7hcSgn/qdTnz27Z8935SnwVOtICrV4bsECVWGLwijBpVlso1nKn
 iMJDVn60rp9U3T8S4Au+fqdswYnzHx3YIWHPCZBJCar22DxE2TUNBFkMWAAjifjofZwt
 HmvylbpgnqXctUwyY7eqv6rfffPZU7pu7VJopCprRIrjLfkV+4ms8H6anVbKJCnezU5K
 RI7JMX4O8HVqa8nkU7CyZ0jR4zMqC4eVGWg9ISlFEiKF4qx2nGKMooLae2PjJ6Xyris7
 tr9yh9YKnf7Nz+sI0aHJZnx9fr4edK4RAL9Ty6TvBoFQ8H4nW9WJuRwIBiuNpn5HKYp8 kQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wckq9g7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:08:54 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DK719c024092;
 Tue, 13 Apr 2021 20:08:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 37u3n9aebm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:08:54 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DK8rhj26542510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:08:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1DB86A051;
 Tue, 13 Apr 2021 20:08:52 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F40F6A047;
 Tue, 13 Apr 2021 20:08:52 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.55.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:08:52 +0000 (GMT)
Message-ID: <bfb940efdba7d308cf5e91874604582cb5173ada.camel@linux.ibm.com>
Subject: Re: [PATCH] fsi: aspeed: Emit fewer barriers in opb operations
From: Eddie James <eajames@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>, Andrew
 Jeffery <andrew@aj.id.au>
Date: Tue, 13 Apr 2021 15:08:52 -0500
In-Reply-To: <20210223041737.171274-1-joel@jms.id.au>
References: <20210223041737.171274-1-joel@jms.id.au>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mnCVsRH21Y0gM829eFc6Q5aqg77Dckpe
X-Proofpoint-GUID: mnCVsRH21Y0gM829eFc6Q5aqg77Dckpe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130132
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2021-02-23 at 14:47 +1030, Joel Stanley wrote:
> When setting up a read or write to the OPB memory space, we must
> perform
> five or six AHB writes. The ordering of these up until the trigger
> write
> does not matter, so use writel_relaxed.

Reviewed-by: Eddie James <eajames@linux.ibm.com>

I have also tested this patch on hardware, so

Tested-by: Eddie James <eajames@linux.ibm.com>

> 
> The generated code goes from (Debian GCC 10.2.1-6):
> 
>         mov     r8, r3
>         mcr     15, 0, sl, cr7, cr10, {4}
>         str     sl, [r6, #20]
>         mcr     15, 0, sl, cr7, cr10, {4}
>         str     r3, [r6, #24]
>         mcr     15, 0, sl, cr7, cr10, {4}
>         str     r1, [r6, #28]
>         mcr     15, 0, sl, cr7, cr10, {4}
>         str     r2, [r6, #32]
>         mcr     15, 0, sl, cr7, cr10, {4}
>         mov     r1, #1
>         str     r1, [r6, #64]   ; 0x40
>         mcr     15, 0, sl, cr7, cr10, {4}
>         str     r1, [r6, #4]
> 
> to this:
> 
>         str     r3, [r7, #20]
>         str     r2, [r7, #24]
>         str     r1, [r7, #28]
>         str     r3, [r7, #64]
>         mov     r8, #0
>         mcr     15, 0, r8, cr7, cr10, {4}
>         str     r3, [r7, #4]
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/fsi-master-aspeed.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-
> master-aspeed.c
> index 90dbe58ca1ed..09fff86b2bac 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -101,11 +101,11 @@ static int __opb_write(struct fsi_master_aspeed
> *aspeed, u32 addr,
>  	u32 reg, status;
>  	int ret;
>  
> -	writel(CMD_WRITE, base + OPB0_RW);
> -	writel(transfer_size, base + OPB0_XFER_SIZE);
> -	writel(addr, base + OPB0_FSI_ADDR);
> -	writel(val, base + OPB0_FSI_DATA_W);
> -	writel(0x1, base + OPB_IRQ_CLEAR);
> +	writel_relaxed(CMD_WRITE, base + OPB0_RW);
> +	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
> +	writel_relaxed(addr, base + OPB0_FSI_ADDR);
> +	writel_relaxed(val, base + OPB0_FSI_DATA_W);
> +	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
>  	writel(0x1, base + OPB_TRIGGER);
>  
>  	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
> @@ -149,10 +149,10 @@ static int __opb_read(struct fsi_master_aspeed
> *aspeed, uint32_t addr,
>  	u32 result, reg;
>  	int status, ret;
>  
> -	writel(CMD_READ, base + OPB0_RW);
> -	writel(transfer_size, base + OPB0_XFER_SIZE);
> -	writel(addr, base + OPB0_FSI_ADDR);
> -	writel(0x1, base + OPB_IRQ_CLEAR);
> +	writel_relaxed(CMD_READ, base + OPB0_RW);
> +	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
> +	writel_relaxed(addr, base + OPB0_FSI_ADDR);
> +	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
>  	writel(0x1, base + OPB_TRIGGER);
>  
>  	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,

