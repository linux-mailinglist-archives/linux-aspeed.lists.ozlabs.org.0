Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1CA6D1BB5
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 11:15:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnvlS0X5sz3fSc
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 20:15:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=M29Uvf7F;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=M29Uvf7F;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pnvl81KFDz3cB1
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 20:15:15 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 0A50B20411; Fri, 31 Mar 2023 17:15:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680254115;
	bh=Isit+42hJAL9l6M+xBH0lc98NTVjBMcOTLmr8l/AXNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M29Uvf7Fm0GACasovv4IFVNJvqyyqVwjE5iiwczLMWWR5h6eO4pGg1joMSZ1O0n3K
	 lTT1MUTs7/QerdhIL1/Lqo8eER+P51W3PrC4xHoamvQfMgK9S1GQBNFvUxpQT2mbqm
	 H8BtPnbehsi+7qLXPSTLsx+EPrVFSX8oDeGkFUnoVeiF4nIdoB4uqQ8u0Njx32tSYI
	 tEUx1KtZnBdx6e9vn5Pb9MZocbNautj36W7ZqYkOsfPyDVK7CA8fe00C+5zxTF3Uzs
	 qlG9kWKYfDVOi1CVcMbthTDh+3DxAARdUXbo85qeK17HA+28WU9adPK4tIDphGW5mA
	 bpX+4WZ1hGm1A==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v3 3/3] i3c: ast2600: Add AST2600 platform-specific driver
Date: Fri, 31 Mar 2023 17:15:01 +0800
Message-Id: <20230331091501.3800299-4-jk@codeconstruct.com.au>
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

Now that we have platform-specific infrastructure for the dw i3c driver,
add platform support for the ASPEED AST2600 SoC.

The AST2600 has a small set of "i3c global" registers, providing
platform-level i3c configuration outside of the i3c core.

For the ast2600, we need a couple of extra setup operations:

 - on probe: find the i3c global register set and parse the SDA pullup
   resistor values

 - on init: set the pullups accordingly, and set the i3c instance IDs

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - use new dw platform infrastructure
v3:
 - switch to embedded struct for platform data
 - drop of_match_ptr()
---
 MAINTAINERS                             |   6 +
 drivers/i3c/master/Kconfig              |  14 ++
 drivers/i3c/master/Makefile             |   1 +
 drivers/i3c/master/ast2600-i3c-master.c | 168 ++++++++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 drivers/i3c/master/ast2600-i3c-master.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd8ebc25afcf..ecadd5ccf771 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9714,6 +9714,12 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
 F:	drivers/i3c/master/dw*
 
+I3C DRIVER FOR ASPEED AST2600
+M:	Jeremy Kerr <jk@codeconstruct.com.au>
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
+F:	drivers/i3c/master/ast2600-i3c-master.c
+
 I3C SUBSYSTEM
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 3b8f95916f46..90dee3ec5520 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -22,6 +22,20 @@ config DW_I3C_MASTER
 	  This driver can also be built as a module.  If so, the module
 	  will be called dw-i3c-master.
 
+config AST2600_I3C_MASTER
+	tristate "ASPEED AST2600 I3C master driver"
+	depends on DW_I3C_MASTER
+	depends on ARCH_ASPEED || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Support for ASPEED AST2600 I3C Controller.
+
+	  This hardware is an instance of the DW I3C controller; this
+	  driver adds platform- specific support for AST2600 hardware.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called ast2600-i3c-master.
+
 config SVC_I3C_MASTER
 	tristate "Silvaco I3C Dual-Role Master driver"
 	depends on I3C
diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index b3fee0f690b2..3e97960160bc 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
 obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
+obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
 obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
 obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
new file mode 100644
index 000000000000..d265669c04f1
--- /dev/null
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Code Construct
+ *
+ * Author: Jeremy Kerr <jk@codeconstruct.com.au>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "dw-i3c-master.h"
+
+/* AST2600-specific global register set */
+#define AST2600_I3CG_REG0(idx)	(((idx) * 4 * 4) + 0x10)
+#define AST2600_I3CG_REG1(idx)	(((idx) * 4 * 4) + 0x14)
+
+#define AST2600_I3CG_REG0_SDA_PULLUP_EN_MASK	GENMASK(29, 28)
+#define AST2600_I3CG_REG0_SDA_PULLUP_EN_2K	(0x0 << 28)
+#define AST2600_I3CG_REG0_SDA_PULLUP_EN_750	(0x2 << 28)
+
+#define AST2600_I3CG_REG1_I2C_MODE		BIT(0)
+#define AST2600_I3CG_REG1_TEST_MODE		BIT(1)
+#define AST2600_I3CG_REG1_ACT_MODE_MASK		GENMASK(3, 2)
+#define AST2600_I3CG_REG1_ACT_MODE(x)		(((x) << 2) & AST2600_I3CG_REG1_ACT_MODE_MASK)
+#define AST2600_I3CG_REG1_PENDING_INT_MASK	GENMASK(7, 4)
+#define AST2600_I3CG_REG1_PENDING_INT(x)	(((x) << 4) & AST2600_I3CG_REG1_PENDING_INT_MASK)
+#define AST2600_I3CG_REG1_SA_MASK		GENMASK(14, 8)
+#define AST2600_I3CG_REG1_SA(x)			(((x) << 8) & AST2600_I3CG_REG1_SA_MASK)
+#define AST2600_I3CG_REG1_SA_EN			BIT(15)
+#define AST2600_I3CG_REG1_INST_ID_MASK		GENMASK(19, 16)
+#define AST2600_I3CG_REG1_INST_ID(x)		(((x) << 16) & AST2600_I3CG_REG1_INST_ID_MASK)
+
+#define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
+
+struct ast2600_i3c {
+	struct dw_i3c_master dw;
+	struct regmap *global_regs;
+	unsigned int global_idx;
+	unsigned int sda_pullup;
+};
+
+static struct ast2600_i3c *to_ast2600_i3c(struct dw_i3c_master *dw)
+{
+	return container_of(dw, struct ast2600_i3c, dw);
+}
+
+static int ast2600_i3c_pullup_to_reg(unsigned int ohms, u32 *regp)
+{
+	u32 reg;
+
+	switch (ohms) {
+	case 2000:
+		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K;
+		break;
+	case 750:
+		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
+		break;
+	case 545:
+		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K |
+			AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (regp)
+		*regp = reg;
+
+	return 0;
+}
+
+static int ast2600_i3c_init(struct dw_i3c_master *dw)
+{
+	struct ast2600_i3c *i3c = to_ast2600_i3c(dw);
+	u32 reg = 0;
+	int rc;
+
+	/* reg0: set SDA pullup values */
+	rc = ast2600_i3c_pullup_to_reg(i3c->sda_pullup, &reg);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(i3c->global_regs,
+			  AST2600_I3CG_REG0(i3c->global_idx), reg);
+	if (rc)
+		return rc;
+
+	/* reg1: set up the instance id, but leave everything else disabled,
+	 * as it's all for client mode
+	 */
+	reg = AST2600_I3CG_REG1_INST_ID(i3c->global_idx);
+	rc = regmap_write(i3c->global_regs,
+			  AST2600_I3CG_REG1(i3c->global_idx), reg);
+
+	return rc;
+}
+
+const struct dw_i3c_platform_ops ast2600_i3c_ops = {
+	.init = ast2600_i3c_init,
+};
+
+static int ast2600_i3c_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args gspec;
+	struct ast2600_i3c *i3c;
+	int rc;
+
+	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
+	if (!i3c)
+		return -ENOMEM;
+
+	rc = of_parse_phandle_with_fixed_args(np, "aspeed,global-regs", 1, 0,
+					      &gspec);
+	if (rc)
+		return -ENODEV;
+
+	i3c->global_regs = syscon_node_to_regmap(gspec.np);
+	of_node_put(gspec.np);
+
+	if (IS_ERR(i3c->global_regs))
+		return PTR_ERR(i3c->global_regs);
+
+	i3c->global_idx = gspec.args[0];
+
+	rc = of_property_read_u32(np, "sda-pullup-ohms", &i3c->sda_pullup);
+	if (rc)
+		i3c->sda_pullup = AST2600_DEFAULT_SDA_PULLUP_OHMS;
+
+	rc = ast2600_i3c_pullup_to_reg(i3c->sda_pullup, NULL);
+	if (rc)
+		dev_err(&pdev->dev, "invalid sda-pullup value %d\n",
+			i3c->sda_pullup);
+
+	i3c->dw.platform_ops = &ast2600_i3c_ops;
+	return dw_i3c_common_probe(&i3c->dw, pdev);
+}
+
+static int ast2600_i3c_remove(struct platform_device *pdev)
+{
+	struct dw_i3c_master *dw_i3c = platform_get_drvdata(pdev);
+
+	return dw_i3c_common_remove(dw_i3c);
+}
+
+static const struct of_device_id ast2600_i3c_master_of_match[] = {
+	{ .compatible = "aspeed,ast2600-i3c", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ast2600_i3c_master_of_match);
+
+static struct platform_driver ast2600_i3c_driver = {
+	.probe = ast2600_i3c_probe,
+	.remove = ast2600_i3c_remove,
+	.driver = {
+		.name = "ast2600-i3c-master",
+		.of_match_table = ast2600_i3c_master_of_match,
+	},
+};
+module_platform_driver(ast2600_i3c_driver);
+
+MODULE_AUTHOR("Jeremy Kerr <jk@codeconstruct.com.au>");
+MODULE_DESCRIPTION("ASPEED AST2600 I3C driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1

