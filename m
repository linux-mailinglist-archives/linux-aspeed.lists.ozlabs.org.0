Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B657A6BE1
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Sep 2023 21:55:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPElZ9ed;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqspN4yrjz3c2b
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Sep 2023 05:55:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPElZ9ed;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rqsp85gnQz2ygy
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Sep 2023 05:55:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695153313; x=1726689313;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Bepkwmn/REb0biKQxCPTgmoT59eVotqTB0kTZUaw9lM=;
  b=fPElZ9edhDgnhYF2dt2DmrVG/77UESU1XYzUEeJdLongIqWL6D3t6cbX
   1RH97cQszW9f1f47i6KGlo+X1qBaHEX9A7nO4sw//rYHeFPRNzmaBW1a7
   ZteHFCMpwn33Tg3l6zRI3Q5zdb+cvuWKxSVB86A2C5lywIB/fR0qL//uB
   nLC1wf94z44dLl6uDRiuyseR9J2WVmhx5ugd/GIK1AgYZW1ev00LXTJxT
   EzQToEKoXJCWl03a3AwqX3NrenXrJ0/oozAW1usDG6quHozUmWmDFdY1J
   TMQ9xXldWM9MSfq22O8uj9Hd6025M0zgX/gpvfJlvJkp/gP/4DCr2Yy3q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383874535"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="383874535"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 12:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746354996"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="746354996"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 19 Sep 2023 12:54:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9473545B; Tue, 19 Sep 2023 22:54:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v1 1/1] serial: 8250_aspeed_vuart: Use devm_clk_get_enabled()
Date: Tue, 19 Sep 2023 22:54:50 +0300
Message-Id: <20230919195450.3197881-1-andriy.shevchenko@linux.intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use devm_clk_get_enabled() to simplify the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 7a4537a1d66c..270b3a710eb6 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -34,7 +34,6 @@
 
 struct aspeed_vuart {
 	struct device		*dev;
-	struct clk		*clk;
 	int			line;
 	struct timer_list	unthrottle_timer;
 	struct uart_8250_port	*port;
@@ -422,6 +421,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	struct resource *res;
 	u32 clk, prop, sirq[2];
 	int rc, sirq_polarity;
+	struct clk *vclk;
 
 	np = pdev->dev.of_node;
 
@@ -454,18 +454,13 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 		return rc;
 
 	if (of_property_read_u32(np, "clock-frequency", &clk)) {
-		vuart->clk = devm_clk_get(&pdev->dev, NULL);
-		if (IS_ERR(vuart->clk)) {
-			rc = dev_err_probe(dev, PTR_ERR(vuart->clk),
-					   "clk or clock-frequency not defined\n");
+		vclk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(vclk)) {
+			rc = dev_err_probe(dev, PTR_ERR(vclk), "clk or clock-frequency not defined\n");
 			goto err_sysfs_remove;
 		}
 
-		rc = clk_prepare_enable(vuart->clk);
-		if (rc < 0)
-			goto err_sysfs_remove;
-
-		clk = clk_get_rate(vuart->clk);
+		clk = clk_get_rate(vclk);
 	}
 
 	/* If current-speed was set, then try not to change it. */
@@ -565,7 +560,6 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	return 0;
 
 err_clk_disable:
-	clk_disable_unprepare(vuart->clk);
 	irq_dispose_mapping(port.port.irq);
 err_sysfs_remove:
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
@@ -580,7 +574,6 @@ static int aspeed_vuart_remove(struct platform_device *pdev)
 	aspeed_vuart_set_enabled(vuart, false);
 	serial8250_unregister_port(vuart->line);
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
-	clk_disable_unprepare(vuart->clk);
 
 	return 0;
 }
-- 
2.40.0.1.gaa8946217a0b

