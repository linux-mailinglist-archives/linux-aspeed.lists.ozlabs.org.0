Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7DA97F4
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 03:18:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2r934dZzDqwr
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 11:18:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DsoLW11s"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2q32sS2zDqy6
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 11:17:19 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n190so427345pgn.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 18:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xBV7lQcJGLCdJ1DprCQZXPKzQ/B4slHcpqoJmoHHX0=;
 b=DsoLW11sIiOue6shE75Kxyfal48BeGlDYtuQ+uPzHfgLzR4wvmdRUekonS4w+/F3I5
 KVLSfhFMcJ5lVUmtJbWWFyyGLz7SfEwmIXgvuB06UoufGIWtcI0TJVARStBpb3TjqDHd
 PhiPHPhRdYmfDRTHhqLMoJy2tooTqkyEo1Q8krWJHMsGqC4Xs4EvMjd/0LbcFH1uEPgn
 FdPmGFI6GedTiP4ugFuXKQiYJlXR5H3QhdzXUjdO19ZmlJQz6ulRVnLwJ7b/nXcMdnYO
 N0wO0JPWewff3GpxQbkgX8XPXQU/kVmto4x5XE25Jc6kwVROiGxA9zWZosi3eBpZ/scA
 dzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xBV7lQcJGLCdJ1DprCQZXPKzQ/B4slHcpqoJmoHHX0=;
 b=NFNpWwzWYW09+5ggra+ztzKcqh/rEC/JKk88L2m0P8KrmC4Eyi0bYK5qlz0cP12ePQ
 fzyivU4362GSDK1FqVEFa/rpEoxdVtaZp5m4V6Sel/KpfRXWgAywO57bxYRsI0YkS3YY
 SXKUq4e0u1X9Wzu4XQ8NFgoB+GUGewozMtaYqg/e9/hDFwTDvng5Mo/AOEypgfCFox/S
 ETT760WH+Ho8McWuxbAdZA7Lx4U0Adm8ZFJKuBTo7nXrrtRwdO7ldxRROJPiVwiIYyJ1
 r2eG4NbsIVvlKU4znAzbOk2PHPoWWtqXGibut2TBp9gKLmtjoKELM+0sf3OWKvzqqzTt
 uk/A==
X-Gm-Message-State: APjAAAUGNa4lTXZs3aBIbpeFXzpLsWadcJyeXcl1wO6q0ADtHj7WSkfO
 czPoHO5WPld7djU9FjU5kKM=
X-Google-Smtp-Source: APXvYqyLU0ir1KiY3O4QnlY1CFxOjeaDqE6YSk1Fqt8q7NGwnUf983bmjsuDk0IW04G2/KhqGC4LYw==
X-Received: by 2002:a17:90a:ca02:: with SMTP id
 x2mr1077306pjt.98.1567646236325; 
 Wed, 04 Sep 2019 18:17:16 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f12sm294387pgq.52.2019.09.04.18.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 18:17:15 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v2 2/4] gpio/aspeed: Setup irqchip dynamically
Date: Thu,  5 Sep 2019 11:17:01 +1000
Message-Id: <20190905011701.15981-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is in preparation for adding ast2600 support. The ast2600 requires two
GPIO drivers which each need their own irqchip.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index b83e23aecd18..16c6eaf70857 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -52,6 +52,7 @@ struct aspeed_gpio_config {
  */
 struct aspeed_gpio {
 	struct gpio_chip chip;
+	struct irq_chip irqc;
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
@@ -681,14 +682,6 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
-static struct irq_chip aspeed_gpio_irqchip = {
-	.name		= "aspeed-gpio",
-	.irq_ack	= aspeed_gpio_irq_ack,
-	.irq_mask	= aspeed_gpio_irq_mask,
-	.irq_unmask	= aspeed_gpio_irq_unmask,
-	.irq_set_type	= aspeed_gpio_set_type,
-};
-
 static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 {
 	const struct aspeed_bank_props *props = gpio->config->props;
@@ -1192,7 +1185,12 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 		gpio->irq = rc;
 		girq = &gpio->chip.irq;
-		girq->chip = &aspeed_gpio_irqchip;
+		girq->chip = &gpio->irqc;
+		girq->chip->name = dev_name(&pdev->dev);
+		girq->chip->irq_ack = aspeed_gpio_irq_ack;
+		girq->chip->irq_mask = aspeed_gpio_irq_mask;
+		girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
+		girq->chip->irq_set_type = aspeed_gpio_set_type;
 		girq->parent_handler = aspeed_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, 1,
-- 
2.20.1

