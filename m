Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E817C8FD8A9
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:25:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nIlE4vI8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgVb0Ngqz3cQX
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 07:25:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nIlE4vI8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgS83gTFz3cQX;
	Thu,  6 Jun 2024 07:23:36 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LC7nj011974;
	Wed, 5 Jun 2024 21:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=8PJMQwkXBuHRk4+y67UGNnhw/k8TP4I96ElVzPKL2DE=;
 b=nIlE4vI8/SfDnpvvPHcGAdea760Vd0k1amKWBVugRkkjlpWGuJ5ZwWR779PQwfn7OcOr
 ZcJp+ynBWlHXz9VV5gtpABl8M1i5n6v2UgysnYvhEmOZbk6bEiQQGoUpRrzhsZN1Urym
 KmX8pNk4f91eTSJX8okyfSZM6kzUjBmmmGyexUpid0WRhdQorCeRB/qHDFQijsgy7A3D
 bPZ3WCfLA5Grl5PPwrff6mQoHNqpI8qbdWf2UGUFEOBRpvmi4hVkH7QgPVt9Nhy8Fd8Z
 qg74ZtCgrXX87RHIwNrVI3hVDWzctzXFwgtyTQxeTs5RxJYhf8BjuKqWqv/7C5jegbPq 8g== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyqf00rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:25 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455J3Ge9031147;
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNKwF10355290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B14F758067;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 721665805F;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v4 24/40] fsi: aspeed: Add interrupt support
Date: Wed,  5 Jun 2024 16:22:56 -0500
Message-Id: <20240605212312.349188-25-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TZy6v-nwDVax87CmXxW2TRfPA3FaSa3S
X-Proofpoint-ORIG-GUID: TZy6v-nwDVax87CmXxW2TRfPA3FaSa3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=883 impostorscore=0 adultscore=0
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

Handle slave interrupts and pass them to the FSI core.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c          | 106 ++++++++++++++++++++++-
 include/trace/events/fsi_master_aspeed.h |  12 +++
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index eecd64bc29512..34f4c9e00e43d 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -6,6 +6,8 @@
 #include <linux/delay.h>
 #include <linux/fsi.h>
 #include <linux/io.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -25,11 +27,13 @@ struct fsi_master_aspeed_data {
 struct fsi_master_aspeed {
 	struct fsi_master	master;
 	spinlock_t		lock;	/* protect HW access */
+	struct irq_domain	*irq_domain;
 	struct device		*dev;
 	void __iomem		*base;
 	void __iomem		*ctrl;
 	struct clk		*clk;
 	struct gpio_desc	*cfam_reset_gpio;
+	u32			irq_mask;
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -79,6 +83,11 @@ static const u32 fsi_base = 0xa0000000;
 #define STATUS_TIMEOUT		BIT(4)
 
 /* OPB_IRQ_MASK */
+#define FSI_MASTER_ERROR_IRQ	BIT(28)
+#define FSI_PORT_ERROR_IRQ	BIT(27)
+#define FSI_HOTPLUG_IRQ		BIT(26)
+#define FSI_REMOTE_SLV_IRQ(l)	(BIT(FSI_REMOTE_SLV_IRQ_BIT) << (l))
+#define FSI_REMOTE_SLV_IRQ_BIT	18
 #define OPB1_XFER_ACK_EN BIT(17)
 #define OPB0_XFER_ACK_EN BIT(16)
 
@@ -96,7 +105,7 @@ static const u32 fsi_base = 0xa0000000;
 #define OPB_RC_CTRL_OPB		BIT(18)	/* Access controller over OPB, not AHB (AST27xx+) */
 #define OPB_RC_XFER_ACK_EN	BIT(16)	/* Enable OPBx xfer ack bit without mask */
 #define OPB_RC_COUNT		GENMASK(15, 0)	/* Number of retries */
-#define OPB_RC_DEFAULT		0x10
+#define OPB_RC_DEFAULT		(OPB_RC_XFER_ACK_EN | 0x10)
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/fsi_master_aspeed.h>
@@ -322,11 +331,76 @@ static int aspeed_master_break(struct fsi_master *master, int link)
 	return aspeed_master_write(master, link, 0, addr, &cmd, 4);
 }
 
+static int aspeed_master_link_enable(struct fsi_master *master, int link, bool enable)
+{
+	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&aspeed->lock, flags);
+	if (enable) {
+		rc = fsi_master_link_enable(master, link, enable);
+		if (rc)
+			goto done;
+
+		aspeed->irq_mask |= FSI_REMOTE_SLV_IRQ(link);
+		writel(aspeed->irq_mask, aspeed->base + OPB_IRQ_MASK);
+	} else {
+		aspeed->irq_mask &= ~FSI_REMOTE_SLV_IRQ(link);
+		writel(aspeed->irq_mask, aspeed->base + OPB_IRQ_MASK);
+
+		rc = fsi_master_link_enable(master, link, enable);
+	}
+
+done:
+	spin_unlock_irqrestore(&aspeed->lock, flags);
+	return rc;
+}
+
+static irqreturn_t aspeed_master_irq(int irq, void *data)
+{
+	struct fsi_master_aspeed *aspeed = data;
+	unsigned long size = FSI_REMOTE_SLV_IRQ_BIT + aspeed->master.n_links;
+	unsigned long bit = FSI_REMOTE_SLV_IRQ_BIT;
+	unsigned long status;
+
+	status = readl(aspeed->base + OPB_IRQ_STATUS);
+	writel(0, aspeed->base + OPB_IRQ_MASK);
+
+	for_each_set_bit_from(bit, &status, size)
+		fsi_master_irq(&aspeed->master, aspeed->irq_domain, bit - FSI_REMOTE_SLV_IRQ_BIT);
+
+	writel(status, aspeed->base + OPB_IRQ_STATUS);
+	writel(0, aspeed->base + OPB_IRQ_STATUS);
+	writel(aspeed->irq_mask, aspeed->base + OPB_IRQ_MASK);
+
+	trace_fsi_master_aspeed_irq(status);
+	return IRQ_HANDLED;
+}
+
+static int aspeed_master_irqd_map(struct irq_domain *domain, unsigned int irq,
+				  irq_hw_number_t hwirq)
+{
+	struct fsi_master_aspeed *aspeed = domain->host_data;
+
+	irq_set_chip_and_handler(irq, &aspeed->master.irq_chip, handle_simple_irq);
+	irq_set_chip_data(irq, &aspeed->master);
+
+	return 0;
+}
+
+static const struct irq_domain_ops aspeed_master_irq_domain_ops = {
+	.map = aspeed_master_irqd_map,
+};
+
 static void aspeed_master_release(struct device *dev)
 {
 	struct fsi_master_aspeed *aspeed =
 		to_fsi_master_aspeed(to_fsi_master(dev));
 
+	if (aspeed->irq_domain)
+		irq_domain_remove(aspeed->irq_domain);
+
 	regmap_exit(aspeed->master.map);
 	kfree(aspeed);
 }
@@ -477,6 +551,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	struct resource *res;
 	unsigned int reg;
 	int rc, links;
+	int irq;
 
 	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
 	if (rc) {
@@ -567,11 +642,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	aspeed->master.dev.of_node = of_node_get(dev_of_node(&pdev->dev));
 
 	aspeed->master.n_links = links;
-	aspeed->master.flags = FSI_MASTER_FLAG_RELA;
+	aspeed->master.flags = FSI_MASTER_FLAG_INTERRUPT | FSI_MASTER_FLAG_RELA;
 	aspeed->master.read = aspeed_master_read;
 	aspeed->master.write = aspeed_master_write;
 	aspeed->master.send_break = aspeed_master_break;
 	aspeed->master.term = aspeed_master_term;
+	aspeed->master.link_enable = aspeed_master_link_enable;
 
 	dev_set_drvdata(&pdev->dev, aspeed);
 
@@ -579,9 +655,30 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	if (rc)
 		goto err_regmap;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		unsigned int size = links * FSI_IRQ_COUNT;
+
+		aspeed->irq_domain = irq_domain_add_linear(aspeed->dev->of_node, size,
+							   &aspeed_master_irq_domain_ops, aspeed);
+		if (aspeed->irq_domain) {
+			rc = devm_request_irq(aspeed->dev, irq, aspeed_master_irq, 0,
+					      dev_name(aspeed->dev), aspeed);
+			if (rc) {
+				dev_warn(aspeed->dev, "failed to request irq:%d\n", irq);
+				irq_domain_remove(aspeed->irq_domain);
+				aspeed->irq_domain = NULL;
+			} else {
+				dev_info(aspeed->dev, "enabling interrupts irq:%d\n", irq);
+			}
+		} else {
+			dev_warn(aspeed->dev, "failed to create irq domain\n");
+		}
+	}
+
 	rc = fsi_master_register(&aspeed->master);
 	if (rc)
-		goto err_regmap;
+		goto err_irq;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -593,6 +690,9 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	get_device(&aspeed->master.dev);
 	return 0;
 
+err_irq:
+	if (aspeed->irq_domain)
+		irq_domain_remove(aspeed->irq_domain);
 err_regmap:
 	regmap_exit(aspeed->master.map);
 err_release:
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 7eeecbfec7f09..dba1776334a0e 100644
--- a/include/trace/events/fsi_master_aspeed.h
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -8,6 +8,18 @@
 
 #include <linux/tracepoint.h>
 
+TRACE_EVENT(fsi_master_aspeed_irq,
+	TP_PROTO(uint32_t status),
+	TP_ARGS(status),
+	TP_STRUCT__entry(
+		__field(uint32_t, status)
+	),
+	TP_fast_assign(
+		__entry->status = status;
+	),
+	TP_printk("status %08x", __entry->status)
+);
+
 TRACE_EVENT(fsi_master_aspeed_opb_xfer,
 	TP_PROTO(uint32_t addr, uint32_t size, uint32_t data, bool read),
 	TP_ARGS(addr, size, data, read),
-- 
2.39.3

