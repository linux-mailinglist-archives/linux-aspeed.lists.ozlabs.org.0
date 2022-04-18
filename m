Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA613504A8D
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Apr 2022 03:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhV3k6Qbvz2yJ9
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Apr 2022 11:39:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=dylan_hung@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhV3f0hRZz2x9T
 for <linux-aspeed@lists.ozlabs.org>; Mon, 18 Apr 2022 11:39:39 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23I1Qh4I071542;
 Mon, 18 Apr 2022 09:26:43 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from DylanHung-PC.aspeed.com (192.168.2.216) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Apr
 2022 09:38:41 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH net-next RESEND v5 2/3] net: mdio: add reset control for
 Aspeed MDIO
Date: Mon, 18 Apr 2022 09:40:58 +0800
Message-ID: <20220418014059.3054-3-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418014059.3054-1-dylan_hung@aspeedtech.com>
References: <20220418014059.3054-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.216]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23I1Qh4I071542
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add reset assertion/deassertion for Aspeed MDIO.  There are 4 MDIO
controllers embedded in Aspeed AST2600 SOC and share one reset control
register SCU50[3].  To work with old DT blobs which don't have the reset
property, devm_reset_control_get_optional_shared is used in this change.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/mdio/mdio-aspeed.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index e2273588c75b..1afb58ccc524 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/reset.h>
 #include <linux/iopoll.h>
 #include <linux/mdio.h>
 #include <linux/module.h>
@@ -37,6 +38,7 @@
 
 struct aspeed_mdio {
 	void __iomem *base;
+	struct reset_control *reset;
 };
 
 static int aspeed_mdio_read(struct mii_bus *bus, int addr, int regnum)
@@ -120,6 +122,12 @@ static int aspeed_mdio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctx->base))
 		return PTR_ERR(ctx->base);
 
+	ctx->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	if (IS_ERR(ctx->reset))
+		return PTR_ERR(ctx->reset);
+
+	reset_control_deassert(ctx->reset);
+
 	bus->name = DRV_NAME;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s%d", pdev->name, pdev->id);
 	bus->parent = &pdev->dev;
@@ -129,6 +137,7 @@ static int aspeed_mdio_probe(struct platform_device *pdev)
 	rc = of_mdiobus_register(bus, pdev->dev.of_node);
 	if (rc) {
 		dev_err(&pdev->dev, "Cannot register MDIO bus!\n");
+		reset_control_assert(ctx->reset);
 		return rc;
 	}
 
@@ -139,7 +148,11 @@ static int aspeed_mdio_probe(struct platform_device *pdev)
 
 static int aspeed_mdio_remove(struct platform_device *pdev)
 {
-	mdiobus_unregister(platform_get_drvdata(pdev));
+	struct mii_bus *bus = (struct mii_bus *)platform_get_drvdata(pdev);
+	struct aspeed_mdio *ctx = bus->priv;
+
+	reset_control_assert(ctx->reset);
+	mdiobus_unregister(bus);
 
 	return 0;
 }
-- 
2.25.1

