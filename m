Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D648C7BD8
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:19:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W2hyvCjO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJKN6yxPz3fqx
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:19:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W2hyvCjO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJJr5DwKz3fnZ;
	Fri, 17 May 2024 04:19:24 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHRRmq002291;
	Thu, 16 May 2024 18:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=35QhAQ7kX9QHCSy8fxK00Ig3Cr+S1lp5g6DIkdhYmNw=;
 b=W2hyvCjOJkT5vCeNZ523rlDuSALQ3RX+Dg4i46pkZSGN46mlN2Y6f9vQwHzOmJbasn6U
 oeXeQnnGX93h1Vbpy7LUC57JfN1gTg9otcVj0xsjR5+qG8awUzTEFyrMHWlHLbke0bdQ
 l4GyJKoaLEbAtLnsHZvUxavo7CXSV/uJN/NoGCy5c2hS3JfiDrWe3DoZWkwJX3t+rvLf
 GSdpBfjXqSrVqFLY50bx3B/MyLGkjZleyA0oSFeXJ0GoDwYgYP3Dv6z0XWaF60F1IxHq
 zOdeaCZTXld49ZNYOIGXfAEQ8QJyMN6vQvRCuKUzsYjVPiePWNt/OujBB/ptTUuBDlG/ WA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pj6g4en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:14 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGVOH5005821;
	Thu, 16 May 2024 18:19:13 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2nq331vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:12 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJAmo27001458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:12 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 015DA5807A;
	Thu, 16 May 2024 18:19:10 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5D605808B;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 08/40] fsi: core: Reset errors instead of clearing interrupts
Date: Thu, 16 May 2024 13:18:35 -0500
Message-Id: <20240516181907.3468796-9-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OeLpiFkQuiAjXgMzGoRM9L88eQWvf1vM
X-Proofpoint-ORIG-GUID: OeLpiFkQuiAjXgMzGoRM9L88eQWvf1vM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, andrew@codeconstruct.com.au, linux-i2c@vger.kernel.org
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

