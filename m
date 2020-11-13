Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF12B18C8
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Nov 2020 11:09:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXZ2M59zQzDr6P
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Nov 2020 21:09:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=dI57/+8h; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXZ2767T5zDr5D
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Nov 2020 21:09:12 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADA44We195662;
 Fri, 13 Nov 2020 10:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=CmOkNnoq4aouIzIKH5BdnPNOjPDxlp5PbgvCa+MCvGk=;
 b=dI57/+8hQXv2he9Ovg5TnVAUuFuHYAM82lFIXcQbjrtLPV7GerAapaQ4Z5wj6gIZUA5J
 02MituRHDV5X2aTmzaLiekpz0kBe35D1QMLql5cjsnS7DhN5gCd5otHEHBghGj4D0yt1
 tlcAqHg9lT2x53EUUUwVSqwIGHR2PPO82BtGShXH8WNJVzj158EV3F2DfkQOb4PvGPIN
 w40wsZcCk6rzf7vWGFJVw5KWFAlRxy/9zergNwvCyc41Bzhxh6T/1eJArspl29WcVmyn
 eArnpahUzu1ng5OYO48vULf6UTTq/VCFaxjgC/JmKIKQB8nfeiJnU8erSPeskB7jeh/1 Xg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34nkhm9rnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Nov 2020 10:09:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADA6HoS164926;
 Fri, 13 Nov 2020 10:09:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34rtktbk6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 10:09:05 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ADA8vq3027309;
 Fri, 13 Nov 2020 10:08:57 GMT
Received: from mwanda (/10.175.206.108)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Nov 2020 02:08:56 -0800
Date: Fri, 13 Nov 2020 13:08:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] soc: aspeed: Fix a reference leak in aspeed_socinfo_init()
Message-ID: <20201113100850.GA168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130060
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130060
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
Cc: Tom Rix <trix@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This needs to call of_node_put(np) before returning if of_iomap() fails.

Fixes: e0218dca5787 ("soc: aspeed: Add soc info driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/aspeed/aspeed-socinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 20a1d4aeb051..773930e0cb10 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -74,8 +74,10 @@ static int __init aspeed_socinfo_init(void)
 	}
 
 	reg = of_iomap(np, 0);
-	if (!reg)
+	if (!reg) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 	siliconid = readl(reg);
 	iounmap(reg);
 
-- 
2.28.0

