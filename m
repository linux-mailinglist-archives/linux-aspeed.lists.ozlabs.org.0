Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 971E17842D
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 06:39:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xn6D0q98zDqM6
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 14:39:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="e6wIKe97"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="adjBjvtK"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xn5y6lmkzDqHh
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 14:39:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6F2D0240B;
 Mon, 29 Jul 2019 00:39:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Jul 2019 00:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UMXxyODXl2c9Y
 2ZmCVe7Q/jHKw7+ynzdFhck94voN10=; b=e6wIKe97schFrs71FUGeJC6zNeZGU
 Ry6QC92YnPoho1Z+qtBuO9jqhVJeUCohnX6M5FWR92p5JKsCs2bs76uv2vzbGiKH
 n1jf1OoAAcXtajQh5d+8S8OEBOPNHsumKv4iGCe+6NHotIXkGniVR+o1MVNzcnTL
 ZE9sdXF/BAsxh1HjU9l+xSXkZkm9/ALUAF2+8u5Mn3lf+R25IBX3tKdMucLWlj1L
 baOA+tRBKytJLk3wcaSpXJKQvQzbQ5bYtC7acgC4KzxqnpjD4UNZzrdMBtsGOu1s
 V9ij5DEjBHCQox5iPiEwqbVzNT8Q5rZWtxP7N1sUTAbLz9qdK2N22YnQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UMXxyODXl2c9Y2ZmCVe7Q/jHKw7+ynzdFhck94voN10=; b=adjBjvtK
 NHKMAop+vPGq6L+nHqtXI48HNc01TXpjUOeIxQOE84O4el0+zi2vc0SWjwVGLRWL
 5SuKuSyomipkLmk0FEjZEhWKi5js7gIG49XRiRFje0aoAKMG8Fc5/MOeXn20W82T
 rQwTv+FmIEK54paSB6Q0kVE8OvVy8RsCLOq1fdp4fZE5wozbQR4pzal9wa0tMSEU
 gRxi9CySVG4EuUhNAtIrS6mBFovIkUZ55PKs342aVr5PYxDz7PksIUcBwyPr3ZO4
 bhu008yrmgPSa7F9lbf/qBU6Hx5jskGYdjYsQ2K9lwtTlwwK+s/o6huPhfnQG74Y
 RZDtY8ooG62klg==
X-ME-Sender: <xms:hHg-XXv7OcjGdX6mzz8bAQY_qEH3_Z9Ni96A2LHKrjSnw9nyqG5aGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:hHg-XcuKKXndNvFPV4Kg6znE0RFczbKPyEFpxW_kOGL5vsBlf-__3g>
 <xmx:hHg-XVxnMah_lcl7BeAeQ2-4pH6AUwEX79rkUEhk2gDpUOY8-ytTOQ>
 <xmx:hHg-XaiztB8JEeWknqReO9RJKbPrkTz9wlnyMS0oZC2EqwAafwSqNw>
 <xmx:hHg-XepZ_hwvde5gVbIMCgPI8FFk3n2YEtkxzaWcIPaAtPs4onf6Yw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D7AA80060;
 Mon, 29 Jul 2019 00:39:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH 2/4] net: phy: Add mdio-aspeed
Date: Mon, 29 Jul 2019 14:09:24 +0930
Message-Id: <20190729043926.32679-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729043926.32679-1-andrew@aj.id.au>
References: <20190729043926.32679-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 design separates the MDIO controllers from the MAC, which is
where they were placed in the AST2400 and AST2500. Further, the register
interface is reworked again, so now we have three possible different
interface implementations, however this driver only supports the
interface provided by the AST2600. The AST2400 and AST2500 will continue
to be supported by the MDIO support embedded in the FTGMAC100 driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/net/phy/Kconfig       |  13 +++
 drivers/net/phy/Makefile      |   1 +
 drivers/net/phy/mdio-aspeed.c | 159 ++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/net/phy/mdio-aspeed.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 20f14c5fbb7e..206d8650ee7f 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -21,6 +21,19 @@ config MDIO_BUS
 
 if MDIO_BUS
 
+config MDIO_ASPEED
+	tristate "ASPEED MDIO bus controller"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on OF_MDIO && HAS_IOMEM
+	help
+	  This module provides a driver for the independent MDIO bus
+	  controllers found in the ASPEED AST2600 SoC. This is a driver for the
+	  third revision of the ASPEED MDIO register interface - the first two
+	  revisions are the "old" and "new" interfaces found in the AST2400 and
+	  AST2500, embedded in the MAC. For legacy reasons, FTGMAC100 driver
+	  continues to drive the embedded MDIO controller for the AST2400 and
+	  AST2500 SoCs, so say N if AST2600 support is not required.
+
 config MDIO_BCM_IPROC
 	tristate "Broadcom iProc MDIO bus controller"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 839acb292c38..ba07c27e4208 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -22,6 +22,7 @@ libphy-$(CONFIG_LED_TRIGGER_PHY)	+= phy_led_triggers.o
 obj-$(CONFIG_PHYLINK)		+= phylink.o
 obj-$(CONFIG_PHYLIB)		+= libphy.o
 
+obj-$(CONFIG_MDIO_ASPEED)	+= mdio-aspeed.o
 obj-$(CONFIG_MDIO_BCM_IPROC)	+= mdio-bcm-iproc.o
 obj-$(CONFIG_MDIO_BCM_UNIMAC)	+= mdio-bcm-unimac.o
 obj-$(CONFIG_MDIO_BITBANG)	+= mdio-bitbang.o
diff --git a/drivers/net/phy/mdio-aspeed.c b/drivers/net/phy/mdio-aspeed.c
new file mode 100644
index 000000000000..71496a9ff54a
--- /dev/null
+++ b/drivers/net/phy/mdio-aspeed.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (C) 2019 IBM Corp. */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#define DRV_NAME "mdio-aspeed"
+
+#define ASPEED_MDIO_CTRL		0x0
+#define   ASPEED_MDIO_CTRL_FIRE		BIT(31)
+#define   ASPEED_MDIO_CTRL_ST		BIT(28)
+#define     ASPEED_MDIO_CTRL_ST_C45	0
+#define     ASPEED_MDIO_CTRL_ST_C22	1
+#define   ASPEED_MDIO_CTRL_OP		GENMASK(27, 26)
+#define     MDIO_C22_OP_WRITE		0b01
+#define     MDIO_C22_OP_READ		0b10
+#define   ASPEED_MDIO_CTRL_PHYAD	GENMASK(25, 21)
+#define   ASPEED_MDIO_CTRL_REGAD	GENMASK(20, 16)
+#define   ASPEED_MDIO_CTRL_MIIWDATA	GENMASK(15, 0)
+
+#define ASPEED_MDIO_DATA		0x4
+#define   ASPEED_MDIO_DATA_MDC_THRES	GENMASK(31, 24)
+#define   ASPEED_MDIO_DATA_MDIO_EDGE	BIT(23)
+#define   ASPEED_MDIO_DATA_MDIO_LATCH	GENMASK(22, 20)
+#define   ASPEED_MDIO_DATA_IDLE		BIT(16)
+#define   ASPEED_MDIO_DATA_MIIRDATA	GENMASK(15, 0)
+
+#define ASPEED_MDIO_RETRIES		10
+
+struct aspeed_mdio {
+	void __iomem *base;
+};
+
+static int aspeed_mdio_read(struct mii_bus *bus, int addr, int regnum)
+{
+	struct aspeed_mdio *ctx = bus->priv;
+	u32 ctrl;
+	int i;
+
+	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d\n", __func__, addr,
+		regnum);
+
+	/* Just clause 22 for the moment */
+	ctrl = ASPEED_MDIO_CTRL_FIRE
+		| FIELD_PREP(ASPEED_MDIO_CTRL_ST, ASPEED_MDIO_CTRL_ST_C22)
+		| FIELD_PREP(ASPEED_MDIO_CTRL_OP, MDIO_C22_OP_READ)
+		| FIELD_PREP(ASPEED_MDIO_CTRL_PHYAD, addr)
+		| FIELD_PREP(ASPEED_MDIO_CTRL_REGAD, regnum);
+
+	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
+
+	for (i = 0; i < ASPEED_MDIO_RETRIES; i++) {
+		u32 data;
+
+		data = ioread32(ctx->base + ASPEED_MDIO_DATA);
+		if (data & ASPEED_MDIO_DATA_IDLE)
+			return FIELD_GET(ASPEED_MDIO_DATA_MIIRDATA, data);
+
+		udelay(100);
+	}
+
+	dev_err(&bus->dev, "MDIO read failed\n");
+	return -EIO;
+}
+
+static int aspeed_mdio_write(struct mii_bus *bus, int addr, int regnum, u16 val)
+{
+	struct aspeed_mdio *ctx = bus->priv;
+	u32 ctrl;
+	int i;
+
+	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d, val: 0x%x\n",
+		__func__, addr, regnum, val);
+
+	/* Just clause 22 for the moment */
+	ctrl = ASPEED_MDIO_CTRL_FIRE
+		| FIELD_PREP(ASPEED_MDIO_CTRL_ST, ASPEED_MDIO_CTRL_ST_C22)
+		| FIELD_PREP(ASPEED_MDIO_CTRL_OP, MDIO_C22_OP_WRITE)
+		| FIELD_PREP(ASPEED_MDIO_CTRL_PHYAD, addr)
+		| FIELD_PREP(ASPEED_MDIO_CTRL_REGAD, regnum)
+		| FIELD_PREP(ASPEED_MDIO_CTRL_MIIWDATA, val);
+
+	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
+
+	for (i = 0; i < ASPEED_MDIO_RETRIES; i++) {
+		ctrl = ioread32(ctx->base + ASPEED_MDIO_CTRL);
+		if (!(ctrl & ASPEED_MDIO_CTRL_FIRE))
+			return 0;
+
+		udelay(100);
+	}
+
+	dev_err(&bus->dev, "MDIO write failed\n");
+	return -EIO;
+}
+
+static int aspeed_mdio_probe(struct platform_device *pdev)
+{
+	struct aspeed_mdio *ctx;
+	struct mii_bus *bus;
+	int rc;
+
+	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(*ctx));
+	if (!bus)
+		return -ENOMEM;
+
+	ctx = bus->priv;
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctx->base))
+		return PTR_ERR(ctx->base);
+
+	bus->name = DRV_NAME;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s%d", pdev->name, pdev->id);
+	bus->parent = &pdev->dev;
+	bus->read = aspeed_mdio_read;
+	bus->write = aspeed_mdio_write;
+
+	rc = of_mdiobus_register(bus, pdev->dev.of_node);
+	if (rc) {
+		dev_err(&pdev->dev, "Cannot register MDIO bus!\n");
+		return rc;
+	}
+
+	platform_set_drvdata(pdev, bus);
+
+	return 0;
+}
+
+static int aspeed_mdio_remove(struct platform_device *pdev)
+{
+	mdiobus_unregister(platform_get_drvdata(pdev));
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_mdio_of_match[] = {
+	{ .compatible = "aspeed,ast2600-mdio", },
+	{ },
+};
+
+static struct platform_driver aspeed_mdio_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = aspeed_mdio_of_match,
+	},
+	.probe = aspeed_mdio_probe,
+	.remove = aspeed_mdio_remove,
+};
+
+module_platform_driver(aspeed_mdio_driver);
+
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_LICENSE("GPL");
-- 
2.20.1

