Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9A3F5A29
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 10:50:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv2rB2hrbz2yM0
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Aug 2021 18:50:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv2r36v0gz2yHY
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Aug 2021 18:50:26 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gv2ks6JVDzbh7G;
 Tue, 24 Aug 2021 16:45:57 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 16:49:46 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 24 Aug
 2021 16:49:46 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v2] soc: aspeed-lpc-ctrl: Fix missing
 clk_disable_unprepare() on error in aspeed_lpc_ctrl_probe()
Date: Tue, 24 Aug 2021 16:55:22 +0800
Message-ID: <20210824085522.1849410-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
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
Cc: linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Move syscon_regmap_lookup_by_compatible() above the
devm_clk_get() to avoid missing clk_disable_unprepare().

Fixes: 2f9b25fa6682 ("soc: aspeed: Re-enable FWH2AHB on AST2600")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 6893c5ec3259..72771e018c42 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -295,6 +295,16 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl")) {
+		lpc_ctrl->fwh2ahb = true;
+
+		lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
+		if (IS_ERR(lpc_ctrl->scu)) {
+			dev_err(dev, "couldn't find scu\n");
+			return PTR_ERR(lpc_ctrl->scu);
+		}
+	}
+
 	lpc_ctrl->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(lpc_ctrl->clk)) {
 		dev_err(dev, "couldn't get clock\n");
@@ -306,16 +316,6 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl")) {
-		lpc_ctrl->fwh2ahb = true;
-
-		lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
-		if (IS_ERR(lpc_ctrl->scu)) {
-			dev_err(dev, "couldn't find scu\n");
-			return PTR_ERR(lpc_ctrl->scu);
-		}
-	}
-
 	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_ctrl->miscdev.name = DEVICE_NAME;
 	lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
-- 
2.25.1

