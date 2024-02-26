Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED9A86783E
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 15:26:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vvp/mnKU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk2wh3g2Sz3vfT
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 01:26:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vvp/mnKU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk2vw5l2Tz3vfh
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 01:25:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708957533; x=1740493533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vhK6pyGf2T+TFWuVP7O7kQnPlVO9Kof9u3xE7jBi6uw=;
  b=Vvp/mnKUNSh9GrrLEdZJjuSkGQdGLJ4wM03dsAt+n0K4ZR9jZmz9Ct0k
   7Qswqzj1OtopdZ0/fg7GN0DBRYpLdir4uEOEf3D4HeVHFt2yGffUFz0Ad
   gkdxb7FwcKImQ/+UvEQwBEni04Xx9UFFpDKKA6Qxl2LGwgCIXMcQPyBP9
   XJvt9n+cu7EBxfh6mcm1mJV4E5JqDVi6YANtiLaVuCKnz5KRi6t6r6nGI
   77dWbJcgg1EpCCYMm9vZ2YYy7CUzEWS+UrhtDzUq12F0B8jUSAZdvRGCb
   H4RLbS1KlDzZxv7UGNV3sRN6HOOViT+29OeCHS4RKrb/8vME0PMdllu25
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3375205"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3375205"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:25:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937030145"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937030145"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2024 06:25:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 683EC812; Mon, 26 Feb 2024 16:25:16 +0200 (EET)
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
Subject: [PATCH v2 08/14] serial: 8250_ingenic: Switch to use uart_read_port_properties()
Date: Mon, 26 Feb 2024 16:19:24 +0200
Message-ID: <20240226142514.1485246-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
References: <20240226142514.1485246-1-andriy.shevchenko@linux.intel.com>
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
 drivers/tty/serial/8250/8250_ingenic.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index a12f737924c0..7603129f1c07 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -234,7 +234,7 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 	struct ingenic_uart_data *data;
 	const struct ingenic_uart_config *cdata;
 	struct resource *regs;
-	int irq, err, line;
+	int err;
 
 	cdata = of_device_get_match_data(&pdev->dev);
 	if (!cdata) {
@@ -242,10 +242,6 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!regs) {
 		dev_err(&pdev->dev, "no registers defined\n");
@@ -259,21 +255,19 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 	spin_lock_init(&uart.port.lock);
 	uart.port.type = PORT_16550A;
 	uart.port.flags = UPF_SKIP_TEST | UPF_IOREMAP | UPF_FIXED_TYPE;
-	uart.port.iotype = UPIO_MEM;
 	uart.port.mapbase = regs->start;
-	uart.port.regshift = 2;
 	uart.port.serial_out = ingenic_uart_serial_out;
 	uart.port.serial_in = ingenic_uart_serial_in;
-	uart.port.irq = irq;
 	uart.port.dev = &pdev->dev;
-	uart.port.fifosize = cdata->fifosize;
 	uart.tx_loadsz = cdata->tx_loadsz;
 	uart.capabilities = UART_CAP_FIFO | UART_CAP_RTOIE;
 
-	/* Check for a fixed line number */
-	line = of_alias_get_id(pdev->dev.of_node, "serial");
-	if (line >= 0)
-		uart.port.line = line;
+	err = uart_read_port_properties(&uart.port, true);
+	if (err)
+		return err;
+
+	uart.port.regshift = 2;
+	uart.port.fifosize = cdata->fifosize;
 
 	uart.port.membase = devm_ioremap(&pdev->dev, regs->start,
 					 resource_size(regs));
-- 
2.43.0.rc1.1.gbec44491f096

