Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940D10F290
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 23:02:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RfGb225vzDqNb
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 09:01:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=mfe@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PhdF0FL0zDrBf
 for <linux-aspeed@lists.ozlabs.org>; Sat, 30 Nov 2019 04:41:21 +1100 (AEDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iak1U-0003D7-N3; Fri, 29 Nov 2019 18:25:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iak1S-0003AR-Ll; Fri, 29 Nov 2019 18:25:38 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: support.opensource@diasemi.com, lee.jones@linaro.org, robh+dt@kernel.org,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com, joel@jms.id.au,
 andrew@aj.id.au, lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH v3 2/6] gpio: make gpiod_to_offset() available for other users
Date: Fri, 29 Nov 2019 18:25:33 +0100
Message-Id: <20191129172537.31410-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129172537.31410-1-m.felsch@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Dec 2019 09:01:40 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Currently gpiod_to_offset() is a gpio-subsystem private function which
is used by the gpiolib itself and by the aspeed gpio driver. The time
has shown that there are other drivers as well which need this
information in some special cases e.g. MFD drivers. The patch makes the
function public but you need to explicit add the <linux/gpio/private.h>
include. See discussion [1] for more information.

[1] https://lkml.org/lkml/2019/11/27/357

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v3:
- former patch description was "gpio: add support to get local gpio number"
- adapt commit message and description to reflect new state
- don't add wrapper instead use the already existing gpiod_to_offset
- move gpiod_to_offset from gpiolib.h into gpiolib.c
- move declaration into linux/gpio/private.h
---
 drivers/gpio/gpio-aspeed.c   | 11 +++++------
 drivers/gpio/gpiolib-sysfs.c |  1 +
 drivers/gpio/gpiolib.c       | 22 ++++++++++++++++++++++
 drivers/gpio/gpiolib.h       |  8 --------
 include/linux/gpio/private.h | 27 +++++++++++++++++++++++++++
 5 files changed, 55 insertions(+), 14 deletions(-)
 create mode 100644 include/linux/gpio/private.h

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index b1d1d39e5174..e10ebad6853a 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -20,13 +20,12 @@
 #include <linux/string.h>
 
 /*
- * These two headers aren't meant to be used by GPIO drivers. We need
- * them in order to access gpiod_to_offset() which we need to implement
- * the aspeed specific API which allows the coprocessor to request
- * access to some GPIOs and to arbitrate between coprocessor and ARM.
+ * The header isn't meant to be used by GPIO drivers. We need it in order to
+ * access gpiod_to_offset() which we need to implement the aspeed specific API
+ * which allows the coprocessor to request access to some GPIOs and to
+ * arbitrate between coprocessor and ARM.
  */
-#include <linux/gpio/consumer.h>
-#include "gpiolib.h"
+#include <linux/gpio/private.h>
 
 struct aspeed_bank_props {
 	unsigned int bank;
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index d4cab6a80928..367db78bb58c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -5,6 +5,7 @@
 #include <linux/sysfs.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/private.h>
 #include <linux/interrupt.h>
 #include <linux/kdev_t.h>
 #include <linux/slab.h>
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 548cf41c6179..197cac0e3e99 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -150,6 +150,28 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
 	return &gdev->descs[hwnum];
 }
 
+/**
+ * gpiod_to_offset - obtain the local GPIO number from a global unique
+ *		     descriptor
+ * @desc:	     gpio whose local gpio number should be returned
+ *
+ * It converts the global unique descriptor into the gpio chip local gpio
+ * number. This can be useful if you need to do further device configuration
+ * e.g. for a MFD. Use this function with caution. You will get a wrong number
+ * if you pass the wrong descriptor.
+ *
+ * Return:
+ * * the GPIO number of the passed descriptor relative to its chip
+ * * -EINVAL if desc is invalid or NULL
+ */
+int gpiod_to_offset(const struct gpio_desc *desc)
+{
+	if (IS_ERR_OR_NULL(desc))
+		return -EINVAL;
+	return desc - &desc->gdev->descs[0];
+}
+EXPORT_SYMBOL_GPL(gpiod_to_offset);
+
 /**
  * desc_to_gpio - convert a GPIO descriptor to the integer namespace
  * @desc: GPIO descriptor
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a7f93ce6e114..a586a793b084 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -124,14 +124,6 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
 
-/*
- * Return the GPIO number of the passed descriptor relative to its chip
- */
-static inline int gpiod_to_offet(const struct gpio_desc *desc)
-{
-	return desc - &desc->gdev->descs[0];
-}
-
 /* With descriptor prefix */
 
 #define gpiod_emerg(desc, fmt, ...)					       \
diff --git a/include/linux/gpio/private.h b/include/linux/gpio/private.h
new file mode 100644
index 000000000000..56514bdcfac6
--- /dev/null
+++ b/include/linux/gpio/private.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Functions listed here should be used with caution. Mostly those functions are
+ * used by the gpiolib internally. But the time has shown that some special
+ * drivers needs access to these helpers too.
+ */
+#ifndef __LINUX_GPIO_PRIVATE_H
+#define __LINUX_GPIO_PRIVATE_H
+
+struct gpio_desc;
+
+#ifdef CONFIG_GPIOLIB
+
+int gpiod_to_offset(const struct gpio_desc *desc);
+
+#else /* CONFIG_GPIOLIB */
+
+static inline int gpiod_to_offset(const struct gpio_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+	return 0;
+}
+
+#endif /* CONFIG_GPIOLIB */
+
+#endif /* __LINUX_GPIO_PRIVATE_H */
-- 
2.20.1

