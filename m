Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9CEAB274
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 08:27:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pnf40gnTzDr7P
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 16:27:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aUMqxfSd"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pnds1rsDzDr7F
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 16:26:57 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 205so3674045pfw.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 23:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBz/Nw09bo2+Nxy27B6Bnst72+LgNmbIsMhxAo7ybD0=;
 b=aUMqxfSdSnkuwGPqLRjheiUFzikOfV2fc0xU5mynUICbJ06VKhxLcszMC7XIGhR+9a
 LCox84h/CIDLKI1gSOXrLAHb3iR6w4VFUPCGACcdJ6Ma0OQwvRE2K/M2jl30aGnGEUHh
 qtdsJvleLml70aYLbf52MZduXl+OBtmnBO7lfJ5+23BRakN9poArHpHZ7Vp3xIAEP4Ip
 IKpv9txRDkokW+UwGti5JJzeptzCSA4SXd8fNu4C6HaAUyOdEMbrrwRHBDnX2D1FweAj
 5DG0jbewwAw/rv0ZkvJaoVxtqR6FcgG8OKwBRl3aqO1YWYoIVxWHLYc9xe36ZLlCKuq8
 nnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBz/Nw09bo2+Nxy27B6Bnst72+LgNmbIsMhxAo7ybD0=;
 b=uRHf6oENfqe4MtUynY1NTsPoB9IkYxv8K2dVApDDIwyoda1DniKJT9IKV3DEdOxd0/
 zAhcCaF7lC01bO9qq93rZ/liAxEAxEjA/B77JVrXhIv4AScWFJHH+vIeD2Z277DJt7AZ
 ONKjokIXQSdDjdDKbitK+EiYjM7hJ1LXzMeFK01tquiQzSSQuXkke9JuZlGgHs5kSdFp
 jRNfDni1oRzh7ny0yMwKSxoyp01JYbpN7G6QGVYCPd0ee6762+R0Q3oj6LjJr3mxD5pc
 HFb7MjQ7+Gh3flqn3e9k4mKS5gi4rd2kxp48iczi/wrC34v6GaEwsHshAU1IzWjM1nnQ
 F55Q==
X-Gm-Message-State: APjAAAUEhN+s1MCD4loo6fgokMiBTE9cxM/vROErJGhOnM6Swm2aHrrh
 IbrBEm/o5Fj4hUwImhK5Jj8=
X-Google-Smtp-Source: APXvYqxBZZ2BelsDovsxHdtpDaLyiv2LFGl8lKiDGpiVUZV8DHdc7jIWEf8BdGHl1IAd2NAHni+KZA==
X-Received: by 2002:a63:6904:: with SMTP id e4mr6538279pgc.321.1567751214158; 
 Thu, 05 Sep 2019 23:26:54 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id a20sm3109704pfo.33.2019.09.05.23.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 23:26:53 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v3 3/5] gpio/aspeed: Setup irqchip dynamically
Date: Fri,  6 Sep 2019 16:26:44 +1000
Message-Id: <20190906062644.13445-1-rashmica.g@gmail.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is in preparation for adding ast2600 support. The ast2600 SoC
requires two instances of the GPIO driver as it has two GPIO
controllers. Each instance needs it's own irqchip.

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

