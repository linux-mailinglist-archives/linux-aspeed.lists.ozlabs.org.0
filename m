Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2882656E3
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 04:11:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnfPk6fbXzDqkp
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 12:11:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=103.231.89.101;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [103.231.89.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnfPf1hp8zDqg9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 12:11:17 +1000 (AEST)
Received: by codeconstruct.com.au (Postfix, from userid 20001)
 id 4DD823FEF9; Thu, 10 Sep 2020 22:11:16 -0400 (EDT)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 2/2] gpio/aspeed-sgpio: don't enable all interrupts by
 default
Date: Fri, 11 Sep 2020 09:51:05 +0800
Message-Id: <20200911015105.48581-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911015105.48581-1-jk@codeconstruct.com.au>
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Currently, the IRQ setup for the SGPIO driver enables all interrupts in
dual-edge trigger mode. Since the default handler is handle_bad_irq, any
state change on input GPIOs will trigger bad IRQ warnings.

This change applies sensible IRQ defaults: single-edge trigger, and all
IRQs disabled.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")

---
v2:
 - update comments to reflect trigger mode change
 - tweak wording to reflect disabled state & single-edge trigger mode
---
 drivers/gpio/gpio-aspeed-sgpio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index a18ca52432e0..64e54f8c30d2 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -452,17 +452,15 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	irq->parents = &gpio->irq;
 	irq->num_parents = 1;
 
-	/* set IRQ settings and Enable Interrupt */
+	/* Apply default IRQ settings */
 	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
 		bank = &aspeed_sgpio_banks[i];
 		/* set falling or level-low irq */
 		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
 		/* trigger type is edge */
 		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
-		/* dual edge trigger mode. */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
-		/* enable irq */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
+		/* single edge trigger */
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
 	}
 
 	return 0;
-- 
2.28.0

