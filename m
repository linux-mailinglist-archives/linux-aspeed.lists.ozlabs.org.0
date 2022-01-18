Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CEB4916BE
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jan 2022 03:36:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdCZx2JxFz30N9
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jan 2022 13:36:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=plEAq1En;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=plEAq1En; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdCZq5b7zz301v
 for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jan 2022 13:36:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AB22B81247;
 Tue, 18 Jan 2022 02:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4BEC36AEF;
 Tue, 18 Jan 2022 02:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473391;
 bh=zrGN/H7rq5Xkf0os/FChXmYJJlBZX3zxIDFjOnOwKh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=plEAq1EnARKYrlWXuqV+fAQVkxSPITA0CI/HXZvv1u/B6S8sngbJc49j254vB3Rm+
 D18TSzdZU3dzrSwwD74fdijnJDoNFUcJ/01nS1qGscRrHF7Sg1afe8tk2Tx2glC3/v
 PoEgtc/oVznQ4HSoOCEOr00He+33fRNRGCPo01TH66gLwxm/LWnJw8qiI2vHfi5Q/B
 999Z45zWtG947QJ3jZ/nQzQki82YEJ/eChA+kdpDAegJ46vBMzqqOubmLeYfP1rVP6
 k7F7HJhqdO8/AoQaSw3VWA7iouSr5gBiBJBmc0zYzX7hKU2mGeBakFyX1Zogu1tm4I
 DC8jIzD+sXtMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 099/188] gpio: aspeed-sgpio: Convert
 aspeed_sgpio.lock to raw_spinlock
Date: Mon, 17 Jan 2022 21:30:23 -0500
Message-Id: <20220118023152.1948105-99-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Iwona Winiarska <iwona.winiarska@intel.com>

[ Upstream commit ab39d6988dd53f354130438d8afa5596a2440fed ]

The gpio-aspeed-sgpio driver implements an irq_chip which need to be
invoked from hardirq context. Since spin_lock() can sleep with
PREEMPT_RT, it is no longer legal to invoke it while interrupts are
disabled.
This also causes lockdep to complain about:
[   25.919465] [ BUG: Invalid wait context ]
because aspeed_sgpio.lock (spin_lock_t) is taken under irq_desc.lock
(raw_spinlock_t).
Let's use of raw_spinlock_t instead of spinlock_t.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index b3a9b8488f11d..454cefbeecf0e 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -31,7 +31,7 @@ struct aspeed_sgpio {
 	struct gpio_chip chip;
 	struct irq_chip intc;
 	struct clk *pclk;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	void __iomem *base;
 	int irq;
 };
@@ -173,12 +173,12 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 	enum aspeed_sgpio_reg reg;
 	int rc = 0;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
 	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -215,11 +215,11 @@ static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	sgpio_set_value(gc, offset, val);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -236,9 +236,9 @@ static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int v
 	/* No special action is required for setting the direction; we'll
 	 * error-out in sgpio_set_value if this isn't an output GPIO */
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 	rc = sgpio_set_value(gc, offset, val);
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -277,11 +277,11 @@ static void aspeed_sgpio_irq_ack(struct irq_data *d)
 
 	status_addr = bank_reg(gpio, bank, reg_irq_status);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	iowrite32(bit, status_addr);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
@@ -296,7 +296,7 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
 	addr = bank_reg(gpio, bank, reg_irq_enable);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
 	if (set)
@@ -306,7 +306,7 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 
 	iowrite32(reg, addr);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_sgpio_irq_mask(struct irq_data *d)
@@ -355,7 +355,7 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	addr = bank_reg(gpio, bank, reg_irq_type0);
 	reg = ioread32(addr);
@@ -372,7 +372,7 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 	reg = (reg & ~bit) | type2;
 	iowrite32(reg, addr);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	irq_set_handler_locked(d, handler);
 
@@ -467,7 +467,7 @@ static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
 
 	reg = bank_reg(gpio, to_bank(offset), reg_tolerance);
 
-	spin_lock_irqsave(&gpio->lock, flags);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	val = readl(reg);
 
@@ -478,7 +478,7 @@ static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
 
 	writel(val, reg);
 
-	spin_unlock_irqrestore(&gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
@@ -575,7 +575,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) | gpio_cnt_regval |
 		  ASPEED_SGPIO_ENABLE, gpio->base + ASPEED_SGPIO_CTRL);
 
-	spin_lock_init(&gpio->lock);
+	raw_spin_lock_init(&gpio->lock);
 
 	gpio->chip.parent = &pdev->dev;
 	gpio->chip.ngpio = nr_gpios * 2;
-- 
2.34.1

