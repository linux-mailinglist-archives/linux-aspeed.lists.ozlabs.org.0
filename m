Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB68C7C24
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:22:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6JHHJzz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJND1DGzz3frG
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:22:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6JHHJzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJKB6XGXz3frq;
	Fri, 17 May 2024 04:19:42 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHPJ0B028004;
	Thu, 16 May 2024 18:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kxSj0cj+SHG6G3CgN+VDhbwxi4I1ZjlQ60/1SQ/PgFM=;
 b=S6JHHJzz6KAnXYx712hsIj2stJW0R9yomexkW9PX4jxFnuH2HAZj9UhQupQ6ti2OQiJR
 9CDTGbIEVCO4dRNxK+VpTMLg+FECT60CgmtDpLYTx3MFaDjQJgzEvGAi37rnHQpYK8qD
 fmrZDF/7FoFCx+j8ArOi2hB+dzjobGrZJPxPanTpgBV6Up4JPB+DL0EcCxoVtfNMRyDr
 DK0xmDbI2RrHGi51s2+45/0j79rsMZNykN/4G94zyrVuYQXiX4xGXh3XXVLKUTuRcG3i
 0yk5BnmwDwmCYColkivezpQ8RtxN4BKdhZZ6fXx8vdKphW8SWx8wWUVKbG7OFQb/4Qa2 qg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5mce8frp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:17 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHVOC7020165;
	Thu, 16 May 2024 18:19:16 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kd0bmck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:16 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJEeC21496474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:16 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DC5D58074;
	Thu, 16 May 2024 18:19:14 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E373858076;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 22/40] fsi: aspeed: Use common master error handler
Date: Thu, 16 May 2024 13:18:49 -0500
Message-Id: <20240516181907.3468796-23-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mNQb2WIZQn7bcU-F0x82aAhQb5jhTRBU
X-Proofpoint-ORIG-GUID: mNQb2WIZQn7bcU-F0x82aAhQb5jhTRBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160132
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

This will do the correct mmode manipulation to do the master
reset.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c9f6d84e1a372..eecd64bc29512 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -226,27 +226,6 @@ static int opb_readb(struct fsi_master_aspeed *aspeed, uint32_t addr, u8 *out)
 	return __opb_read(aspeed, addr, XFER_BYTE, (void *)out);
 }
 
-static int check_errors(struct fsi_master_aspeed *aspeed, int err)
-{
-	int ret;
-
-	if (err == -EIO) {
-		/* Check MAEB (0x70) ? */
-
-		/* Then clear errors in master */
-		ret = opb_writel(aspeed, ctrl_base + FSI_MRESP0,
-				cpu_to_be32(FSI_MRESP_RST_ALL_MASTER));
-		if (ret) {
-			/* TODO: log? return different code? */
-			return ret;
-		}
-		/* TODO: confirm that 0x70 was okay */
-	}
-
-	/* This will pass through timeout errors */
-	return err;
-}
-
 static int aspeed_master_read(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, void *val, size_t size)
 {
@@ -277,7 +256,8 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 		goto done;
 	}
 
-	ret = check_errors(aspeed, ret);
+	if (ret == -EIO)
+		fsi_master_error(&aspeed->master, link);
 done:
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
@@ -313,7 +293,8 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 		goto done;
 	}
 
-	ret = check_errors(aspeed, ret);
+	if (ret == -EIO)
+		fsi_master_error(&aspeed->master, link);
 done:
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
-- 
2.39.3

