Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A88FD888
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:24:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PiTtOAXh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgTT6sjgz3cVb
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:24:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PiTtOAXh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS54Dl2z3bwX;
	Thu,  6 Jun 2024 07:23:33 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KvLRH013983;
	Wed, 5 Jun 2024 21:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=YOLIj6L0KAZvactSkelHXB6uAYCWUbFIRDQVWm/PliY=;
 b=PiTtOAXh3BPpIPX69G2uibOakX68i4UV4dUx9roCCl8b/tFxrxGfGcAFBJER4R5Lf4Xp
 8UqnERDqNZFNxBqZMkZoMrtkh8cG1c8S27Hsg6nf7dQ6jKW/w1cCWtZYPbyXgtkGTvZI
 7phkshjc/7mr5wzpgwpQe1EVaN3CfQIPsG2ABop+2Tu8B05MAT3SGB3+Hkg77/SHPNyG
 wa1JHmLiE9J3l+t6aZ1hpEcMTIwox3RqnG1WFTdNCsoSSM/HgvKndT5NArfZvslJ8hxG
 u7YfMq6xHKyk4SBGsHsygF3TY2Rt0AjutNoItR9pcSrjBTeUwU/Ouim/BSa4Aq7aCky4 Cw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjygp81uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455K6b7t022779;
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygg6med4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNLgh22741606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 028835805F;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8C9A58068;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 25/40] fsi: hub: Add interrupt support
Date: Wed,  5 Jun 2024 16:22:57 -0500
Message-Id: <20240605212312.349188-26-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B6cp8WvZrLVnF0C6jRplKcNcw8Vs8k6u
X-Proofpoint-ORIG-GUID: B6cp8WvZrLVnF0C6jRplKcNcw8Vs8k6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=782 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The hub master receives it's interrupts from the local slave register
space, which is handled in the FSI core. Therefore, just route the remote
slave interrupts to the hub link device interrupts.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 119 ++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 91ad6b7728fa2..4dbc542500bbd 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -7,8 +7,10 @@
 
 #include <linux/delay.h>
 #include <linux/fsi.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -35,9 +37,10 @@
  */
 struct fsi_master_hub {
 	struct fsi_master	master;
+	struct irq_domain	*irq_domain;
 	struct fsi_device	*upstream;
-	uint32_t		addr, size;	/* slave-relative addr of */
-						/* master address space */
+	uint32_t		addr;
+	uint32_t		size;
 };
 
 #define to_fsi_master_hub(m) container_of(m, struct fsi_master_hub, master)
@@ -77,10 +80,81 @@ static int hub_master_break(struct fsi_master *master, int link)
 	return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
 }
 
+static int hub_master_link_enable(struct fsi_master *master, int link,
+				  bool enable)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	u32 srsim = 0xff000000 >> (8 * (link % 4));
+	int slave_idx = 4 * (link / 4);
+	__be32 srsim_be;
+	int ret;
+
+	ret = fsi_slave_read(hub->upstream->slave, FSI_SLAVE_BASE + FSI_SRSIM0 + slave_idx,
+			     &srsim_be, sizeof(srsim_be));
+	if (ret)
+		return ret;
+
+	if (enable) {
+		ret = fsi_master_link_enable(master, link, enable);
+		if (ret)
+			return ret;
+
+		srsim |= be32_to_cpu(srsim_be);
+		srsim_be = cpu_to_be32(srsim);
+		ret = fsi_slave_write(hub->upstream->slave,
+				      FSI_SLAVE_BASE + FSI_SRSIM0 + slave_idx, &srsim_be,
+				      sizeof(srsim_be));
+	} else {
+		srsim = be32_to_cpu(srsim_be) & ~srsim;
+		srsim_be = cpu_to_be32(srsim);
+		ret = fsi_slave_write(hub->upstream->slave,
+				      FSI_SLAVE_BASE + FSI_SRSIM0 + slave_idx, &srsim_be,
+				      sizeof(srsim_be));
+		if (ret)
+			return ret;
+
+		ret = fsi_master_link_enable(master, link, enable);
+	}
+
+	return ret;
+}
+
+static irqreturn_t hub_master_irq(int irq, void *data)
+{
+	struct fsi_master_hub *hub = data;
+	struct fsi_master *parent = hub->upstream->slave->master;
+	unsigned int link = 0;
+
+	for (; link < FSI_HUB_MASTER_MAX_LINKS; ++link) {
+		if (parent->remote_interrupt_status & (1 << link))
+			fsi_master_irq(&hub->master, hub->irq_domain, link);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int hub_master_irqd_map(struct irq_domain *domain, unsigned int irq,
+			       irq_hw_number_t hwirq)
+{
+	struct fsi_master_hub *hub = domain->host_data;
+
+	irq_set_chip_and_handler(irq, &hub->master.irq_chip, handle_simple_irq);
+	irq_set_chip_data(irq, &hub->master);
+
+	return 0;
+}
+
+static const struct irq_domain_ops hub_master_irq_domain_ops = {
+	.map = hub_master_irqd_map,
+};
+
 static void hub_master_release(struct device *dev)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(to_fsi_master(dev));
 
+	if (hub->irq_domain)
+		irq_domain_remove(hub->irq_domain);
+
 	regmap_exit(hub->master.map);
 	kfree(hub);
 }
@@ -135,6 +209,7 @@ static int hub_master_probe(struct device *dev)
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
 	hub->master.send_break = hub_master_break;
+	hub->master.link_enable = hub_master_link_enable;
 
 	dev_set_drvdata(dev, hub);
 
@@ -142,9 +217,44 @@ static int hub_master_probe(struct device *dev)
 	if (rc)
 		goto err_free;
 
+	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
+		struct device_node *parent = of_irq_find_parent(dev->of_node);
+
+		if (parent) {
+			struct irq_fwspec fwspec;
+			unsigned int irq;
+
+			fwspec.fwnode = of_node_to_fwnode(parent);
+			fwspec.param_count = 1;
+			fwspec.param[0] = (fsi_dev->slave->link * FSI_IRQ_COUNT) + 8;
+			irq = irq_create_fwspec_mapping(&fwspec);
+			if (irq) {
+				unsigned int size = links * FSI_IRQ_COUNT;
+
+				hub->irq_domain = irq_domain_add_linear(dev->of_node, size,
+									&hub_master_irq_domain_ops,
+									hub);
+
+				if (hub->irq_domain) {
+					rc = devm_request_irq(dev, irq, hub_master_irq, 0,
+							      dev_name(dev), hub);
+					if (rc) {
+						dev_warn(dev, "failed to request irq:%u\n", irq);
+						irq_domain_remove(hub->irq_domain);
+						hub->irq_domain = NULL;
+					} else {
+						dev_info(dev, "enabling interrupts irq:%u\n", irq);
+					}
+				} else {
+					dev_warn(dev, "failed to create irq domain\n");
+				}
+			}
+		}
+	}
+
 	rc = fsi_master_register(&hub->master);
 	if (rc)
-		goto err_free;
+		goto err_irq;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -156,6 +266,9 @@ static int hub_master_probe(struct device *dev)
 	get_device(&hub->master.dev);
 	return 0;
 
+err_irq:
+	if (hub->irq_domain)
+		irq_domain_remove(hub->irq_domain);
 err_free:
 	kfree(hub);
 err_release:
-- 
2.39.3

