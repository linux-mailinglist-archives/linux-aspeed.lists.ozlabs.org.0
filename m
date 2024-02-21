Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED085E62C
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 19:35:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MPCzwGhT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4hH0xBhz3dRV
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 05:35:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MPCzwGhT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4h50Xj4z3brV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 05:35:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540501; x=1740076501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dYynpd7BpWY3yNBCHCGwe1IyzPj618I/HKzMJe4rUOU=;
  b=MPCzwGhTk9dOACPp8GI7srV7z9zIyWVUVnYUngNn+7AFfzdTt+/9Iq1H
   l2/PxdHM60RH0Mxl/d8GZLsh+cvAcf40obYsXm/EMSN0YRbH9gIwxOQiH
   dOHykHpROTuumjC+LRbxb7pBTz4aXz74ZetIXdDU0JDdBZ947i9Aj4vzF
   3RAtRrLIrjOfmCHyuwdNeI0yry+rVF0yGRHeAA6SM75HCKW766H+RyOVX
   m3C5I1yLBDkhEczl0OjgwES9UxSKPjKY2GVE12qez6AjQW4ohWmKB2Csi
   FrR/P+zl7ZYt87dyKDk/qrj39q+6nwDWcVi/r2DElFVOEBcAYT/ixoypJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28164680"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28164680"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936684740"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="936684740"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 10:34:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EA46D3F4; Wed, 21 Feb 2024 20:34:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 04/14] serial: 8250_aspeed_vuart: Switch to use uart_read_port_properties()
Date: Wed, 21 Feb 2024 20:31:20 +0200
Message-ID: <20240221183442.4124354-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
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
Cc: Scott Branden <sbranden@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@linux.intel.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since we have now a common helper to read port properties
use it instead of sparse home grown solution.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 50 +++++++--------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 8c2aaf7af7b7..2a4bc39b11af 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -419,8 +419,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	struct aspeed_vuart *vuart;
 	struct device_node *np;
 	struct resource *res;
-	u32 clk, prop, sirq[2];
 	int rc, sirq_polarity;
+	u32 prop, sirq[2];
 	struct clk *vclk;
 
 	np = pdev->dev.of_node;
@@ -447,53 +447,35 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	port.port.status = UPSTAT_SYNC_FIFO;
 	port.port.dev = &pdev->dev;
 	port.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
+	port.port.flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE |
+			  UPF_NO_THRE_TEST;
 	port.bugs |= UART_BUG_TXRACE;
 
 	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
 	if (rc < 0)
 		return rc;
 
-	if (of_property_read_u32(np, "clock-frequency", &clk)) {
+	rc = uart_read_port_properties(&port.port, true);
+	if (rc)
+		goto err_sysfs_remove;
+
+	/* Get clk rate through clk driver if present */
+	if (!port.port.uartclk) {
 		vclk = devm_clk_get_enabled(dev, NULL);
 		if (IS_ERR(vclk)) {
 			rc = dev_err_probe(dev, PTR_ERR(vclk), "clk or clock-frequency not defined\n");
 			goto err_sysfs_remove;
 		}
 
-		clk = clk_get_rate(vclk);
+		port.port.uartclk = clk_get_rate(vclk);
 	}
 
 	/* If current-speed was set, then try not to change it. */
 	if (of_property_read_u32(np, "current-speed", &prop) == 0)
-		port.port.custom_divisor = clk / (16 * prop);
+		port.port.custom_divisor = port.port.uartclk / (16 * prop);
 
-	/* Check for shifted address mapping */
-	if (of_property_read_u32(np, "reg-offset", &prop) == 0)
-		port.port.mapbase += prop;
-
-	/* Check for registers offset within the devices address range */
-	if (of_property_read_u32(np, "reg-shift", &prop) == 0)
-		port.port.regshift = prop;
-
-	/* Check for fifo size */
-	if (of_property_read_u32(np, "fifo-size", &prop) == 0)
-		port.port.fifosize = prop;
-
-	/* Check for a fixed line number */
-	rc = of_alias_get_id(np, "serial");
-	if (rc >= 0)
-		port.port.line = rc;
-
-	port.port.irq = irq_of_parse_and_map(np, 0);
 	port.port.handle_irq = aspeed_vuart_handle_irq;
-	port.port.iotype = UPIO_MEM;
 	port.port.type = PORT_ASPEED_VUART;
-	port.port.uartclk = clk;
-	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_IOREMAP
-		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
-
-	if (of_property_read_bool(np, "no-loopback-test"))
-		port.port.flags |= UPF_SKIP_TEST;
 
 	if (port.port.fifosize)
 		port.capabilities = UART_CAP_FIFO;
@@ -503,7 +485,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	rc = serial8250_register_8250_port(&port);
 	if (rc < 0)
-		goto err_clk_disable;
+		goto err_sysfs_remove;
 
 	vuart->line = rc;
 	vuart->port = serial8250_get_port(vuart->line);
@@ -529,7 +511,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	rc = aspeed_vuart_set_lpc_address(vuart, prop);
 	if (rc < 0) {
 		dev_err_probe(dev, rc, "invalid value in aspeed,lpc-io-reg property\n");
-		goto err_clk_disable;
+		goto err_sysfs_remove;
 	}
 
 	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
@@ -541,14 +523,14 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
 	if (rc < 0) {
 		dev_err_probe(dev, rc, "invalid sirq number in aspeed,lpc-interrupts property\n");
-		goto err_clk_disable;
+		goto err_sysfs_remove;
 	}
 
 	sirq_polarity = aspeed_vuart_map_irq_polarity(sirq[1]);
 	if (sirq_polarity < 0) {
 		rc = dev_err_probe(dev, sirq_polarity,
 				   "invalid sirq polarity in aspeed,lpc-interrupts property\n");
-		goto err_clk_disable;
+		goto err_sysfs_remove;
 	}
 
 	aspeed_vuart_set_sirq_polarity(vuart, sirq_polarity);
@@ -559,8 +541,6 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_clk_disable:
-	irq_dispose_mapping(port.port.irq);
 err_sysfs_remove:
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
 	return rc;
-- 
2.43.0.rc1.1.gbec44491f096

