Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB58C7C04
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:21:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LhU9fWt0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJM459Jhz3fqC
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:21:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LhU9fWt0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJJz5QV5z3frq;
	Fri, 17 May 2024 04:19:31 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGlSQp023873;
	Thu, 16 May 2024 18:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QqPznRA+hyrwCZS4ZfTG52d1Xiq+sQbDIgM9Bqyai5Y=;
 b=LhU9fWt0LpKoW8pPwxfeIfyglZguAk8Z7FHvi7bBFT/Kwq84BG0IKhelkxfUQV/kMpQP
 u6F0P4ZuIbGfPmWcNtxVcGr1Nog0LjLgQ1u/JePRcnBt4Bj1sa022dAxaUHVztSpufF3
 rm7iI+RdFiqgOZDJOEPnkxSijfqIxbMmnxHVp39bJhFkHkaBj+EpXvlEjkI9cXMf/c3c
 wQXFPggva5HT8gnnyEAQlEl0MnAYDVyhZ3mvkPspWocE5aIY9kj/diC0EJBD3U4ChrAb
 TD10fluuqQ25PKEkAgGA3fMlVBz61o5mp1Zq7tX1NszLbp4tOU3jxGSTaheDHnhZsaCY OQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5nycr8dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:21 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGLm1D029592;
	Thu, 16 May 2024 18:19:20 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m34mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJHj544630574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:20 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACB5F58073;
	Thu, 16 May 2024 18:19:17 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E88558071;
	Thu, 16 May 2024 18:19:17 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 34/40] fsi: core: Add master register read-only sysfs
Date: Thu, 16 May 2024 13:19:01 -0500
Message-Id: <20240516181907.3468796-35-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pR0lzxHYKRZTL71aAOXDWwxAvFP9QeCG
X-Proofpoint-ORIG-GUID: pR0lzxHYKRZTL71aAOXDWwxAvFP9QeCG
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

The master registers are commonly used for debugging or diagnosis so
provide them in sysfs files.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c   | 144 +++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h |   6 ++
 2 files changed, 150 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ae65d87d4b13e..096b26c6421f2 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1392,6 +1392,141 @@ static ssize_t master_break_store(struct device *dev,
 
 static DEVICE_ATTR(break, 0200, NULL, master_break_store);
 
+struct fsi_master_attribute {
+	struct device_attribute attr;
+	int reg;
+};
+
+static ssize_t master_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int reg;
+	int rc;
+	
+	rc = regmap_read(master->map, fattr->reg, &reg);
+	if (rc)
+		return rc;
+
+	return sysfs_emit(buf, "%08x\n", reg);
+}
+
+static ssize_t master_reg_1bpp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int count = (master->n_links + 31) / 32;
+	unsigned int reg;
+	unsigned int i;
+	int len = 0;
+	int rc;
+	
+	for (i = 0; i < count; ++i) {
+		rc = regmap_read(master->map, fattr->reg + (i * 4), &reg);
+		if (rc)
+			return rc;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", reg);
+	}
+
+	return len;
+}
+
+static ssize_t master_reg_4bpp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int count = (master->n_links + 7) / 8;
+	unsigned int reg;
+	unsigned int i;
+	int len = 0;
+	int rc;
+	
+	for (i = 0; i < count; ++i) {
+		rc = regmap_read(master->map, fattr->reg + (i * 4), &reg);
+		if (rc)
+			return rc;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", reg);
+	}
+
+	return len;
+}
+
+static ssize_t master_reg_32bpp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int reg;
+	int len = 0;
+	int rc;
+	int i;
+	
+	for (i = 0; i < master->n_links; ++i) {
+		rc = regmap_read(master->map, fattr->reg + (i * 4), &reg);
+		if (rc)
+			return rc;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", reg);
+	}
+
+	return len;
+}
+
+#define FSI_MASTER_ATTR(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_show, NULL), reg }
+#define FSI_MASTER_ATTR_1BPP(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_1bpp_show, NULL), reg }
+#define FSI_MASTER_ATTR_4BPP(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_4bpp_show, NULL), reg }
+#define FSI_MASTER_ATTR_32BPP(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_32bpp_show, NULL), reg }
+
+static FSI_MASTER_ATTR(mmode, FSI_MMODE);
+static FSI_MASTER_ATTR(mdlyr, FSI_MDLYR);
+static FSI_MASTER_ATTR_1BPP(mcrsp, FSI_MCRSP);
+static FSI_MASTER_ATTR_1BPP(menp, FSI_MENP0);
+static FSI_MASTER_ATTR_1BPP(mlevp, FSI_MLEVP0);
+static FSI_MASTER_ATTR_1BPP(mrefp, FSI_MREFP0);
+static FSI_MASTER_ATTR_1BPP(mhpmp, FSI_MHPMP0);
+static FSI_MASTER_ATTR_4BPP(msiep, FSI_MSIEP0);
+static FSI_MASTER_ATTR_1BPP(maesp, FSI_MAESP0);
+static FSI_MASTER_ATTR(maeb, FSI_MAEB);
+static FSI_MASTER_ATTR(mver, FSI_MVER);
+static FSI_MASTER_ATTR_1BPP(mbsyp, FSI_MBSYP0);
+static FSI_MASTER_ATTR_32BPP(mstap, FSI_MSTAP0);
+static FSI_MASTER_ATTR(mesrb, FSI_MESRB0);
+static FSI_MASTER_ATTR(mscsb, FSI_MSCSB0);
+static FSI_MASTER_ATTR(matrb, FSI_MATRB0);
+static FSI_MASTER_ATTR(mdtrb, FSI_MDTRB0);
+static FSI_MASTER_ATTR(mectrl, FSI_MECTRL);
+
+static struct attribute *master_mapped_attrs[] = {
+	&dev_attr_mmode.attr.attr,
+	&dev_attr_mdlyr.attr.attr,
+	&dev_attr_mcrsp.attr.attr,
+	&dev_attr_menp.attr.attr,
+	&dev_attr_mlevp.attr.attr,
+	&dev_attr_mrefp.attr.attr,
+	&dev_attr_mhpmp.attr.attr,
+	&dev_attr_msiep.attr.attr,
+	&dev_attr_maesp.attr.attr,
+	&dev_attr_maeb.attr.attr,
+	&dev_attr_mver.attr.attr,
+	&dev_attr_mbsyp.attr.attr,
+	&dev_attr_mstap.attr.attr,
+	&dev_attr_mesrb.attr.attr,
+	&dev_attr_mscsb.attr.attr,
+	&dev_attr_matrb.attr.attr,
+	&dev_attr_mdtrb.attr.attr,
+	&dev_attr_mectrl.attr.attr,
+	NULL
+};
+
+static const struct attribute_group master_mapped_group = {
+	.attrs = master_mapped_attrs,
+};
+
 static struct attribute *master_attrs[] = {
 	&dev_attr_break.attr,
 	&dev_attr_rescan.attr,
@@ -1665,6 +1800,12 @@ int fsi_master_register(struct fsi_master *master)
 	}
 out:
 	mutex_unlock(&master->scan_lock);
+
+	if (!rc && master->map) {
+		if (!sysfs_create_group(&master->dev.kobj, &master_mapped_group))
+			master->groups = true;
+	}
+
 	return rc;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
@@ -1675,6 +1816,9 @@ void fsi_master_unregister(struct fsi_master *master)
 
 	trace_fsi_master_unregister(master);
 
+	if (master->groups)
+		sysfs_remove_group(&master->dev.kobj, &master_mapped_group);
+
 	mutex_lock(&master->scan_lock);
 	fsi_master_unscan(master);
 	master->n_links = 0;
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 2104902091e05..1fa101a477899 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/irq.h>
 #include <linux/mutex.h>
+#include <linux/sysfs.h>
 
 /*
  * Master registers
@@ -27,12 +28,16 @@
 #define FSI_MENP0		0x10		/* R/W: enable */
 #define FSI_MLEVP0		0x18		/* R: plug detect */
 #define FSI_MSENP0		0x18		/* S: Set enable */
+#define FSI_MREFP0		0x20		/* R: Plug reference */
 #define FSI_MCENP0		0x20		/* C: Clear enable */
+#define FSI_MHPMP0		0x28		/* R: Plug monitor */
 #define FSI_MSIEP0		0x30		/* R/W: interrupt enable */
+#define FSI_MAESP0		0x50		/* R: Any error port */
 #define FSI_MSSIEP0		0x50		/* S: Set interrupt enable */
 #define FSI_MCSIEP0		0x70		/* C: Clear interrupt enable */
 #define FSI_MAEB		0x70		/* R: Error address */
 #define FSI_MVER		0x74		/* R: master version/type */
+#define FSI_MBSYP0		0x78		/* R: Port busy */
 #define FSI_MSTAP0		0xd0		/* R: Port status */
 #define FSI_MRESP0		0xd0		/* W: Port reset */
 #define FSI_MESRB0		0x1d0		/* R: Master error status */
@@ -151,6 +156,7 @@ struct fsi_master {
 	int		(*link_config)(struct fsi_master *, int link,
 				       u8 t_send_delay, u8 t_echo_delay);
 	u8		remote_interrupt_status;
+	bool		groups;
 };
 
 #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
-- 
2.39.3

