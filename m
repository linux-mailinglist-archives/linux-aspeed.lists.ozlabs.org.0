Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71387016B
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 13:32:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=URSy4uJF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJ3g4v1Qz3vXt
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 23:31:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=URSy4uJF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJ2S09cZz3cHC
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Mar 2024 23:30:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709555456; x=1741091456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ndloFPd65Za/5Rw2io8+LcsLZs9zze94gN/QFg2Mk/c=;
  b=URSy4uJFQS7pugEb3CY/SMKi+AqPSEHczEFq8KOW2mTIwHwjl+DkwY+J
   RIkLPBEo1Ii+50LQXzuYOBnM/l5y9qNdNnzLSlgNHgv6insblsuXDVXZl
   GOTQAbQYynaB2aOArGw5mLFqet2kB1bBzyA3rjeMGrevLIiuX04x5nXI+
   cyeF4i1/BDgLbzI/XKqkffxdZKX99gzYsskbvK84AEwVCAg0s2bI70OZs
   MpXON3EPhSj2vwKAyTL2E/9DO43YsL7pudSej1/ayAqppEveiEIiOwVAo
   +FVa53SLWC0JSe6td8Xa2E+gdKKYPs1mAC0rRCwCNgG9IJrxuSN3L9x8G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7815207"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7815207"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 04:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="937040431"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="937040431"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2024 04:30:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B276C8A3; Mon,  4 Mar 2024 14:30:37 +0200 (EET)
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
Subject: [PATCH v3 10/14] serial: 8250_of: Switch to use uart_read_port_properties()
Date: Mon,  4 Mar 2024 14:27:11 +0200
Message-ID: <20240304123035.758700-11-andriy.shevchenko@linux.intel.com>
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@linux.intel.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Since we have now a common helper to read port properties
use it instead of sparse home grown solution.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/tty/serial/8250/8250_of.c | 105 +++++++-----------------------
 1 file changed, 22 insertions(+), 83 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 9dcc17e33269..5d1dd992d8fb 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -69,37 +69,22 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
 	struct uart_port *port = &up->port;
-	u32 clk, spd, prop;
-	int ret, irq;
+	u32 spd;
+	int ret;
 
 	memset(port, 0, sizeof *port);
 
 	pm_runtime_enable(&ofdev->dev);
 	pm_runtime_get_sync(&ofdev->dev);
 
-	if (of_property_read_u32(np, "clock-frequency", &clk)) {
-
-		/* Get clk rate through clk driver if present */
-		info->clk = devm_clk_get_enabled(dev, NULL);
-		if (IS_ERR(info->clk)) {
-			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
-			goto err_pmruntime;
-		}
-
-		clk = clk_get_rate(info->clk);
-	}
-	/* If current-speed was set, then try not to change it. */
-	if (of_property_read_u32(np, "current-speed", &spd) == 0)
-		port->custom_divisor = clk / (16 * spd);
-
 	ret = of_address_to_resource(np, 0, &resource);
 	if (ret) {
 		dev_err_probe(dev, ret, "invalid address\n");
 		goto err_pmruntime;
 	}
 
-	port->flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
-				  UPF_FIXED_TYPE;
+	port->dev = &ofdev->dev;
+	port->flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_FIXED_TYPE;
 	spin_lock_init(&port->lock);
 
 	if (resource_type(&resource) == IORESOURCE_IO) {
@@ -108,70 +93,31 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 	} else {
 		port->mapbase = resource.start;
 		port->mapsize = resource_size(&resource);
-
-		/* Check for shifted address mapping */
-		if (of_property_read_u32(np, "reg-offset", &prop) == 0) {
-			if (prop >= port->mapsize) {
-				ret = dev_err_probe(dev, -EINVAL, "reg-offset %u exceeds region size %pa\n",
-						    prop, &port->mapsize);
-				goto err_pmruntime;
-			}
-
-			port->mapbase += prop;
-			port->mapsize -= prop;
-		}
-
-		port->iotype = UPIO_MEM;
-		if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
-			switch (prop) {
-			case 1:
-				port->iotype = UPIO_MEM;
-				break;
-			case 2:
-				port->iotype = UPIO_MEM16;
-				break;
-			case 4:
-				port->iotype = of_device_is_big_endian(np) ?
-					       UPIO_MEM32BE : UPIO_MEM32;
-				break;
-			default:
-				ret = dev_err_probe(dev, -EINVAL, "unsupported reg-io-width (%u)\n",
-						    prop);
-				goto err_pmruntime;
-			}
-		}
 		port->flags |= UPF_IOREMAP;
 	}
 
+	ret = uart_read_and_validate_port_properties(port);
+	if (ret)
+		goto err_pmruntime;
+
+	/* Get clk rate through clk driver if present */
+	if (!port->uartclk) {
+		info->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(info->clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
+			goto err_pmruntime;
+		}
+
+		port->uartclk = clk_get_rate(info->clk);
+	}
+	/* If current-speed was set, then try not to change it. */
+	if (of_property_read_u32(np, "current-speed", &spd) == 0)
+		port->custom_divisor = port->uartclk / (16 * spd);
+
 	/* Compatibility with the deprecated pxa driver and 8250_pxa drivers. */
 	if (of_device_is_compatible(np, "mrvl,mmp-uart"))
 		port->regshift = 2;
 
-	/* Check for registers offset within the devices address range */
-	if (of_property_read_u32(np, "reg-shift", &prop) == 0)
-		port->regshift = prop;
-
-	/* Check for fifo size */
-	if (of_property_read_u32(np, "fifo-size", &prop) == 0)
-		port->fifosize = prop;
-
-	/* Check for a fixed line number */
-	ret = of_alias_get_id(np, "serial");
-	if (ret >= 0)
-		port->line = ret;
-
-	irq = of_irq_get(np, 0);
-	if (irq < 0) {
-		if (irq == -EPROBE_DEFER) {
-			ret = -EPROBE_DEFER;
-			goto err_pmruntime;
-		}
-		/* IRQ support not mandatory */
-		irq = 0;
-	}
-
-	port->irq = irq;
-
 	info->rst = devm_reset_control_get_optional_shared(&ofdev->dev, NULL);
 	if (IS_ERR(info->rst)) {
 		ret = PTR_ERR(info->rst);
@@ -183,12 +129,6 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 		goto err_pmruntime;
 
 	port->type = type;
-	port->uartclk = clk;
-
-	if (of_property_read_bool(np, "no-loopback-test"))
-		port->flags |= UPF_SKIP_TEST;
-
-	port->dev = &ofdev->dev;
 	port->rs485_config = serial8250_em485_config;
 	port->rs485_supported = serial8250_em485_supported;
 	up->rs485_start_tx = serial8250_em485_start_tx;
@@ -280,7 +220,6 @@ static int of_platform_serial_probe(struct platform_device *ofdev)
 	platform_set_drvdata(ofdev, info);
 	return 0;
 err_dispose:
-	irq_dispose_mapping(port8250.port.irq);
 	pm_runtime_put_sync(&ofdev->dev);
 	pm_runtime_disable(&ofdev->dev);
 err_free:
-- 
2.43.0.rc1.1.gbec44491f096

