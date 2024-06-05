Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11E8FD8D0
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:27:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNYBpF0y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgX16LRhz30St
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:26:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNYBpF0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgSD10lWz3cTD;
	Thu,  6 Jun 2024 07:23:39 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455K8Rdf009413;
	Wed, 5 Jun 2024 21:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=kxSj0cj+SHG6G3CgN+VDhbwxi4I1ZjlQ60/1SQ/PgFM=;
 b=sNYBpF0yZJhYUumcRcGzpnM8KTcckFRjdFV9alyg8qURpJSwIfgY5oyN2gubUtRuDlIA
 3aTFz+DN07nDx/DCXWg+zN4S1UmriHRX7JmS0MvBLlg2vMwrb5TrAxjrUfg5aA0aiZBp
 zbvipDJZ2OMD3bPAJjoywSCTUlO3KYrdE5fP4IAsBI9rqo5Q3i0mupLiVfRn0cGVBGHU
 rxoTd6egTkPNy82w0idL1ykIrhWFuMeuZid6CGSe1JR3SEs9RvIEoE6urHK9GSbpSb3S
 brBJIE8NbtZDkFVoZI4BdSLL2ufwYfM9elMgl/7B1de3b3MEq2oZ6nOmUVmrAcWeprA1 VA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxse06rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IZCbw031109;
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNKaI17367726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E59358059;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4B2758065;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 22/40] fsi: aspeed: Use common master error handler
Date: Wed,  5 Jun 2024 16:22:54 -0500
Message-Id: <20240605212312.349188-23-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NEm3V_-JbDh5Z16bQusD7g1wrzAk3zLR
X-Proofpoint-GUID: NEm3V_-JbDh5Z16bQusD7g1wrzAk3zLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
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

