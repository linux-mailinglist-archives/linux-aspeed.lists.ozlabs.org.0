Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4E8C7BF2
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:20:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tu6i9VdJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJLN68Hjz3fpd
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:20:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tu6i9VdJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJJw5cvSz3fq2;
	Fri, 17 May 2024 04:19:28 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGkw93021245;
	Thu, 16 May 2024 18:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tzPFGbo6X3zcNdVJFT3Zq8NM38ZKt/TD8N6qjoX5nmY=;
 b=Tu6i9VdJy9SqOE8YPfw7wKNhmxqklFXeVtDHH08z4aciF5vj2Dewv/DF5iYdHIsVf6BD
 oWiIIxBqgiSw0cmJ0/M1b3SD02JSKK+x6XrslHBALqLmraTVYAnHewXSfp8FxtLIqLUh
 80G+E/XQTLBH0wJHiEfRwZcDqYXH64YjKnYAQB5M7yWBLJGRZG6Qn5Rnzgcw8eE5aT75
 lBCiQeVK1nvFGXHYXmpIIwWVcGaV8Ez8+6LPonpnyby57oYEpkaKe3LN10LZTT9CwuNt
 dNnt+ZvuykIJ1D2UY+VmBrVoCbuypaFUTP3pdo2lDXXTn6ljeWKNElrzYpE5iRgTMEWR OQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5nycr8dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHmnXO006183;
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmud39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJGA542140022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C90C858078;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AD6858080;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 31/40] i2c: fsi: Add boolean for skip stop command on abort
Date: Thu, 16 May 2024 13:18:58 -0500
Message-Id: <20240516181907.3468796-32-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HC54uwD7Go1XxXnYpXpr9t0lMi06jJCP
X-Proofpoint-ORIG-GUID: HC54uwD7Go1XxXnYpXpr9t0lMi06jJCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

In preparation for interrupt support, store whether to skip the
final stop command during the abort procedure instead of checking
the previously read status register in the abort function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 022f1287aa0e3..614d830419bb8 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -116,6 +116,9 @@
 #define I2C_STAT_ANY_RESP	(I2C_STAT_ERR |				\
 				 I2C_STAT_DAT_REQ |			\
 				 I2C_STAT_CMD_COMP)
+#define I2C_STAT_SKIP_STOP	(I2C_STAT_PARITY |			\
+				 I2C_STAT_LOST_ARB |			\
+				 I2C_STAT_STOP_ERR)
 
 /* extended status register */
 #define I2C_ESTAT_FIFO_SZ	GENMASK(31, 24)
@@ -150,6 +153,7 @@ struct fsi_i2c_master {
 	struct mutex		lock;
 	u32			clock_div;
 	u8			fifo_size;
+	bool			skip_stop;
 };
 
 struct fsi_i2c_port {
@@ -459,31 +463,30 @@ static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
 	return 0;
 }
 
-static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
+static int fsi_i2c_abort(struct fsi_i2c_port *port)
 {
 	struct fsi_i2c_master *i2c = port->master;
 	u32 cmd = I2C_CMD_WITH_STOP;
 	unsigned long start;
-	u32 stat;
+	u32 status;
 	int rc;
 
 	rc = fsi_i2c_reset_engine(i2c, port->port);
 	if (rc)
 		return rc;
 
-	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &status);
 	if (rc)
 		return rc;
 
 	/* if sda is low, peform full bus reset */
-	if (!(stat & I2C_STAT_SDA_IN)) {
+	if (!(status & I2C_STAT_SDA_IN)) {
 		rc = fsi_i2c_reset_bus(i2c, port);
 		if (rc)
 			return rc;
 	}
 
-	/* skip final stop command for these errors */
-	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
+	if (i2c->skip_stop)
 		return 0;
 
 	/* write stop command */
@@ -534,7 +537,8 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 	int rc;
 
 	if (status & I2C_STAT_ERR) {
-		rc = fsi_i2c_abort(port, status);
+		port->master->skip_stop = status & I2C_STAT_SKIP_STOP;
+		rc = fsi_i2c_abort(port);
 		if (rc)
 			return rc;
 
-- 
2.39.3

