Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA428FD89F
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:25:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bZIAPUDX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgV95Qvlz3cCM
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:25:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bZIAPUDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS74bfdz3cGM;
	Thu,  6 Jun 2024 07:23:35 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KKjXd025682;
	Wed, 5 Jun 2024 21:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=VVh0pOteeIri9qqbCA+sDhPXPbv1rTPqRDlFd5iwUgU=;
 b=bZIAPUDXFYmgTFtCfDv9tEDVvUj6CmYgYvE/7YWCivsVTzkCYsCopRFTTMaEsvCVoJoe
 +d6h5Izah7nlyXWIHXtPUwzKrHP5m99aE8RO5oJOmFMR5iaLxPGBLm1xph9MVxVYYNkW
 ywZ5Fn+uQWEhWtfHJ6/c9p2Db5XLgoQLtTAHWT3c5xyT4joiM6MZiYRgQUxe0CymqjnE
 NJ6yDlb34unaIJld6jTZrrQsR4qJbuCaTODjEoxHhRcJXQPdJZEawgRu1hIPZ4Wsig+0
 3yLBFfYRObbednuK3gEEJMINFhFPKOld5AzoDgxxUXP1pnlVoKgWSaZf6K5v5/nd65ho MA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjuwr0qc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:26 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455LKNJ5008463;
	Wed, 5 Jun 2024 21:23:25 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNMRD48103912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A02558055;
	Wed,  5 Jun 2024 21:23:22 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C8415806A;
	Wed,  5 Jun 2024 21:23:22 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 30/40] i2c: fsi: Define a function to check status error bits
Date: Wed,  5 Jun 2024 16:23:02 -0500
Message-Id: <20240605212312.349188-31-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uIQ3lo8aMA4Sveu7X7k3F3_3kcFfPMRd
X-Proofpoint-GUID: uIQ3lo8aMA4Sveu7X7k3F3_3kcFfPMRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=914
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This will be used more than once with interrupt support, so split
the error bit checks into a function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 38 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index f3b97bf88d0f9..022f1287aa0e3 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -507,6 +507,26 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 	return -ETIMEDOUT;
 }
 
+static int fsi_i2c_error_status_to_rc(u32 status)
+{
+	if (status & I2C_STAT_INV_CMD)
+		return -EINVAL;
+
+	if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN | I2C_STAT_BE_ACCESS))
+		return -EPROTO;
+
+	if (status & I2C_STAT_NACK)
+		return -ENXIO;
+
+	if (status & I2C_STAT_LOST_ARB)
+		return -EAGAIN;
+
+	if (status & I2C_STAT_STOP_ERR)
+		return -EBADMSG;
+
+	return -EIO;
+}
+
 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 				 struct i2c_msg *msg, u32 status)
 {
@@ -518,23 +538,7 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 		if (rc)
 			return rc;
 
-		if (status & I2C_STAT_INV_CMD)
-			return -EINVAL;
-
-		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
-		    I2C_STAT_BE_ACCESS))
-			return -EPROTO;
-
-		if (status & I2C_STAT_NACK)
-			return -ENXIO;
-
-		if (status & I2C_STAT_LOST_ARB)
-			return -EAGAIN;
-
-		if (status & I2C_STAT_STOP_ERR)
-			return -EBADMSG;
-
-		return -EIO;
+		return fsi_i2c_error_status_to_rc(status);
 	}
 
 	if (status & I2C_STAT_DAT_REQ) {
-- 
2.39.3

