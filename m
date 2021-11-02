Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F7443736
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 21:21:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkLrr39xgz2yb7
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 07:21:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkLrf292kz2xsf
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 07:21:06 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218552908"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="218552908"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 13:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="500738814"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2021 13:17:48 -0700
From: jae.hyun.yoo@intel.com
To: Rob Herring <robh+dt@kernel.org>, Corey Minyard <minyard@acm.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Cedric Le Goater <clg@kaod.org>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next v2 3/6] ipmi: bt: add clock control logic
Date: Tue,  2 Nov 2021 13:37:14 -0700
Message-Id: <20211102203717.96794-4-jae.hyun.yoo@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

If LPC BT driver is registered ahead of lpc-ctrl module, LPC BT
hardware block will be enabled without heart beating of LCLK until
lpc-ctrl enables the LCLK. This issue causes improper handling on
host interrupts when the host sends interrupts in that time frame.
Then kernel eventually forcibly disables the interrupt with
dumping stack and printing a 'nobody cared this irq' message out.

To prevent this issue, all LPC sub drivers should enable LCLK
individually so this patch adds clock control logic into the LPC
BT driver.

Fixes: 54f9c4d0778b ("ipmi: add an Aspeed BT IPMI BMC driver")
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
v1 -> v2:
 - No change.

 drivers/char/ipmi/bt-bmc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 7450904e330a..a20f92cc7b18 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -5,6 +5,7 @@
 
 #include <linux/atomic.h>
 #include <linux/bt-bmc.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -62,6 +63,7 @@ struct bt_bmc {
 	wait_queue_head_t	queue;
 	struct timer_list	poll_timer;
 	struct mutex		mutex;
+	struct clk		*clk;
 };
 
 static atomic_t open_count = ATOMIC_INIT(0);
@@ -423,6 +425,19 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	if (IS_ERR(bt_bmc->base))
 		return PTR_ERR(bt_bmc->base);
 
+	bt_bmc->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(bt_bmc->clk)) {
+		rc = PTR_ERR(bt_bmc->clk);
+		if (rc != -EPROBE_DEFER)
+			dev_err(dev, "Unable to get clock\n");
+		return rc;
+	}
+	rc = clk_prepare_enable(bt_bmc->clk);
+	if (rc) {
+		dev_err(dev, "Unable to enable clock\n");
+		return rc;
+	}
+
 	mutex_init(&bt_bmc->mutex);
 	init_waitqueue_head(&bt_bmc->queue);
 
@@ -433,7 +448,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	rc = misc_register(&bt_bmc->miscdev);
 	if (rc) {
 		dev_err(dev, "Unable to register misc device\n");
-		return rc;
+		goto err;
 	}
 
 	bt_bmc_config_irq(bt_bmc, pdev);
@@ -457,6 +472,11 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	clr_b_busy(bt_bmc);
 
 	return 0;
+
+err:
+	clk_disable_unprepare(bt_bmc->clk);
+
+	return rc;
 }
 
 static int bt_bmc_remove(struct platform_device *pdev)
@@ -466,6 +486,8 @@ static int bt_bmc_remove(struct platform_device *pdev)
 	misc_deregister(&bt_bmc->miscdev);
 	if (bt_bmc->irq < 0)
 		del_timer_sync(&bt_bmc->poll_timer);
+	clk_disable_unprepare(bt_bmc->clk);
+
 	return 0;
 }
 
-- 
2.25.1

