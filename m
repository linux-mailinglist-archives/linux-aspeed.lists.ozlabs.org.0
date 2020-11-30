Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FB2CB11F
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 00:53:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClzSq5m84zDqxb
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 10:53:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckz8p0yvbzDqml
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Nov 2020 19:36:05 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0AU8Vqmw067868;
 Mon, 30 Nov 2020 16:31:52 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 30 Nov 2020 16:34:13 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "Borislav
 Petkov" <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rrichter@marvell.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:EDAC-CORE"
 <linux-edac@vger.kernel.org>
Subject: [PATCH 3/3] edac: Supporting AST2400 and AST2600 edac driver
Date: Mon, 30 Nov 2020 16:33:45 +0800
Message-ID: <20201130083345.4814-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130083345.4814-1-troy_lee@aspeedtech.com>
References: <20201130083345.4814-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0AU8Vqmw067868
X-Mailman-Approved-At: Wed, 02 Dec 2020 10:53:22 +1100
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
Cc: leetroy@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Adding AST2400 and AST2600 edac driver support.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 drivers/edac/Kconfig       |   6 +-
 drivers/edac/aspeed_edac.c | 114 +++++++++++++++++++++++++++++--------
 2 files changed, 94 insertions(+), 26 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index fc30f2ef9782..8ea70746d0bf 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -508,10 +508,10 @@ config EDAC_QCOM
 	  health, you should probably say 'Y' here.
 
 config EDAC_ASPEED
-	tristate "Aspeed AST 2500 SoC"
-	depends on MACH_ASPEED_G5
+	tristate "Aspeed AST BMC SoC"
+	depends on (MACH_ASPEED_G4 || MACH_ASPEED_G5 || MACH_ASPEED_G6)
 	help
-	  Support for error detection and correction on the Aspeed AST 2500 SoC.
+	  Support for error detection and correction on the Aspeed AST BMC SoC.
 
 	  First, ECC must be configured in the bootloader. Then, this driver
 	  will expose error counters via the EDAC kernel framework.
diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index fbec28dc661d..03a3c12f6bf6 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -14,12 +14,11 @@
 #include <linux/regmap.h>
 #include "edac_module.h"
 
-
 #define DRV_NAME "aspeed-edac"
 
-
 #define ASPEED_MCR_PROT        0x00 /* protection key register */
 #define ASPEED_MCR_CONF        0x04 /* configuration register */
+#define ASPEED_MCR_REQ         0x08 /* Graphics Memory Protection register */
 #define ASPEED_MCR_INTR_CTRL   0x50 /* interrupt control/status register */
 #define ASPEED_MCR_ADDR_UNREC  0x58 /* address of first un-recoverable error */
 #define ASPEED_MCR_ADDR_REC    0x5c /* address of last recoverable error */
@@ -34,10 +33,8 @@
 #define ASPEED_MCR_INTR_CTRL_CNT_UNREC GENMASK(15, 12)
 #define ASPEED_MCR_INTR_CTRL_ENABLE  (BIT(0) | BIT(1))
 
-
 static struct regmap *aspeed_regmap;
 
-
 static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	void __iomem *regs = (void __iomem *)context;
@@ -53,7 +50,6 @@ static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
 	return 0;
 }
 
-
 static int regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
 	void __iomem *regs = (void __iomem *)context;
@@ -63,6 +59,76 @@ static int regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
 	return 0;
 }
 
+extern void aspeed_sdmc_disable_mem_protection(u8 req)
+{
+	u32 req_val = 0;
+
+	regmap_read(aspeed_regmap, ASPEED_MCR_REQ, &req_val);
+
+	req_val &= ~BIT(req);
+
+	regmap_write(aspeed_regmap, ASPEED_MCR_REQ, req_val);
+}
+EXPORT_SYMBOL(aspeed_sdmc_disable_mem_protection);
+
+static const u32 ast2400_dram_table[] = {
+	0x04000000,	//64MB
+	0x08000000,	//128MB
+	0x10000000,	//256MB
+	0x20000000,	//512MB
+};
+
+static const u32 ast2500_dram_table[] = {
+	0x08000000,	//128MB
+	0x10000000,	//256MB
+	0x20000000,	//512MB
+	0x40000000,	//1024MB
+};
+
+static const u32 ast2600_dram_table[] = {
+	0x10000000,	//256MB
+	0x20000000,	//512MB
+	0x40000000,	//1024MB
+	0x80000000,	//2048MB
+};
+
+extern u32 aspeed_get_dram_size(void)
+{
+	u32 reg04;
+	u32 size;
+
+	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
+
+#if defined(CONFIG_MACH_ASPEED_G6)
+	size = ast2600_dram_table[reg04 & 0x3];
+#elif defined(CONFIG_MACH_ASPEED_G5)
+	size = ast2500_dram_table[reg04 & 0x3];
+#else
+	size = ast2400_dram_table[reg04 & 0x3];
+#endif
+	return size;
+}
+EXPORT_SYMBOL(aspeed_get_dram_size);
+
+static const u32 aspeed_vga_table[] = {
+	0x800000,	//8MB
+	0x1000000,	//16MB
+	0x2000000,	//32MB
+	0x4000000,	//64MB
+};
+
+extern u32 aspeed_get_vga_size(void)
+{
+	u32 reg04;
+	u32 size;
+
+	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
+
+	size = aspeed_vga_table[((reg04 & 0xC) >> 2)];
+	return size;
+}
+EXPORT_SYMBOL(aspeed_get_vga_size);
+
 static bool regmap_is_volatile(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -209,8 +275,8 @@ static int config_irq(void *ctx, struct platform_device *pdev)
 	/* register interrupt handler */
 	irq = platform_get_irq(pdev, 0);
 	dev_dbg(&pdev->dev, "got irq %d\n", irq);
-	if (irq < 0)
-		return irq;
+	if (!irq)
+		return -ENODEV;
 
 	rc = devm_request_irq(&pdev->dev, irq, mcr_isr, IRQF_TRIGGER_HIGH,
 			      DRV_NAME, ctx);
@@ -239,7 +305,11 @@ static int init_csrows(struct mem_ctl_info *mci)
 	int rc;
 
 	/* retrieve info about physical memory from device tree */
-	np = of_find_node_by_path("/memory");
+#ifdef CONFIG_MACH_ASPEED_G4
+	np = of_find_node_by_path("/memory@40000000");
+#else
+	np = of_find_node_by_path("/memory@80000000");
+#endif
 	if (!np) {
 		dev_err(mci->pdev, "dt: missing /memory node\n");
 		return -ENODEV;
@@ -281,11 +351,19 @@ static int aspeed_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
+	struct device_node *np;
+	struct resource *res;
 	void __iomem *regs;
-	u32 reg04;
 	int rc;
 
-	regs = devm_platform_ioremap_resource(pdev, 0);
+	/* setup regmap */
+	np = dev->of_node;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENOENT;
+
+	regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
@@ -294,13 +372,6 @@ static int aspeed_probe(struct platform_device *pdev)
 	if (IS_ERR(aspeed_regmap))
 		return PTR_ERR(aspeed_regmap);
 
-	/* bail out if ECC mode is not configured */
-	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
-	if (!(reg04 & ASPEED_MCR_CONF_ECC)) {
-		dev_err(&pdev->dev, "ECC mode is not configured in u-boot\n");
-		return -EPERM;
-	}
-
 	edac_op_state = EDAC_OPSTATE_INT;
 
 	/* allocate & init EDAC MC data structure */
@@ -373,13 +444,13 @@ static int aspeed_remove(struct platform_device *pdev)
 	return 0;
 }
 
-
 static const struct of_device_id aspeed_of_match[] = {
+	{ .compatible = "aspeed,ast2400-sdram-edac" },
 	{ .compatible = "aspeed,ast2500-sdram-edac" },
+	{ .compatible = "aspeed,ast2600-sdram-edac" },
 	{},
 };
 
-
 static struct platform_driver aspeed_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
@@ -395,18 +466,15 @@ static int __init aspeed_init(void)
 	return platform_driver_register(&aspeed_driver);
 }
 
-
 static void __exit aspeed_exit(void)
 {
 	platform_driver_unregister(&aspeed_driver);
 }
 
-
 module_init(aspeed_init);
 module_exit(aspeed_exit);
 
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Stefan Schaeckeler <sschaeck@cisco.com>");
-MODULE_DESCRIPTION("Aspeed AST2500 EDAC driver");
+MODULE_DESCRIPTION("Aspeed EDAC driver");
 MODULE_VERSION("1.0");
-- 
2.17.1

