Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378B18C7BFD
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:21:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dU/psU1h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJLn59nMz3fpx
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:21:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dU/psU1h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJJy0R9Wz3fq2;
	Fri, 17 May 2024 04:19:29 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GI23ZR004647;
	Thu, 16 May 2024 18:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EXGcZynFVVUbk26l2/hfQQpZCKfn9AC1kWN4XMBRoBg=;
 b=dU/psU1hJhfhhc6Sk6kIthXyV54V5gcufJsDYSXqat/n3AkKqJozC/tWkcDA4n+SIqnC
 LzRiGQtyc6YWtxSw6gVEUZkLbw4243+7LJtJE12I2tkNwGeMgIgv8Y6EI4s1j4jleH8O
 ZpFxFpq6bZbWMmQGUOHM/x6JG4klxWxaz2+WvIGYEZN3OXrYKp/ZwIYZUsNjZ5YVhWt3
 nQiYjSCYAE8lEXBWH1+CuEMv9cFogJUXnEV6Jf+WI8Gq+yo61V4yPHIklCBuOSFTBepe
 CFq6ou35Are6aVdCcBgXZ+g9uv9aAOoTMT3W/wW/lMq55HGToRt26rPBcCtdHbHX49PN ng== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5q2jg11x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:17 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GG0JQR029625;
	Thu, 16 May 2024 18:19:16 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m34m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:16 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJDfK36635144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:15 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F11658068;
	Thu, 16 May 2024 18:19:11 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F2285808F;
	Thu, 16 May 2024 18:19:11 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:11 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 13/40] fsi: core: Disable relative addressing during scan
Date: Thu, 16 May 2024 13:18:40 -0500
Message-Id: <20240516181907.3468796-14-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4PfkHuvTMQH78lpqvrHSNU6T6jg83Vu3
X-Proofpoint-GUID: 4PfkHuvTMQH78lpqvrHSNU6T6jg83Vu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 mlxlogscore=808 classifier=spam adjust=0 reason=mlx scancount=1
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

Relative addressing is not allowed during slave ID initialization, so
turn it off during the FSI scan procedure.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index bfb147de90efc..8b402149acbe9 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1223,8 +1223,20 @@ static int fsi_master_break(struct fsi_master *master, int link)
 
 static int fsi_master_scan(struct fsi_master *master)
 {
+	bool set_mmode = false;
 	int link, rc;
 
+	/* relative addressing is not allowed during slave ID initialization */
+	if (master->map && (master->flags & FSI_MASTER_FLAG_RELA)) {
+		u32 mmode = master->mmode & ~FSI_MMODE_RELA;
+
+		rc = regmap_write(master->map, FSI_MMODE, mmode);
+		if (rc)
+			return rc;
+
+		set_mmode = true;
+	}
+
 	trace_fsi_master_scan(master, true);
 	for (link = 0; link < master->n_links; link++) {
 		rc = _fsi_master_link_enable(master, link);
@@ -1246,6 +1258,12 @@ static int fsi_master_scan(struct fsi_master *master)
 			fsi_master_link_disable(master, link);
 	}
 
+	if (set_mmode) {
+		rc = regmap_write(master->map, FSI_MMODE, master->mmode);
+		if (rc)
+			return rc;
+	}
+
 	return 0;
 }
 
-- 
2.39.3

