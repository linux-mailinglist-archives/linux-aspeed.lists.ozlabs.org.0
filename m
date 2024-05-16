Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9BE8C7BE4
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:20:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NP3iUm1b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJKs6fnFz3fpY
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:20:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NP3iUm1b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJJt6CvHz3fpY;
	Fri, 17 May 2024 04:19:26 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGGCpY016278;
	Thu, 16 May 2024 18:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dqdJlR5MaTztZMJgWYsXAeJqjv1L5VBfiwva68G3Zto=;
 b=NP3iUm1blKdCpvnXHDrLH11TD6Ymg20NEoUjZuNbW3hyE0mouwzB64CpqUAXEECPBz3g
 uDzwZO5QqkK4GW76Zwy1GX2EOe2TEyIv01WuOYqBMwMc2+5Ww6gvjrCnKDuQ9Ou1Qa6C
 S5p3atVGprmLOneb2yWgjPo7Q241kV3ZVg3o5RkFPRHnuqrxl/0ED6Q0poToFcSrzUa9
 Gx/AfW7NXvMHojm086iIWw3EEf6zTxa8XzALr+2K6TbdqJnUN5f7wg12AtsHbLfgyj4q
 PwkubH3W/RQhitbtYZJake0EnRejmtICnNePfD122TRihK+3hnZUhefBEDp6klnjE8eP Ag== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5g6jh6u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:16 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAFtV002257;
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0pkfuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:15 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJD7D19202620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0082D58056;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B649058052;
	Thu, 16 May 2024 18:19:12 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 18/40] fsi: aspeed: Don't clear all IRQs during OPB transfers
Date: Thu, 16 May 2024 13:18:45 -0500
Message-Id: <20240516181907.3468796-19-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u2pDWQQhoxsFKEfFhDC_C6Oq6MKpP5WB
X-Proofpoint-GUID: u2pDWQQhoxsFKEfFhDC_C6Oq6MKpP5WB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

In order to support FSI interrupts, the OPB transfer functions should
not clear all the IRQs pending. Instead, just write the OPB ACK bit
to the IRQ status register. As commented, this register invisibly
masks the interrupt once the interrupt condition is cleared. Fix this
by writing 0 before each OPB transfer.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 04aa5cb9b6fad..f840c7c4a56b9 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -47,6 +47,11 @@ static const u32 fsi_base = 0xa0000000;
 #define OPB_CLK_SYNC	0x3c
 #define OPB_IRQ_CLEAR	0x40
 #define OPB_IRQ_MASK	0x44
+/*
+ * This register does NOT behave in the expected manner. It is expected that writing 1b would clear
+ * the corresponding interrupt condition. However it also invisibly masks the interrupt! Writing 0b
+ * unmasks again.
+ */
 #define OPB_IRQ_STATUS	0x48
 
 #define OPB0_SELECT	0x10
@@ -113,13 +118,14 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
 	writel_relaxed(addr, base + OPB0_FSI_ADDR);
 	writel_relaxed(val, base + OPB0_FSI_DATA_W);
-	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
+	writel_relaxed(0, base + OPB_IRQ_STATUS);
 	writel(0x1, base + OPB_TRIGGER);
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 				(reg & OPB0_XFER_ACK_EN) != 0,
 				0, OPB_POLL_TIMEOUT);
 
+	writel(OPB0_XFER_ACK_EN, base + OPB_IRQ_STATUS);
 	status = readl(base + OPB0_STATUS);
 
 	/* Return error when poll timed out */
@@ -165,13 +171,14 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	writel_relaxed(CMD_READ, base + OPB0_RW);
 	writel_relaxed(transfer_size, base + OPB0_XFER_SIZE);
 	writel_relaxed(addr, base + OPB0_FSI_ADDR);
-	writel_relaxed(0x1, base + OPB_IRQ_CLEAR);
+	writel_relaxed(0, aspeed->base + OPB_IRQ_STATUS);
 	writel(0x1, base + OPB_TRIGGER);
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 			   (reg & OPB0_XFER_ACK_EN) != 0,
 			   0, OPB_POLL_TIMEOUT);
 
+	writel(OPB0_XFER_ACK_EN, base + OPB_IRQ_STATUS);
 	status = readl(base + OPB0_STATUS);
 
 	result = readl(base + OPB0_FSI_DATA_R);
@@ -530,8 +537,6 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	}
 
 	writel(0x1, aspeed->base + OPB_CLK_SYNC);
-	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
-			aspeed->base + OPB_IRQ_MASK);
 
 	writel(opb_retry_counter, aspeed->base + OPB_RETRY_COUNTER);
 
-- 
2.39.3

