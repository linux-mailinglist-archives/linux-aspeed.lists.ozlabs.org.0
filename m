Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0398FD899
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:25:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5ku3jlD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgTz6NCyz3c4h
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:25:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5ku3jlD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS72qlCz3bwX;
	Thu,  6 Jun 2024 07:23:35 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LC7nl011974;
	Wed, 5 Jun 2024 21:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=n2ELCBKlduOnR5wTkTQugicJX8taWF2bAtKMB7UJJcw=;
 b=o5ku3jlDKGnNpkYTseiN9vGHPln5AmkJc9bNvPHIFr9vVa9sJoN5hWHuUG+B6IB1A//t
 DQ+tw/tIvHh/uBH/GRgf9Ohk+jpgGhd2uc1gXM9kf+J0b/JEP/skiXNTDu+0PqHVYsw6
 57H28QZQbmGjWxBcbkNqqPyBzQorDDNu4XNofJMhBxLUHnRjfiNSBCN1IAOH3WLVzyUh
 tlY7NHhZQkZ9DgJSMv3oR5BvJKy0FMPmchqp09cTt4qaPbV53er7aF7lsLffEflccJbq
 MJuDW7M5iXRSnDoaxTxf3n7OoU5yoRfnCRxbVPjO0qD/bbNbgroiBOw8eBE4v80cmyR7 hw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyqf00rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:26 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IMrJS008468;
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNLdK11797064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 465E158068;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09EBF5806A;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 26/40] i2c: fsi: Calculate clock divider from local bus frequency
Date: Wed,  5 Jun 2024 16:22:58 -0500
Message-Id: <20240605212312.349188-27-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qOMgNStxmKtiBcL3iSuT9syNUUV56CE1
X-Proofpoint-ORIG-GUID: qOMgNStxmKtiBcL3iSuT9syNUUV56CE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=973 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160
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

Use the new FSI device local bus clock to calculate the proper
i2c clock divder and look up an optional clock-frequency property
from device tree. Change the default clock divider to 7 now that
the default local bus clock divider has been reduced as well.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Change minimum clock div to 3
 - Use DIV_ROUND_UP instead of re-implementing it
 - Better logic for checking for clock-frequency property

 drivers/i2c/busses/i2c-fsi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 10332693edf0d..2404ace8c56fa 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -27,7 +27,8 @@
 
 #define FSI_ENGID_I2C		0x7
 
-#define I2C_DEFAULT_CLK_DIV	6
+#define I2C_DEFAULT_CLK_DIV	7
+#define I2C_DEFAULT_CLK_RATE	400000
 
 /* i2c registers */
 #define I2C_FSI_FIFO		0x00
@@ -150,6 +151,7 @@ struct fsi_i2c_master {
 	u8			fifo_size;
 	struct list_head	ports;
 	struct mutex		lock;
+	u32			clock_div;
 };
 
 struct fsi_i2c_port {
@@ -194,7 +196,7 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 	if (rc)
 		return rc;
 
-	mode |= FIELD_PREP(I2C_MODE_CLKDIV, I2C_DEFAULT_CLK_DIV);
+	mode |= FIELD_PREP(I2C_MODE_CLKDIV, i2c->clock_div);
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
 		return rc;
@@ -680,6 +682,7 @@ static int fsi_i2c_probe(struct device *dev)
 	struct fsi_i2c_port *port;
 	struct device_node *np;
 	u32 port_no, ports, stat;
+	u32 lbus;
 	int rc;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -689,6 +692,19 @@ static int fsi_i2c_probe(struct device *dev)
 	mutex_init(&i2c->lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
+	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
+
+	lbus = fsi_device_local_bus_frequency(i2c->fsi);
+	if (lbus) {
+		u32 clock;
+
+		if (device_property_read_u32(dev, "clock-frequency", &clock) || !clock)
+			clock = I2C_DEFAULT_CLK_RATE;
+
+		i2c->clock_div = DIV_ROUND_UP(DIV_ROUND_UP(lbus, clock), 4) - 1;
+		if (i2c->clock_div <= 2)
+			i2c->clock_div = 3;
+	}
 
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
-- 
2.39.3

