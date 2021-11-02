Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5844373A
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 21:21:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkLrx6QFvz2yNY
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 07:21:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkLrg6wK7z2xsj
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 07:21:07 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218552913"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="218552913"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 13:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="500738821"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2021 13:17:48 -0700
From: jae.hyun.yoo@intel.com
To: Rob Herring <robh+dt@kernel.org>, Corey Minyard <minyard@acm.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Cedric Le Goater <clg@kaod.org>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next v2 6/6] ipmi: kcs_bmc_aspeed: add clock control logic
Date: Tue,  2 Nov 2021 13:37:17 -0700
Message-Id: <20211102203717.96794-7-jae.hyun.yoo@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
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
Cc: devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

If LPC KCS driver is registered ahead of lpc-ctrl module, LPC
KCS block will be enabled without heart beating of LCLK until
lpc-ctrl enables the LCLK. This issue causes improper handling on
host interrupts when the host sends interrupts in that time frame.
Then kernel eventually forcibly disables the interrupt with
dumping stack and printing a 'nobody cared this irq' message out.

To prevent this issue, all LPC sub drivers should enable LCLK
individually so this patch adds clock control logic into the LPC
KCS driver.

Fixes: be2ed207e374 ("ipmi: add an Aspeed KCS IPMI BMC driver")
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
v1 -> v2:
 - No change.

 drivers/char/ipmi/kcs_bmc_aspeed.c | 31 ++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 92a37b33494c..00706472cc4d 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) "aspeed-kcs-bmc: " fmt
 
 #include <linux/atomic.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -126,6 +127,8 @@ struct aspeed_kcs_bmc {
 		bool remove;
 		struct timer_list timer;
 	} obe;
+
+	struct clk *clk;
 };
 
 struct aspeed_kcs_of_ops {
@@ -620,24 +623,37 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		rc = PTR_ERR(priv->clk);
+		if (rc != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Couldn't get clock\n");
+		return rc;
+	}
+	rc = clk_prepare_enable(priv->clk);
+	if (rc) {
+		dev_err(&pdev->dev, "Couldn't enable clock\n");
+		return rc;
+	}
+
 	spin_lock_init(&priv->obe.lock);
 	priv->obe.remove = false;
 	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
 
 	rc = aspeed_kcs_set_address(kcs_bmc, addrs, nr_addrs);
 	if (rc)
-		return rc;
+		goto err;
 
 	/* Host to BMC IRQ */
 	rc = aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
 	if (rc)
-		return rc;
+		goto err;
 
 	/* BMC to Host IRQ */
 	if (have_upstream_irq) {
 		rc = aspeed_kcs_config_upstream_irq(priv, upstream_irq[0], upstream_irq[1]);
 		if (rc < 0)
-			return rc;
+			goto err;
 	} else {
 		priv->upstream_irq.mode = aspeed_kcs_irq_none;
 	}
@@ -650,13 +666,19 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	rc = kcs_bmc_add_device(&priv->kcs_bmc);
 	if (rc) {
 		dev_warn(&pdev->dev, "Failed to register channel %d: %d\n", kcs_bmc->channel, rc);
-		return rc;
+		goto err;
 	}
 
 	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n",
 			kcs_bmc->channel, addrs[0]);
 
 	return 0;
+
+err:
+	aspeed_kcs_enable_channel(kcs_bmc, false);
+	clk_disable_unprepare(priv->clk);
+
+	return rc;
 }
 
 static int aspeed_kcs_remove(struct platform_device *pdev)
@@ -664,6 +686,7 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
 	struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
 	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
 
+	clk_disable_unprepare(priv->clk);
 	kcs_bmc_remove_device(kcs_bmc);
 
 	aspeed_kcs_enable_channel(kcs_bmc, false);
-- 
2.25.1

