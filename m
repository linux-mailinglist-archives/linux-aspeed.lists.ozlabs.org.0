Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C97EA8FD8CB
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:26:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ioyAb1w0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgWp72DLz3cQL
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:26:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ioyAb1w0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgSC3vTcz3cVW;
	Thu,  6 Jun 2024 07:23:39 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455L225X000941;
	Wed, 5 Jun 2024 21:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=cejzBxtcEByI+xMESV4H8QqE4nNOLYSRaK7OFmvEFBE=;
 b=ioyAb1w0585qU6CaHMcgcicOMtHeMUvRmJDSfhWxR5cwxKvFkB4CIBxDOB+MPhaBwdMh
 UpnrB7rGC1utOLVe/oqGQaCVVtMPf5amf29IuAuJBfwUEmD4mTLYaq9u8kZcbh/mZBTH
 PFRWzgU+Jv9m4Z6Fd6KF7cB9aaoeNjq5v2WhiYaheg3pE76wGDf6r4OfBaRIeu7pdVyM
 nBKbDH1w3s/5nanjTR3VRNM56KLPYu3iL/Ka/OWCD4pfCGJYEc8Ory30/a+h75ICPX5F
 3ycmYsW48iWjqJaROatnQDCBTzeyh+SDUrWcq1t1SCKUSh7lWD8hIkYcuqJ3hyC1Appd Ug== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxbg09vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:21 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455KMO2f022835;
	Wed, 5 Jun 2024 21:23:21 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygg6med3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:21 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNIfs57934222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:20 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B204A5806F;
	Wed,  5 Jun 2024 21:23:16 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F925806D;
	Wed,  5 Jun 2024 21:23:16 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 11/40] fsi: core: Allow cfam device type aliases
Date: Wed,  5 Jun 2024 16:22:43 -0500
Message-Id: <20240605212312.349188-12-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L36lbHd8U_-4VPslOZbKWIRElqd6FP7j
X-Proofpoint-ORIG-GUID: L36lbHd8U_-4VPslOZbKWIRElqd6FP7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Other FSI devices can uses aliases for the device numbering, so
modify the function to get a new minor to allow the cfam type
to use aliases too.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 59 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 660f89b743235..36e31eafad3d0 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -884,12 +884,37 @@ static int fsi_adjust_index(int index)
 #endif
 }
 
-static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
-			       dev_t *out_dev, int *out_index)
+static const char *const fsi_dev_type_names[] = {
+	"cfam",
+	"sbefifo",
+	"scom",
+	"occ",
+};
+
+static int __fsi_get_new_minor(struct fsi_slave *slave, struct device_node *np,
+			       enum fsi_dev_type type, dev_t *out_dev, int *out_index)
 {
 	int cid = slave->chip_id;
 	int id;
 
+	if (np && type < 4) {
+		int aid = of_alias_get_id(np, fsi_dev_type_names[type]);
+
+		if (aid >= 0) {
+			/* Use the same scheme as the legacy numbers. */
+			id = (aid << 2) | type;
+			id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
+			if (id >= 0) {
+				*out_index = aid;
+				*out_dev = fsi_base_dev + id;
+				return 0;
+			}
+
+			if (id != -ENOSPC)
+				return id;
+		}
+	}
+
 	/* Check if we qualify for legacy numbering */
 	if (cid >= 0 && cid < 16 && type < 4) {
 		/*
@@ -918,36 +943,10 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
 	return 0;
 }
 
-static const char *const fsi_dev_type_names[] = {
-	"cfam",
-	"sbefifo",
-	"scom",
-	"occ",
-};
-
 int fsi_get_new_minor(struct fsi_device *fdev, enum fsi_dev_type type,
 		      dev_t *out_dev, int *out_index)
 {
-	if (fdev->dev.of_node) {
-		int aid = of_alias_get_id(fdev->dev.of_node, fsi_dev_type_names[type]);
-
-		if (aid >= 0) {
-			/* Use the same scheme as the legacy numbers. */
-			int id = (aid << 2) | type;
-
-			id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
-			if (id >= 0) {
-				*out_index = aid;
-				*out_dev = fsi_base_dev + id;
-				return 0;
-			}
-
-			if (id != -ENOSPC)
-				return id;
-		}
-	}
-
-	return __fsi_get_new_minor(fdev->slave, type, out_dev, out_index);
+	return __fsi_get_new_minor(fdev->slave, fdev->dev.of_node, type, out_dev, out_index);
 }
 EXPORT_SYMBOL_GPL(fsi_get_new_minor);
 
@@ -1059,7 +1058,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	}
 
 	/* Allocate a minor in the FSI space */
-	rc = __fsi_get_new_minor(slave, fsi_dev_cfam, &slave->dev.devt,
+	rc = __fsi_get_new_minor(slave, slave->dev.of_node, fsi_dev_cfam, &slave->dev.devt,
 				 &slave->cdev_idx);
 	if (rc)
 		goto err_free;
-- 
2.39.3

