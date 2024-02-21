Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321E85E646
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 19:36:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mbZ35zs4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4jN6QnFz3cRd
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 05:36:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mbZ35zs4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4hC3nStz3d28
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 05:35:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540508; x=1740076508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KeTPJX3iP5rGOV/714NN6qjfj4XXg/FxlTFlGOhpEw4=;
  b=mbZ35zs4SQ0Z8U3UWsme7lrx2I0CR+LgYFR3qe0ArPzJvKYFgIeWOFdJ
   gVYVRRVIjn+DevwYfIW+a9xHIce/4uWTpcfpKhenXSQ3XuAxf7GvBzqFO
   y2WnM6IP/nEYUTkeC+JW+dlHE7gBSFRs/uqVpawTdjA/XsJTN0wrz/8zG
   8bOKT7Yx25ulB4klwAShNuRe8K08eLI3/KaUKmLNQ68EddA/a1qZdiYl6
   aXKieGkGD340FY8yQbbhGyRrBpSDgDxJUc1R7HtHfj+eX8FzRTIfGkt/X
   b6bq4kb+eo+teuL9/EixKdyfTR9e+aAzs2W/N0kqcDzFTlvHOfKOVCZmo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28164847"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28164847"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936684755"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="936684755"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 10:34:55 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 43015570; Wed, 21 Feb 2024 20:34:47 +0200 (EET)
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
Subject: [PATCH v1 09/14] serial: 8250_lpc18xx: Switch to use uart_read_port_properties()
Date: Wed, 21 Feb 2024 20:31:25 +0200
Message-ID: <20240221183442.4124354-10-andriy.shevchenko@linux.intel.com>
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
 drivers/tty/serial/8250/8250_lpc18xx.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_lpc18xx.c b/drivers/tty/serial/8250/8250_lpc18xx.c
index 8d728a6a5991..e4a6b7b4caf2 100644
--- a/drivers/tty/serial/8250/8250_lpc18xx.c
+++ b/drivers/tty/serial/8250/8250_lpc18xx.c
@@ -92,11 +92,7 @@ static int lpc18xx_serial_probe(struct platform_device *pdev)
 	struct lpc18xx_uart_data *data;
 	struct uart_8250_port uart;
 	struct resource *res;
-	int irq, ret;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -139,19 +135,12 @@ static int lpc18xx_serial_probe(struct platform_device *pdev)
 		goto dis_clk_reg;
 	}
 
-	ret = of_alias_get_id(pdev->dev.of_node, "serial");
-	if (ret >= 0)
-		uart.port.line = ret;
-
 	data->dma.rx_param = data;
 	data->dma.tx_param = data;
 
 	spin_lock_init(&uart.port.lock);
 	uart.port.dev = &pdev->dev;
-	uart.port.irq = irq;
-	uart.port.iotype = UPIO_MEM32;
 	uart.port.mapbase = res->start;
-	uart.port.regshift = 2;
 	uart.port.type = PORT_16550A;
 	uart.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SKIP_TEST;
 	uart.port.uartclk = clk_get_rate(data->clk_uart);
@@ -160,6 +149,13 @@ static int lpc18xx_serial_probe(struct platform_device *pdev)
 	uart.port.rs485_supported = lpc18xx_rs485_supported;
 	uart.port.serial_out = lpc18xx_uart_serial_out;
 
+	ret = uart_read_port_properties(&uart.port, true);
+	if (ret)
+		return ret;
+
+	uart.port.iotype = UPIO_MEM32;
+	uart.port.regshift = 2;
+
 	uart.dma = &data->dma;
 	uart.dma->rxconf.src_maxburst = 1;
 	uart.dma->txconf.dst_maxburst = 1;
-- 
2.43.0.rc1.1.gbec44491f096

