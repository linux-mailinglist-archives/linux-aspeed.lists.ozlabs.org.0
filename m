Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F2F2D0C84
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 10:02:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqHQ70mBVzDqWS
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 20:02:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqHPZ2Dy3zDqDT
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Dec 2020 20:02:09 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0B78vaST096566;
 Mon, 7 Dec 2020 16:57:36 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Dec 2020 17:00:24 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "Borislav
 Petkov" <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:EDAC-CORE"
 <linux-edac@vger.kernel.org>
Subject: [PATCH v4 3/3] edac: Supporting AST2400 and AST2600 edac driver
Date: Mon, 7 Dec 2020 17:00:13 +0800
Message-ID: <20201207090013.14145-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207090013.14145-1-troy_lee@aspeedtech.com>
References: <20201207090013.14145-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0B78vaST096566
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
 drivers/edac/Kconfig       | 6 +++---
 drivers/edac/aspeed_edac.c | 7 +++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 7a47680d6f07..c410331e8ee8 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -515,10 +515,10 @@ config EDAC_QCOM
 	  health, you should probably say 'Y' here.
 
 config EDAC_ASPEED
-	tristate "Aspeed AST 2500 SoC"
-	depends on MACH_ASPEED_G5
+	tristate "Aspeed AST BMC SoC"
+	depends on ARCH_ASPEED
 	help
-	  Support for error detection and correction on the Aspeed AST 2500 SoC.
+	  Support for error detection and correction on the Aspeed AST BMC SoC.
 
 	  First, ECC must be configured in the bootloader. Then, this driver
 	  will expose error counters via the EDAC kernel framework.
diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index fde809efc520..a46da56d6d54 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -239,7 +239,7 @@ static int init_csrows(struct mem_ctl_info *mci)
 	int rc;
 
 	/* retrieve info about physical memory from device tree */
-	np = of_find_node_by_path("/memory");
+	np = of_find_node_by_name(NULL, "memory");
 	if (!np) {
 		dev_err(mci->pdev, "dt: missing /memory node\n");
 		return -ENODEV;
@@ -375,10 +375,13 @@ static int aspeed_remove(struct platform_device *pdev)
 
 
 static const struct of_device_id aspeed_of_match[] = {
+	{ .compatible = "aspeed,ast2400-sdram-edac" },
 	{ .compatible = "aspeed,ast2500-sdram-edac" },
+	{ .compatible = "aspeed,ast2600-sdram-edac" },
 	{},
 };
 
+MODULE_DEVICE_TABLE(of, aspeed_of_match);
 
 static struct platform_driver aspeed_driver = {
 	.driver		= {
@@ -392,5 +395,5 @@ module_platform_driver(aspeed_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Stefan Schaeckeler <sschaeck@cisco.com>");
-MODULE_DESCRIPTION("Aspeed AST2500 EDAC driver");
+MODULE_DESCRIPTION("Aspeed BMC SoC EDAC driver");
 MODULE_VERSION("1.0");
-- 
2.17.1

