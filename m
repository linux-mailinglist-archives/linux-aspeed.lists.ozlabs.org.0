Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED78C7BE8
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:20:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pxEPVioM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJL12fN5z3frH
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:20:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pxEPVioM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJJv1yXXz3fpX;
	Fri, 17 May 2024 04:19:27 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GI9XIt019715;
	Thu, 16 May 2024 18:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Wgrp9mSZpxfDhxFWWnfZxUxl4xHvgw/nBvDHfI2klKI=;
 b=pxEPVioMDRil1pCqVMq7lC6ZNfwhpvjkslzhWpMcZefyDcZDOFNOTlY3JxuXuZ0w9cE5
 eeggip1/PRNgeh4vS1FibfA2UNz8RUoVGpHT0bEWYrcWBgYQmvKdzB7op1yvUtuC/EYl
 DNB3cMKZvEu+RVjygJkhxFPBTKUJYyOZ55XXyB91Q98qIxCD/mKS06FmLirb59v7DRh4
 ika9Y10Vm/o8935PcalWKfSud240yep/1Jg84DBdx2D8GRSLrOAq8IXFbmDIclCOqXVK
 25J/1afLdOKKiTO6zKMuFa1+x491p17u0w9ptYzajW+CQ3VLAWJbonjtEVESOKVo0HDy 7A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5q5980mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:12 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GH0GoI018828;
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJ9pw57409906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CB8158084;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0E2B58088;
	Thu, 16 May 2024 18:19:08 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:08 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 05/40] fsi: Calculate local bus clock frequency
Date: Thu, 16 May 2024 13:18:32 -0500
Message-Id: <20240516181907.3468796-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pe6chPvis694aZ-ghQ3j2i0LNtrROURo
X-Proofpoint-ORIG-GUID: Pe6chPvis694aZ-ghQ3j2i0LNtrROURo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Instead of a hardcoded local bus clock divider, calculate the responder
local bus frequency from the FSI bus frequency.  This will allow FSI
engine drivers to set and calculate their bus (I2C, SPI, etc) frequencies.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Use cfam clock-frequency property instead of hardcoded master local bus
   divider
 - Change default local bus clock divider from 8 to 2

 drivers/fsi/fsi-core.c   | 22 +++++++++++++++++++---
 drivers/fsi/fsi-master.h |  1 +
 drivers/fsi/fsi-slave.h  |  2 ++
 include/linux/fsi.h      |  1 +
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 27235583183e5..44875f2350b04 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -109,6 +109,12 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
 }
 
+unsigned long fsi_device_local_bus_frequency(struct fsi_device *dev)
+{
+	return dev->slave->master->clock_frequency / dev->slave->clock_div;
+}
+EXPORT_SYMBOL_GPL(fsi_device_local_bus_frequency);
+
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
@@ -209,12 +215,12 @@ static inline uint32_t fsi_smode_sid(int x)
 	return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
 }
 
-static uint32_t fsi_slave_smode(int id, u8 t_senddly, u8 t_echodly)
+static uint32_t fsi_slave_smode(int id, int div, u8 t_senddly, u8 t_echodly)
 {
 	return FSI_SMODE_WSC | FSI_SMODE_ECRC
 		| fsi_smode_sid(id)
 		| fsi_smode_echodly(t_echodly - 1) | fsi_smode_senddly(t_senddly - 1)
-		| fsi_smode_lbcrr(0x8);
+		| fsi_smode_lbcrr(div - 1);
 }
 
 static int fsi_slave_set_smode(struct fsi_slave *slave, uint8_t id)
@@ -225,7 +231,8 @@ static int fsi_slave_set_smode(struct fsi_slave *slave, uint8_t id)
 	/* set our smode register with the slave ID field to 0; this enables
 	 * extended slave addressing
 	 */
-	smode = fsi_slave_smode(slave->id, slave->t_send_delay, slave->t_echo_delay);
+	smode = fsi_slave_smode(slave->id, slave->clock_div, slave->t_send_delay,
+				slave->t_echo_delay);
 	data = cpu_to_be32(smode);
 
 	return fsi_master_write(slave->master, slave->link, id, FSI_SLAVE_BASE + FSI_SMODE,
@@ -950,6 +957,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	struct fsi_slave *slave;
 	uint8_t crc;
 	__be32 data, llmode, slbus;
+	u32 clock;
 	int rc;
 
 	/* Currently, we only support single slaves on a link, and use the
@@ -1003,6 +1011,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	slave->dev.of_node = fsi_slave_find_of_node(master, link, id);
 	slave->dev.release = fsi_slave_release;
 	device_initialize(&slave->dev);
+	slave->clock_div = FSI_SMODE_LBCRR_DEFAULT;
 	slave->cfam_id = cfam_id;
 	slave->master = master;
 	slave->link = link;
@@ -1020,6 +1029,10 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	}
 
+	if (master->clock_frequency && !device_property_read_u32(&slave->dev, "clock-frequency",
+								 &clock) && clock)
+		slave->clock_div = DIV_ROUND_UP(master->clock_frequency, clock);
+
 	slbus = cpu_to_be32(FSI_SLBUS_FORCE);
 	rc = fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SLBUS,
 			      &slbus, sizeof(slbus));
@@ -1289,6 +1302,9 @@ int fsi_master_register(struct fsi_master *master)
 	if (!dev_name(&master->dev))
 		dev_set_name(&master->dev, "fsi%d", master->idx);
 
+	if (master->flags & FSI_MASTER_FLAG_SWCLOCK)
+		master->clock_frequency = 100000000; // POWER reference clock
+
 	master->dev.class = &fsi_master_class;
 
 	mutex_lock(&master->scan_lock);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index a0d7ad0f0f7cc..ff23983ea84c8 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -121,6 +121,7 @@
 
 struct fsi_master {
 	struct device	dev;
+	unsigned long	clock_frequency;
 	int		idx;
 	int		n_links;
 	int		flags;
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index 45190b06fa027..fabc0b66d5bf3 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -48,6 +48,7 @@
 #define FSI_SMODE_SD_DEFAULT	 16		/* Default send delay */
 #define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
+#define FSI_SMODE_LBCRR_DEFAULT	 2		/* Default clk ratio */
 
 /*
  * SISS fields
@@ -104,6 +105,7 @@ struct fsi_slave {
 	int			id;	/* FSI address */
 	int			link;	/* FSI link# */
 	u32			cfam_id;
+	u32			clock_div;
 	int			chip_id;
 	uint32_t		size;	/* size of slave address space */
 	u8			t_send_delay;
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 3df8c54868df5..e0309bf0ae072 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -24,6 +24,7 @@ extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
 extern int fsi_device_write(struct fsi_device *dev, uint32_t addr,
 		const void *val, size_t size);
 extern int fsi_device_peek(struct fsi_device *dev, void *val);
+extern unsigned long fsi_device_local_bus_frequency(struct fsi_device *dev);
 
 struct fsi_device_id {
 	u8	engine_type;
-- 
2.39.3

