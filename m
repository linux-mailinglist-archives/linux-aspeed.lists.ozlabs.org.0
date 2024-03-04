Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9387014B
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 13:31:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nmg7X5BX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJ2l4hz5z3c2F
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 23:31:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nmg7X5BX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJ2N32CKz3cBG
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Mar 2024 23:30:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709555452; x=1741091452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MzeE3/tXNoP+XePWQLaHjZ7JMNhfc4kTQ5ZC6sxw0R8=;
  b=Nmg7X5BXeGDg+09ZCOA33OZNe4sVGnZ3KtPTrvvUKRBxliFnswUcHTvf
   7Bs2/A4g9zgsrLJTpP1GM3YQrqSTpZXGLWZSoKRqsehNcjOaP/M5PXxHu
   M9BqvMQMw2vsygjvYUErGvknicmjmznnOIecBK/tWPY85OIi3WSnaZ58Y
   Cd9pOUtQ1Skn6g9dCYGUuwb/g1+tYYEomaNyiNxhTfX71g+eAX7rtjIio
   25pY+QhuygFY7rqmX1S8fXwBznZfnfZr7En4pYdvyI22x1hi+bgd4XKy0
   17OZVpiPF9AQfGwwlanYRqJN+lGOslHzW20ZKHZ4vybzS+OaQPkpRSGQ3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7815065"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7815065"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 04:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="937040424"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="937040424"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2024 04:30:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 58ECA3F1; Mon,  4 Mar 2024 14:30:37 +0200 (EET)
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
Subject: [PATCH v3 03/14] serial: port: Introduce a common helper to read properties
Date: Mon,  4 Mar 2024 14:27:04 +0200
Message-ID: <20240304123035.758700-4-andriy.shevchenko@linux.intel.com>
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

Several serial drivers want to read the same or similar set of
the port properties. Make a common helper for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/serial_port.c | 145 +++++++++++++++++++++++++++++++
 include/linux/serial_core.h      |   2 +
 2 files changed, 147 insertions(+)

diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
index 72b6f4f326e2..22b9eeb23e68 100644
--- a/drivers/tty/serial/serial_port.c
+++ b/drivers/tty/serial/serial_port.c
@@ -8,7 +8,10 @@
 
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/serial_core.h>
 #include <linux/spinlock.h>
 
@@ -105,6 +108,148 @@ void uart_remove_one_port(struct uart_driver *drv, struct uart_port *port)
 }
 EXPORT_SYMBOL(uart_remove_one_port);
 
+/**
+ * __uart_read_properties - read firmware properties of the given UART port
+ * @port: corresponding port
+ * @use_defaults: apply defaults (when %true) or validate the values (when %false)
+ *
+ * The following device properties are supported:
+ *   - clock-frequency (optional)
+ *   - fifo-size (optional)
+ *   - no-loopback-test (optional)
+ *   - reg-shift (defaults may apply)
+ *   - reg-offset (value may be validated)
+ *   - reg-io-width (defaults may apply or value may be validated)
+ *   - interrupts (OF only)
+ *   - serial [alias ID] (OF only)
+ *
+ * If the port->dev is of struct platform_device type the interrupt line
+ * will be retrieved via platform_get_irq() call against that device.
+ * Otherwise it will be assigned by fwnode_irq_get() call. In both cases
+ * the index 0 of the resource is used.
+ *
+ * The caller is responsible to initialize the following fields of the @port
+ *   ->dev (must be valid)
+ *   ->flags
+ *   ->mapbase
+ *   ->mapsize
+ *   ->regshift (if @use_defaults is false)
+ * before calling this function. Alternatively the above mentioned fields
+ * may be zeroed, in such case the only ones, that have associated properties
+ * found, will be set to the respective values.
+ *
+ * If no error happened, the ->irq, ->mapbase, ->mapsize will be altered.
+ * The ->iotype is always altered.
+ *
+ * When @use_defaults is true and the respective property is not found
+ * the following values will be applied:
+ *   ->regshift = 0
+ * In this case IRQ must be provided, otherwise an error will be returned.
+ *
+ * When @use_defaults is false and the respective property is found
+ * the following values will be validated:
+ *   - reg-io-width (->iotype)
+ *   - reg-offset (->mapsize against ->mapbase)
+ *
+ * Returns: 0 on success or negative errno on failure
+ */
+static int __uart_read_properties(struct uart_port *port, bool use_defaults)
+{
+	struct device *dev = port->dev;
+	u32 value;
+	int ret;
+
+	/* Read optional UART functional clock frequency */
+	device_property_read_u32(dev, "clock-frequency", &port->uartclk);
+
+	/* Read the registers alignment (default: 8-bit) */
+	ret = device_property_read_u32(dev, "reg-shift", &value);
+	if (ret)
+		port->regshift = use_defaults ? 0 : port->regshift;
+	else
+		port->regshift = value;
+
+	/* Read the registers I/O access type (default: MMIO 8-bit) */
+	ret = device_property_read_u32(dev, "reg-io-width", &value);
+	if (ret) {
+		port->iotype = UPIO_MEM;
+	} else {
+		switch (value) {
+		case 1:
+			port->iotype = UPIO_MEM;
+			break;
+		case 2:
+			port->iotype = UPIO_MEM16;
+			break;
+		case 4:
+			port->iotype = device_is_big_endian(dev) ? UPIO_MEM32BE : UPIO_MEM32;
+			break;
+		default:
+			if (!use_defaults) {
+				dev_err(dev, "Unsupported reg-io-width (%u)\n", value);
+				return -EINVAL;
+			}
+			port->iotype = UPIO_UNKNOWN;
+			break;
+		}
+	}
+
+	/* Read the address mapping base offset (default: no offset) */
+	ret = device_property_read_u32(dev, "reg-offset", &value);
+	if (ret)
+		value = 0;
+
+	/* Check for shifted address mapping overflow */
+	if (!use_defaults && port->mapsize < value) {
+		dev_err(dev, "reg-offset %u exceeds region size %pa\n", value, &port->mapsize);
+		return -EINVAL;
+	}
+
+	port->mapbase += value;
+	port->mapsize -= value;
+
+	/* Read optional FIFO size */
+	device_property_read_u32(dev, "fifo-size", &port->fifosize);
+
+	if (device_property_read_bool(dev, "no-loopback-test"))
+		port->flags |= UPF_SKIP_TEST;
+
+	/* Get index of serial line, if found in DT aliases */
+	ret = of_alias_get_id(dev_of_node(dev), "serial");
+	if (ret >= 0)
+		port->line = ret;
+
+	if (dev_is_platform(dev))
+		ret = platform_get_irq(to_platform_device(dev), 0);
+	else
+		ret = fwnode_irq_get(dev_fwnode(dev), 0);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	if (ret > 0)
+		port->irq = ret;
+	else if (use_defaults)
+		/* By default IRQ support is mandatory */
+		return ret;
+	else
+		port->irq = 0;
+
+	port->flags |= UPF_SHARE_IRQ;
+
+	return 0;
+}
+
+int uart_read_port_properties(struct uart_port *port)
+{
+	return __uart_read_properties(port, true);
+}
+EXPORT_SYMBOL_GPL(uart_read_port_properties);
+
+int uart_read_and_validate_port_properties(struct uart_port *port)
+{
+	return __uart_read_properties(port, false);
+}
+EXPORT_SYMBOL_GPL(uart_read_and_validate_port_properties);
+
 static struct device_driver serial_port_driver = {
 	.name = "port",
 	.suppress_bind_attrs = true,
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index c2cf9484014c..c1fd3d2f6238 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -962,6 +962,8 @@ int uart_register_driver(struct uart_driver *uart);
 void uart_unregister_driver(struct uart_driver *uart);
 int uart_add_one_port(struct uart_driver *reg, struct uart_port *port);
 void uart_remove_one_port(struct uart_driver *reg, struct uart_port *port);
+int uart_read_port_properties(struct uart_port *port);
+int uart_read_and_validate_port_properties(struct uart_port *port);
 bool uart_match_port(const struct uart_port *port1,
 		const struct uart_port *port2);
 
-- 
2.43.0.rc1.1.gbec44491f096

