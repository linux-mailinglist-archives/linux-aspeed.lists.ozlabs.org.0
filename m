Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03822367EAA
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Apr 2021 12:31:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQtxz5hHsz2yxR
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Apr 2021 20:31:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=KblNUNp8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=KblNUNp8; 
 dkim-atps=neutral
X-Greylist: delayed 4757 seconds by postgrey-1.36 at boromir;
 Thu, 22 Apr 2021 20:31:32 AEST
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQtxw5dCvz2y6F
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Apr 2021 20:31:32 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13M999Hp015712;
 Thu, 22 Apr 2021 09:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=GfNIYgwxlG1PoarHwy8HPbhqCeRGTR5cailtNG4Fve8=;
 b=KblNUNp88rGkN6Jqx/V0A0KyHxdzRoEvtWBjhXjwBD565Nq6noruJHkIq7VGCGwRxOsd
 lydWnyYjK9JGgCK8i/J4GQaw377ds8TuO3dpukqJ+LvakCp4CgIF8KsA6AzZtK71UWPq
 DEXmoad5mbyWkgGuLb7MdQOvagtl4CbgrT4Gxzt6O2Q33Hav9BStRTCyz2b7euCPDxOg
 fmSbvMCaX9Sfvu2pdhOUeNMTqZ7m2EDvHS2UFirVySalrMLWjSJHzTinMovqpT6BKsZX
 kC9ulOgtXojTr6/qhxiwwAXCj7r39Jt1AmbCHc17yDRRz505cT/H8xAaRpRYpZFSfa2h Iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 37yqmnmsbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 09:11:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13M9Aueo151761;
 Thu, 22 Apr 2021 09:11:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3809m1x2g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 09:11:57 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13M9Buj5154989;
 Thu, 22 Apr 2021 09:11:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 3809m1x2fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 09:11:56 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13M9Bqkw028273;
 Thu, 22 Apr 2021 09:11:52 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Apr 2021 09:11:52 +0000
Date: Thu, 22 Apr 2021 12:11:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Message-ID: <YIE90PSXsMTa2Y8n@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: kJLzve4nSPiUlwZkC1ctP0MZQjv0yXzk
X-Proofpoint-GUID: kJLzve4nSPiUlwZkC1ctP0MZQjv0yXzk
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220077
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
Cc: Robert Lippert <rlippert@google.com>, linux-aspeed@lists.ozlabs.org,
 Patrick Venture <venture@google.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The intent here was to return negative error codes but it actually
returns positive values.  The problem is that type promotion with
ternary operations is quite complicated.

"ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
returns long.  What happens is that "ret" is cast to u32 and becomes
positive then it's cast to long and it's still positive.

Fix this by removing the ternary so that "ret" is type promoted directly
to long.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 210455efb321..eceeaf8dfbeb 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 			return -EINTR;
 	}
 	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
+	if (ret)
+		return ret;
 
-	return ret ? ret : copied;
+	return copied;
 }
 
 static __poll_t snoop_file_poll(struct file *file,
-- 
2.30.2

