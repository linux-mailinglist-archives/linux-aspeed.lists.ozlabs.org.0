Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA0A8CC74F
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 May 2024 21:36:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hxWvxgg3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl1XM6QM4z78h2
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 05:27:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hxWvxgg3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl1Wj5f0Wz3fyJ;
	Thu, 23 May 2024 05:26:41 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MIuAQe027630;
	Wed, 22 May 2024 19:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x7pWOfCWK1R/iOvFYMyRCieamnXkuL2K1vcfY/HPR24=;
 b=hxWvxgg3yRdfHphvzPwEnhwha4i3Sn6VbRCol6V9vSNVC0GLKUWVpBM5KGCChp8J1WJk
 RWFbGbnRYZxvcKFTxFmPz6BVEDwDmdcfa4juCc7yJoa5/uNrEkcKADlzNrYlWxRNF1Te
 VFot0IG1zhYKjZTwNtbSH4h7uMwypxme8jG/T5FclGCJRO/VXBrW4QeTc6nvQbdCuLVc
 qZZUGiGymR/HbQW1A+dLwPGFlx7AQf20Sc9upvkzAO+1CgLTbiOWIxjXC4gy1vZQHhuo
 Hiaodm6dW5VLR/2oOWnfit50w0KDOqGTDmIsKMYDmZxief0W6pe0dEC/9tfKnsA+2aRU Vg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9p4x83vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:36 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJ47wD008090;
	Wed, 22 May 2024 19:25:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y79c359ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:35 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPVWQ59113748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:34 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C28FE5805D;
	Wed, 22 May 2024 19:25:31 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 742C758066;
	Wed, 22 May 2024 19:25:31 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:31 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v6 18/20] fsi: occ: Get device number from FSI minor number API
Date: Wed, 22 May 2024 14:25:22 -0500
Message-Id: <20240522192524.3286237-19-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7aQTrkIu-uauI0UtU_rAaYawFYzJnvCh
X-Proofpoint-GUID: 7aQTrkIu-uauI0UtU_rAaYawFYzJnvCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Remove the IDA indexing for OCC devices and instead use the FSI
minor number API. This will make the OCC numbering consistent
with other FSI engines and make the "reg" device tree property
unnecessary.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c | 47 +++++++++----------------------------------
 1 file changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index da35ca9e84a6e..2023355b39805 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -4,9 +4,9 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
+#include <linux/fsi.h>
 #include <linux/fsi-sbefifo.h>
 #include <linux/gfp.h>
-#include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
@@ -44,6 +44,7 @@ struct occ {
 	struct device *sbefifo;
 	char name[32];
 	int idx;
+	dev_t devt;
 	bool platform_hwmon;
 	u8 sequence_number;
 	void *buffer;
@@ -75,8 +76,6 @@ struct occ_client {
 
 #define to_client(x)	container_of((x), struct occ_client, xfr)
 
-static DEFINE_IDA(occ_ida);
-
 static int occ_open(struct inode *inode, struct file *file)
 {
 	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
@@ -622,7 +621,6 @@ static int occ_unregister_of_child(struct device *dev, void *data)
 static int occ_probe(struct platform_device *pdev)
 {
 	int rc;
-	u32 reg;
 	char child_name[32];
 	struct occ *occ;
 	struct platform_device *hwmon_dev = NULL;
@@ -637,6 +635,10 @@ static int occ_probe(struct platform_device *pdev)
 	if (!occ)
 		return -ENOMEM;
 
+	rc = fsi_get_new_minor(to_fsi_dev(dev->parent), fsi_dev_occ, &occ->devt, &occ->idx);
+	if (rc)
+		return rc;
+
 	/* SBE words are always four bytes */
 	occ->buffer = kvmalloc(OCC_MAX_RESP_WORDS * 4, GFP_KERNEL);
 	if (!occ->buffer)
@@ -651,24 +653,6 @@ static int occ_probe(struct platform_device *pdev)
 	 */
 	occ->sequence_number = (u8)((jiffies % 0xff) + 1);
 	mutex_init(&occ->occ_lock);
-
-	if (dev->of_node) {
-		rc = of_property_read_u32(dev->of_node, "reg", &reg);
-		if (!rc) {
-			/* make sure we don't have a duplicate from dts */
-			occ->idx = ida_simple_get(&occ_ida, reg, reg + 1,
-						  GFP_KERNEL);
-			if (occ->idx < 0)
-				occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
-							  GFP_KERNEL);
-		} else {
-			occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
-						  GFP_KERNEL);
-		}
-	} else {
-		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
-	}
-
 	platform_set_drvdata(pdev, occ);
 
 	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
@@ -680,7 +664,7 @@ static int occ_probe(struct platform_device *pdev)
 	rc = misc_register(&occ->mdev);
 	if (rc) {
 		dev_err(dev, "failed to register miscdevice: %d\n", rc);
-		ida_simple_remove(&occ_ida, occ->idx);
+		fsi_free_minor(occ->devt);
 		kvfree(occ->buffer);
 		return rc;
 	}
@@ -719,7 +703,7 @@ static int occ_remove(struct platform_device *pdev)
 	else
 		device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
 
-	ida_simple_remove(&occ_ida, occ->idx);
+	fsi_free_minor(occ->devt);
 
 	return 0;
 }
@@ -746,20 +730,7 @@ static struct platform_driver occ_driver = {
 	.remove = occ_remove,
 };
 
-static int occ_init(void)
-{
-	return platform_driver_register(&occ_driver);
-}
-
-static void occ_exit(void)
-{
-	platform_driver_unregister(&occ_driver);
-
-	ida_destroy(&occ_ida);
-}
-
-module_init(occ_init);
-module_exit(occ_exit);
+module_platform_driver(occ_driver);
 
 MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
 MODULE_DESCRIPTION("BMC P9 OCC driver");
-- 
2.39.3

