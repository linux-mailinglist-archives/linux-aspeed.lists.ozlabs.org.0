Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C2F85E632
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 19:35:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZO3ym03G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4hR60rqz3dHK
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 05:35:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZO3ym03G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4h72dplz3brV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 05:35:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540504; x=1740076504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I4lO6MagkDaFdZKLWh5rqmLxpQuCDQmwf3i8KwokS+U=;
  b=ZO3ym03GjJ8EmihIF2/HXFf/yX8C+TpYfLyBoqU4RKaOHZnddw+330k2
   gysCi6SQDnemm32R1WYxl3J1z6tZLO0BFyq4GY/A4hWJzVXoLnrLKBxjl
   DLtN1XRHwHQeqWuhe3DxzwQLgaD7sCcgIklJmxqC0YKFSD788hJyC/Rmq
   6PuEt4+djAWyp8VniDlrMgEK+6iLHLUrE3JP0cWP50BtvzM/k2BFm/DVc
   +97U+h8UdBn8vg+HV+Urwyw4fEuRs2kO+I04GeVhkm2PQ7+VqIXqhU6Re
   NLme8KwNKRpBP3uyDtaeMXGNGw3NEJSwefeUsR0hInlSitFc0NQ2B5qQe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28164709"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28164709"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:34:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936684741"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="936684741"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 10:34:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DB5503D3; Wed, 21 Feb 2024 20:34:46 +0200 (EET)
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
Subject: [PATCH v1 03/14] serial: port: Introduce a common helper to read properties
Date: Wed, 21 Feb 2024 20:31:19 +0200
Message-ID: <20240221183442.4124354-4-andriy.shevchenko@linux.intel.com>
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

Several serial drivers want to read the same or similar set of
the port properties. Make a common helper for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/serial_port.c | 135 +++++++++++++++++++++++++++++++
 include/linux/serial_core.h      |   1 +
 2 files changed, 136 insertions(+)

diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
index 88975a4df306..111e1f25fbc6 100644
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
 
@@ -82,6 +85,138 @@ void uart_remove_one_port(struct uart_driver *drv, struct uart_port *port)
 }
 EXPORT_SYMBOL(uart_remove_one_port);
 
+/**
+ * uart_read_port_properties - read firmware properties of the given UART port
+ * @port: corresponding port
+ * @use_defaults: apply defaults or validate the values
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
+ *   ->iotype (if @use_defaults is false)
+ *   ->mapbase
+ *   ->mapsize
+ *   ->regshift (if @use_defaults is false)
+ * before calling this function. Alternatively the above mentioned fields
+ * may be zeroed, in such case the only ones, that have associated properties
+ * found, will be set to the respective values.
+ *
+ * When @use_defaults is true and the respective property is not found
+ * the following values will be applied:
+ *   ->iotype = UPIO_MEM
+ *   ->regshift = 0
+ * In this case IRQ must be provided, otherwise an error will be returned.
+ *
+ * The ->irq, ->mapbase, ->mapsize are always altered if no error happened.
+ *
+ * When @use_defaults is false and the respective property is found
+ * the following values will be validated:
+ *   - reg-io-width (->iotype)
+ *   - reg-offset (->mapsize against ->mapbase)
+ *
+ * Returns: 0 on success or negative errno on failure
+ */
+int uart_read_port_properties(struct uart_port *port, bool use_defaults)
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
+		port->iotype = use_defaults ? UPIO_MEM : port->iotype;
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
+			port->iotype = UPIO_UNSET;
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
+EXPORT_SYMBOL(uart_read_port_properties);
+
 static struct device_driver serial_port_driver = {
 	.name = "port",
 	.suppress_bind_attrs = true,
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 2b0526ae1fac..c93d775fc8a8 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -962,6 +962,7 @@ int uart_register_driver(struct uart_driver *uart);
 void uart_unregister_driver(struct uart_driver *uart);
 int uart_add_one_port(struct uart_driver *reg, struct uart_port *port);
 void uart_remove_one_port(struct uart_driver *reg, struct uart_port *port);
+int uart_read_port_properties(struct uart_port *port, bool use_defaults);
 bool uart_match_port(const struct uart_port *port1,
 		const struct uart_port *port2);
 
-- 
2.43.0.rc1.1.gbec44491f096

