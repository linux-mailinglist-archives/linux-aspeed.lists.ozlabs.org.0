Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D58FD89C
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:25:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qTIXnIs0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgV555LFz3cTL
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:25:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qTIXnIs0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS72xjxz3cNc;
	Thu,  6 Jun 2024 07:23:34 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455L0dbb020650;
	Wed, 5 Jun 2024 21:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=11zpQI9xr19rfXGIBfzj6RLCrXVfSzpcD3mn995Pgkw=;
 b=qTIXnIs0cIUFNfnUlChghskfK1spVWV80YRnBV/8P4zVtVDHZFRUKlJyvbSUialCpXrk
 Xk+wqZ+Pe0b5bPsdd1fKM3uuWDK6CsvJHa1DTGX3cPDnK9J+pAq0+6OPtmq2KW3itgiT
 94bRU0KezJN8TwEPv2Yv00gX3v1rpdEwUxTM53xKrIgpaCAKzETdGMY2bFBTZB2fhFF3
 8AKcTaMQl5hk1EDDA1IY3OExJz9HhBwE3C0hkpgtDrHuGw9VE0X8mSgDeT3YWO4VIHug
 X60U7vKIzKzZw6dWfhxh0Q/j8oJEO6uKzlSV6RwUOTftkjl0bsmcV0oypvlAUkP0Zy86 qw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyhyr1mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:26 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JlkIQ026600;
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffn6hj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNLmI40763872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDA095805D;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85FE95806B;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 21/40] fsi: aspeed: Disable relative addressing and IPOLL for cfam reset
Date: Wed,  5 Jun 2024 16:22:53 -0500
Message-Id: <20240605212312.349188-22-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cIvVpV4DnW7VlBXI_jFKy5cMb1bRJmM7
X-Proofpoint-GUID: cIvVpV4DnW7VlBXI_jFKy5cMb1bRJmM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=721 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Need to disable these for the master reset after cfam reset.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 176e596b4391b..c9f6d84e1a372 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -402,11 +402,18 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 
 	trace_fsi_master_aspeed_cfam_reset(true);
 	spin_lock_irqsave(&aspeed->lock, flags);
+
+	regmap_write(aspeed->master.map, FSI_MMODE,
+		     aspeed->master.mmode & ~(FSI_MMODE_EIP | FSI_MMODE_RELA));
+
 	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
 	udelay(900);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
 	udelay(900);
+
 	regmap_write(aspeed->master.map, FSI_MRESP0, FSI_MRESP_RST_ALL_MASTER);
+	regmap_write(aspeed->master.map, FSI_MMODE, aspeed->master.mmode);
+
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	trace_fsi_master_aspeed_cfam_reset(false);
 
-- 
2.39.3

