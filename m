Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 191402648A1
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 17:19:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnMxW1bgnzDqfq
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 01:19:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XqNu86gt; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnMws6dq8zDqfp;
 Fri, 11 Sep 2020 01:18:52 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AF2EN3074908; Thu, 10 Sep 2020 11:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GbDZ7CBL/LYipeJIp2XxF3Pn1ncBwSbgSFF+3KzbL8k=;
 b=XqNu86gtYDuMVkhJSOVDKsZb2ErtTuItMVO1cbHSnmirE6ANLxP0BZFyfwkGeyT1nbR9
 0W6ky73O1um/vKY4qTX+u/I5oePs52W/Xh/WVUpO+VbUkT5PUPRgGaYGmSTfh9zuZVa5
 a6AMC6MXpVK1znA4R7KtHY0u7VTv81uN7k9k15xvM4rTsKh2XkHSUlWt9rgg2/jdEQUZ
 SMRaJU/gOtQI+plnecPhc012W+XVM8w9ePf9kYs/NUFcYHauR+rI4dD4XpKb50HZRDll
 /hdxPxHMfLroVAADQZAKuZEeABJ0VSvO3DsNX5Sv8ErmdJVQAd3+NgENSH3RIRtoOKos qg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33fpd60nmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 11:18:45 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08AFDZqI013601;
 Thu, 10 Sep 2020 15:18:45 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 33c2a98c31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 15:18:45 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08AFIiTI55312666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 15:18:44 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DEDF6E050;
 Thu, 10 Sep 2020 15:18:44 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A47DC6E052;
 Thu, 10 Sep 2020 15:18:43 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.140.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Sep 2020 15:18:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 4/4] fsi: Aspeed master: Set bus frequency from devicetree
Date: Thu, 10 Sep 2020 10:18:40 -0500
Message-Id: <20200910151840.25333-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910151840.25333-1-eajames@linux.ibm.com>
References: <20200910151840.25333-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_03:2020-09-10,
 2020-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=1 bulkscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100130
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org,
 alistair@popple.id.au, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 sboyd@kernel.org, robh+dt@kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Set the FSI bus frequency based on the value encoded in the
devicetree. The default value is 166MHz, which is the highest
frequency some FSI slaves can accept.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c006ec008a1a..be19fee0bece 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -515,6 +515,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	struct fsi_master_aspeed *aspeed;
 	struct resource *res;
 	int rc, links, reg;
+	u32 bus_freq = 166666666;
 	__be32 raw;
 
 	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
@@ -539,6 +540,10 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		dev_err(aspeed->dev, "couldn't get clock\n");
 		return PTR_ERR(aspeed->clk);
 	}
+
+	of_property_read_u32(pdev->dev.of_node, "bus-frequency", &bus_freq);
+	clk_set_rate(aspeed->clk, bus_freq);
+
 	rc = clk_prepare_enable(aspeed->clk);
 	if (rc) {
 		dev_err(aspeed->dev, "couldn't enable clock\n");
-- 
2.26.2

