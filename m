Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4169924F1
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 08:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMTtn34F8z30gn
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 17:36:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728282959;
	cv=none; b=XxehjBvDddl5R6Y0nPruXDTjsk3+EtUbg2u6u5HBthPZGugcSpJNJZqyHP8TcJcfnEpXbH0vsNHc3iwfRGuphnsijMqS3lhk0ftkx+IQSw7s+F7e+bMloy2wrxrEZHkpchsi1shW4t6JMGMkIHWdloTgGMDIYdOB63VEDDsVzQmh6A5lmMymMjzuaq7IVoCrPidt698jL0AYkmusDRqxjfC+lsfwB3IMVd5P4Gi5MACylhPUvcNd0yttPhjoz11hLS8+aQsNuSuIc0O9o10vWnrPRk7lPJTGhjbv57VMH6qXS/SXRIzHZTTEWPMI9XZ++Tm8zb9FmJf/4nCOFhBTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728282959; c=relaxed/relaxed;
	bh=opsSvw89E1aD4oa1u8W01BfXOchcRfN3Jn3+5GK659I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k5mgJItSYzRtNRUWfaMHjbofHB4M4QGW4w3wGkmAjXMVGmD8xHv1FiYtrXFT3FGtxbBV7fY/k1VVPZHDNwoimutUZAss0QMWlAVCiusCsyRjBWEM9KcQzbb7Rt0hKI6GMut5xczRPzPQ/HUQ8NNYSzGuUeyArpQi17pbgnE4t/E2j/Gy55eKrFh1qcgqfDqHnjB7o685qZlUtd0ili9Wr9q4O+ssiiH0mw+j/d6ZFc4sjK0dY6GSwKyFpVWAz5qz31ZhqtovbJDhUH6QqGiYTUdMmRv4nvMfWCu4D4TTuOlCKDWowGu+IP/83n3UjIpoIznXb/CFx+t8SCWA82F0Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMTtk4DjMz2yY1
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2024 17:35:58 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 14:34:08 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] watchdog: aspeed: Update bootstatus handling
Date: Mon, 7 Oct 2024 14:34:07 +0800
Message-ID: <20241007063408.2360874-4-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com, Bonnie_Lo@wiwynn.com, Patrick_NC_Lin@wiwynn.com, DELPHINE_CHIU@wiwynn.com, Peter.Yin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update the bootstatus according to the latest design guide
from the OpenBMC shown as below.
https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-update.md#proposed-design

In short,
- WDIOF_EXTERN1   => system is reset by Software
- WDIOF_CARDRESET => system is reset by WDT
- Others          => other reset events, e.g., power on reset.

On AST2400 platform, only a bit, SCU3C[1], represents that the
system is reset by WDT1 or WDT2.

On AST2500 platform, SCU3C[4:2] are WDT reset flags.
  SCU3C[4]: system is reset by WDT3.
  SCU3C[3]: system is reset by WDT2.
  SCU3C[2]: system is reset by WDT1.

On AST2600 platform, SCU074[31:16] are WDT reset flags.
  SCU074[31:28]: system is reset by WDT4
    SCU074[31]: system is reset by WDT4 software reset.
  SCU074[27:24]: system is reset by WDT3
    SCU074[27]: system is reset by WDT3 software reset.
  SCU074[23:20]: system is reset by WDT2
    SCU074[23]: system is reset by WDT2 software reset.
  SCU074[19:16]: system is reset by WDT1
    SCU074[19]: system is reset by WDT1 software reset.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 109 +++++++++++++++++++++++++++++++---
 1 file changed, 101 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..68eaada8a564 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -11,10 +11,12 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/kstrtox.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/watchdog.h>
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -22,15 +24,41 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+
+/* AST SCU Register for System Reset Event Log Register Set
+ * ast2600 is scu074 ast2400/2500 is scu03c
+ */
+#define AST2400_SCU_SYS_RESET_STATUS	0x3c
+#define   AST2400_SCU_SYS_RESET_WDT_MASK	0x1
+#define   AST2400_SCU_SYS_RESET_WDT_MASK_SHIFT	1
+
+#define   AST2500_SCU_SYS_RESET_WDT_MASK	0x1
+#define   AST2500_SCU_SYS_RESET_WDT_MASK_SHIFT	2
+
+#define AST2600_SCU_SYS_RESET_STATUS	0x74
+#define   AST2600_SCU_SYS_RESET_WDT_MASK	0xf
+#define   AST2600_SCU_SYS_RESET_WDT_SW_MASK	0x8
+#define   AST2600_SCU_SYS_RESET_WDT_MASK_SHIFT	16
+
+struct aspeed_wdt_scu {
+	const char *compatible;
+	u32 reset_status_reg;
+	u32 wdt_reset_mask;
+	u32 wdt_sw_reset_mask;
+	u32 wdt_reset_mask_shift;
+};
+
 struct aspeed_wdt_config {
 	u32 ext_pulse_width_mask;
 	u32 irq_shift;
 	u32 irq_mask;
+	struct aspeed_wdt_scu scu;
 };
 
 struct aspeed_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*base;
+	int			idx;
 	u32			ctrl;
 	const struct aspeed_wdt_config *cfg;
 };
@@ -39,18 +67,39 @@ static const struct aspeed_wdt_config ast2400_config = {
 	.ext_pulse_width_mask = 0xff,
 	.irq_shift = 0,
 	.irq_mask = 0,
+	.scu = {
+		.compatible = "aspeed,ast2400-scu",
+		.reset_status_reg = AST2400_SCU_SYS_RESET_STATUS,
+		.wdt_reset_mask = AST2400_SCU_SYS_RESET_WDT_MASK,
+		.wdt_sw_reset_mask = 0,
+		.wdt_reset_mask_shift = AST2400_SCU_SYS_RESET_WDT_MASK_SHIFT,
+	},
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
+	.scu = {
+		.compatible = "aspeed,ast2500-scu",
+		.reset_status_reg = AST2400_SCU_SYS_RESET_STATUS,
+		.wdt_reset_mask = AST2500_SCU_SYS_RESET_WDT_MASK,
+		.wdt_sw_reset_mask = 0,
+		.wdt_reset_mask_shift = AST2500_SCU_SYS_RESET_WDT_MASK_SHIFT,
+	},
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
+	.scu = {
+		.compatible = "aspeed,ast2600-scu",
+		.reset_status_reg = AST2600_SCU_SYS_RESET_STATUS,
+		.wdt_reset_mask = AST2600_SCU_SYS_RESET_WDT_MASK,
+		.wdt_sw_reset_mask = AST2600_SCU_SYS_RESET_WDT_SW_MASK,
+		.wdt_reset_mask_shift = AST2600_SCU_SYS_RESET_WDT_MASK_SHIFT,
+	},
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -213,6 +262,52 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int aspeed_wdt_get_bootstatus(struct device *dev,
+				     struct aspeed_wdt *wdt)
+{
+	struct device_node *np = dev->of_node;
+	struct aspeed_wdt_scu scu = wdt->cfg->scu;
+	struct regmap *scu_base;
+	u32 reset_mask_width;
+	u32 reset_mask_shift;
+	u32 status;
+	int ret;
+
+	wdt->idx = of_alias_get_id(np, "watchdog");
+	if (wdt->idx < 0)
+		wdt->idx = 0;
+
+	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
+	if (IS_ERR(scu_base))
+		return PTR_ERR(scu_base);
+
+	ret = regmap_read(scu_base, scu.reset_status_reg, &status);
+	if (ret)
+		return ret;
+
+	/* On AST2400, only a bit used to represent WDT reset */
+	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
+		wdt->idx = 0;
+
+	reset_mask_width = hweight32(scu.wdt_reset_mask);
+	reset_mask_shift = scu.wdt_reset_mask_shift +
+			   reset_mask_width * wdt->idx;
+
+	if (status & (scu.wdt_sw_reset_mask << reset_mask_shift))
+		wdt->wdd.bootstatus = WDIOF_EXTERN1;
+	else if (status & (scu.wdt_reset_mask << reset_mask_shift))
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	else
+		wdt->wdd.bootstatus = WDIOF_UNKNOWN;
+
+	ret = regmap_write(scu_base, scu.reset_status_reg,
+			   scu.wdt_reset_mask << reset_mask_shift);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /* access_cs0 shows if cs0 is accessible, hence the reverted bit */
 static ssize_t access_cs0_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -312,7 +407,6 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	struct device_node *np;
 	const char *reset_type;
 	u32 duration;
-	u32 status;
 	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
@@ -458,14 +552,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
-	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = aspeed_wdt_get_bootstatus(dev, wdt);
+	if (ret)
+		return ret;
 
-		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
-		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-			wdt->wdd.groups = bswitch_groups;
-	}
+	if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
+	    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
+		wdt->wdd.groups = bswitch_groups;
 
 	dev_set_drvdata(dev, wdt);
 
-- 
2.34.1

