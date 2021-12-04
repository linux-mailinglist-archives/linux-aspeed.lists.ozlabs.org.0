Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBF46867B
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Dec 2021 18:12:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5x7w4R20z2ync
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Dec 2021 04:12:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5x7r5Wsxz2xtL
 for <linux-aspeed@lists.ozlabs.org>; Sun,  5 Dec 2021 04:12:03 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="217820726"
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; d="scan'208";a="217820726"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2021 09:10:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; d="scan'208";a="514135791"
Received: from skoikkar-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.144.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2021 09:10:54 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] gpio: aspeed: Convert aspeed_gpio.lock to raw_spinlock
Date: Sat,  4 Dec 2021 18:10:26 +0100
Message-Id: <20211204171027.451220-1-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The gpio-aspeed driver implements an irq_chip which need to be invoked
from hardirq context. Since spin_lock() can sleep with PREEMPT_RT, it is
no longer legal to invoke it while interrupts are disabled.
This also causes lockdep to complain about:
[    0.649797] [ BUG: Invalid wait context ]
because aspeed_gpio.lock (spin_lock_t) is taken under irq_desc.lock
(raw_spinlock_t).
Let's use of raw_spinlock_t instead of spinlock_t.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/gpio/gpio-aspeed.c | 52 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 3c8f20c57695..318a7d95a1a8 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -53,7 +53,7 @@ struct aspeed_gpio_config {
 struct aspeed_gpio {
 	struct gpio_chip chip;
 	struct irq_chip irqc;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	void __iomem *base;
 	int irq;
 	const struct aspeed_gpio_config *config;
@@ -413,14 +413,14 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	unsigned long flags;
 	bool copro;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	__aspeed_gpio_set(gc, offset, val);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -435,7 +435,7 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	if (!have_input(gpio, offset))
 		return -ENOTSUPP;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
 	reg &= ~GPIO_BIT(offset);
@@ -445,7 +445,7 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -463,7 +463,7 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 	if (!have_output(gpio, offset))
 		return -ENOTSUPP;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
 	reg |= GPIO_BIT(offset);
@@ -474,7 +474,7 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -492,11 +492,11 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	if (!have_output(gpio, offset))
 		return GPIO_LINE_DIRECTION_IN;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	val = ioread32(bank_reg(gpio, bank, reg_dir)) & GPIO_BIT(offset);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
@@ -539,14 +539,14 @@ static void aspeed_gpio_irq_ack(struct irq_data *d)
 
 	status_addr = bank_reg(gpio, bank, reg_irq_status);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	iowrite32(bit, status_addr);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
@@ -565,7 +565,7 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 
 	addr = bank_reg(gpio, bank, reg_irq_enable);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	reg = ioread32(addr);
@@ -577,7 +577,7 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_gpio_irq_mask(struct irq_data *d)
@@ -629,7 +629,7 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	addr = bank_reg(gpio, bank, reg_irq_type0);
@@ -649,7 +649,7 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	irq_set_handler_locked(d, handler);
 
@@ -716,7 +716,7 @@ static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
 
 	treg = bank_reg(gpio, to_bank(offset), reg_tolerance);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
 	val = readl(treg);
@@ -730,7 +730,7 @@ static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -856,7 +856,7 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 		return rc;
 	}
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	if (timer_allocation_registered(gpio, offset)) {
 		rc = unregister_allocated_timer(gpio, offset);
@@ -916,7 +916,7 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 	configure_timer(gpio, offset, i);
 
 out:
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -927,13 +927,13 @@ static int disable_debounce(struct gpio_chip *chip, unsigned int offset)
 	unsigned long flags;
 	int rc;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	rc = unregister_allocated_timer(gpio, offset);
 	if (!rc)
 		configure_timer(gpio, offset, 0);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -1015,7 +1015,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 		return -EINVAL;
 	bindex = offset >> 3;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	/* Sanity check, this shouldn't happen */
 	if (gpio->cf_copro_bankmap[bindex] == 0xff) {
@@ -1036,7 +1036,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	if (bit)
 		*bit = GPIO_OFFSET(offset);
  bail:
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(aspeed_gpio_copro_grab_gpio);
@@ -1060,7 +1060,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 		return -EINVAL;
 	bindex = offset >> 3;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	/* Sanity check, this shouldn't happen */
 	if (gpio->cf_copro_bankmap[bindex] == 0) {
@@ -1074,7 +1074,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
 					      GPIO_CMDSRC_ARM);
  bail:
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);
@@ -1148,7 +1148,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-	spin_lock_init(&gpio->lock);
+	raw_spin_lock_init(&gpio->lock);
 
 	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
 	if (!gpio_id)
-- 
2.31.1

