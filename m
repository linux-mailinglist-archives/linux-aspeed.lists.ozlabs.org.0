Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EDA8FD878
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:24:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CAPpPLi4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgSy3GVbz3cTj
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:24:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CAPpPLi4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS44bgDz3bw2;
	Thu,  6 Jun 2024 07:23:32 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455L22RL000949;
	Wed, 5 Jun 2024 21:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=35QhAQ7kX9QHCSy8fxK00Ig3Cr+S1lp5g6DIkdhYmNw=;
 b=CAPpPLi4bVRRGc//GeterL+0O98Y3jyYLFp6r0c6dCG6SdxJfZxHVW+ZemHNDydGjV/M
 4j1K7LHAKhuYLktvbmxz7okeFTRSNRYiIlVULjbqGEmVaZwoOgHUzpBSDE0IU/p0WHSw
 O8J2dfE1+Wh53Hq1AwpiHgWBKMT16+fkwKqP9+O3qBh9bJg5i6CDJ0ajLQmdiK8iu1f0
 K14upxagk3g9wEiB4k9OWFEQXQrRyCqXk65UZ57yTBiQXLv4YeZviw2TSEh370MTjCoN
 IfyRWvwbxZ6tALzfsC3OceELQgqpZCwi6e0LStany7AUMLmoSewZ6HmdrlYabuvKNgIS fw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxbg09vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:21 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IX4mD008479;
	Wed, 5 Jun 2024 21:23:20 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:20 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNHeq26215124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC0F95805E;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DC5158068;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 08/40] fsi: core: Reset errors instead of clearing interrupts
Date: Wed,  5 Jun 2024 16:22:40 -0500
Message-Id: <20240605212312.349188-9-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4jj5RR4L9-1uNJtIYpjzprPcMIaCAcXq
X-Proofpoint-ORIG-GUID: 4jj5RR4L9-1uNJtIYpjzprPcMIaCAcXq
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

The proper way to clear error conditions is to use the SRES
register rather than simple clearing SISC.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 9 +++++----
 drivers/fsi/fsi-slave.h | 6 ++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 93bbdcf50a89a..ce9762d1bd8b0 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -166,7 +166,7 @@ static int fsi_slave_calc_addr(struct fsi_slave *slave, uint32_t *addrp,
 static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 {
 	struct fsi_master *master = slave->master;
-	__be32 irq, stat;
+	__be32 irq, reset, stat;
 	int rc, link;
 	uint8_t id;
 
@@ -187,9 +187,10 @@ static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 			be32_to_cpu(stat), be32_to_cpu(irq));
 	trace_fsi_slave_error(slave, be32_to_cpu(irq), be32_to_cpu(stat));
 
-	/* clear interrupts */
-	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SISC,
-			&irq, sizeof(irq));
+	/* reset errors */
+	reset = cpu_to_be32(FSI_SRES_ERRS);
+	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SRES, &reset,
+				sizeof(reset));
 }
 
 /* Encode slave local bus echo delay */
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index fabc0b66d5bf3..e9fd4be6f3760 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -24,6 +24,7 @@
 #define FSI_SSI1M		0x1c	/* S  : Set slave interrupt 1 mask */
 #define FSI_SCI1M		0x20	/* C  : Clear slave interrupt 1 mask */
 #define FSI_SLBUS		0x30	/* W  : LBUS Ownership */
+#define FSI_SRES		0x34	/* W  : Reset */
 #define FSI_SRSIC0		0x68	/* C  : Clear remote interrupt condition */
 #define FSI_SRSIC4		0x6c	/* C  : Clear remote interrupt condition */
 #define FSI_SRSIM0		0x70	/* R/W: Remote interrupt mask */
@@ -90,6 +91,11 @@
  */
 #define FSI_SLBUS_FORCE		0x80000000	/* Force LBUS ownership */
 
+/*
+ * SRES fields
+ */
+#define FSI_SRES_ERRS		0x40000000	/* Reset FSI slave errors */
+
 /*
  * LLMODE fields
  */
-- 
2.39.3

