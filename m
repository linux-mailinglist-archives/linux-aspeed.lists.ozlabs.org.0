Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB922563C
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jul 2020 05:45:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B970f4qp1zDqGF
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jul 2020 13:45:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=103.231.89.101;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeconstruct.com.au
X-Greylist: delayed 451 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Jul 2020 00:14:04 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [103.231.89.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6KBN0yNlzDqlZ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jul 2020 00:14:03 +1000 (AEST)
Received: by codeconstruct.com.au (Postfix, from userid 20001)
 id A1AB340172; Wed, 15 Jul 2020 10:06:30 -0400 (EDT)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/2] gpio/aspeed-sgpio: don't enable all interrupts by default
Date: Wed, 15 Jul 2020 21:54:18 +0800
Message-Id: <20200715135418.3194860-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715135418.3194860-1-jk@codeconstruct.com.au>
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jul 2020 13:45:18 +1000
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Currently, the IRQ setup for the SGPIO driver enables all interrupts for
dual-edge trigger mode. Since the default handler is handle_bad_irq, any
state change on input GPIOs will trigger bad IRQ warnings.

This change applies sensible (disabled) IRQ defaults.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 927d46f159b8..23a3a40901d6 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -451,9 +451,7 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 		/* trigger type is edge */
 		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
 		/* dual edge trigger mode. */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
-		/* enable irq */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
 	}
 
 	return 0;
-- 
2.27.0

