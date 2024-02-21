Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32B85E642
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 19:35:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCPW8jch;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4j26tjBz3d28
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 05:35:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCPW8jch;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4h94nmtz3d2c
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 05:35:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540506; x=1740076506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x0OGDwF7erFFwXirCEnUP9h+wCzGSEhdgN5rCP6VdCA=;
  b=fCPW8jchE+DKT8sFkodaoHh61UCfSK69O9lvOw8wex75F3PZoEGOulSD
   SlBt5+x6qto6+v6erYYqOgpXBZYlEOUjJ7g64K9e4HnMGyq39WAI1s3fr
   LZmKm68Y36sGSYl0R6q4otDKIcVWcceb58AkRZkcAnW+U/TCfsBAm+VA9
   GaitxXZiGrxkaxH0AkzzhjoWutNDF/jo/ILs387ooo23D4qGZRnefua7U
   r0CfYIENfPzMHx9SuqyDCJg9A487Np4U9Vcn/Q/lg5O3wIbwWnkgQzImd
   4i7sxXJpK9anVA9PQFdV7a/pe+9Ai2Le9qHwqJ4yh0iU+krehxTlVGYPZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28164839"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28164839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936684756"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="936684756"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 10:34:55 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5F21880C; Wed, 21 Feb 2024 20:34:47 +0200 (EET)
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
Subject: [PATCH v1 11/14] serial: 8250_omap: Switch to use uart_read_port_properties()
Date: Wed, 21 Feb 2024 20:31:27 +0200
Message-ID: <20240221183442.4124354-12-andriy.shevchenko@linux.intel.com>
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
Cc: Scott Branden <sbranden@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since we have now a common helper to read port properties
use it instead of sparse home grown solution.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_omap.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 6942990a333c..173af575a43e 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1394,11 +1394,7 @@ static int omap8250_probe(struct platform_device *pdev)
 	struct uart_8250_port up;
 	struct resource *regs;
 	void __iomem *membase;
-	int irq, ret;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	int ret;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!regs) {
@@ -1419,7 +1415,6 @@ static int omap8250_probe(struct platform_device *pdev)
 	up.port.dev = &pdev->dev;
 	up.port.mapbase = regs->start;
 	up.port.membase = membase;
-	up.port.irq = irq;
 	/*
 	 * It claims to be 16C750 compatible however it is a little different.
 	 * It has EFR and has no FCR7_64byte bit. The AFE (which it claims to
@@ -1429,13 +1424,9 @@ static int omap8250_probe(struct platform_device *pdev)
 	 * or pm callback.
 	 */
 	up.port.type = PORT_8250;
-	up.port.iotype = UPIO_MEM;
-	up.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SOFT_FLOW |
-		UPF_HARD_FLOW;
+	up.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SOFT_FLOW | UPF_HARD_FLOW;
 	up.port.private_data = priv;
 
-	up.port.regshift = OMAP_UART_REGSHIFT;
-	up.port.fifosize = 64;
 	up.tx_loadsz = 64;
 	up.capabilities = UART_CAP_FIFO;
 #ifdef CONFIG_PM
@@ -1461,14 +1452,14 @@ static int omap8250_probe(struct platform_device *pdev)
 	up.rs485_stop_tx = serial8250_em485_stop_tx;
 	up.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
 
-	ret = of_alias_get_id(np, "serial");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to get alias\n");
+	ret = uart_read_port_properties(&up.port, true);
+	if (ret)
 		return ret;
-	}
-	up.port.line = ret;
 
-	if (of_property_read_u32(np, "clock-frequency", &up.port.uartclk)) {
+	up.port.regshift = OMAP_UART_REGSHIFT;
+	up.port.fifosize = 64;
+
+	if (!up.port.uartclk) {
 		struct clk *clk;
 
 		clk = devm_clk_get(&pdev->dev, NULL);
@@ -1560,8 +1551,8 @@ static int omap8250_probe(struct platform_device *pdev)
 	}
 #endif
 
-	irq_set_status_flags(irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(&pdev->dev, irq, omap8250_irq, 0,
+	irq_set_status_flags(up.port.irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(&pdev->dev, up.port.irq, omap8250_irq, 0,
 			       dev_name(&pdev->dev), priv);
 	if (ret < 0)
 		return ret;
-- 
2.43.0.rc1.1.gbec44491f096

