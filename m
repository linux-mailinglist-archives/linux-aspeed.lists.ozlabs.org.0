Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 290098FD864
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:23:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yz9z/IBR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgSN089Vz3bNs
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:23:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yz9z/IBR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS25fT9z30Wg;
	Thu,  6 Jun 2024 07:23:30 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KwLb6015829;
	Wed, 5 Jun 2024 21:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=oHKlxwrlNdF8PlHD5y5HFMOj3x1VaBvrVhlzZpRcYr8=;
 b=Yz9z/IBRDllcpXerN5/VRAIlY9xP1b0ZVHXbqnEMarnAGgmCyUE29ufZVS9R8lGBFTxu
 Ij6YZMgA8vPxl7WPH7XM7cUvDYpc6YVhPA2s6BVWdtTW0bE626hzBiGZmbhBY/+sSjAL
 dz23YahZjZ/6GhZY9vV04e8RIOv2fAUhVrmP8ntHCjQn3JGKLKsLwvmJBLKKrtwSS3Oz
 TStjpSXKj9kMG8zM8CrhEiI7VTlEvlzpsBfGO6vY6bv8As3SHG9TbWHKY0b+yb6ezL/X
 TZgsM6W8rLCKako5bSEGsjRM0WnjoogldxeDijedgl1jNaaNjDkg+JgNy1ADe041Iplr Kg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjygp81u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:18 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455KGajT022794;
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygg6med39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:17 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNDRk20251162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:16 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B947358065;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 794B658063;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 02/40] fsi: Move slave definitions to fsi-slave.h
Date: Wed,  5 Jun 2024 16:22:34 -0500
Message-Id: <20240605212312.349188-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fUq12zTZtn0dl8zMyNQpeum3Dq7dC68g
X-Proofpoint-ORIG-GUID: fUq12zTZtn0dl8zMyNQpeum3Dq7dC68g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Master drivers may need access to the slave definitions.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 35 -----------------
 drivers/fsi/fsi-slave.h | 84 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 35 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 097d5a780264c..7bf0c96fc0172 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -45,41 +45,6 @@
 
 static const int engine_page_size = 0x400;
 
-#define FSI_SLAVE_BASE			0x800
-
-/*
- * FSI slave engine control register offsets
- */
-#define FSI_SMODE		0x0	/* R/W: Mode register */
-#define FSI_SISC		0x8	/* R/W: Interrupt condition */
-#define FSI_SSTAT		0x14	/* R  : Slave status */
-#define FSI_SLBUS		0x30	/* W  : LBUS Ownership */
-#define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
-
-/*
- * SMODE fields
- */
-#define FSI_SMODE_WSC		0x80000000	/* Warm start done */
-#define FSI_SMODE_ECRC		0x20000000	/* Hw CRC check */
-#define FSI_SMODE_SID_SHIFT	24		/* ID shift */
-#define FSI_SMODE_SID_MASK	3		/* ID Mask */
-#define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
-#define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
-#define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
-#define FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
-#define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
-#define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
-
-/*
- * SLBUS fields
- */
-#define FSI_SLBUS_FORCE		0x80000000	/* Force LBUS ownership */
-
-/*
- * LLMODE fields
- */
-#define FSI_LLMODE_ASYNC	0x1
-
 #define FSI_SLAVE_SIZE_23b		0x800000
 
 static DEFINE_IDA(master_ida);
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index 1d63a585829dd..dba65bd4e083f 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -7,6 +7,90 @@
 #include <linux/cdev.h>
 #include <linux/device.h>
 
+#define FSI_SLAVE_BASE			0x800
+
+/*
+ * FSI slave engine control register offsets
+ */
+#define FSI_SMODE		0x0	/* R/W: Mode register */
+#define FSI_SISC		0x8	/* R  : Interrupt condition */
+#define FSI_SCISC		0x8	/* C  : Clear interrupt condition */
+#define FSI_SISM		0xc	/* R/W: Interrupt mask */
+#define FSI_SISS		0x10	/* R  : Interrupt status */
+#define FSI_SSISM		0x10	/* S  : Set interrupt mask */
+#define FSI_SCISM		0x14	/* C  : Clear interrupt mask */
+#define FSI_SSTAT		0x14	/* R  : Slave status */
+#define FSI_SI1S		0x1c	/* R  : Slave interrupt 1 status */
+#define FSI_SSI1M		0x1c	/* S  : Set slave interrupt 1 mask */
+#define FSI_SCI1M		0x20	/* C  : Clear slave interrupt 1 mask */
+#define FSI_SLBUS		0x30	/* W  : LBUS Ownership */
+#define FSI_SRSIC0		0x68	/* C  : Clear remote interrupt condition */
+#define FSI_SRSIC4		0x6c	/* C  : Clear remote interrupt condition */
+#define FSI_SRSIM0		0x70	/* R/W: Remote interrupt mask */
+#define FSI_SRSIM4		0x74	/* R/W: Remote interrupt mask */
+#define FSI_SRSIS0		0x78	/* R  : Remote interrupt status */
+#define FSI_SRSIS4		0x7c	/* R  : Remote interrupt status */
+#define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
+
+/*
+ * SMODE fields
+ */
+#define FSI_SMODE_WSC		0x80000000	/* Warm start done */
+#define FSI_SMODE_ECRC		0x20000000	/* Hw CRC check */
+#define FSI_SMODE_SID_SHIFT	24		/* ID shift */
+#define FSI_SMODE_SID_MASK	3		/* ID Mask */
+#define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
+#define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
+#define FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
+#define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
+
+/*
+ * SISS fields
+ */
+#define FSI_SISS_CRC_ERROR		BIT(31)
+#define FSI_SISS_PROTO_ERROR		BIT(30)
+#define FSI_SISS_LBUS_PARITY_ERROR	BIT(29)
+#define FSI_SISS_LBUS_PROTO_ERROR	BIT(28)
+#define FSI_SISS_ACCESS_ERROR		BIT(27)
+#define FSI_SISS_LBUS_OWNERSHIP_ERROR	BIT(26)
+#define FSI_SISS_LBUS_OWNERSHIP_CHANGE	BIT(25)
+#define FSI_SISS_ASYNC_MODE_ERROR	BIT(14)
+#define FSI_SISS_OPB_ACCESS_ERROR	BIT(13)
+#define FSI_SISS_OPB_FENCED		BIT(12)
+#define FSI_SISS_OPB_PARITY_ERROR	BIT(11)
+#define FSI_SISS_OPB_PROTO_ERROR	BIT(10)
+#define FSI_SISS_OPB_TIMEOUT		BIT(9)
+#define FSI_SISS_OPB_ERROR_ACK		BIT(8)
+#define FSI_SISS_MFSI_MASTER_ERROR	BIT(3)
+#define FSI_SISS_MFSI_PORT_ERROR	BIT(2)
+#define FSI_SISS_MFSI_HP		BIT(1)
+#define FSI_SISS_MFSI_CR_PARITY_ERROR	BIT(0)
+#define FSI_SISS_ALL			0xfe007f00
+
+/*
+ * SI1S fields
+ */
+#define FSI_SI1S_SLAVE_BIT	31
+#define FSI_SI1S_SHIFT_BIT	30
+#define FSI_SI1S_SCOM_BIT	29
+#define FSI_SI1S_SCRATCH_BIT	28
+#define FSI_SI1S_I2C_BIT	27
+#define FSI_SI1S_SPI_BIT	26
+#define FSI_SI1S_SBEFIFO_BIT	25
+#define FSI_SI1S_MBOX_BIT	24
+
+/*
+ * SLBUS fields
+ */
+#define FSI_SLBUS_FORCE		0x80000000	/* Force LBUS ownership */
+
+/*
+ * LLMODE fields
+ */
+#define FSI_LLMODE_ASYNC	0x1
+
 struct fsi_master;
 
 struct fsi_slave {
-- 
2.39.3

