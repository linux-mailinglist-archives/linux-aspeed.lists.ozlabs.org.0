Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1A5AFC4F
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 14:16:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T18r2X0bzF35r
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 22:16:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9GQo1LK"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NYR94jhrzDqlZ
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 16:13:22 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id r12so383507pfh.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0R4od+wuMr+NDzF1+z+ZTrIyJPL7Gs58v3spHNx+2Ww=;
 b=I9GQo1LKddFj+zeh1M5ALKgcSoPfUmH8J1F6u4tihZK///JmHS0Rut+73m0FesKYOV
 /f7RfOB7hF8MdsxLiaIj7UOr99ai6wOj2P1bVUnzKQWBL8Lh3CukghsKchIWSRF+1Ega
 0GoKw0T3XUSIpclPFQVKsuWJEgi1wLOg92abAbggKjGZHV3yWpxF90rBtcOtLScznd+t
 Kr1xXyg1pRjscBMPIua94ge1T6WL3gLNll8w0I8RBIcKOaKfG79CHLO4w5BgWXyUMaCS
 61/lrsEh6AOtynDw5tRsEX2IoAz0Ay3NP6OJcGLtBKfSJ0m8gDFa2r0ExuEiGKv1y3Bh
 mjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0R4od+wuMr+NDzF1+z+ZTrIyJPL7Gs58v3spHNx+2Ww=;
 b=r9/IIIJaGiaf62dln/mA9ILWlka/XgGTlmfhfQOHwSJd4F2kSzF/wAIVeU84eBIHS+
 hy5U2kcVp8iRFfihPgHZ7FVVDARyzyg0bhMxwafn2HFBHxmsOdsB11QtHODQkBSfafel
 on6vkZPTTVs9qN1WmDL0A3c5r3Eb1lgkpjJv56oAuZaGnAQi8YcuiEtI+khPvk06zEoH
 IP3nApFP+Vrn7LBf/XSeMLHgKyhUG3TN1LySyFtijISH8KBqfxkT/eZZRZCF+YaxMDZp
 s0ksW38J0TJ8KXYQ0oFkAazqyPyV/J8N5wmUhMZSzu2ZVzbLdYGgdMczrCgZ2y91Q+tW
 cyrQ==
X-Gm-Message-State: APjAAAWtd69YaTRW4j5lk40BE+YFdgRQtAWkfEHsuwdal9/y12u2cpl4
 5Mq3ogNhSsPa1VbVIsKETJZpZBYb0aI=
X-Google-Smtp-Source: APXvYqyrSsRag5fFUjnjFpISMekXcJebSX0p+DbmDDo9Ojs7XfwNCS4cd2mq5Gn2rGzkdbFERUMFEg==
X-Received: by 2002:a62:e205:: with SMTP id a5mr44807409pfi.137.1567577600668; 
 Tue, 03 Sep 2019 23:13:20 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 23:13:20 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 bgolaszewski@baylibre.com
Subject: [PATCH 2/4] gpio/aspeed: Setup irqchip dynamically
Date: Wed,  4 Sep 2019 16:12:43 +1000
Message-Id: <20190904061245.30770-2-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Sep 2019 22:16:16 +1000
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

This is in preparation for ast2600 as we will have two gpio drivers
which need their own irqchip.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 77752b2624e8..60ab042c9129 100644
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

