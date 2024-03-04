Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116A870169
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 13:31:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWmKLuwr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJ3b2DkJz3vXf
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 23:31:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWmKLuwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJ2S0TWMz3cKN
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Mar 2024 23:30:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709555456; x=1741091456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2fQaXc8Ypf3lwPz6yPzLdFKzd2VLz29IZnJiOdcHyzs=;
  b=mWmKLuwrPsOc+keGLs2s/1gv7qANGK33PwC3rfgNaVYTtGZoK30qja9J
   4WQC44XB0K9uTouGlxOlpSUce54nM0zH06H5MMzumWM8Wcd+MCYi7Srgn
   brwif/e5ygeEQ7OZMnHQpSKciCxNUeaKvGJjSKZ3Z9wuvWmUZFB0ym40p
   TnzuwIhTvuPStS6TJyhuQL7eKRj2bzJBHl4A6s4gW2lcYFUDPIGpjfrXs
   yB90hFa4aUqZO1ETAg+dU3NglqvF4QiK6c6sf9XLNSq0YsKtNGP4NXxs7
   +JAcTmX7QVb9WrZ3Zos+JgUERpIw8JtuyOsEn2SP2GjlD81DbpEqSbC56
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7815193"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7815193"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 04:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="937040434"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="937040434"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2024 04:30:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8088AB1; Mon,  4 Mar 2024 14:30:37 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 13/14] serial: 8250_tegra: Switch to use uart_read_port_properties()
Date: Mon,  4 Mar 2024 14:27:14 +0200
Message-ID: <20240304123035.758700-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240304123035.758700-1-andriy.shevchenko@linux.intel.com>
References: <20240304123035.758700-1-andriy.shevchenko@linux.intel.com>
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since we have now a common helper to read port properties
use it instead of sparse home grown solution.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_tegra.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_tegra.c b/drivers/tty/serial/8250/8250_tegra.c
index ba352262df75..60a80d00d251 100644
--- a/drivers/tty/serial/8250/8250_tegra.c
+++ b/drivers/tty/serial/8250/8250_tegra.c
@@ -57,25 +57,11 @@ static int tegra_uart_probe(struct platform_device *pdev)
 	port = &port8250.port;
 	spin_lock_init(&port->lock);
 
-	port->flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
-		      UPF_FIXED_TYPE;
-	port->iotype = UPIO_MEM32;
-	port->regshift = 2;
+	port->flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_FIXED_TYPE;
 	port->type = PORT_TEGRA;
-	port->irqflags |= IRQF_SHARED;
 	port->dev = &pdev->dev;
 	port->handle_break = tegra_uart_handle_break;
 
-	ret = of_alias_get_id(pdev->dev.of_node, "serial");
-	if (ret >= 0)
-		port->line = ret;
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
-
-	port->irq = ret;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
@@ -88,12 +74,18 @@ static int tegra_uart_probe(struct platform_device *pdev)
 	port->mapbase = res->start;
 	port->mapsize = resource_size(res);
 
+	ret = uart_read_port_properties(port);
+	if (ret)
+		return ret;
+
+	port->iotype = UPIO_MEM32;
+	port->regshift = 2;
+
 	uart->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
 	if (IS_ERR(uart->rst))
 		return PTR_ERR(uart->rst);
 
-	if (device_property_read_u32(&pdev->dev, "clock-frequency",
-				     &port->uartclk)) {
+	if (!port->uartclk) {
 		uart->clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(uart->clk)) {
 			dev_err(&pdev->dev, "failed to get clock!\n");
-- 
2.43.0.rc1.1.gbec44491f096

