Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A6C6D1BB6
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 11:15:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnvlX17tGz3cdH
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 20:15:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AdXI5EOc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AdXI5EOc;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pnvl81pt4z3cdH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 20:15:15 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 3D76C203E3; Fri, 31 Mar 2023 17:15:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680254114;
	bh=DwJVXzMJiN5hjRhApoLO5DGd/N9N6w0f4EJEHeB8P4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AdXI5EOc2F1wrp2rxwRLFAotgwLg2JiITCq9889wM24yT7ggqLXxJIA+6is9ph6M/
	 pgfdtkASAVW4Pq0+gcaq3q91PI17S2DTdW3tLS8VvGVDFfWeVsGZlSr33ZBuoSCSse
	 WJ8/8PNldSvDa4t0DRmWG9d+4qof0y35dVXu/c8gezh8sHePMHHWJa45to8VeFfi4a
	 dxEbvYKwqu0sT7qTmF+eKzWeGq8XEZeXVYvl7BmtLzIUxF9nBwsSq3GJWf/+PzPsrT
	 UXxG8+X1SFYc+uo2fH6Pg2IpG46IhXnLBASx8dyP6dqVLIvI3sn3jFUp3gJVUHHhLI
	 76aLBJRbNj61g==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v3 1/3] i3c: dw: Add infrastructure for platform-specific implementations
Date: Fri, 31 Mar 2023 17:14:59 +0800
Message-Id: <20230331091501.3800299-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230331091501.3800299-1-jk@codeconstruct.com.au>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matt Johnston <matt@codeconstruct.com.au>, Jack Chen <zenghuchen@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The dw i3c core can be integrated into various SoC devices. Platforms
that use this core may need a little configuration that is specific to
that platform.

Add some infrastructure to allow platform-specific behaviour: common
probe/remove functions, a set of platform hook operations, and a pointer
for platform-specific data in struct dw_i3c_master. Move the common api
into a new (i3c local) header file.

Platforms will provide their own struct platform_driver, which allocates
struct dw_i3c_master, does any platform-specific probe behaviour, and
calls into the common probe.

A future change will add new platform support that uses this
infrastructure.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - structure for platform implementations as separate platform_drivers,
   to be implemented in separate source files
 - provide default ops rather than null checks

v3:
 - remove ->platform_data to use an encapsulated dw_i3c_master
   for platform implementations instead
---
 drivers/i3c/master/dw-i3c-master.c | 76 +++++++++++++++++-------------
 drivers/i3c/master/dw-i3c-master.h | 54 +++++++++++++++++++++
 2 files changed, 97 insertions(+), 33 deletions(-)
 create mode 100644 drivers/i3c/master/dw-i3c-master.h

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1c146a39e1bd..9fc03108a5db 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -21,6 +21,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "dw-i3c-master.h"
+
 #define DEVICE_CTRL			0x0
 #define DEV_CTRL_ENABLE			BIT(31)
 #define DEV_CTRL_RESUME			BIT(30)
@@ -189,8 +191,6 @@
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
 
-#define MAX_DEVS 32
-
 #define I3C_BUS_SDR1_SCL_RATE		8000000
 #define I3C_BUS_SDR2_SCL_RATE		6000000
 #define I3C_BUS_SDR3_SCL_RATE		4000000
@@ -201,11 +201,6 @@
 
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 
-struct dw_i3c_master_caps {
-	u8 cmdfifodepth;
-	u8 datafifodepth;
-};
-
 struct dw_i3c_cmd {
 	u32 cmd_lo;
 	u32 cmd_hi;
@@ -224,25 +219,6 @@ struct dw_i3c_xfer {
 	struct dw_i3c_cmd cmds[];
 };
 
-struct dw_i3c_master {
-	struct i3c_master_controller base;
-	u16 maxdevs;
-	u16 datstartaddr;
-	u32 free_pos;
-	struct {
-		struct list_head list;
-		struct dw_i3c_xfer *cur;
-		spinlock_t lock;
-	} xferqueue;
-	struct dw_i3c_master_caps caps;
-	void __iomem *regs;
-	struct reset_control *core_rst;
-	struct clk *core_clk;
-	char version[5];
-	char type[5];
-	u8 addrs[MAX_DEVS];
-};
-
 struct dw_i3c_i2c_dev_data {
 	u8 index;
 };
@@ -602,6 +578,10 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	u32 thld_ctrl;
 	int ret;
 
+	ret = master->platform_ops->init(master);
+	if (ret)
+		return ret;
+
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
@@ -1124,14 +1104,23 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
 };
 
-static int dw_i3c_probe(struct platform_device *pdev)
+/* default platform ops implementations */
+static int dw_i3c_platform_init_nop(struct dw_i3c_master *i3c)
+{
+	return 0;
+}
+
+static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
+	.init = dw_i3c_platform_init_nop,
+};
+
+int dw_i3c_common_probe(struct dw_i3c_master *master,
+			struct platform_device *pdev)
 {
-	struct dw_i3c_master *master;
 	int ret, irq;
 
-	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
-	if (!master)
-		return -ENOMEM;
+	if (!master->platform_ops)
+		master->platform_ops = &dw_i3c_platform_ops_default;
 
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
@@ -1192,10 +1181,10 @@ static int dw_i3c_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
 
-static int dw_i3c_remove(struct platform_device *pdev)
+int dw_i3c_common_remove(struct dw_i3c_master *master)
 {
-	struct dw_i3c_master *master = platform_get_drvdata(pdev);
 	int ret;
 
 	ret = i3c_master_unregister(&master->base);
@@ -1208,6 +1197,27 @@ static int dw_i3c_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
+
+/* base platform implementation */
+
+static int dw_i3c_probe(struct platform_device *pdev)
+{
+	struct dw_i3c_master *master;
+
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	return dw_i3c_common_probe(master, pdev);
+}
+
+static int dw_i3c_remove(struct platform_device *pdev)
+{
+	struct dw_i3c_master *master = platform_get_drvdata(pdev);
+
+	return dw_i3c_common_remove(master);
+}
 
 static const struct of_device_id dw_i3c_master_of_match[] = {
 	{ .compatible = "snps,dw-i3c-master-1.00a", },
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
new file mode 100644
index 000000000000..cd376daa28cf
--- /dev/null
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Code Construct
+ *
+ * Author: Jeremy Kerr <jk@codeconstruct.com.au>
+ */
+
+#include <linux/clk.h>
+#include <linux/i3c/master.h>
+#include <linux/reset.h>
+#include <linux/types.h>
+
+#define DW_I3C_MAX_DEVS 32
+
+struct dw_i3c_master_caps {
+	u8 cmdfifodepth;
+	u8 datafifodepth;
+};
+
+struct dw_i3c_master {
+	struct i3c_master_controller base;
+	u16 maxdevs;
+	u16 datstartaddr;
+	u32 free_pos;
+	struct {
+		struct list_head list;
+		struct dw_i3c_xfer *cur;
+		spinlock_t lock;
+	} xferqueue;
+	struct dw_i3c_master_caps caps;
+	void __iomem *regs;
+	struct reset_control *core_rst;
+	struct clk *core_clk;
+	char version[5];
+	char type[5];
+	u8 addrs[DW_I3C_MAX_DEVS];
+
+	/* platform-specific data */
+	const struct dw_i3c_platform_ops *platform_ops;
+};
+
+struct dw_i3c_platform_ops {
+	/*
+	 * Called on early bus init: the i3c has been set up, but before any
+	 * transactions have taken place. Platform implementations may use to
+	 * perform actual device enabling with the i3c core ready.
+	 */
+	int (*init)(struct dw_i3c_master *i3c);
+};
+
+extern int dw_i3c_common_probe(struct dw_i3c_master *master,
+			       struct platform_device *pdev);
+extern int dw_i3c_common_remove(struct dw_i3c_master *master);
+
-- 
2.39.1

