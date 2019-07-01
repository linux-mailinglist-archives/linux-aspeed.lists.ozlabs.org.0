Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15E5C3FB
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Jul 2019 21:55:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cym03xB3zDqZC
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jul 2019 05:55:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cykF3L5SzDqYj
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jul 2019 05:54:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61JbMkN043634
 for <linux-aspeed@lists.ozlabs.org>; Mon, 1 Jul 2019 15:54:11 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfqjbaqem-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jul 2019 15:54:11 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-aspeed@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 1 Jul 2019 20:54:10 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 20:54:07 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61Js6GN11927990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 19:54:06 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D2DC6E059;
 Mon,  1 Jul 2019 19:54:06 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 103DF6E04E;
 Mon,  1 Jul 2019 19:54:06 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 19:54:05 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4 6/8] drivers/soc: xdma: Add debugfs entries
Date: Mon,  1 Jul 2019 14:53:57 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562010839-1113-1-git-send-email-eajames@linux.ibm.com>
References: <1562010839-1113-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19070119-0036-0000-0000-00000AD28F50
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011361; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01226037; UDB=6.00645423; IPR=6.01007250; 
 MB=3.00027541; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-01 19:54:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070119-0037-0000-0000-00004C6EA442
Message-Id: <1562010839-1113-7-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010230
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 eduval@amazon.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add debugfs entries for the relevant XDMA engine registers and for
dumping the AST2500 reserved memory space.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 128 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 72b4c4b..08128ce 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -172,6 +172,12 @@ struct aspeed_xdma {
 
 	char pcidev[4];
 	struct miscdevice misc;
+	struct dentry *debugfs_dir;
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct debugfs_regset32 regset;
+	struct debugfs_reg32 regs[XDMA_NUM_DEBUGFS_REGS];
+#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
 };
 
 struct aspeed_xdma_client {
@@ -614,6 +620,126 @@ static int aspeed_xdma_init_mem(struct aspeed_xdma *ctx, u32 conf)
 	return 0;
 }
 
+static ssize_t aspeed_xdma_debugfs_vga_read(struct file *file,
+					    char __user *buf, size_t len,
+					    loff_t *offset)
+{
+	int rc = -ENOMEM;
+	struct inode *inode = file_inode(file);
+	struct aspeed_xdma *ctx = inode->i_private;
+	loff_t offs = *offset;
+	void *tmp;
+
+	if (len + offs > ctx->vga_size) {
+		if (offs < ctx->vga_size)
+			len = ctx->vga_size - offs;
+		else
+			return 0;
+	}
+
+	tmp = kzalloc(len, GFP_KERNEL);
+	if (!tmp)
+		return rc;
+
+	memcpy_fromio(tmp, ctx->vga_virt + offs, len);
+
+	rc = copy_to_user(buf, tmp, len);
+	if (rc)
+		goto free;
+
+	*offset = offs + len;
+	rc = len;
+
+free:
+	kfree(tmp);
+
+	return rc;
+}
+
+static const struct file_operations aspeed_xdma_debugfs_vga_fops = {
+	.owner	= THIS_MODULE,
+	.llseek	= generic_file_llseek,
+	.read	= aspeed_xdma_debugfs_vga_read,
+};
+
+static void aspeed_xdma_init_debugfs(struct aspeed_xdma *ctx)
+{
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
+		return;
+
+	ctx->debugfs_dir = debugfs_create_dir(DEVICE_NAME, NULL);
+	if (IS_ERR(ctx->debugfs_dir)) {
+		dev_warn(ctx->dev, "Failed to create debugfs directory.\n");
+		return;
+	}
+
+	debugfs_create_file("vga", 0444, ctx->debugfs_dir, ctx,
+			    &aspeed_xdma_debugfs_vga_fops);
+
+	ctx->regs[0].name = "host_q_addr31";
+	ctx->regs[0].offset = XDMA_HOST_CMD_QUEUE_ADDR0;
+	ctx->regs[1].name = "host_q_addr63";
+	ctx->regs[1].offset = XDMA_HOST_CMD_QUEUE_ADDR1;
+	ctx->regs[2].name = "host_q_endp";
+	ctx->regs[2].offset = XDMA_HOST_CMD_QUEUE_ENDP;
+	ctx->regs[3].name = "host_q_writep";
+	ctx->regs[3].offset = XDMA_HOST_CMD_QUEUE_WRITEP;
+	ctx->regs[4].name = "host_q_readp";
+	ctx->regs[4].offset = XDMA_HOST_CMD_QUEUE_READP;
+	ctx->regs[5].name = "bmc_q_addr";
+	ctx->regs[5].offset = XDMA_BMC_CMD_QUEUE_ADDR;
+	ctx->regs[6].name = "bmc_q_endp";
+	ctx->regs[6].offset = XDMA_BMC_CMD_QUEUE_ENDP;
+	ctx->regs[7].name = "bmc_q_writep";
+	ctx->regs[7].offset = XDMA_BMC_CMD_QUEUE_WRITEP;
+	ctx->regs[8].name = "bmc_q_readp";
+	ctx->regs[8].offset = XDMA_BMC_CMD_QUEUE_READP;
+	ctx->regs[9].name = "control";
+	ctx->regs[9].offset = XDMA_CTRL;
+	ctx->regs[10].name = "status";
+	ctx->regs[10].offset = XDMA_STATUS;
+	ctx->regs[11].name = "ds_frame_size";
+	ctx->regs[11].offset = XDMA_DS_FRAME_SIZE;
+	ctx->regs[12].name = "probe_ds_pcie";
+	ctx->regs[12].offset = XDMA_PROBE_DS_PCIE;
+	ctx->regs[13].name = "probe_us_pcie";
+	ctx->regs[13].offset = XDMA_PROBE_US_PCIE;
+	ctx->regs[14].name = "inprg_ds1";
+	ctx->regs[14].offset = XDMA_INPRG_DS_CMD1;
+	ctx->regs[15].name = "inprg_ds2";
+	ctx->regs[15].offset = XDMA_INPRG_DS_CMD2;
+	ctx->regs[16].name = "inprg_us031";
+	ctx->regs[16].offset = XDMA_INPRG_US_CMD00;
+	ctx->regs[17].name = "inprg_us063";
+	ctx->regs[17].offset = XDMA_INPRG_US_CMD01;
+	ctx->regs[18].name = "inprg_us131";
+	ctx->regs[18].offset = XDMA_INPRG_US_CMD10;
+	ctx->regs[19].name = "inprg_us163";
+	ctx->regs[19].offset = XDMA_INPRG_US_CMD11;
+	ctx->regs[20].name = "inprg_us231";
+	ctx->regs[20].offset = XDMA_INPRG_US_CMD20;
+	ctx->regs[21].name = "inprg_us263";
+	ctx->regs[21].offset = XDMA_INPRG_US_CMD21;
+	ctx->regs[22].name = "vga_q_addr31";
+	ctx->regs[22].offset = XDMA_VGA_CMD_QUEUE_ADDR0;
+	ctx->regs[23].name = "vga_q_addr63";
+	ctx->regs[23].offset = XDMA_VGA_CMD_QUEUE_ADDR1;
+	ctx->regs[24].name = "vga_q_endp";
+	ctx->regs[24].offset = XDMA_VGA_CMD_QUEUE_ENDP;
+	ctx->regs[25].name = "vga_q_writep";
+	ctx->regs[25].offset = XDMA_VGA_CMD_QUEUE_WRITEP;
+	ctx->regs[26].name = "vga_q_readp";
+	ctx->regs[26].offset = XDMA_VGA_CMD_QUEUE_READP;
+	ctx->regs[27].name = "vga_cmd_status";
+	ctx->regs[27].offset = XDMA_VGA_CMD_STATUS;
+
+	ctx->regset.regs = ctx->regs;
+	ctx->regset.nregs = XDMA_NUM_DEBUGFS_REGS;
+	ctx->regset.base = ctx->base;
+
+	debugfs_create_regset32("regs", 0444, ctx->debugfs_dir, &ctx->regset);
+}
+
 static int aspeed_xdma_change_pcie_conf(struct aspeed_xdma *ctx, u32 conf)
 {
 	int rc;
@@ -785,6 +911,7 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	}
 
 	device_create_file(dev, &dev_attr_pcidev);
+	aspeed_xdma_init_debugfs(ctx);
 
 	return 0;
 }
@@ -793,6 +920,7 @@ static int aspeed_xdma_remove(struct platform_device *pdev)
 {
 	struct aspeed_xdma *ctx = platform_get_drvdata(pdev);
 
+	debugfs_remove_recursive(ctx->debugfs_dir);
 	device_remove_file(ctx->dev, &dev_attr_pcidev);
 
 	misc_deregister(&ctx->misc);
-- 
1.8.3.1

