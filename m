Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEAD8C7C08
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 May 2024 20:21:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jqZnWPmM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgJMG086rz3fp5
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 May 2024 04:21:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jqZnWPmM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgJK002GQz3fs3;
	Fri, 17 May 2024 04:19:31 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GG714X003960;
	Thu, 16 May 2024 18:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UaPvf6PO9NoXq8wwJQeNt9uuUYf2ak6wZVS6nw5xVWE=;
 b=jqZnWPmMUzAX42xPQS+NsysJQBmRY8X5XJ2bH7UXahVWqBdvdNf0Zgj5JjYIll8mzzrk
 71EkJc1Bz6EJKQvNkfspR74stf9datRUk/VL4fHfuwFFnWkxqJMSHrUrTbO0rE2ub5/p
 5L0X+gnQvBwiN3n7+NfznJmGaePCCbCWAswdXwL+ugUaI9I3vdvAa6fkS7NEVxgUNeZD
 5SxQtdYVZLwdHkn3GMDu3icBJuatoO+kVVvbYnOWkZR7Otuk937GqdIG6MU4twqEXigj
 Nz48dR9vZM+40vkJNZ9lbOZRYDCiNKs+fmYS2w/Rf95nFabHNcSfgbw66jw5AXmUS4RA Uw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5g6jh6u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHabl2005998;
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmud3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:21 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJI1G18678322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F4D85806B;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60A1C58069;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v3 37/40] fsi: core: Add different types of CFAM
Date: Thu, 16 May 2024 13:19:04 -0500
Message-Id: <20240516181907.3468796-38-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BvFygxNzDn5UiTwaxCXe-fb5nnUBLwAP
X-Proofpoint-GUID: BvFygxNzDn5UiTwaxCXe-fb5nnUBLwAP
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

Detect the CFAM type based on the chip id and set up the device
type based on the CFAM type.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 84 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3d2bedb3ad51b..2785812a7d4ad 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1028,6 +1028,37 @@ static struct attribute *cfam_attrs[] = {
 
 ATTRIBUTE_GROUPS(cfam);
 
+static struct attribute *cfam_s_attrs[] = {
+	&dev_attr_send_echo_delays.attr,
+	&dev_attr_chip_id.attr,
+	&dev_attr_cfam_id.attr,
+	&dev_attr_send_term.attr,
+	&dev_attr_config_table.attr,
+	&dev_attr_smode.attr.attr,
+	&dev_attr_sdma.attr.attr,
+	&dev_attr_sisc.attr.attr,
+	&dev_attr_sism.attr.attr,
+	&dev_attr_siss.attr.attr,
+	&dev_attr_sstat.attr.attr,
+	&dev_attr_si1m.attr.attr,
+	&dev_attr_si1s.attr.attr,
+	&dev_attr_sic.attr.attr,
+	&dev_attr_si2m.attr.attr,
+	&dev_attr_si2s.attr.attr,
+	&dev_attr_scmdt.attr.attr,
+	&dev_attr_sdata.attr.attr,
+	&dev_attr_slastd.attr.attr,
+	&dev_attr_smbl.attr.attr,
+	&dev_attr_soml.attr.attr,
+	&dev_attr_snml.attr.attr,
+	&dev_attr_smbr.attr.attr,
+	&dev_attr_somr.attr.attr,
+	&dev_attr_snmr.attr.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(cfam_s);
+
 static char *cfam_devnode(const struct device *dev, umode_t *mode,
 			  kuid_t *uid, kgid_t *gid)
 {
@@ -1046,6 +1077,57 @@ static const struct device_type cfam_type = {
 	.groups = cfam_groups
 };
 
+static char *cfam_ody_devnode(const struct device *dev, umode_t *mode, kuid_t *uid, kgid_t *gid)
+{
+	const struct fsi_slave *slave = to_fsi_slave(dev);
+
+#ifdef CONFIG_FSI_NEW_DEV_NODE
+	return kasprintf(GFP_KERNEL, "fsi/ody%d", slave->cdev_idx);
+#else
+	return kasprintf(GFP_KERNEL, "ody%d", slave->cdev_idx);
+#endif
+}
+
+static const struct device_type cfam_ody_type = {
+	.name = "ody",
+	.devnode = cfam_ody_devnode
+};
+
+static char *cfam_s_devnode(const struct device *dev, umode_t *mode, kuid_t *uid, kgid_t *gid)
+{
+	const struct fsi_slave *slave = to_fsi_slave(dev);
+
+#ifdef CONFIG_FSI_NEW_DEV_NODE
+	return kasprintf(GFP_KERNEL, "fsi/cfam-s%d", slave->cdev_idx);
+#else
+	return kasprintf(GFP_KERNEL, "cfam-s%d", slave->cdev_idx);
+#endif
+}
+
+static const struct device_type cfam_s_type = {
+	.name = "cfam-s",
+	.devnode = cfam_s_devnode,
+	.groups = cfam_s_groups,
+};
+
+const struct device_type *fsi_get_cfam_type(u32 id)
+{
+	u32 major = (id & 0xf00) >> 8;
+	u32 minor = (id & 0xf0) >> 4;
+
+	switch (major) {
+	case 0x9:
+		return &cfam_s_type;
+	case 0xc:
+		if (minor == 0)
+			return &cfam_ody_type;
+		fallthrough;
+	case 0xd:
+	default:
+		return &cfam_type;
+	}
+}
+
 static char *fsi_cdev_devnode(const struct device *dev, umode_t *mode,
 			      kuid_t *uid, kgid_t *gid)
 {
@@ -1202,7 +1284,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	spin_lock_init(&slave->lock);
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, id);
-	slave->dev.type = &cfam_type;
+	slave->dev.type = fsi_get_cfam_type(cfam_id);
 	slave->dev.parent = &master->dev;
 	slave->dev.of_node = fsi_slave_find_of_node(master, link, id);
 	slave->dev.release = fsi_slave_release;
-- 
2.39.3

