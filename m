Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49D39F381
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 12:27:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzmdm4xXsz2yyQ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 20:27:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzmdj4RjCz3071
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 20:27:37 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 158ACALd009900;
 Tue, 8 Jun 2021 18:12:10 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 18:25:59 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 06/10] gpio: gpio-aspeed-sgpio: Add AST2400 and AST2500
 platform data.
Date: Tue, 8 Jun 2021 18:25:41 +0800
Message-ID: <20210608102547.4880-7-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608102547.4880-1-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 158ACALd009900
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
Cc: steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

We use platform data to store GPIO pin mask and the max number of
available GPIO pins for AST2600.
Refactor driver to also add the platform data for AST2400/AST2500 and
remove unused MAX_NR_HW_SGPIO and ASPEED_SGPIO_PINS_MASK macros.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index ea20a0127748..7d0a4f6fd9d1 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -17,21 +17,8 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
-/*
- * MAX_NR_HW_GPIO represents the number of actual hardware-supported GPIOs (ie,
- * slots within the clocked serial GPIO data). Since each HW GPIO is both an
- * input and an output, we provide MAX_NR_HW_GPIO * 2 lines on our gpiochip
- * device.
- *
- * We use SGPIO_OUTPUT_OFFSET to define the split between the inputs and
- * outputs; the inputs start at line 0, the outputs start at OUTPUT_OFFSET.
- */
-#define MAX_NR_HW_SGPIO			80
-#define SGPIO_OUTPUT_OFFSET		MAX_NR_HW_SGPIO
-
 #define ASPEED_SGPIO_CTRL		0x54
 
-#define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
 #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
 #define ASPEED_SGPIO_ENABLE		BIT(0)
 #define ASPEED_SGPIO_PINS_SHIFT		6
@@ -484,6 +471,11 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	return 0;
 }
 
+static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
+	.max_ngpios = 80,
+	.pin_mask = GENMASK(9, 6),
+};
+
 static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
 	.max_ngpios = 128,
 	.pin_mask = GENMASK(10, 6),
@@ -495,8 +487,8 @@ static const struct aspeed_sgpio_pdata ast2600_sgpiom_80_pdata = {
 };
 
 static const struct of_device_id aspeed_sgpio_of_table[] = {
-	{ .compatible = "aspeed,ast2400-sgpio" },
-	{ .compatible = "aspeed,ast2500-sgpio" },
+	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata, },
+	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata, },
 	{ .compatible = "aspeed,ast2600-sgpiom-128", .data = &ast2600_sgpiom_128_pdata, },
 	{ .compatible = "aspeed,ast2600-sgpiom-80", .data = &ast2600_sgpiom_80_pdata, },
 	{}
@@ -521,13 +513,11 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio->base);
 
 	pdata = device_get_match_data(&pdev->dev);
-	if (pdata) {
-		gpio->max_ngpios = pdata->max_ngpios;
-		pin_mask = pdata->pin_mask;
-	} else {
-		gpio->max_ngpios = MAX_NR_HW_SGPIO;
-		pin_mask = ASPEED_SGPIO_PINS_MASK;
-	}
+	if (!pdata)
+		return -EINVAL;
+
+	gpio->max_ngpios = pdata->max_ngpios;
+	pin_mask = pdata->pin_mask;
 
 	rc = of_property_read_u32(pdev->dev.of_node, "ngpios", &nr_gpios);
 	if (rc < 0) {
-- 
2.17.1

