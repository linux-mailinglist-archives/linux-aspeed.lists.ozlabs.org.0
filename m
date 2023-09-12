Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB8579D6F0
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Sep 2023 18:56:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csKOSLbO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlV9148spz3cC7
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 02:56:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csKOSLbO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlV8t53ZTz3bxL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 02:56:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694537775; x=1726073775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6oK3QKUyE2J6G3j5C3mGEJEaadkE/lTt0pjP5XqCoTA=;
  b=csKOSLbOBvydDJS9JTQIAvOrGE4ynVs+/NxlnygXHD/kVn4SQ3NLINao
   uahjPmHSePJnn1THYsuz754XjI9DRhX5H3SwIZXljeSIoSrin3Orb1MSJ
   nzcaniCoFQs5XhQQjbWhZPx3fMgzH0r7gvvDeEUQWEiOz7tPdtvOoqWYe
   3oHBdXtrPGx+5M/+NWzuDYzGg3FbNBWhixo4WjNOXgN1nxByRWHUcWKUP
   yHe8yGKlRGPfsn8Pl6H6sBn09yX4wYLQ/oT/cKRdy/+JWpoYic2KbdCDW
   QviUazDu7Jd95sfrybQUNCRfm9KUQ2oTzzATDELsHTWHaxV/a3ydAG5wO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381135989"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="381135989"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 09:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="746968566"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="746968566"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 12 Sep 2023 09:55:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 76B6C248; Tue, 12 Sep 2023 19:55:45 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v1 1/1] serial: 8250_aspeed_vuart: Use dev_err_probe() instead of dev_err()
Date: Tue, 12 Sep 2023 19:55:40 +0300
Message-Id: <20230912165540.402504-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The probe process may generate EPROBE_DEFER. In this case
dev_err_probe() can still record err information. Otherwise
it may pollute logs on that occasion.

This also helps simplifing code and standardizing the error output.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 4a9e71b2dbbc..7a4537a1d66c 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -415,6 +415,7 @@ static int aspeed_vuart_map_irq_polarity(u32 dt)
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct of_phandle_args sirq_polarity_sense_args;
+	struct device *dev = &pdev->dev;
 	struct uart_8250_port port;
 	struct aspeed_vuart *vuart;
 	struct device_node *np;
@@ -455,9 +456,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "clock-frequency", &clk)) {
 		vuart->clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(vuart->clk)) {
-			dev_warn(&pdev->dev,
-				"clk or clock-frequency not defined\n");
-			rc = PTR_ERR(vuart->clk);
+			rc = dev_err_probe(dev, PTR_ERR(vuart->clk),
+					   "clk or clock-frequency not defined\n");
 			goto err_sysfs_remove;
 		}
 
@@ -533,7 +533,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	rc = aspeed_vuart_set_lpc_address(vuart, prop);
 	if (rc < 0) {
-		dev_err(&pdev->dev, "invalid value in aspeed,lpc-io-reg property\n");
+		dev_err_probe(dev, rc, "invalid value in aspeed,lpc-io-reg property\n");
 		goto err_clk_disable;
 	}
 
@@ -545,14 +545,14 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
 	if (rc < 0) {
-		dev_err(&pdev->dev, "invalid sirq number in aspeed,lpc-interrupts property\n");
+		dev_err_probe(dev, rc, "invalid sirq number in aspeed,lpc-interrupts property\n");
 		goto err_clk_disable;
 	}
 
 	sirq_polarity = aspeed_vuart_map_irq_polarity(sirq[1]);
 	if (sirq_polarity < 0) {
-		dev_err(&pdev->dev, "invalid sirq polarity in aspeed,lpc-interrupts property\n");
-		rc = sirq_polarity;
+		rc = dev_err_probe(dev, sirq_polarity,
+				   "invalid sirq polarity in aspeed,lpc-interrupts property\n");
 		goto err_clk_disable;
 	}
 
-- 
2.40.0.1.gaa8946217a0b

