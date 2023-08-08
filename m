Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB73773B2D
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 17:45:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKyDw5S6Yz30NP
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 01:45:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx03.aspeed.com; envelope-from=dylan_hung@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX03.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKyDh2TZrz2yw4
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 01:44:52 +1000 (AEST)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Aug
 2023 23:42:45 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Aug 2023 23:42:45 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<p.zabel@pengutronix.de>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] i3c: ast2600: Add reset deassertion for global registers
Date: Tue, 8 Aug 2023 23:42:41 +0800
Message-ID: <20230808154241.749641-4-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add missing reset deassertion of the I3C global control registers.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 drivers/i3c/master/ast2600-i3c-master.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index 09ed19d489e9..5d9d060134e0 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 
 #include "dw-i3c-master.h"
 
@@ -128,6 +129,7 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct of_phandle_args gspec;
 	struct ast2600_i3c *i3c;
+	struct reset_control *rst;
 	int rc;
 
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
@@ -156,6 +158,13 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "invalid sda-pullup value %d\n",
 			i3c->sda_pullup);
 
+	rst = devm_reset_control_get_shared(&pdev->dev, "global_rst");
+	if (IS_ERR(rst)) {
+		dev_err(&pdev->dev, "missing of invalid reset entry");
+		return PTR_ERR(rst);
+	}
+	reset_control_deassert(rst);
+
 	i3c->dw.platform_ops = &ast2600_i3c_ops;
 	i3c->dw.ibi_capable = true;
 	return dw_i3c_common_probe(&i3c->dw, pdev);
-- 
2.25.1

