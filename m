Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DACCC8FD866
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:23:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lY3oaZv6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgSS729hz3cMQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:23:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lY3oaZv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS26w2xz30fM;
	Thu,  6 Jun 2024 07:23:30 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455L0OGr020141;
	Wed, 5 Jun 2024 21:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=Y98dRxrLBHldvjnywSLtVO9jA7MBr6bUSzYUwxA+r8w=;
 b=lY3oaZv6PK4mfWkBx4bhr+mES/YcHQQDHq8kb/sGTmkrwDhSDcmO7pgPr/fCPYtoKaf7
 B4V8XYuPtTiTLLwDJ3MKh8HIQ6NjZkz5ToQzRaoV/9JB6cpPzZV9rvRQEZcdPA/dTqwI
 +QKw5ZBaH/eSH/FjUxT8Ef02nWIGdmd8l6AK02KYB8juRS2NTmL8Sx3VroKPaWjgP18N
 cYHgSob1SRvD+aMmn7EAZbbdm55P9wi/d7AQUK1zlHrPHUuxMGdoxfJ0vXK7egMRUuMT
 +JRugMFzwRUVpXpMLSXOPekXPUpavIMOLsgeWlPnMn+J2Cq7jgwpup+dgfeC/wggOczL EA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyhyr1mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:20 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455L18Jx026513;
	Wed, 5 Jun 2024 21:23:19 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yggp366ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:19 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNGTJ18547272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:18 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F23258055;
	Wed,  5 Jun 2024 21:23:16 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3239F5806A;
	Wed,  5 Jun 2024 21:23:16 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 10/40] fsi: core: Add slave spinlock
Date: Wed,  5 Jun 2024 16:22:42 -0500
Message-Id: <20240605212312.349188-11-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -f-zZ_WIngontr3AXPh0CWSnvzJnDmob
X-Proofpoint-GUID: -f-zZ_WIngontr3AXPh0CWSnvzJnDmob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
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

FSI slave operations were not locked, meaning that during slave
error recovery operations, other slave accesses may take place,
resulting in incorrect recovery and additional errors. Make the
slave access and error recovery atomic with a spinlock. Don't
use a mutex for future interrupt handling support.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 7 +++++++
 drivers/fsi/fsi-slave.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ce9762d1bd8b0..660f89b743235 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -304,6 +304,7 @@ static int fsi_slave_handle_error(struct fsi_slave *slave, bool write,
 int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 			void *val, size_t size)
 {
+	unsigned long flags;
 	uint8_t id = slave->id;
 	int rc, err_rc, i;
 
@@ -311,6 +312,7 @@ int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 	if (rc)
 		return rc;
 
+	spin_lock_irqsave(&slave->lock, flags);
 	for (i = 0; i < slave_retries; i++) {
 		rc = fsi_master_read(slave->master, slave->link,
 				id, addr, val, size);
@@ -321,6 +323,7 @@ int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 		if (err_rc)
 			break;
 	}
+	spin_unlock_irqrestore(&slave->lock, flags);
 
 	return rc;
 }
@@ -329,6 +332,7 @@ EXPORT_SYMBOL_GPL(fsi_slave_read);
 int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			const void *val, size_t size)
 {
+	unsigned long flags;
 	uint8_t id = slave->id;
 	int rc, err_rc, i;
 
@@ -336,6 +340,7 @@ int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 	if (rc)
 		return rc;
 
+	spin_lock_irqsave(&slave->lock, flags);
 	for (i = 0; i < slave_retries; i++) {
 		rc = fsi_master_write(slave->master, slave->link,
 				id, addr, val, size);
@@ -346,6 +351,7 @@ int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 		if (err_rc)
 			break;
 	}
+	spin_unlock_irqrestore(&slave->lock, flags);
 
 	return rc;
 }
@@ -1007,6 +1013,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	if (!slave)
 		return -ENOMEM;
 
+	spin_lock_init(&slave->lock);
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, id);
 	slave->dev.type = &cfam_type;
 	slave->dev.parent = &master->dev;
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index e9fd4be6f3760..0468ec1c60db2 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -6,6 +6,7 @@
 
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/spinlock.h>
 
 #define FSI_SLAVE_BASE			0x800
 
@@ -107,6 +108,7 @@ struct fsi_slave {
 	struct device		dev;
 	struct fsi_master	*master;
 	struct cdev		cdev;
+	spinlock_t		lock;	/* atomic access and error recovery */
 	int			cdev_idx;
 	int			id;	/* FSI address */
 	int			link;	/* FSI link# */
-- 
2.39.3

